# Document Data Domain Technical Implementation

## 1. Module Overview

The **document data domain** is a core business module in Litho Book. It converts Markdown documents from the local file system into a structured, searchable, and navigable in-memory data model. As the system's knowledge-content carrier and processing engine, this module transforms raw files into a structured knowledge base.

### Core Responsibilities
- **Document tree construction**: recursively scan a specified directory and build a tree structure with metadata.
- **Full-text retrieval**: provide keyword-based intelligent search with relevance sorting and highlighted matches.
- **Content rendering**: convert Markdown source into frontend-ready HTML.
- **State management**: maintain document statistics and search indexes for efficient queries.

### Technical Positioning
As the system's core business domain, the document data domain sits at the center of the architecture. Upstream, it provides data services to the user interaction domain; downstream, it relies on the system support domain for error handling. Its design follows high-cohesion and low-coupling principles, communicating with other modules through clear interfaces.

---

## 2. Core Data Structures

### 2.1 `DocumentTree` Struct

`DocumentTree` is the module's central data container and encapsulates the complete in-memory representation of the documentation directory:

```rust
pub struct DocumentTree {
    pub root: FileNode,
    pub file_map: HashMap<String, PathBuf>,
    pub stats: TreeStats,
    pub search_index: HashMap<String, Vec<String>>,
}
```

| Field | Type | Description |
|------|------|------|
| `root` | `FileNode` | Root node of the document tree, containing all child nodes |
| `file_map` | `HashMap<String, PathBuf>` | File-path mapping table for quickly locating physical paths |
| `stats` | `TreeStats` | Documentation-library statistics, such as file count and size |
| `search_index` | `HashMap<String, Vec<String>>` | Full-text search index storing the line text for each file |

### 2.2 `FileNode` Node Structure

`FileNode` represents a single node in the tree. It can be either a directory or a file:

```rust
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
```

Key characteristics:
- **Serialization support**: JSON serialization through `serde`, making the structure easy to send to the frontend.
- **Conditional serialization**: `size` and `modified` are omitted when empty, reducing network payload size.
- **Tree structure**: recursive nesting through the `children` vector naturally supports directory hierarchies.

### 2.3 Search Result Structures

#### `SearchResult`
Represents the search matches for a single file:

```rust
pub struct SearchResult {
    pub file_path: String,
    pub file_name: String,
    pub title: Option<String>,
    pub matches: Vec<SearchMatch>,
    pub relevance_score: f32,
}
```

#### `SearchMatch`
Represents a concrete match within a file:

```rust
pub struct SearchMatch {
    pub line_number: usize,
    pub content: String,
    pub highlighted_content: String,
    pub context_before: Option<String>,
    pub context_after: Option<String>,
}
```

Search-result design characteristics:
- **Context awareness**: includes surrounding snippets to help users understand the match in context.
- **Highlight markup**: pre-generates content with `<mark>` tags to reduce frontend work.
- **Relevance score**: quantifies match quality and supports result ordering.

---

## 3. Core Feature Implementation

### 3.1 Document Tree Construction Flow

Document-tree construction is recursive and starts from `DocumentTree::new()`:

```rust
pub fn new(docs_dir: &Path) -> anyhow::Result<Self>
```

#### Construction Steps
1. **Initialize components**: create the `file_map`, `search_index`, and `stats` collector.
2. **Read directory contents**: use `std::fs::read_dir()` to obtain directory entries.
3. **Sort entries**: sort by type, with directories first, and then by name to ensure stable display order.
4. **Filter files**:
   - Skip hidden files whose names start with `.`.
   - Keep only files with the `.md` extension.
5. **Build recursively**: call `build_tree()` on each valid entry for depth-first traversal.
6. **Create a virtual root**: wrap the actual directory contents in a unified tree root.

#### Key Algorithm: `build_tree()`

```rust
fn build_tree(
    current_path: &Path,
    base_path: &Path,
    file_map: &mut HashMap<String, PathBuf>,
    search_index: &mut HashMap<String, Vec<String>>,
    stats: &mut TreeStats,
) -> anyhow::Result<FileNode>
```

This method performs different logic depending on the path type:
- **File handling**:
  - Compute the relative path and store it in `file_map`.
  - Read file contents and build the `search_index`.
  - Update statistics.
- **Directory handling**:
  - Recursively process child entries.
  - Collect child nodes into the `children` vector.

#### Path Handling Strategy
- **Relative-path normalization**: use `/` as the separator for cross-platform compatibility.
- **Base-path stripping**: remove the documentation root prefix to avoid exposing absolute paths.
- **URL-friendly format**: replace backslashes so paths can be used in Web routes.

### 3.2 Full-Text Search Engine

#### Search Flow (`search_content`)
```rust
pub fn search_content(&self, query: &str) -> Vec<SearchResult>
```

1. **Input validation**: return an empty result set for empty queries.
2. **Preprocessing**: lowercase the query for case-insensitive search.
3. **Index traversal**: match against each file in `search_index`.
4. **Line-level matching**: check each line for the query term.
5. **Score calculation**: combine multiple factors to determine relevance.
6. **Result sorting**: sort by score descending and keep the top 50 results.

#### Relevance Scoring Algorithm

The system uses a multidimensional weighted scoring mechanism. The total score is the sum of factor scores:

| Factor | Weight | Description |
|------|------|------|
| Heading match | ×3 | A match on a heading line starting with `#` |
| Exact word match | ×2 | The query appears as an independent word |
| Line-prefix match | ×1.5 | The match appears at the beginning of the line |
| Filename match | +2 | The filename contains the query |

**Scoring example**:
```text
Query: "performance optimization"
File: performance.md
Content: # Performance Optimization Guide
      This article explains how to optimize performance...

Calculation:
- Heading match: 1.0 × 3 = 3.0
- Exact match: 1.0 × 2 = 2.0
- Line-prefix match: none
- Filename match: +2.0
Total: 7.0
```

#### Highlighting Implementation (`highlight_matches`)

```rust
fn highlight_matches(&self, content: &str, query: &str) -> String
```

It uses a simple string-search-and-replace strategy:
1. Find the query position in the content.
2. Wrap the matched segment in a `<mark>` HTML tag.
3. Preserve the rest of the original text unchanged.

This implementation keeps highlighting accurate while avoiding the overhead of complex regular-expression parsing.

### 3.3 Markdown Renderer

#### Rendering Implementation (`render_markdown`)

```rust
pub fn render_markdown(&self, content: &str) -> String
```

Rendering is based on `pulldown-cmark` and enables a broad set of Markdown extensions:

```rust
let mut options = Options::empty();
options.insert(Options::ENABLE_TABLES);
options.insert(Options::ENABLE_FOOTNOTES);
options.insert(Options::ENABLE_STRIKETHROUGH);
options.insert(Options::ENABLE_TASKLISTS);
options.insert(Options::ENABLE_SMART_PUNCTUATION);
options.insert(Options::ENABLE_HEADING_ATTRIBUTES);
```

Supported Markdown features:
- Tables
- Footnotes
- Strikethrough
- Task lists
- Smart punctuation
- Heading attributes

Rendering is performed entirely on the server so the frontend receives standard HTML, reducing client-side processing complexity.

---

## 4. Module Interaction and Integration

### 4.1 Integration with the User Interaction Domain

The document data domain is injected into the Axum Web service through `AppState` and used by route handlers:

```rust
// src/server.rs
#[derive(Clone)]
pub struct AppState {
    pub doc_tree: DocumentTree,
    pub docs_path: String,
}

// Inject state while creating the router
let app = server::create_router(doc_tree, docs_path);
```

Main interaction scenarios:

#### Document Browsing
```rust
async fn file_handler(
    State(state): State<AppState>, 
    Query(query): Query<FileQuery>
) -> Result<Json<FileResponse>, StatusCode> {
    let content = state.doc_tree.get_file_content(&query.file.unwrap())?;
    let html = state.doc_tree.render_markdown(&content);
    // ...
}
```

#### Full-Text Search
```rust
async fn search_handler(
    State(state): State<AppState>, 
    Query(query): Query<SearchQuery>
) -> Result<Json<SearchResponse>, StatusCode> {
    let results = state.doc_tree.search_content(&query.q.unwrap());
    // ...
}
```

### 4.2 Collaboration with the AI Assistant

In the AI chat flow, the document data domain provides context:

```rust
async fn chat_stream_handler(
    State(state): State<AppState>,
    Json(request): Json<ChatRequest>,
) -> Sse<impl Stream<Item = Result<Event, Infallible>>> {
    // Get the current document content as context
    let context = request.context;
    
    // Include document context while building the AI request
    call_openai_stream_api(&request.message, context, ...).await
}
```

The system also automatically loads specific documents, such as "architecture overview.md", as background knowledge to improve AI answer quality.

### 4.3 Error-Handling Integration

The document data domain follows the unified error-handling convention and propagates errors through `anyhow` and `thiserror`:

```rust
use anyhow::Result;

pub fn get_file_content(&self, file_path: &str) -> anyhow::Result<String> {
    let path = self.file_map.get(file_path)
        .ok_or_else(|| anyhow::anyhow!("File not found: {}", file_path))?;
    
    std::fs::read_to_string(path)
        .map_err(|e| anyhow::anyhow!("Failed to read file {}: {}", path.display(), e))
}
```

These errors are eventually mapped by the system support domain's `LithoBookError` to appropriate HTTP status codes, ensuring consistent error feedback between frontend and backend.

---

## 5. Performance and Optimization Considerations

### 5.1 Memory Usage Analysis

The document data domain maintains several data structures in memory:
- **Document tree**: O(n) space complexity, where n is the total number of files and directories.
- **File mapping**: O(m) space complexity, where m is the number of Markdown files.
- **Search index**: O(k) space complexity, where k is the total number of lines across all files.

For a typical documentation library with hundreds of files, memory usage is usually in the tens to hundreds of MB.

### 5.2 Time Complexity Analysis

| Operation | Time Complexity | Description |
|------|------------|------|
| Document tree construction | O(n) | n is the total number of file-system nodes |
| File lookup | O(1) | Hash-table lookup |
| Single-file read | O(1) | Locate through `file_map`, then read |
| Full-text search | O(k) | k is the total number of indexed lines |

### 5.3 Potential Optimizations

Although the current implementation already performs well, several optimizations remain possible:

#### Caching
- **Rendered-result cache**: add an LRU cache for frequently accessed files to avoid repeated rendering.
- **Search-result cache**: cache results for common queries to improve response speed.

#### Incremental Updates
- **File watching**: use the `notify` crate to monitor file-system changes.
- **Hot reload**: incrementally update `DocumentTree` when documents change instead of rebuilding it completely.

#### Index Optimization
- **Inverted index**: refactor `search_index` into a term-based inverted index.
- **Vector search**: introduce embedding models for semantic search.

---

## 6. Design Strengths and Improvement Suggestions

### 6.1 Design Strengths

1. **Single-responsibility principle**: the module focuses on document-data management and processing.
2. **High cohesion**: related functions, such as tree building, search, and rendering, are organized together.
3. **Low coupling**: it interacts with other modules through clearly defined interfaces.
4. **Testability**: the pure-function-style API design makes unit testing straightforward.
5. **Extensibility**: the module structure makes it easy to add features such as tagging or version control.

### 6.2 Improvement Suggestions

1. **Configuration separation**:
   - Search weights are currently hardcoded.
   - Extract them into configuration so they can be adjusted dynamically.

2. **Concurrency safety**:
   - `DocumentTree` is currently immutable.
   - If runtime updates are required, wrap it with `Arc<RwLock<T>>`.

3. **Persistence support**:
   - Add serialization/deserialization capabilities.
   - Cache a built `DocumentTree` to disk to speed up startup.

4. **Search enhancements**:
   - Support Boolean operators such as AND/OR/NOT.
   - Add an optional regular-expression search mode.
   - Implement fuzzy matching.

5. **Internationalization support**:
   - The current highlighting implementation assumes ASCII text.
   - It should be improved to handle Unicode and wide characters correctly.

---

## 7. Summary

As Litho Book's knowledge hub, the document data domain successfully converts static files into a dynamic knowledge base. Its design reflects the strengths of Rust: a powerful type system for data integrity, ownership for memory safety, and a high-performance asynchronous ecosystem for a smooth user experience.

The module provides more than basic document management. Through intelligent search algorithms and comprehensive context support, it gives users a knowledge-exploration experience beyond a traditional file browser. Its clear architecture and modular design provide a solid foundation for future expansion and make it one of the system's most mature and critical components.
