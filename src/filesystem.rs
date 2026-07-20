use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::path::{Path, PathBuf};
use tracing::{debug, warn};

/// Rewrite a relative markdown asset URL (e.g. an image `src`) so it resolves
/// against the `/raw/` static route that serves the docs directory.
///
/// `url` is the raw destination from the markdown (e.g. "charts/x.png",
/// "../shared/y.png", "https://example.com/z.png"). `base_dir` is the
/// document-tree-relative directory of the file containing the link (e.g.
/// "testing/read-cache-validation", or "" for a root file).
///
/// External URLs, protocol-relative URLs, `data:`/`mailto:` URIs, page anchors,
/// and already-rooted paths (starting with "/") are returned unchanged — only
/// document-relative paths are rewritten. The joined path is normalized (`.`
/// and `..` segments collapsed) and spaces are percent-encoded so the result is
/// a valid URL.
fn rewrite_relative_asset_url(url: &str, base_dir: &str) -> String {
    if url.is_empty()
        || url.starts_with('/')
        || url.starts_with('#')
        || url.starts_with("data:")
        || url.starts_with("mailto:")
        || url.starts_with("//")
        || url.contains("://")
    {
        return url.to_string();
    }

    let joined = if base_dir.is_empty() {
        url.to_string()
    } else {
        format!("{}/{}", base_dir.trim_end_matches('/'), url)
    };

    let mut segments: Vec<&str> = Vec::new();
    for seg in joined.split('/') {
        match seg {
            "" | "." => {}
            ".." => {
                segments.pop();
            }
            s => segments.push(s),
        }
    }

    format!("/raw/{}", segments.join("/").replace(' ', "%20"))
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FileNode {
    pub name: String,
    pub path: String,
    pub is_file: bool,
    pub children: Vec<FileNode>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub size: Option<u64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub modified: Option<String>,
}

#[derive(Debug, Clone, Serialize)]
pub struct SearchResult {
    pub file_path: String,
    pub file_name: String,
    pub title: Option<String>,
    pub matches: Vec<SearchMatch>,
    pub relevance_score: f32,
}

#[derive(Debug, Clone, Serialize)]
pub struct SearchMatch {
    pub line_number: usize,
    pub content: String,
    pub highlighted_content: String,
    pub context_before: Option<String>,
    pub context_after: Option<String>,
}

#[derive(Debug, Clone)]
pub struct DocumentTree {
    pub root: FileNode,
    pub file_map: HashMap<String, PathBuf>,
    pub stats: TreeStats,
    pub search_index: HashMap<String, Vec<String>>, // file_path -> lines
}

#[derive(Debug, Clone)]
pub struct TreeStats {
    pub total_files: usize,
    pub total_dirs: usize,
    pub total_size: u64,
}

impl DocumentTree {
    /// Create a new document tree from the given directory
    pub fn new(docs_dir: &Path) -> anyhow::Result<Self> {
        let mut file_map = HashMap::new();
        let mut search_index = HashMap::new();
        let mut stats = TreeStats {
            total_files: 0,
            total_dirs: 0,
            total_size: 0,
        };

        debug!("Building document tree from: {}", docs_dir.display());

        // Create a virtual root that contains the children of the actual directory
        let mut children = Vec::new();

        // Read directory contents and sort them
        let mut entries: Vec<_> = std::fs::read_dir(docs_dir)?
            .filter_map(|entry| entry.ok())
            .collect();

        // Sort entries: directories first, then files, both alphabetically
        entries.sort_by(|a, b| {
            let a_is_dir = a.path().is_dir();
            let b_is_dir = b.path().is_dir();

            match (a_is_dir, b_is_dir) {
                (true, false) => std::cmp::Ordering::Less, // Directories first
                (false, true) => std::cmp::Ordering::Greater, // Files second
                _ => a.file_name().cmp(&b.file_name()),    // Same type: sort by name
            }
        });

        for entry in entries {
            let path = entry.path();

            // Skip hidden files and non-markdown files, but traverse dot directories.
            if let Some(name) = path.file_name().and_then(|n| n.to_str()) {
                if path.is_file() && name.starts_with('.') {
                    debug!("Skipping hidden file: {}", name);
                    continue;
                }

                if path.is_file() && path.extension().and_then(|s| s.to_str()) != Some("md") {
                    debug!("Skipping non-markdown file: {}", name);
                    continue;
                }
            }

            match Self::build_tree(
                &path,
                docs_dir,
                &mut file_map,
                &mut search_index,
                &mut stats,
            ) {
                Ok(child) => children.push(child),
                Err(e) => {
                    warn!("Failed to process path {}: {}", path.display(), e);
                    continue;
                }
            }
        }

        // Create virtual root node
        let root = FileNode {
            name: "root".to_string(),
            path: "".to_string(),
            is_file: false,
            children,
            size: None,
            modified: None,
        };

        debug!(
            "Document tree built: {} files, {} directories, {} bytes total",
            stats.total_files, stats.total_dirs, stats.total_size
        );

        Ok(DocumentTree {
            root,
            file_map,
            stats,
            search_index,
        })
    }

    /// Recursively build the file tree
    fn build_tree(
        current_path: &Path,
        base_path: &Path,
        file_map: &mut HashMap<String, PathBuf>,
        search_index: &mut HashMap<String, Vec<String>>,
        stats: &mut TreeStats,
    ) -> anyhow::Result<FileNode> {
        let name = current_path
            .file_name()
            .unwrap_or_default()
            .to_string_lossy()
            .to_string();

        let relative_path = current_path
            .strip_prefix(base_path)
            .unwrap_or(current_path)
            .to_string_lossy()
            .replace('\\', "/");

        if current_path.is_file() {
            let metadata = std::fs::metadata(current_path)?;
            let size = metadata.len();
            let modified = metadata.modified().ok().and_then(|time| {
                time.duration_since(std::time::UNIX_EPOCH)
                    .ok()
                    .map(|d| {
                        let datetime = chrono::DateTime::from_timestamp(d.as_secs() as i64, 0)?;
                        Some(datetime.format("%Y-%m-%d %H:%M:%S").to_string())
                    })
                    .flatten()
            });

            if current_path.extension().and_then(|s| s.to_str()) == Some("md") {
                file_map.insert(relative_path.clone(), current_path.to_path_buf());

                // Build search index for this file
                if let Ok(content) = std::fs::read_to_string(current_path) {
                    let lines: Vec<String> = content.lines().map(|line| line.to_string()).collect();
                    search_index.insert(relative_path.clone(), lines);
                }

                stats.total_files += 1;
                stats.total_size += size;
            }

            return Ok(FileNode {
                name,
                path: relative_path,
                is_file: true,
                children: vec![],
                size: Some(size),
                modified,
            });
        }

        stats.total_dirs += 1;
        let mut children = Vec::new();

        // Read directory contents and sort them
        let mut entries: Vec<_> = std::fs::read_dir(current_path)?
            .filter_map(|entry| entry.ok())
            .collect();

        // Sort entries: directories first, then files, both alphabetically
        entries.sort_by(|a, b| {
            let a_is_dir = a.path().is_dir();
            let b_is_dir = b.path().is_dir();

            match (a_is_dir, b_is_dir) {
                (true, false) => std::cmp::Ordering::Less, // Directories first
                (false, true) => std::cmp::Ordering::Greater, // Files second
                _ => {
                    // Same type: sort by name (case-insensitive)
                    let a_name = a.file_name().to_string_lossy().to_lowercase();
                    let b_name = b.file_name().to_string_lossy().to_lowercase();
                    a_name.cmp(&b_name)
                }
            }
        });

        for entry in entries {
            let path = entry.path();

            // Skip hidden files and non-markdown files, but traverse dot directories.
            if let Some(name) = path.file_name().and_then(|n| n.to_str()) {
                if path.is_file() && name.starts_with('.') {
                    debug!("Skipping hidden file: {}", name);
                    continue;
                }

                if path.is_file() && path.extension().and_then(|s| s.to_str()) != Some("md") {
                    debug!("Skipping non-markdown file: {}", name);
                    continue;
                }
            }

            match Self::build_tree(&path, base_path, file_map, search_index, stats) {
                Ok(child) => children.push(child),
                Err(e) => {
                    warn!("Failed to process path {}: {}", path.display(), e);
                    continue;
                }
            }
        }

        Ok(FileNode {
            name,
            path: relative_path,
            is_file: false,
            children,
            size: None,
            modified: None,
        })
    }

    /// Get the content of a file by its relative path
    pub fn get_file_content(&self, file_path: &str) -> anyhow::Result<String> {
        let path = self
            .file_map
            .get(file_path)
            .ok_or_else(|| anyhow::anyhow!("File not found: {}", file_path))?;

        debug!("Reading file: {}", path.display());
        let content = std::fs::read_to_string(path)
            .map_err(|e| anyhow::anyhow!("Failed to read file {}: {}", path.display(), e))?;

        Ok(content)
    }

    /// Render markdown content to HTML.
    ///
    /// `base_dir` is the document-tree-relative directory of the file being
    /// rendered (e.g. "testing/read-cache-validation", or "" for a root-level
    /// file). It is used to rewrite *relative* image URLs so they resolve
    /// against the `/raw/` static route that serves files out of the docs
    /// directory.
    ///
    /// Why this is needed: the content is a single-page app served at "/", so a
    /// markdown `![](charts/x.png)` would otherwise resolve against the page URL
    /// ("/charts/x.png") — a path the server has no route for — and render as a
    /// broken-image placeholder. Rewriting to `/raw/<file-dir>/charts/x.png`
    /// points the browser at the docs-directory file server instead.
    pub fn render_markdown(&self, content: &str, base_dir: &str) -> String {
        use pulldown_cmark::{Event, Options, Parser, Tag, html};

        let mut options = Options::empty();
        options.insert(Options::ENABLE_TABLES);
        options.insert(Options::ENABLE_FOOTNOTES);
        options.insert(Options::ENABLE_STRIKETHROUGH);
        options.insert(Options::ENABLE_TASKLISTS);
        options.insert(Options::ENABLE_SMART_PUNCTUATION);
        options.insert(Options::ENABLE_HEADING_ATTRIBUTES);

        // Intercept image tags and rewrite relative sources. External URLs,
        // data URIs, anchors, and already-rooted paths are passed through
        // untouched (see rewrite_relative_asset_url).
        let parser = Parser::new_ext(content, options).map(|event| match event {
            Event::Start(Tag::Image {
                link_type,
                dest_url,
                title,
                id,
            }) => Event::Start(Tag::Image {
                link_type,
                dest_url: rewrite_relative_asset_url(&dest_url, base_dir).into(),
                title,
                id,
            }),
            other => other,
        });

        let mut html_output = String::new();
        html::push_html(&mut html_output, parser);

        html_output
    }

    /// Get statistics about the document tree
    pub fn get_stats(&self) -> &TreeStats {
        &self.stats
    }

    /// Advanced search with full-text search and content preview
    pub fn search_content(&self, query: &str) -> Vec<SearchResult> {
        if query.trim().is_empty() {
            return vec![];
        }

        let query_lower = query.to_lowercase();
        let mut results = Vec::new();

        for (file_path, lines) in &self.search_index {
            let mut matches = Vec::new();
            let mut relevance_score = 0.0;

            // Extract title from first heading
            let title = lines
                .iter()
                .find(|line| line.trim().starts_with('#'))
                .map(|line| line.trim_start_matches('#').trim().to_string());

            // Search through all lines
            for (line_number, line) in lines.iter().enumerate() {
                let line_lower = line.to_lowercase();

                if line_lower.contains(&query_lower) {
                    // Calculate relevance score
                    let mut line_score = 1.0;

                    // Higher score for title matches
                    if line.trim().starts_with('#') {
                        line_score *= 3.0;
                    }

                    // Higher score for exact word matches
                    if line_lower
                        .split_whitespace()
                        .any(|word| word == query_lower)
                    {
                        line_score *= 2.0;
                    }

                    // Higher score for matches at the beginning of the line
                    if line_lower.trim_start().starts_with(&query_lower) {
                        line_score *= 1.5;
                    }

                    relevance_score += line_score;

                    // Create highlighted content
                    let highlighted_content = self.highlight_matches(line, query);

                    // Get context lines
                    let context_before = if line_number > 0 {
                        lines.get(line_number - 1).cloned()
                    } else {
                        None
                    };

                    let context_after = lines.get(line_number + 1).cloned();

                    matches.push(SearchMatch {
                        line_number: line_number + 1, // 1-based line numbers
                        content: line.clone(),
                        highlighted_content,
                        context_before,
                        context_after,
                    });
                }
            }

            // Also check filename matches
            let file_name = file_path.rsplit('/').next().unwrap_or(file_path);
            if file_name.to_lowercase().contains(&query_lower) {
                relevance_score += 2.0; // Bonus for filename matches
            }

            if !matches.is_empty() {
                results.push(SearchResult {
                    file_path: file_path.clone(),
                    file_name: file_name.to_string(),
                    title,
                    matches,
                    relevance_score,
                });
            }
        }

        // Sort by relevance score (descending)
        results.sort_by(|a, b| {
            b.relevance_score
                .partial_cmp(&a.relevance_score)
                .unwrap_or(std::cmp::Ordering::Equal)
        });

        // Limit results to prevent overwhelming the UI
        results.truncate(50);

        results
    }

    /// Highlight all search matches in content while escaping HTML-sensitive characters.
    fn highlight_matches(&self, content: &str, query: &str) -> String {
        let query_lower = query.to_lowercase();
        let content_lower = content.to_lowercase();

        let indices: Vec<usize> = content_lower
            .match_indices(&query_lower)
            .map(|(index, _)| index)
            .collect();

        if indices.is_empty() {
            return escape_html(content);
        }

        let mut result = String::new();
        let mut last_end = 0;
        for start in indices {
            let end = start + query.len();
            result.push_str(&escape_html(&content[last_end..start]));
            result.push_str("<mark>");
            result.push_str(&escape_html(&content[start..end]));
            result.push_str("</mark>");
            last_end = end;
        }
        result.push_str(&escape_html(&content[last_end..]));
        result
    }
}

fn escape_html(content: &str) -> String {
    content
        .replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

#[cfg(test)]
mod tests {
    use super::*;

    fn tree_with_file(name: &str, content: &str) -> (tempfile::TempDir, DocumentTree) {
        let dir = tempfile::tempdir().unwrap();
        std::fs::write(dir.path().join(name), content).unwrap();
        let tree = DocumentTree::new(dir.path()).unwrap();
        (dir, tree)
    }

    #[test]
    fn search_highlights_all_matches_and_escapes_html() {
        let (_dir, tree) = tree_with_file("test.md", "<b>foo</b> & foo");
        let results = tree.search_content("foo");

        assert_eq!(results.len(), 1);
        assert_eq!(
            results[0].matches[0].highlighted_content,
            "&lt;b&gt;<mark>foo</mark>&lt;/b&gt; &amp; <mark>foo</mark>"
        );
    }

    #[test]
    fn search_escapes_html_when_filename_match_has_no_content_match() {
        let (_dir, tree) = tree_with_file("foo.md", "<script>alert(1)</script>");
        let results = tree.search_content("foo");

        assert_eq!(results.len(), 0);
        assert_eq!(
            tree.highlight_matches("<script>alert(1)</script>", "missing"),
            "&lt;script&gt;alert(1)&lt;/script&gt;"
        );
    }

    #[test]
    fn document_tree_ignores_hidden_and_non_markdown_files() {
        let dir = tempfile::tempdir().unwrap();
        std::fs::write(dir.path().join(".hidden.md"), "hidden").unwrap();
        std::fs::write(dir.path().join("ignored.txt"), "ignored").unwrap();
        std::fs::write(dir.path().join("visible.md"), "visible").unwrap();

        let tree = DocumentTree::new(dir.path()).unwrap();

        assert_eq!(tree.stats.total_files, 1);
        assert_eq!(tree.root.children[0].name, "visible.md");
    }

    #[test]
    fn document_tree_includes_dot_directories() {
        let dir = tempfile::tempdir().unwrap();
        let paw_dir = dir.path().join(".paw");
        std::fs::create_dir(&paw_dir).unwrap();
        std::fs::write(paw_dir.join("notes.md"), "dot directory content").unwrap();

        let tree = DocumentTree::new(dir.path()).unwrap();

        assert_eq!(tree.stats.total_files, 1);
        assert!(tree.file_map.contains_key(".paw/notes.md"));
        assert_eq!(
            tree.get_file_content(".paw/notes.md").unwrap(),
            "dot directory content"
        );
    }
}
