use axum::{
    Router,
    extract::{Query, State},
    http::StatusCode,
    response::{Html, Json, Sse, sse::Event},
    routing::{get, post},
};
use futures::stream::Stream;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::convert::Infallible;
use std::fs;
use std::path::Path;
use std::time::Duration;
use tower_http::{cors::CorsLayer, services::ServeDir};
use tracing::{debug, error, info};

use crate::filesystem::{DocumentTree, SearchResult};

#[derive(Clone)]
pub struct AppState {
    pub doc_tree: DocumentTree,
    pub docs_path: String,
    pub lang: String,
}

#[derive(Deserialize)]
pub struct FileQuery {
    file: Option<String>,
}

#[derive(Deserialize)]
pub struct SearchQuery {
    q: Option<String>,
}

#[derive(Serialize)]
pub struct FileResponse {
    pub content: String,
    pub html: String,
    pub path: String,
    pub size: Option<u64>,
    pub modified: Option<String>,
}

#[derive(Serialize)]
pub struct SearchResponse {
    pub results: Vec<SearchResult>,
    pub total: usize,
    pub query: String,
}

#[derive(Serialize)]
pub struct StatsResponse {
    pub total_files: usize,
    pub total_dirs: usize,
    pub total_size: u64,
    pub formatted_size: String,
}

// AI-assistant-related data structures.
#[derive(Deserialize)]
pub struct ChatRequest {
    pub message: String,
    pub context: Option<String>, // Current document content as context.
    pub history: Option<Vec<OpenAIMessage>>, // Conversation history messages.
}

#[derive(Serialize, Deserialize)]
pub struct OpenAIMessage {
    pub role: String,
    pub content: String,
}

#[derive(Serialize, Deserialize)]
pub struct OpenAIRequest {
    pub model: String,
    pub messages: Vec<OpenAIMessage>,
    pub temperature: f32,
    pub max_tokens: i32,
    pub stream: bool,
}
// Streaming-response-related data structures.
#[derive(Deserialize)]
pub struct OpenAIStreamChoice {
    pub delta: OpenAIStreamDelta,
    pub finish_reason: Option<String>,
}

#[derive(Deserialize)]
pub struct OpenAIStreamDelta {
    pub content: Option<String>,
}

#[derive(Deserialize)]
pub struct OpenAIStreamResponse {
    pub choices: Vec<OpenAIStreamChoice>,
}

#[derive(Serialize)]
pub struct StreamEvent {
    pub event_type: String,
    pub content: Option<String>,
    pub suggestions: Option<Vec<String>>,
    pub finished: bool,
}

/// Create the main application router
pub fn create_router(doc_tree: DocumentTree, docs_path: String, lang: String) -> Router {
    let state = AppState {
        doc_tree,
        docs_path,
        lang,
    };

    Router::new()
        .route("/", get(index_handler))
        .route("/api/file", get(get_file_handler))
        .route("/api/tree", get(get_tree_handler))
        .route("/api/search", get(search_handler))
        .route("/api/stats", get(stats_handler))
        .route("/api/chat", post(chat_stream_handler))
        .route("/health", get(health_handler))
        .nest_service("/assets", ServeDir::new("assets"))
        .layer(CorsLayer::permissive())
        .with_state(state)
}

/// Serve the main index page
async fn index_handler(State(state): State<AppState>) -> Result<Html<String>, StatusCode> {
    debug!("Serving index page");

    let tree_json = serde_json::to_string(&state.doc_tree.root).map_err(|e| {
        error!("Failed to serialize document tree: {}", e);
        StatusCode::INTERNAL_SERVER_ERROR
    })?;

    let html = generate_index_html(&tree_json, &state.docs_path, &state.lang);
    Ok(Html(html))
}

/// Get file content and render as HTML
async fn get_file_handler(
    Query(params): Query<FileQuery>,
    State(state): State<AppState>,
) -> Result<Json<FileResponse>, StatusCode> {
    let file_path = params.file.ok_or_else(|| {
        debug!("Missing file parameter in request");
        StatusCode::BAD_REQUEST
    })?;

    debug!("Requesting file: {}", file_path);

    let content = state.doc_tree.get_file_content(&file_path).map_err(|e| {
        error!("Failed to read file {}: {}", file_path, e);
        StatusCode::NOT_FOUND
    })?;

    let html = state.doc_tree.render_markdown(&content);

    // Get file metadata if available
    let file_info = state
        .doc_tree
        .file_map
        .get(&file_path)
        .and_then(|path| std::fs::metadata(path).ok())
        .map(|metadata| {
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
            (size, modified)
        });

    let response = FileResponse {
        content,
        html,
        path: file_path,
        size: file_info.as_ref().map(|(size, _)| *size),
        modified: file_info.and_then(|(_, modified)| modified),
    };

    info!("Successfully served file: {}", response.path);
    Ok(Json(response))
}

/// Get the document tree structure
async fn get_tree_handler(State(state): State<AppState>) -> Json<serde_json::Value> {
    debug!("Serving document tree");
    Json(serde_json::to_value(&state.doc_tree.root).unwrap_or_default())
}

/// Search for content with full-text search
async fn search_handler(
    Query(params): Query<SearchQuery>,
    State(state): State<AppState>,
) -> Result<Json<SearchResponse>, StatusCode> {
    let query = params.q.unwrap_or_default();

    if query.trim().is_empty() {
        return Ok(Json(SearchResponse {
            results: vec![],
            total: 0,
            query: query.clone(),
        }));
    }

    debug!("Searching for: {}", query);

    let results = state.doc_tree.search_content(&query);
    let total = results.len();

    debug!("Found {} results matching query: {}", total, query);

    Ok(Json(SearchResponse {
        results,
        total,
        query,
    }))
}

/// Get statistics about the document tree
async fn stats_handler(State(state): State<AppState>) -> Json<StatsResponse> {
    let stats = state.doc_tree.get_stats();

    let formatted_size = format_bytes(stats.total_size);

    Json(StatsResponse {
        total_files: stats.total_files,
        total_dirs: stats.total_dirs,
        total_size: stats.total_size,
        formatted_size,
    })
}

/// Health check endpoint
async fn health_handler() -> Json<serde_json::Value> {
    Json(serde_json::json!({
        "status": "healthy",
        "timestamp": chrono::Utc::now().to_rfc3339(),
        "version": env!("CARGO_PKG_VERSION")
    }))
}

/// AI assistant streaming chat handler.
async fn chat_stream_handler(
    State(state): State<AppState>,
    Json(request): Json<ChatRequest>,
) -> Sse<impl Stream<Item = Result<Event, Infallible>>> {
    debug!("AI assistant received message: {}", request.message);

    let stream = async_stream::stream! {
        match call_openai_stream_api(
            &request.message,
            request.context.as_deref(),
            request.history,
            &state.docs_path,
        ).await {
            Ok(mut response_stream) => {
                let mut full_response = String::new();

                // Send start event.
                yield Ok(Event::default()
                    .event("start")
                    .data(serde_json::to_string(&StreamEvent {
                        event_type: "start".to_string(),
                        content: None,
                        suggestions: None,
                        finished: false,
                    }).unwrap_or_default()));

                // Handle streaming response.
                while let Some(chunk) = response_stream.recv().await {
                    match chunk {
                        Ok(content) => {
                            full_response.push_str(&content);

                            // Send content chunk.
                            yield Ok(Event::default()
                                .event("content")
                                .data(serde_json::to_string(&StreamEvent {
                                    event_type: "content".to_string(),
                                    content: Some(content),
                                    suggestions: None,
                                    finished: false,
                                }).unwrap_or_default()));
                        }
                        Err(e) => {
                            error!("Streaming response error: {}", e);
                            yield Ok(Event::default()
                                .event("error")
                                .data(serde_json::to_string(&StreamEvent {
                                    event_type: "error".to_string(),
                                    content: Some("Sorry, I cannot answer your question right now. Please try again later.".to_string()),
                                    suggestions: None,
                                    finished: true,
                                }).unwrap_or_default()));
                            return;
                        }
                    }
                }

                // Generate suggested questions.
                let suggestions = generate_suggestions(&full_response, request.context.as_deref());

                // Send completion event.
                yield Ok(Event::default()
                    .event("finish")
                    .data(serde_json::to_string(&StreamEvent {
                        event_type: "finish".to_string(),
                        content: None,
                        suggestions: Some(suggestions),
                        finished: true,
                    }).unwrap_or_default()));
            }
            Err(e) => {
                error!("Failed to call AI API: {}", e);
                yield Ok(Event::default()
                    .event("error")
                    .data(serde_json::to_string(&StreamEvent {
                        event_type: "error".to_string(),
                        content: Some("Sorry, I cannot answer your question right now. Please try again later.".to_string()),
                        suggestions: None,
                        finished: true,
                    }).unwrap_or_default()));
            }
        }
    };

    Sse::new(stream).keep_alive(
        axum::response::sse::KeepAlive::new()
            .interval(Duration::from_secs(1))
            .text("keep-alive-text"),
    )
}

/// Call the OpenAI-compatible streaming API.
async fn call_openai_stream_api(
    message: &str,
    context: Option<&str>,
    history: Option<Vec<OpenAIMessage>>,
    _docs_path: &str,
) -> Result<
    tokio::sync::mpsc::Receiver<Result<String, Box<dyn std::error::Error + Send + Sync>>>,
    Box<dyn std::error::Error + Send + Sync>,
> {
    let client = reqwest::Client::new();

    // Build the system prompt.
    let mut system_prompt = "You are a professional documentation assistant that helps users understand and analyze technical documentation. Answer accurately, concisely, and helpfully.".to_string();

    // Add context when provided.
    if let Some(ctx) = context {
        if !ctx.is_empty() {
            system_prompt.push_str(&format!("\n\nUser-provided context:\n{}", ctx));
        }
    }

    // Build message list.
    let mut messages = vec![OpenAIMessage {
        role: "system".to_string(),
        content: system_prompt,
    }];

    // Add history messages when provided.
    if let Some(hist) = history {
        // Limit history to avoid oversized requests.
        let max_history = 10; // Keep at most 10 conversation turns.
        let start_index = if hist.len() > max_history {
            hist.len() - max_history
        } else {
            0
        };
        messages.extend(hist.into_iter().skip(start_index));
    }

    // Add current user message.
    messages.push(OpenAIMessage {
        role: "user".to_string(),
        content: message.to_string(),
    });

    let request_body = OpenAIRequest {
        model: "openai/gpt-4.1".to_string(),
        messages,
        temperature: 0.7,
        max_tokens: 16384,
        stream: true, // Enable streaming response.
    };

    let github_token = std::env::var("GITHUB_TOKEN")
        .map_err(|_| "GITHUB_TOKEN environment variable must be set for GitHub Models API")?;
    if github_token.trim().is_empty() {
        return Err("GITHUB_TOKEN environment variable must not be empty".into());
    }

    let response = client
        .post("https://models.github.ai/inference/chat/completions")
        .header("Authorization", format!("Bearer {}", github_token))
        .header("Accept", "application/vnd.github+json")
        .header("X-GitHub-Api-Version", "2026-03-10")
        .header("Content-Type", "application/json")
        .json(&request_body)
        .send()
        .await?;

    if !response.status().is_success() {
        let status = response.status();
        let text = response.text().await.unwrap_or_default();
        return Err(format!("API request failed: {} - {}", status, text).into());
    }

    // Create a channel for streaming data.
    let (tx, rx) = tokio::sync::mpsc::channel(100);

    // Process the streaming response in a background task.
    tokio::spawn(async move {
        use futures::StreamExt;

        let mut stream = response.bytes_stream();
        let mut buffer = String::new();

        while let Some(chunk_result) = stream.next().await {
            match chunk_result {
                Ok(chunk) => {
                    let chunk_str = String::from_utf8_lossy(&chunk);
                    buffer.push_str(&chunk_str);

                    let ends_with_newline = buffer.ends_with('\n');
                    let mut lines: Vec<String> = buffer.lines().map(str::to_string).collect();
                    let incomplete_tail = if ends_with_newline { None } else { lines.pop() };

                    for line in &lines {
                        if let Some(data) = line.strip_prefix("data: ") {
                            if data == "[DONE]" {
                                // Stream ended.
                                return;
                            }

                            // Try to parse JSON.
                            if let Ok(stream_response) =
                                serde_json::from_str::<OpenAIStreamResponse>(data)
                                && let Some(choice) = stream_response.choices.first()
                            {
                                if let Some(content) = &choice.delta.content
                                    && !content.is_empty()
                                    && tx.send(Ok(content.clone())).await.is_err()
                                {
                                    return; // Receiver has been closed.
                                }

                                // Check whether the stream is complete.
                                if choice.finish_reason.is_some() {
                                    return;
                                }
                            }
                        }
                    }

                    buffer.clear();
                    if let Some(tail) = incomplete_tail {
                        buffer.push_str(&tail);
                    }
                }
                Err(e) => {
                    let _ = tx
                        .send(Err(format!("Streaming response error: {}", e).into()))
                        .await;
                    return;
                }
            }
        }
    });

    Ok(rx)
}

/// Generate recommended follow-up questions.
fn generate_suggestions(ai_response: &str, _context: Option<&str>) -> Vec<String> {
    let mut suggestions = Vec::new();

    // Generate related questions from AI response content.
    if ai_response.contains("architecture") || ai_response.contains("design") {
        suggestions.push("What are the strengths and weaknesses of this architecture?".to_string());
        suggestions.push("What alternative designs are available?".to_string());
    }

    if ai_response.contains("performance") || ai_response.contains("latency") {
        suggestions
            .push("What performance optimization strategies does the project use?".to_string());
        suggestions.push("How can performance hotspots in the project be optimized?".to_string());
    }

    if ai_response.contains("configuration") || ai_response.contains("parameter") {
        suggestions.push("What are the default values for these settings?".to_string());
        suggestions.push("How can these parameters be tuned?".to_string());
    }

    // Provide generic suggestions when no specific suggestion matches.
    if suggestions.is_empty() {
        suggestions.push("Can you explain this in more detail?".to_string());
        suggestions.push("Are there related examples?".to_string());
        suggestions.push("What best practices apply here?".to_string());
    }

    // Limit suggestion count.
    suggestions.truncate(3);
    suggestions
}

/// Format bytes into human-readable format
fn format_bytes(bytes: u64) -> String {
    const UNITS: &[&str] = &["B", "KB", "MB", "GB", "TB"];

    if bytes == 0 {
        return "0 B".to_string();
    }

    let mut size = bytes as f64;
    let mut unit_index = 0;

    while size >= 1024.0 && unit_index < UNITS.len() - 1 {
        size /= 1024.0;
        unit_index += 1;
    }

    if unit_index == 0 {
        format!("{} {}", bytes, UNITS[unit_index])
    } else {
        format!("{:.1} {}", size, UNITS[unit_index])
    }
}

/// Generate the main HTML page
fn generate_index_html(tree_json: &str, docs_path: &str, lang: &str) -> String {
    let labels = load_labels(lang);

    // Read the template file
    let template_content = include_str!("../templates/index.html.tpl");

    // Replace the placeholders with actual data
    let mut html = template_content
        .replace("{{ tree_json|safe }}", tree_json)
        .replace("{{ docs_path }}", docs_path);

    // Generic i18n placeholder replacement:
    // {{ i18n.some_key }} -> labels["some_key"]
    for (key, value) in labels {
        let placeholder = format!("{{{{ i18n.{} }}}}", key);
        html = html.replace(&placeholder, &value);
    }

    html
}

fn load_labels(lang: &str) -> HashMap<String, String> {
    let i18n_dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("i18n");
    let en_path = i18n_dir.join("en.json");
    let mut labels = load_i18n_map(&en_path)
        .or_else(|| {
            serde_json::from_str::<HashMap<String, String>>(include_str!("../i18n/en.json")).ok()
        })
        .unwrap_or_default();

    let normalized_lang = normalize_lang(lang);
    if normalized_lang != "en" {
        let lang_path = i18n_dir.join(format!("{}.json", normalized_lang));
        if let Some(lang_labels) = load_i18n_map(&lang_path) {
            // English keys remain the fallback for missing translations.
            labels.extend(lang_labels);
        }
    }

    labels
}

fn normalize_lang(lang: &str) -> String {
    let normalized = lang.trim().to_lowercase().replace('_', "-");
    normalized
        .split('-')
        .next()
        .filter(|part| !part.is_empty())
        .unwrap_or("en")
        .to_string()
}

fn load_i18n_map(path: &Path) -> Option<HashMap<String, String>> {
    let content = fs::read_to_string(path).ok()?;
    serde_json::from_str::<HashMap<String, String>>(&content).ok()
}

#[cfg(test)]
mod tests {
    use super::*;
    use axum::body::Body;
    use axum::http::Request;
    use tower::ServiceExt;

    fn make_test_app() -> (Router, tempfile::TempDir) {
        let dir = tempfile::tempdir().unwrap();
        std::fs::write(dir.path().join("test.md"), "# Test\nHello world").unwrap();
        let tree = DocumentTree::new(dir.path()).unwrap();
        let docs_path = dir.path().display().to_string().replace('\\', "/");
        let router = create_router(tree, docs_path, "en".to_string());
        (router, dir)
    }

    #[tokio::test]
    async fn health_endpoint_returns_ok() {
        let (app, _dir) = make_test_app();
        let response = app
            .oneshot(
                Request::builder()
                    .uri("/health")
                    .body(Body::empty())
                    .unwrap(),
            )
            .await
            .unwrap();

        assert_eq!(response.status(), StatusCode::OK);
    }

    #[tokio::test]
    async fn file_endpoint_returns_markdown_file() {
        let (app, _dir) = make_test_app();
        let response = app
            .oneshot(
                Request::builder()
                    .uri("/api/file?file=test.md")
                    .body(Body::empty())
                    .unwrap(),
            )
            .await
            .unwrap();

        assert_eq!(response.status(), StatusCode::OK);
    }

    #[tokio::test]
    async fn file_endpoint_rejects_missing_file_param() {
        let (app, _dir) = make_test_app();
        let response = app
            .oneshot(
                Request::builder()
                    .uri("/api/file")
                    .body(Body::empty())
                    .unwrap(),
            )
            .await
            .unwrap();

        assert_eq!(response.status(), StatusCode::BAD_REQUEST);
    }

    #[tokio::test]
    async fn file_endpoint_returns_not_found_for_unknown_file() {
        let (app, _dir) = make_test_app();
        let response = app
            .oneshot(
                Request::builder()
                    .uri("/api/file?file=missing.md")
                    .body(Body::empty())
                    .unwrap(),
            )
            .await
            .unwrap();

        assert_eq!(response.status(), StatusCode::NOT_FOUND);
    }

    #[tokio::test]
    async fn search_endpoint_returns_ok() {
        let (app, _dir) = make_test_app();
        let response = app
            .oneshot(
                Request::builder()
                    .uri("/api/search?q=Hello")
                    .body(Body::empty())
                    .unwrap(),
            )
            .await
            .unwrap();

        assert_eq!(response.status(), StatusCode::OK);
    }
}
