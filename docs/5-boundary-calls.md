# System Boundary Interface Documentation

This document describes the system external call interfaces, including boundary mechanisms such as CLI commands, API endpoints, and configuration parameters.

## Command-Line Interface (CLI)

### litho-book

**Description**: A web-based reader for litho-generated documentation

**Source file**: `src/cli.rs`

**Arguments**:

- `docs_dir` (PathBuf): Required - Path to the markdown documentation directory

**Options**:

- `port, p`(u16): Optional - Port to serve the web interface on (default: `3000`)
- `host`(String): Optional - Host to bind the server to (default: `127.0.0.1`)
- `open, o`(bool): Optional - Open browser automatically after starting the server
- `verbose, v`(bool): Optional - Enable verbose logging

**Usage examples**:

```bash
litho-book ./docs
```

```bash
litho-book ./docs -p 8080 --host 0.0.0.0 --open
```

```bash
litho-book ./notes --port 3000 --verbose
```

## API Interfaces

### GET /

**Description**: Serve the main index page with document tree and UI

**Source file**: `src/server.rs`

**Response format**: HTML

### GET /api/file

**Description**: Get file content and render as HTML

**Source file**: `src/server.rs`

**Request format**: Query parameter 'file' specifying the file path

**Response format**: JSON with FileResponse structure

### GET /api/tree

**Description**: Get the document tree structure

**Source file**: `src/server.rs`

**Response format**: JSON with document tree hierarchy

### GET /api/search

**Description**: Search for content with full-text search

**Source file**: `src/server.rs`

**Request format**: Query parameter 'q' containing search term

**Response format**: JSON with SearchResponse structure

### GET /api/stats

**Description**: Get statistics about the document tree

**Source file**: `src/server.rs`

**Response format**: JSON with StatsResponse structure

### POST /api/chat

**Description**: AI assistant streaming chat endpoint

**Source file**: `src/server.rs`

**Request format**: JSON with ChatRequest structure containing message, context, and history

**Response format**: SSE (Server-Sent Events) stream of StreamEvent objects

**Authentication**: Bearer token read from the GITHUB_TOKEN environment variable for GitHub Models API

### GET /health

**Description**: Health check endpoint

**Source file**: `src/server.rs`

**Response format**: JSON with health status and version info

## Integration Recommendations

### CLI

Use the command line interface to start the documentation server with custom configuration

**Example code**:

```
litho-book ./my-docs --port 8080 --host 0.0.0.0 --open --verbose
```

**Best practices**:

- Always validate that your documentation directory exists before starting
- Use ports >= 1024 to avoid requiring administrator privileges
- Enable verbose logging (--verbose) when debugging startup issues
- Use --open flag to automatically launch browser after startup

### API

Integrate with the RESTful API to build custom frontends or automation scripts

**Example code**:

```
curl "http://localhost:3000/api/search?q=architecture"
curl -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Explain the system architecture", "context": "..."}'
```

**Best practices**:

- Cache responses from /api/tree and /api/stats endpoints for performance
- Implement proper error handling for 404 (file not found) and 500 (server error) responses
- Respect rate limits when making multiple requests
- Use the health endpoint to check server status before making requests

### Security

Secure the application when exposing beyond localhost

**Example code**:

```
litho-book ./docs --host 0.0.0.0 --port 8080
# Add reverse proxy with authentication
```

**Best practices**:

- Avoid binding to 0.0.0.0 in production without additional security measures
- Consider adding JWT or API key authentication for the API endpoints
- Use GITHUB_TOKEN only through the environment and rotate it if exposed
- Monitor logs for unauthorized access attempts


---

**Analysis confidence**: 9.5/10
