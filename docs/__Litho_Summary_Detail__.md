# Project Analysis Summary Report (Full Version)

Generated at: 2025-10-04 09:16:59 UTC

## Execution Time Statistics

- **Total execution time**: 589.59 seconds
- **Preprocessing phase**: 0.08 seconds (0.0%)
- **Research phase**: 68.03 seconds (11.5%)
- **Documentation generation phase**: 521.49 seconds (88.4%)
- **Output phase**: 0.00 seconds (0.0%)
- **Summary generation time**: 0.000 seconds

## Cache Performance Statistics and Savings

### Performance Metrics
- **Cache hit rate**: 100.0%
- **Total operations**: 17
- **Cache hits**: 17
- **Cache misses**: 0
- **Cache writes**: 1

### Savings
- **Reasoning time saved**: 98.1 seconds
- **Tokens saved**: 47817 input + 12612 output = 60429 total
- **Estimated cost saved**: $0.0290
- **Efficiency improvement ratio**: 0.2x(time saved / actual execution time)

## Core Research Data Summary

According to the prompt template data integration rules, the following is the complete content of the four research material categories:

### System context research report
Provides the project core goals, user roles, and system boundary information.

```json
{
  "business_value": "By converting local documentation directories into a structured, searchable, AI-assisted web interface, it significantly improves the accessibility and efficiency of personal knowledge bases, reduces information fragmentation, and supports efficient knowledge retrieval and content creation, especially for technical documentation management, reading-note organization, and AI-enhanced learning scenarios.",
  "confidence_score": 0.95,
  "external_systems": [
    {
      "description": "Provides an AI chat streaming response service for handling document-related questions submitted by users in the frontend",
      "interaction_type": "HTTP/REST",
      "name": "GitHub Models (GitHubModels) OpenAI-compatible API"
    }
  ],
  "project_description": "Litho Book is a local document browsing and AI assistant system that combines a command-line tool with a web service. It is designed for developers and knowledge workers to convert local Markdown documentation directories into a searchable, browsable web application, with integrated AI chat capabilities to enhance knowledge exploration.",
  "project_name": "litho-book",
  "project_type": "FullStackApp",
  "system_boundary": {
    "excluded_components": [
      "Frontend React/Vue interface",
      "Markdown file generation tools",
      "Document version control (such as Git)",
      "User authentication and authorization system",
      "Cloud storage synchronization service",
      "AI model training or fine-tuning"
    ],
    "included_components": [
      "Command-line argument parsing (cli.rs)",
      "Filesystem scanning and document tree construction (filesystem.rs)",
      "Unified error handling mechanism (error.rs)",
      "Axum HTTP server (server.rs)",
      "Main program entry coordination (main.rs)"
    ],
    "scope": "Local documentation server and AI-enhanced knowledge exploration system; does not include frontend UI development, document generation, document synchronization, or user account management capabilities"
  },
  "target_users": [
    {
      "description": "Software engineers who use local Markdown files to manage code documentation, API notes, and technical notes",
      "name": "Developers",
      "needs": [
        "Quickly browse local documentation directories",
        "Full-text search over document content",
        "View structured content in a browser",
        "Ask document-related questions through an AI assistant"
      ]
    },
    {
      "description": "Scholars, researchers, or content creators who need to organize and retrieve large numbers of personal notes, reading summaries, and research materials",
      "name": "Knowledge workers",
      "needs": [
        "Centrally manage scattered Markdown files",
        "Quickly locate information by keyword",
        "Receive context-aware AI Q&A support",
        "Use offline without cloud uploads"
      ]
    }
  ]
}
```

### Domain module research report
Provides high-level domain partitioning, module relationships, and core business process information.

```json
{
  "architecture_summary": "Litho Book is a full-stack application for local knowledge management. It uses a command-line startup plus web-service architecture, and its core design follows separation of concerns. The system is written in Rust and uses Axum to build a high-performance HTTP service. User input is parsed through the CLI, while the main program coordinates filesystem scanning, error handling, and service startup. The overall architecture is clear, module dependencies are explicit, and the design emphasizes low coupling and high cohesion. It is deeply optimized for structured Markdown document browsing and AI-enhanced search, with good maintainability and extensibility.",
  "business_flows": [
    {
      "description": "After the user starts the application from the command line, the system begins with argument parsing and completes the full lifecycle of log initialization, document tree construction, HTTP service binding, and automatic browser opening. This is the required first-use path for users.",
      "entry_point": "Run from the command line `litho-book --path ./docs --port 3000`",
      "importance": 10.0,
      "involved_domains_count": 3,
      "name": "Project Startup and Service Initialization Flow",
      "steps": [
        {
          "code_entry_point": null,
          "domain_module": "User Interaction Domain",
          "operation": "Parse command-line arguments through cli.rs and validate the documentation directory and port",
          "step": 1,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "System Support Domain",
          "operation": "Initialize logging system，Print startup banner",
          "step": 2,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "Document Data Domain",
          "operation": "Call filesystem.rs to recursively scan the documentation directory and build the in-memory DocumentTree structure",
          "step": 3,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "System Support Domain",
          "operation": "Create Axum application state (AppState) and bind the document tree and route handlers",
          "step": 4,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "User Interaction Domain",
          "operation": "Start the Axum HTTP server and bind the TCP port",
          "step": 5,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "System Support Domain",
          "operation": "Decide based on configuration whether to automatically open the browser to the service address",
          "step": 6,
          "sub_module": null
        }
      ]
    },
    {
      "description": "The user enters keywords in the web interface to search. The system performs efficient full-text search in the document tree and returns results with highlighting and relevance scores. This is the core usage scenario for knowledge workers.",
      "entry_point": "The frontend sends a GET /search?q=keyword request",
      "importance": 10.0,
      "involved_domains_count": 2,
      "name": "Document Full-Text Search Flow",
      "steps": [
        {
          "code_entry_point": null,
          "domain_module": "User Interaction Domain",
          "operation": "The web service receives the /search request and extracts the query keyword",
          "step": 1,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "Document Data Domain",
          "operation": "Execute keyword matching in DocumentTree and calculate relevance scores using title weights, term frequency, and context",
          "step": 2,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "Document Data Domain",
          "operation": "Sort matching results, extract context snippets, and add HTML highlight tags",
          "step": 3,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "User Interaction Domain",
          "operation": "Serialize search results as JSON and return them to the frontend",
          "step": 4,
          "sub_module": null
        }
      ]
    },
    {
      "description": "The user asks the AI assistant document-related questions. The system packages context and conversation history, calls an external AI API to obtain a streaming response, and returns it incrementally in SSE format to provide a natural-language interaction experience.",
      "entry_point": "The frontend sends a POST /chat request containing conversation history and the question",
      "importance": 9.0,
      "involved_domains_count": 3,
      "name": "AI Assistant Streaming Conversation Flow",
      "steps": [
        {
          "code_entry_point": null,
          "domain_module": "User Interaction Domain",
          "operation": "The web service receives the /chat request and extracts the user question and conversation history",
          "step": 1,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "Document Data Domain",
          "operation": "Retrieve relevant document snippets from context and build AI request content containing the system prompt and context",
          "step": 2,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "User Interaction Domain",
          "operation": "Use reqwest to send a streaming HTTP request to the GitHub Models OpenAI API",
          "step": 3,
          "sub_module": null
        },
        {
          "code_entry_point": null,
          "domain_module": "User Interaction Domain",
          "operation": "Convert the AI streaming response into Server-Sent Events (SSE) format and return it to the frontend chunk by chunk",
          "step": 4,
          "sub_module": null
        }
      ]
    }
  ],
  "confidence_score": 0.98,
  "domain_modules": [
    {
      "code_paths": [
        "src/cli.rs",
        "src/server.rs"
      ],
      "complexity": 8.0,
      "description": "Handles direct interaction between users and the system, including command-line argument parsing and backend service support for the web interface. This domain is the sole entry point into the system, responsible for receiving configuration, validating parameters, and responding to frontend requests; it bridges user intent and system capabilities.",
      "domain_type": "Core Business Domain",
      "importance": 10.0,
      "name": "User Interaction Domain",
      "sub_modules": [
        {
          "code_paths": [
            "src/cli.rs"
          ],
          "description": "Parses configuration parameters entered by users through the command line, such as document path, port, and host address, and validates them (for example, directory existence and port permissions), with cross-platform permission checks.",
          "importance": 9.0,
          "key_functions": [
            "Parse the --path, --port, --host, --open, and --verbose arguments",
            "Verify that the documentation directory exists and is a directory",
            "Check administrator privileges for privileged ports (<1024)",
            "Generate service address strings"
          ],
          "name": "Command-Line Interface"
        },
        {
          "code_paths": [
            "src/server.rs"
          ],
          "description": "Provides RESTful APIs based on Axum to respond to frontend requests, including document browsing, full-text search, system statistics, and AI chat streaming responses. It is the core channel for users to interact with the system through a browser.",
          "importance": 10.0,
          "key_functions": [
            "Render Markdown files as HTML",
            "Return the document tree structure",
            "Execute keyword full-text search (with weighted ranking)",
            "Return system statistics (file count, size, etc.)",
            "Stream AI conversation responses (SSE)",
            "Generate the homepage HTML template"
          ],
          "name": "Web Service Interface"
        }
      ]
    },
    {
      "code_paths": [
        "src/filesystem.rs"
      ],
      "complexity": 9.0,
      "description": "Responsible for structured modeling and content management of local documentation directories. It converts Markdown files in the filesystem into a searchable, navigable in-memory tree structure (DocumentTree), and provides full-text search and rendering capabilities. It is the core carrier and processing engine for the system knowledge content.",
      "domain_type": "Core Business Domain",
      "importance": 10.0,
      "name": "Document Data Domain",
      "sub_modules": [
        {
          "code_paths": [
            "src/filesystem.rs"
          ],
          "description": "Recursively scans the specified directory and builds a tree structure containing file paths, metadata, and content. It indexes only .md files, ignores hidden files, and supports file type identification and path mapping.",
          "importance": 9.0,
          "key_functions": [
            "Recursively traverse directories",
            "Build FileNode nodes and the DocumentTree structure",
            "Filter non-Markdown files and hidden files",
            "Build an index from file paths to content"
          ],
          "name": "Document Tree Construction"
        },
        {
          "code_paths": [
            "src/filesystem.rs"
          ],
          "description": "Implements keyword-based intelligent search that combines title weighting, term-frequency analysis, context extraction, and relevance ranking, returning highlighted search results for quick document content location.",
          "importance": 10.0,
          "key_functions": [
            "Keyword matching and highlighting",
            "Title weighting (H1/H2 first)",
            "Term-frequency statistics and relevance scoring",
            "Context snippet extraction",
            "Search result sorting"
          ],
          "name": "Full-Text Search Engine"
        },
        {
          "code_paths": [
            "src/filesystem.rs"
          ],
          "description": "Converts Markdown source files to HTML for frontend display, ensuring content renders correctly in the browser.",
          "importance": 7.0,
          "key_functions": [
            "Syntax conversion from Markdown to HTML",
            "Code block highlighting support",
            "Inline style and structure preservation"
          ],
          "name": "Markdown Renderer"
        }
      ]
    },
    {
      "code_paths": [
        "src/main.rs",
        "src/error.rs"
      ],
      "complexity": 6.0,
      "description": "Provides system-level common capabilities, including unified error handling, log initialization, program startup coordination, and external service calls. This domain contains no business logic, but ensures stable system operation and reliable inter-module communication.",
      "domain_type": "Infrastructure Domain",
      "importance": 8.0,
      "name": "System Support Domain",
      "sub_modules": [
        {
          "code_paths": [
            "src/error.rs"
          ],
          "description": "Defines a unified LithoBookError enum that wraps errors such as IO, serialization, and invalid paths. By implementing From<LithoBookError> for axum::http::StatusCode, it automatically maps application errors to standard HTTP status codes, ensuring consistent frontend/backend error handling.",
          "importance": 9.0,
          "key_functions": [
            "Define the LithoBookError enum",
            "Wrap std::io::Error and serde_json::Error",
            "Map to axum::http::StatusCode",
            "Provide error conversion and logging"
          ],
          "name": "Error Handling Hub"
        },
        {
          "code_paths": [
            "src/main.rs"
          ],
          "description": "As the application main entry point, it initializes logging, loads configuration, builds the document tree, creates the server, and starts the service; it is the orchestration center for the entire system lifecycle.",
          "importance": 8.0,
          "key_functions": [
            "Parse command-line arguments",
            "Initialize logging system",
            "Print startup banner",
            "Call filesystem to build the document tree",
            "Create the Axum router and AppState",
            "Bind the TCP port and start the HTTP service",
            "Automatically open browser"
          ],
          "name": "Program Startup Coordination"
        }
      ]
    }
  ],
  "domain_relations": [
    {
      "description": "Both the command-line interface and web service interface depend on the DocumentTree structure provided by the Document Data Domain to respond to user requests. The CLI calls the filesystem module at startup to build the tree, and the web service accesses this structure for each search or browsing request; this is the system core data-flow dependency.",
      "from_domain": "User Interaction Domain",
      "relation_type": "Data dependency",
      "strength": 9.0,
      "to_domain": "Document Data Domain"
    },
    {
      "description": "During execution, both CLI and web service depend on the error handling mechanism in the System Support Domain to uniformly convert business errors into standard HTTP response codes, ensuring consistent user-facing error feedback.",
      "from_domain": "User Interaction Domain",
      "relation_type": "Service call",
      "strength": 8.0,
      "to_domain": "System Support Domain"
    },
    {
      "description": "The main program entry point (main.rs), as the startup coordinator, actively calls the CLI module to parse arguments, calls filesystem to build the document tree, and calls server to start the HTTP service. It initiates and orchestrates the entire system flow.",
      "from_domain": "System Support Domain",
      "relation_type": "Service call",
      "strength": 9.0,
      "to_domain": "User Interaction Domain"
    },
    {
      "description": "The Document Data Domain may trigger IO errors when scanning files or rendering Markdown; these must be uniformly converted to LithoBookError through error.rs to standardize error propagation.",
      "from_domain": "Document Data Domain",
      "relation_type": "Data dependency",
      "strength": 7.0,
      "to_domain": "System Support Domain"
    },
    {
      "description": "When handling AI chat requests, the Web Service Interface uses reqwest to send HTTP requests to the GitHub Models OpenAI-compatible API, obtains streaming responses, and converts them into SSE streams for the frontend. This is the key external dependency for the system enhanced functionality.",
      "from_domain": "User Interaction Domain",
      "relation_type": "Service call",
      "strength": 8.0,
      "to_domain": "External System"
    }
  ]
}
```

### Workflow research report
Contains static codebase analysis results and business process analysis.

```json
{
  "main_workflow": {
    "description": "After the user starts the application from the command line, the system begins with argument parsing and completes the full lifecycle of log initialization, document tree construction, HTTP service binding, and automatic browser opening. This is the required first-use path for users.",
    "flowchart_mermaid": "graph TD\n    A[User runs command-line startup] --> B[Parse command-line arguments]\n    B --> C[Initialize logging system]\n    C --> D[Build document tree]\n    D --> E[Create HTTP server]\n    E --> F[Start HTTP service]\n    F --> G[Automatically open browser]",
    "name": "Project Startup and Service Initialization Flow"
  },
  "other_important_workflows": [
    {
      "description": "The user enters keywords in the web interface to search. The system performs efficient full-text search in the document tree and returns results with highlighting and relevance scores. This is the core usage scenario for knowledge workers.",
      "flowchart_mermaid": "graph TD\n    A[User enters search keyword] --> B[Receive search request]\n    B --> C[Execute full-text search]\n    C --> D[Sort and highlight results]\n    D --> E[Return search results]",
      "name": "Document Full-Text Search Flow"
    },
    {
      "description": "The user asks the AI assistant document-related questions. The system packages context and conversation history, calls an external AI API to obtain a streaming response, and returns it incrementally in SSE format to provide a natural-language interaction experience.",
      "flowchart_mermaid": "graph TD\n    A[User submits question] --> B[Receive chat request]\n    B --> C[Build AI request content]\n    C --> D[Call AI API]\n    D --> E[Return response as a stream]",
      "name": "AI Assistant Streaming Conversation Flow"
    }
  ]
}
```

### Code insight data
Code analysis results from preprocessing, including function, class, and module definitions.

```json
[
  {
    "code_dossier": {
      "code_purpose": "entry",
      "description": null,
      "file_path": "src/main.rs",
      "functions": [
        "main",
        "init_logging",
        "print_banner",
        "open_browser",
        "format_bytes"
      ],
      "importance_score": 1.0,
      "interfaces": [],
      "name": "main.rs",
      "source_summary": "mod cli;\nmod error;\nmod filesystem;\nmod server;\n\nuse clap::Parser;\nuse tracing::{error, info, warn};\nuse tracing_subscriber::{layer::SubscriberExt, util::SubscriberInitExt};\n\n#[tokio::main]\nasync fn main() -> anyhow::Result<()> {\n    // Parse command line arguments\n    let args = cli::Args::parse();\n    \n    // Initialize logging\n    init_logging(args.verbose);\n    \n    // Print banner\n    print_banner();\n    \n    // Validate arguments\n    if let Err(e) = args.validate() {\n        error!(\"Argument validation failed: {}\", e);\n        std::process::exit(1);\n    }\n    \n    info!(\"Scanning documentation directory: {}\", args.docs_dir.display());\n    \n    // Build document tree\n    let doc_tree = match filesystem::DocumentTree::new(&args.docs_dir) {\n        Ok(tree) => {\n            let stats = tree.get_stats();\n            info!(\n                \"successfully scanned documentation directory: {} files, {} directories, total size: {}\",\n                stats.total_files,\n                stats.total_dirs,\n                format_bytes(stats.total_size)\n            );\n            \n            if stats.total_files == 0 {\n                warn!(\"No Markdown files found; please check whether the directory contains .md files\");\n            }\n            \n            tree\n        }\n        Err(e) => {\n            error!(\"Failed to scan documentation directory: {}\", e);\n            std::process::exit(1);\n        }\n    };\n    \n    // Create router\n    let docs_path = args.docs_dir.display().to_string().replace('\\\\', \"/\");\n    let app = server::create_router(doc_tree, docs_path);\n    \n    // Start server\n    let bind_address = args.bind_address();\n    let listener = match tokio::net::TcpListener::bind(&bind_address).await {\n        Ok(listener) => {\n            info!(\"Server bound successfully: {}\", bind_address);\n            listener\n        }\n        Err(e) => {\n            error!(\"Unable to bind to address {}: {}\", bind_address, e);\n            std::process::exit(1);\n        }\n    };\n    \n    let server_url = args.server_url();\n    \n    info!(\"🚀 Litho Book server started successfully!\");\n    info!(\"📖 Access URL: {}\", server_url);\n    info!(\"📁 Documentation directory: {}\", args.docs_dir.display());\n    info!(\"⏹️  Press Ctrl+C to stop the server\");\n    \n    // Auto-open browser\n    if args.open {\n        info!(\"Opening browser...\");\n        if let Err(e) = open_browser(&server_url) {\n            warn!(\"unable to automatically open browser: {}\", e);\n            info!(\"Please visit manually: {}\", server_url);\n        }\n    }\n    \n    // Start server\n    if let Err(e) = axum::serve(listener, app).await {\n        error!(\"Server runtime error: {}\", e);\n        std::process::exit(1);\n    }\n    \n    Ok(())\n}\n\n/// Initialize logging based on verbosity level\nfn init_logging(verbose: bool) {\n    let filter = if verbose {\n        tracing_subscriber::filter::LevelFilter::DEBUG\n    } else {\n        tracing_subscriber::filter::LevelFilter::INFO\n    };\n    \n    tracing_subscriber::registry()\n        .with(\n            tracing_subscriber::fmt::layer()\n                .with_target(false)\n                .with_thread_ids(false)\n                .with_thread_names(false)\n                .with_file(false)\n                .with_line_number(false)\n        )\n        .with(filter)\n        .init();\n}\n\n/// Print application banner\nfn print_banner() {\n    println!();\n    println!(\"📚 Litho Book - Documentation Reader\");\n    println!(\"   Version: {}\", env!(\"CARGO_PKG_VERSION\"));\n    println!(\"   A web-based reader for litho-generated documentation\");\n    println!();\n}\n\n/// Open browser automatically\nfn open_browser(url: &str) -> anyhow::Result<()> {\n    #[cfg(target_os = \"windows\")]\n    {\n        std::process::Command::new(\"cmd\")\n            .args([\"/c\", \"start\", \"\", url])\n            .spawn()?;\n    }\n    \n    #[cfg(target_os = \"macos\")]\n    {\n        std::process::Command::new(\"open\")\n            .arg(url)\n            .spawn()?;\n    }\n    \n    #[cfg(target_os = \"linux\")]\n    {\n        // Try different browsers in order of preference\n        let browsers = [\"xdg-open\", \"firefox\", \"chromium\", \"google-chrome\"];\n        \n        for browser in &browsers {\n            if std::process::Command::new(browser)\n                .arg(url)\n                .spawn()\n                .is_ok()\n            {\n                return Ok(());\n            }\n        }\n        \n        anyhow::bail!(\"No suitable browser found\");\n    }\n    \n    #[cfg(not(any(target_os = \"windows\", target_os = \"macos\", target_os = \"linux\")))]\n    {\n        anyhow::bail!(\"Automatic browser opening not supported on this platform\");\n    }\n    \n    Ok(())\n}\n\n/// Format bytes into human-readable format\nfn format_bytes(bytes: u64) -> String {\n    const UNITS: &[&str] = &[\"B\", \"KB\", \"MB\", \"GB\", \"TB\"];\n    \n    if bytes == 0 {\n        return \"0 B\".to_string();\n    }\n    \n    let mut size = bytes as f64;\n    let mut unit_index = 0;\n    \n    while size >= 1024.0 && unit_index < UNITS.len() - 1 {\n        size /= 1024.0;\n        unit_index += 1;\n    }\n    \n    if unit_index == 0 {\n        format!(\"{} {}\", bytes, UNITS[unit_index])\n    } else {\n        format!(\"{:.1} {}\", size, UNITS[unit_index])\n    }\n}"
    },
    "complexity_metrics": {
      "cohesion_score": 0.9,
      "coupling_factor": 0.8,
      "cyclomatic_complexity": 15.0,
      "depth_of_inheritance": 0,
      "lines_of_code": 187,
      "number_of_classes": 0,
      "number_of_functions": 5
    },
    "dependencies": [
      {
        "dependency_type": "internal",
        "is_external": false,
        "line_number": 11,
        "name": "cli",
        "path": "./src/cli.rs",
        "version": null
      },
      {
        "dependency_type": "internal",
        "is_external": false,
        "line_number": 11,
        "name": "error",
        "path": "./src/error.rs",
        "version": null
      },
      {
        "dependency_type": "internal",
        "is_external": false,
        "line_number": 11,
        "name": "filesystem",
        "path": "./src/filesystem.rs",
        "version": null
      },
      {
        "dependency_type": "internal",
        "is_external": false,
        "line_number": 11,
        "name": "server",
        "path": "./src/server.rs",
        "version": null
      },
      {
        "dependency_type": "external",
        "is_external": true,
        "line_number": 12,
        "name": "clap",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "external",
        "is_external": true,
        "line_number": 13,
        "name": "tracing",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "external",
        "is_external": true,
        "line_number": 13,
        "name": "tracing_subscriber",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "external",
        "is_external": true,
        "line_number": 15,
        "name": "tokio",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "external",
        "is_external": true,
        "line_number": 15,
        "name": "anyhow",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "external",
        "is_external": true,
        "line_number": 56,
        "name": "axum",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "external",
        "is_external": true,
        "line_number": 23,
        "name": "std::process",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "external",
        "is_external": true,
        "line_number": 106,
        "name": "std::fs",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "external",
        "is_external": true,
        "line_number": 73,
        "name": "open",
        "path": null,
        "version": null
      }
    ],
    "detailed_description": "main.rs is the execution entry point for the Litho Book project. It initializes the application environment, parses command-line arguments, builds the document tree, starts the web server, and handles system-level operations. It coordinates the workflows of multiple modules (cli, error, filesystem, server), completing the full lifecycle from user input to service startup. The core workflow includes parsing command-line arguments, initializing logging, printing the startup banner, validating arguments, scanning the documentation directory to build the file tree, creating the Axum router, binding the TCP listener port, starting the HTTP service, and automatically opening the browser when needed. This component is the startup hub for the whole application; it does not implement business logic, but delegates tasks to other modules as a coordinator.",
    "interfaces": [],
    "responsibilities": [
      "Parse and validate command-line arguments",
      "Initialize the logging system and environment configuration",
      "Build the documentation directory tree and handle file scanning",
      "Create and start the Axum HTTP server",
      "Handle platform-specific browser auto-open logic"
    ]
  },
  {
    "code_dossier": {
      "code_purpose": "model",
      "description": null,
      "file_path": "src/filesystem.rs",
      "functions": [
        "FileNode",
        "SearchResult",
        "SearchMatch",
        "DocumentTree",
        "TreeStats",
        "DocumentTree::new",
        "DocumentTree::build_tree",
        "DocumentTree::get_file_content",
        "DocumentTree::render_markdown",
        "DocumentTree::get_stats",
        "DocumentTree::search_content",
        "DocumentTree::highlight_matches"
      ],
      "importance_score": 0.8,
      "interfaces": [],
      "name": "filesystem.rs",
      "source_summary": "use serde::{Deserialize, Serialize};\nuse std::collections::HashMap;\nuse std::path::{Path, PathBuf};\nuse tracing::{debug, warn};\n\n#[derive(Debug, Clone, Serialize, Deserialize)]\npub struct FileNode {\n    pub name: String,\n    pub path: String,\n    pub is_file: bool,\n    pub children: Vec<FileNode>,\n    #[serde(skip_serializing_if = \"Option::is_none\")]\n    pub size: Option<u64>,\n    #[serde(skip_serializing_if = \"Option::is_none\")]\n    pub modified: Option<String>,\n}\n\n#[derive(Debug, Clone, Serialize)]\npub struct SearchResult {\n    pub file_path: String,\n    pub file_name: String,\n    pub title: Option<String>,\n    pub matches: Vec<SearchMatch>,\n    pub relevance_score: f32,\n}\n\n#[derive(Debug, Clone, Serialize)]\npub struct SearchMatch {\n    pub line_number: usize,\n    pub content: String,\n    pub highlighted_content: String,\n    pub context_before: Option<String>,\n    pub context_after: Option<String>,\n}\n\n#[derive(Debug, Clone)]\npub struct DocumentTree {\n    pub root: FileNode,\n    pub file_map: HashMap<String, PathBuf>,\n    pub stats: TreeStats,\n    pub search_index: HashMap<String, Vec<String>>, // file_path -> lines\n}\n\n#[derive(Debug, Clone)]\npub struct TreeStats {\n    pub total_files: usize,\n    pub total_dirs: usize,\n    pub total_size: u64,\n}\n\nimpl DocumentTree {\n    /// Create a new document tree from the given directory\n    pub fn new(docs_dir: &Path) -> anyhow::Result<Self> {\n        let mut file_map = HashMap::new();\n        let mut search_index = HashMap::new();\n        let mut stats = TreeStats {\n            total_files: 0,\n            total_dirs: 0,\n            total_size: 0,\n        };\n\n        debug!(\"Building document tree from: {}\", docs_dir.display());\n\n        // Create a virtual root that contains the children of the actual directory\n        let mut children = Vec::new();\n\n        // Read directory contents and sort them\n        let mut entries: Vec<_> = std::fs::read_dir(docs_dir)?\n            .filter_map(|entry| entry.ok())\n            .collect();\n\n        // Sort entries: directories first, then files, both alphabetically\n        entries.sort_by(|a, b| {\n            let a_is_dir = a.path().is_dir();\n            let b_is_dir = b.path().is_dir();\n\n            match (a_is_dir, b_is_dir) {\n                (true, false) => std::cmp::Ordering::Less, // Directories first\n                (false, true) => std::cmp::Ordering::Greater, // Files second\n                _ => a.file_name().cmp(&b.file_name()),    // Same type: sort by name\n            }\n        });\n\n        for entry in entries {\n            let path = entry.path();\n\n            // Skip hidden files and non-markdown files (unless it's a directory)\n            if let Some(name) = path.file_name().and_then(|n| n.to_str()) {\n                if name.starts_with('.') {\n                    debug!(\"Skipping hidden file/directory: {}\", name);\n                    continue;\n                }\n\n                if path.is_file() && path.extension().and_then(|s| s.to_str()) != Some(\"md\") {\n                    debug!(\"Skipping non-markdown file: {}\", name);\n                    continue;\n                }\n            }\n\n            match Self::build_tree(\n                &path,\n                docs_dir,\n                &mut file_map,\n                &mut search_index,\n                &mut stats,\n            ) {\n                Ok(child) => children.push(child),\n                Err(e) => {\n                    warn!(\"Failed to process path {}: {}\", path.display(), e);\n                    continue;\n                }\n            }\n        }\n\n        // Create virtual root node\n        let root = FileNode {\n            name: \"root\".to_string(),\n            path: \"\".to_string(),\n            is_file: false,\n            children,\n            size: None,\n            modified: None,\n        };\n\n        debug!(\n            \"Document tree built: {} files, {} directories, {} bytes total\",\n            stats.total_files, stats.total_dirs, stats.total_size\n        );\n\n        Ok(DocumentTree {\n            root,\n            file_map,\n            stats,\n            search_index,\n        })\n    }\n\n    /// Recursively build the file tree\n    fn build_tree(\n        current_path: &Path,\n        base_path: &Path,\n        file_map: &mut HashMap<String, PathBuf>,\n        search_index: &mut HashMap<String, Vec<String>>,\n        stats: &mut TreeStats,\n    ) -> anyhow::Result<FileNode> {\n        let name = current_path\n            .file_name()\n            .unwrap_or_default()\n            .to_string_lossy()\n            .to_string();\n\n        let relative_path = current_path\n            .strip_prefix(base_path)\n            .unwrap_or(current_path)\n            .to_string_lossy()\n            .replace('\\\\', \"/\");\n\n        if current_path.is_file() {\n            let metadata = std::fs::metadata(current_path)?;\n            let size = metadata.len();\n            let modified = metadata.modified().ok().and_then(|time| {\n                time.duration_since(std::time::UNIX_EPOCH)\n                    .ok()\n                    .map(|d| {\n                        let datetime = chrono::DateTime::from_timestamp(d.as_secs() as i64, 0)?;\n                        Some(datetime.format(\"%Y-%m-%d %H:%M:%S\").to_string())\n                    })\n                    .flatten()\n            });\n\n            if current_path.extension().and_then(|s| s.to_str()) == Some(\"md\") {\n                file_map.insert(relative_path.clone(), current_path.to_path_buf());\n\n                // Build search index for this file\n                if let Ok(content) = std::fs::read_to_string(current_path) {\n                    let lines: Vec<String> = content.lines().map(|line| line.to_string()).collect();\n                    search_index.insert(relative_path.clone(), lines);\n                }\n\n                stats.total_files += 1;\n                stats.total_size += size;\n            }\n\n            return Ok(FileNode {\n                name,\n                path: relative_path,\n                is_file: true,\n                children: vec![],\n                size: Some(size),\n                modified,\n            });\n        }\n\n        stats.total_dirs += 1;\n        let mut children = Vec::new();\n\n        // Read directory contents and sort them\n        let mut entries: Vec<_> = std::fs::read_dir(current_path)?\n            .filter_map(|entry| entry.ok())\n            .collect();\n\n        // Sort entries: directories first, then files, both alphabetically\n        entries.sort_by(|a, b| {\n            let a_is_dir = a.path().is_dir();\n            let b_is_dir = b.path().is_dir();\n\n            match (a_is_dir, b_is_dir) {\n                (true, false) => std::cmp::Ordering::Less, // Directories first\n                (false, true) => std::cmp::Ordering::Greater, // Files second\n                _ => {\n                    // Same type: sort by name (case-insensitive)\n                    let a_name = a.file_name().to_string_lossy().to_lowercase();\n                    let b_name = b.file_name().to_string_lossy().to_lowercase();\n                    a_name.cmp(&b_name)\n                }\n            }\n        });\n\n        for entry in entries {\n            let path = entry.path();\n\n            // Skip hidden files and non-markdown files (unless it's a directory)\n            if let Some(name) = path.file_name().and_then(|n| n.to_str()) {\n                if name.starts_with('.') {\n                    debug!(\"Skipping hidden file/directory: {}\", name);\n                    continue;\n                }\n\n                if path.is_file() && path.extension().and_then(|s| s.to_str()) != Some(\"md\") {\n                    debug!(\"Skipping non-markdown file: {}\", name);\n                    continue;\n                }\n            }\n\n            match Self::build_tree(&path, base_path, file_map, search_index, stats) {\n                Ok(child) => children.push(child),\n                Err(e) => {\n                    warn!(\"Failed to process path {}: {}\", path.display(), e);\n                    continue;\n                }\n            }\n        }\n\n        Ok(FileNode {\n            name,\n            path: relative_path,\n            is_file: false,\n            children,\n            size: None,\n            modified: None,\n        })\n    }\n\n    /// Get the content of a file by its relative path\n    pub fn get_file_content(&self, file_path: &str) -> anyhow::Result<String> {\n        let path = self\n            .file_map\n            .get(file_path)\n            .ok_or_else(|| anyhow::anyhow!(\"File not found: {}\", file_path))?;\n\n        debug!(\"Reading file: {}\", path.display());\n        let content = std::fs::read_to_string(path)\n            .map_err(|e| anyhow::anyhow!(\"Failed to read file {}: {}\", path.display(), e))?;\n\n        Ok(content)\n    }\n\n    /// Render markdown content to HTML\n    pub fn render_markdown(&self, content: &str) -> String {\n        use pulldown_cmark::{Options, Parser, html};\n\n        let mut options = Options::empty();\n        options.insert(Options::ENABLE_TABLES);\n        options.insert(Options::ENABLE_FOOTNOTES);\n        options.insert(Options::ENABLE_STRIKETHROUGH);\n        options.insert(Options::ENABLE_TASKLISTS);\n        options.insert(Options::ENABLE_SMART_PUNCTUATION);\n        options.insert(Options::ENABLE_HEADING_ATTRIBUTES);\n\n        let parser = Parser::new_ext(content, options);\n        let mut html_output = String::new();\n        html::push_html(&mut html_output, parser);\n\n        html_output\n    }\n\n    /// Get statistics about the document tree\n    pub fn get_stats(&self) -> &TreeStats {\n        &self.stats\n    }\n\n    /// Advanced search with full-text search and content preview\n    pub fn search_content(&self, query: &str) -> Vec<SearchResult> {\n        if query.trim().is_empty() {\n            return vec![];\n        }\n\n        let query_lower = query.to_lowercase();\n        let mut results = Vec::new();\n\n        for (file_path, lines) in &self.search_index {\n            let mut matches = Vec::new();\n            let mut relevance_score = 0.0;\n\n            // Extract title from first heading\n            let title = lines\n                .iter()\n                .find(|line| line.trim().starts_with('#'))\n                .map(|line| line.trim_start_matches('#').trim().to_string());\n\n            // Search through all lines\n            for (line_number, line) in lines.iter().enumerate() {\n                let line_lower = line.to_lowercase();\n\n                if line_lower.contains(&query_lower) {\n                    // Calculate relevance score\n                    let mut line_score = 1.0;\n\n                    // Higher score for title matches\n                    if line.trim().starts_with('#') {\n                        line_score *= 3.0;\n                    }\n\n                    // Higher score for exact word matches\n                    if line_lower\n                        .split_whitespace()\n                        .any(|word| word == query_lower)\n                    {\n                        line_score *= 2.0;\n                    }\n\n                    // Higher score for matches at the beginning of the line\n                    if line_lower.trim_start().starts_with(&query_lower) {\n                        line_score *= 1.5;\n                    }\n\n                    relevance_score += line_score;\n\n                    // Create highlighted content\n                    let highlighted_content = self.highlight_matches(line, query);\n\n                    // Get context lines\n                    let context_before = if line_number > 0 {\n                        lines.get(line_number - 1).cloned()\n                    } else {\n                        None\n                    };\n\n                    let context_after = lines.get(line_number + 1).cloned();\n\n                    matches.push(SearchMatch {\n                        line_number: line_number + 1, // 1-based line numbers\n                        content: line.clone(),\n                        highlighted_content,\n                        context_before,\n                        context_after,\n                    });\n                }\n            }\n\n            // Also check filename matches\n            let file_name = file_path.split('/').last().unwrap_or(file_path);\n            if file_name.to_lowercase().contains(&query_lower) {\n                relevance_score += 2.0; // Bonus for filename matches\n            }\n\n            if !matches.is_empty() {\n                results.push(SearchResult {\n                    file_path: file_path.clone(),\n                    file_name: file_name.to_string(),\n                    title,\n                    matches,\n                    relevance_score,\n                });\n            }\n        }\n\n        // Sort by relevance score (descending)\n        results.sort_by(|a, b| {\n            b.relevance_score\n                .partial_cmp(&a.relevance_score)\n                .unwrap_or(std::cmp::Ordering::Equal)\n        });\n\n        // Limit results to prevent overwhelming the UI\n        results.truncate(50);\n\n        results\n    }\n\n    /// Highlight search matches in content\n    fn highlight_matches(&self, content: &str, query: &str) -> String {\n        let query_lower = query.to_lowercase();\n        let content_lower = content.to_lowercase();\n\n        if let Some(start) = content_lower.find(&query_lower) {\n            let end = start + query.len();\n            let before = &content[..start];\n            let matched = &content[start..end];\n            let after = &content[end..];\n\n            format!(\"{}<mark>{}</mark>{}\", before, matched, after)\n        } else {\n            content.to_string()\n        }\n    }\n}\n"
    },
    "complexity_metrics": {
      "cohesion_score": 0.85,
      "coupling_factor": 0.65,
      "cyclomatic_complexity": 34.0,
      "depth_of_inheritance": 0,
      "lines_of_code": 407,
      "number_of_classes": 5,
      "number_of_functions": 12
    },
    "dependencies": [
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "serde",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "std",
        "is_external": false,
        "line_number": null,
        "name": "std::collections::HashMap",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "std",
        "is_external": false,
        "line_number": null,
        "name": "std::path::{Path, PathBuf}",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "tracing",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "anyhow",
        "path": null,
        "version": null
      }
    ],
    "detailed_description": "filesystem.rs is a model component for building and managing the documentation directory tree. Its core function is to recursively scan a specified directory, convert the filesystem structure into an in-memory tree data structure (DocumentTree), and support full-text search, Markdown rendering, and file content reading. It abstracts files and directories in the filesystem as FileNode nodes, and uses DocumentTree to uniformly manage file path mappings, search indexes, and statistics. This component is specifically optimized for Markdown files: it indexes only .md files and ignores hidden files. It also implements keyword-based full-text search, including title weighting, term-frequency weighting, context extraction, and result sorting, ultimately returning search results with highlighting and relevance scores. In addition, it provides Markdown-to-HTML rendering for frontend display.",
    "interfaces": [
      {
        "description": "Data structure representing a single node (file or directory) in the filesystem; supports serialization and deserialization for cross-service transfer or persistence.",
        "interface_type": "struct",
        "name": "FileNode",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "name",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "path",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "is_file",
            "param_type": "bool"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "children",
            "param_type": "Vec<FileNode>"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "size",
            "param_type": "Option<u64>"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "modified",
            "param_type": "Option<String>"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Represents a single result returned by a search query, including file path, matched content, title, and relevance score.",
        "interface_type": "struct",
        "name": "SearchResult",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "file_path",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "file_name",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "title",
            "param_type": "Option<String>"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "matches",
            "param_type": "Vec<SearchMatch>"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "relevance_score",
            "param_type": "f32"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Represents the specific line content of a search match, including highlighted text and context lines, for displaying match context in the frontend.",
        "interface_type": "struct",
        "name": "SearchMatch",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "line_number",
            "param_type": "usize"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "content",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "highlighted_content",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "context_before",
            "param_type": "Option<String>"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "context_after",
            "param_type": "Option<String>"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "The main document tree structure, encapsulating the whole filesystem tree structure, path mappings, search index, and statistics; it is the core interface exposed by the component.",
        "interface_type": "struct",
        "name": "DocumentTree",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "root",
            "param_type": "FileNode"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "file_map",
            "param_type": "HashMap<String, PathBuf>"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "stats",
            "param_type": "TreeStats"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "search_index",
            "param_type": "HashMap<String, Vec<String>>"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Stores document tree statistics, including file count, directory count, and total size.",
        "interface_type": "struct",
        "name": "TreeStats",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "total_files",
            "param_type": "usize"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "total_dirs",
            "param_type": "usize"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "total_size",
            "param_type": "u64"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      }
    ],
    "responsibilities": [
      "Recursively scan directories and build the filesystem tree structure (DocumentTree)",
      "Maintain mappings from file paths to actual files (file_map) to support fast content reading",
      "Build a full-text search index (search_index) for Markdown files",
      "Implement advanced keyword-based full-text search with relevance scoring and highlighting",
      "Provide the capability to render Markdown content as HTML"
    ]
  },
  {
    "code_dossier": {
      "code_purpose": "model",
      "description": null,
      "file_path": "src/error.rs",
      "functions": [
        "From<LithoBookError> for axum::http::StatusCode"
      ],
      "importance_score": 0.8,
      "interfaces": [
        "LithoBookError"
      ],
      "name": "error.rs",
      "source_summary": "use thiserror::Error;\n\n#[derive(Error, Debug)]\npub enum LithoBookError {\n    #[error(\"IO error: {0}\")]\n    Io(#[from] std::io::Error),\n\n    #[error(\"JSON serialization error: {0}\")]\n    Json(#[from] serde_json::Error),\n\n    #[error(\"File not found: {path}\")]\n    FileNotFound { path: String },\n\n    #[error(\"Invalid file path: {path}\")]\n    InvalidPath { path: String },\n\n    #[error(\"Directory scan error: {0}\")]\n    DirectoryScan(String),\n\n    #[error(\"Server error: {0}\")]\n    Server(String),\n\n    #[error(\"Configuration error: {0}\")]\n    Config(String),\n}\n\nimpl From<LithoBookError> for axum::http::StatusCode {\n    fn from(err: LithoBookError) -> Self {\n        match err {\n            LithoBookError::FileNotFound { .. } => axum::http::StatusCode::NOT_FOUND,\n            LithoBookError::InvalidPath { .. } => axum::http::StatusCode::BAD_REQUEST,\n            LithoBookError::Json(_) => axum::http::StatusCode::INTERNAL_SERVER_ERROR,\n            LithoBookError::Io(_) => axum::http::StatusCode::INTERNAL_SERVER_ERROR,\n            LithoBookError::DirectoryScan(_) => axum::http::StatusCode::INTERNAL_SERVER_ERROR,\n            LithoBookError::Server(_) => axum::http::StatusCode::INTERNAL_SERVER_ERROR,\n            LithoBookError::Config(_) => axum::http::StatusCode::BAD_REQUEST,\n        }\n    }\n}\n"
    },
    "complexity_metrics": {
      "cohesion_score": 0.95,
      "coupling_factor": 0.7,
      "cyclomatic_complexity": 3.0,
      "depth_of_inheritance": 0,
      "lines_of_code": 39,
      "number_of_classes": 1,
      "number_of_functions": 1
    },
    "dependencies": [
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "thiserror",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "serde_json",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "std",
        "is_external": false,
        "line_number": null,
        "name": "std::io",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "axum::http::StatusCode",
        "path": null,
        "version": null
      }
    ],
    "detailed_description": "This component defines an enum named LithoBookError for unified management of all custom error types in the LithoBook application. It integrates standard-library IO errors and serde_json serialization errors, and defines application-specific errors such as file not found, invalid path, directory scan failure, server error, and configuration error. By implementing From<LithoBookError> for axum::http::StatusCode, it automatically maps application-layer errors to HTTP status codes, providing a standardized error response mechanism for the Axum HTTP framework. It is the core hub of system error handling.",
    "interfaces": [
      {
        "description": null,
        "interface_type": "enum",
        "name": "LithoBookError",
        "parameters": [
          {
            "description": "Wrap underlying I/O operation failures",
            "is_optional": false,
            "name": "Io",
            "param_type": "std::io::Error"
          },
          {
            "description": "Wrap JSON serialization/deserialization failures",
            "is_optional": false,
            "name": "Json",
            "param_type": "serde_json::Error"
          },
          {
            "description": "File does not exist, carrying path information",
            "is_optional": false,
            "name": "FileNotFound",
            "param_type": "FileNotFound"
          },
          {
            "description": "Invalid path format, carrying path information",
            "is_optional": false,
            "name": "InvalidPath",
            "param_type": "InvalidPath"
          },
          {
            "description": "Error occurred during directory scanning",
            "is_optional": false,
            "name": "DirectoryScan",
            "param_type": "String"
          },
          {
            "description": "Internal server error, carrying descriptive information",
            "is_optional": false,
            "name": "Server",
            "param_type": "String"
          },
          {
            "description": "Configuration loading or parsing failed",
            "is_optional": false,
            "name": "Config",
            "param_type": "String"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      }
    ],
    "responsibilities": [
      "Define a unified application-layer error enum and centrally manage all error scenarios",
      "Wrap third-party library errors (std::io::Error, serde_json::Error) into a consistent in-application error model",
      "Implement HTTP status code conversion logic and provide error response mappings for the Axum framework",
      "Provide clear, readable, structured error information for upper-layer services, making debugging and frontend display easier",
      "Serve as the standardized interface for error propagation, ensuring consistent error transfer across system layers"
    ]
  },
  {
    "code_dossier": {
      "code_purpose": "api",
      "description": null,
      "file_path": "src/server.rs",
      "functions": [
        "create_router",
        "index_handler",
        "get_file_handler",
        "get_tree_handler",
        "search_handler",
        "stats_handler",
        "health_handler",
        "chat_stream_handler",
        "call_openai_stream_api",
        "generate_suggestions",
        "format_bytes",
        "generate_index_html"
      ],
      "importance_score": 0.8,
      "interfaces": [
        "AppState",
        "FileQuery",
        "SearchQuery",
        "FileResponse",
        "SearchResponse",
        "StatsResponse",
        "ChatRequest",
        "OpenAIMessage",
        "OpenAIRequest",
        "OpenAIStreamChoice",
        "OpenAIStreamDelta",
        "OpenAIStreamResponse",
        "StreamEvent"
      ],
      "name": "server.rs",
      "source_summary": "use axum::{\n    Router,\n    extract::{Query, State},\n    http::StatusCode,\n    response::{Html, Json, Sse, sse::Event},\n    routing::{get, post},\n};\nuse futures::stream::Stream;\nuse serde::{Deserialize, Serialize};\nuse std::convert::Infallible;\nuse std::time::Duration;\nuse tower_http::cors::CorsLayer;\nuse tracing::{debug, error, info};\n\nuse crate::filesystem::{DocumentTree, SearchResult};\n\n#[derive(Clone)]\npub struct AppState {\n    pub doc_tree: DocumentTree,\n    pub docs_path: String,\n}\n\n#[derive(Deserialize)]\npub struct FileQuery {\n    file: Option<String>,\n}\n\n#[derive(Deserialize)]\npub struct SearchQuery {\n    q: Option<String>,\n}\n\n#[derive(Serialize)]\npub struct FileResponse {\n    pub content: String,\n    pub html: String,\n    pub path: String,\n    pub size: Option<u64>,\n    pub modified: Option<String>,\n}\n\n#[derive(Serialize)]\npub struct SearchResponse {\n    pub results: Vec<SearchResult>,\n    pub total: usize,\n    pub query: String,\n}\n\n#[derive(Serialize)]\npub struct StatsResponse {\n    pub total_files: usize,\n    pub total_dirs: usize,\n    pub total_size: u64,\n    pub formatted_size: String,\n}\n\n// AI-assistant-related data structures\n#[derive(Deserialize)]\npub struct ChatRequest {\n    pub message: String,\n    pub context: Option<String>,             // current document content as context\n    pub history: Option<Vec<OpenAIMessage>>, // conversation history messages\n}\n\n#[derive(Serialize, Deserialize)]\npub struct OpenAIMessage {\n    pub role: String,\n    pub content: String,\n}\n\n#[derive(Serialize, Deserialize)]\npub struct OpenAIRequest {\n    pub model: String,\n    pub messages: Vec<OpenAIMessage>,\n    pub temperature: f32,\n    pub max_tokens: i32,\n    pub stream: bool,\n}\n// streaming-response-related data structures\n#[derive(Deserialize)]\npub struct OpenAIStreamChoice {\n    pub delta: OpenAIStreamDelta,\n    pub finish_reason: Option<String>,\n}\n\n#[derive(Deserialize)]\npub struct OpenAIStreamDelta {\n    pub content: Option<String>,\n}\n\n#[derive(Deserialize)]\npub struct OpenAIStreamResponse {\n    pub choices: Vec<OpenAIStreamChoice>,\n}\n\n#[derive(Serialize)]\npub struct StreamEvent {\n    pub event_type: String,\n    pub content: Option<String>,\n    pub suggestions: Option<Vec<String>>,\n    pub finished: bool,\n}\n\n/// Create the main application router\npub fn create_router(doc_tree: DocumentTree, docs_path: String) -> Router {\n    let state = AppState {\n        doc_tree,\n        docs_path,\n    };\n\n    Router::new()\n        .route(\"/\", get(index_handler))\n        .route(\"/api/file\", get(get_file_handler))\n        .route(\"/api/tree\", get(get_tree_handler))\n        .route(\"/api/search\", get(search_handler))\n        .route(\"/api/stats\", get(stats_handler))\n        .route(\"/api/chat\", post(chat_stream_handler))\n        .route(\"/health\", get(health_handler))\n        .layer(CorsLayer::permissive())\n        .with_state(state)\n}\n\n/// Serve the main index page\nasync fn index_handler(State(state): State<AppState>) -> Result<Html<String>, StatusCode> {\n    debug!(\"Serving index page\");\n\n    let tree_json = serde_json::to_string(&state.doc_tree.root).map_err(|e| {\n        error!(\"Failed to serialize document tree: {}\", e);\n        StatusCode::INTERNAL_SERVER_ERROR\n    })?;\n\n    let html = generate_index_html(&tree_json, &state.docs_path);\n    Ok(Html(html))\n}\n\n/// Get file content and render as HTML\nasync fn get_file_handler(\n    Query(params): Query<FileQuery>,\n    State(state): State<AppState>,\n) -> Result<Json<FileResponse>, StatusCode> {\n    let file_path = params.file.ok_or_else(|| {\n        debug!(\"Missing file parameter in request\");\n        StatusCode::BAD_REQUEST\n    })?;\n\n    debug!(\"Requesting file: {}\", file_path);\n\n    let content = state.doc_tree.get_file_content(&file_path).map_err(|e| {\n        error!(\"Failed to read file {}: {}\", file_path, e);\n        StatusCode::NOT_FOUND\n    })?;\n\n    let html = state.doc_tree.render_markdown(&content);\n\n    // Get file metadata if available\n    let file_info = state\n        .doc_tree\n        .file_map\n        .get(&file_path)\n        .and_then(|path| std::fs::metadata(path).ok())\n        .map(|metadata| {\n            let size = metadata.len();\n            let modified = metadata.modified().ok().and_then(|time| {\n                time.duration_since(std::time::UNIX_EPOCH)\n                    .ok()\n                    .map(|d| {\n                        let datetime = chrono::DateTime::from_timestamp(d.as_secs() as i64, 0)?;\n                        Some(datetime.format(\"%Y-%m-%d %H:%M:%S\").to_string())\n                    })\n                    .flatten()\n            });\n            (size, modified)\n        });\n\n    let response = FileResponse {\n        content,\n        html,\n        path: file_path,\n        size: file_info.as_ref().map(|(size, _)| *size),\n        modified: file_info.and_then(|(_, modified)| modified),\n    };\n\n    info!(\"successfully served file: {}\", response.path);\n    Ok(Json(response))\n}\n\n/// Get the document tree structure\nasync fn get_tree_handler(State(state): State<AppState>) -> Json<serde_json::Value> {\n    debug!(\"Serving document tree\");\n    Json(serde_json::to_value(&state.doc_tree.root).unwrap_or_default())\n}\n\n/// Search for content with full-text search\nasync fn search_handler(\n    Query(params): Query<SearchQuery>,\n    State(state): State<AppState>,\n) -> Result<Json<SearchResponse>, StatusCode> {\n    let query = params.q.unwrap_or_default();\n\n    if query.trim().is_empty() {\n        return Ok(Json(SearchResponse {\n            results: vec![],\n            total: 0,\n            query: query.clone(),\n        }));\n    }\n\n    debug!(\"Searching for: {}\", query);\n\n    let results = state.doc_tree.search_content(&query);\n    let total = results.len();\n\n    debug!(\"Found {} results matching query: {}\", total, query);\n\n    Ok(Json(SearchResponse {\n        results,\n        total,\n        query,\n    }))\n}\n\n/// Get statistics about the document tree\nasync fn stats_handler(State(state): State<AppState>) -> Json<StatsResponse> {\n    let stats = state.doc_tree.get_stats();\n\n    let formatted_size = format_bytes(stats.total_size);\n\n    Json(StatsResponse {\n        total_files: stats.total_files,\n        total_dirs: stats.total_dirs,\n        total_size: stats.total_size,\n        formatted_size,\n    })\n}\n\n/// Health check endpoint\nasync fn health_handler() -> Json<serde_json::Value> {\n    Json(serde_json::json!({\n        \"status\": \"healthy\",\n        \"timestamp\": chrono::Utc::now().to_rfc3339(),\n        \"version\": env!(\"CARGO_PKG_VERSION\")\n    }))\n}\n\n/// AI assistant streaming chat handler function\nasync fn chat_stream_handler(\n    State(state): State<AppState>,\n    Json(request): Json<ChatRequest>,\n) -> Sse<impl Stream<Item = Result<Event, Infallible>>> {\n    debug!(\"AI assistant received message: {}\", request.message);\n\n    let stream = async_stream::stream! {\n        match call_openai_stream_api(\n            &request.message,\n            request.context.as_deref(),\n            request.history,\n            &state.docs_path,\n        ).await {\n            Ok(mut response_stream) => {\n                let mut full_response = String::new();\n\n                // send start event\n                yield Ok(Event::default()\n                    .event(\"start\")\n                    .data(serde_json::to_string(&StreamEvent {\n                        event_type: \"start\".to_string(),\n                        content: None,\n                        suggestions: None,\n                        finished: false,\n                    }).unwrap_or_default()));\n\n                // handle streaming response\n                while let Some(chunk) = response_stream.recv().await {\n                    match chunk {\n                        Ok(content) => {\n                            full_response.push_str(&content);\n\n                            // send content chunk\n                            yield Ok(Event::default()\n                                .event(\"content\")\n                                .data(serde_json::to_string(&StreamEvent {\n                                    event_type: \"content\".to_string(),\n                                    content: Some(content),\n                                    suggestions: None,\n                                    finished: false,\n                                }).unwrap_or_default()));\n                        }\n                        Err(e) => {\n                            error!(\"streaming response error: {}\", e);\n                            yield Ok(Event::default()\n                                .event(\"error\")\n                                .data(serde_json::to_string(&StreamEvent {\n                                    event_type: \"error\".to_string(),\n                                    content: Some(\"Sorry, I cannot answer your question right now. Please try again later..\".to_string()),\n                                    suggestions: None,\n                                    finished: true,\n                                }).unwrap_or_default()));\n                            return;\n                        }\n                    }\n                }\n\n                // generate suggested questions\n                let suggestions = generate_suggestions(&full_response, request.context.as_deref());\n\n                // send completion event\n                yield Ok(Event::default()\n                    .event(\"finish\")\n                    .data(serde_json::to_string(&StreamEvent {\n                        event_type: \"finish\".to_string(),\n                        content: None,\n                        suggestions: Some(suggestions),\n                        finished: true,\n                    }).unwrap_or_default()));\n            }\n            Err(e) => {\n                error!(\"failed to call AI API: {}\", e);\n                yield Ok(Event::default()\n                    .event(\"error\")\n                    .data(serde_json::to_string(&StreamEvent {\n                        event_type: \"error\".to_string(),\n                        content: Some(\"Sorry, I cannot answer your question right now. Please try again later..\".to_string()),\n                        suggestions: None,\n                        finished: true,\n                    }).unwrap_or_default()));\n            }\n        }\n    };\n\n    Sse::new(stream).keep_alive(\n        axum::response::sse::KeepAlive::new()\n            .interval(Duration::from_secs(1))\n            .text(\"keep-alive-text\"),\n    )\n}\n\n/// call OpenAI-compatible streaming API\nasync fn call_openai_stream_api(\n    message: &str,\n    context: Option<&str>,\n    history: Option<Vec<OpenAIMessage>>,\n    docs_path: &str,\n) -> Result<\n    tokio::sync::mpsc::Receiver<Result<String, Box<dyn std::error::Error + Send + Sync>>>,\n    Box<dyn std::error::Error + Send + Sync>,\n> {\n    let client = reqwest::Client::new();\n\n    // build system prompt\n    let mut system_prompt = \"You are a professional documentation assistant dedicated to helping users understand and analyze technical documentation. Answer accurately, concisely, and helpfully..\".to_string();\n\n    // add architecture overview document as background material\n    let architecture_path = std::path::Path::new(docs_path).join(\"2-architecture-overview.md\");\n    if let Ok(architecture_content) = std::fs::read_to_string(&architecture_path) {\n        system_prompt.push_str(&format!(\"\\n\\narchitecture overview of the project the user is focused on:\\n{}\", architecture_content));\n    }\n\n    if let Some(ctx) = context {\n        system_prompt.push_str(&format!(\"\\n\\ndocument content currently being viewed by the user:\\n{}\", ctx));\n    }\n\n    // build message list\n    let mut messages = vec![OpenAIMessage {\n        role: \"system\".to_string(),\n        content: system_prompt,\n    }];\n\n    // add history messages (if any)\n    if let Some(hist) = history {\n        // limit history message count to avoid oversized requests\n        let max_history = 10; // keep at most 10 conversation rounds\n        let start_index = if hist.len() > max_history {\n            hist.len() - max_history\n        } else {\n            0\n        };\n        messages.extend(hist.into_iter().skip(start_index));\n    }\n\n    // add current user message\n    messages.push(OpenAIMessage {\n        role: \"user\".to_string(),\n        content: message.to_string(),\n    });\n\n    let request_body = OpenAIRequest {\n        model: \"openai/gpt-4.1\".to_string(),\n        messages,\n        temperature: 0.7,\n        max_tokens: 16384,\n        stream: true, // enable streaming response\n    };\n\n    let response = client\n        .post(\"https://models.github.ai/inference/chat/completions\")\n        .header(\n            \"Authorization\",\n            \"Bearer <GITHUB_TOKEN>\",\n        )\n        .header(\"Content-Type\", \"application/json\")\n        .json(&request_body)\n        .send()\n        .await?;\n\n    if !response.status().is_success() {\n        let status = response.status();\n        let text = response.text().await.unwrap_or_default();\n        return Err(format!(\"API request failed: {} - {}\", status, text).into());\n    }\n\n    // create channel to pass streaming data\n    let (tx, rx) = tokio::sync::mpsc::channel(100);\n\n    // handle streaming response in background task\n    tokio::spawn(async move {\n        use futures::StreamExt;\n\n        let mut stream = response.bytes_stream();\n        let mut buffer = String::new();\n\n        while let Some(chunk_result) = stream.next().await {\n            match chunk_result {\n                Ok(chunk) => {\n                    let chunk_str = String::from_utf8_lossy(&chunk);\n                    buffer.push_str(&chunk_str);\n\n                    // process SSE-formatted data\n                    let lines: Vec<&str> = buffer.lines().collect();\n                    let mut processed_lines = 0;\n\n                    for line in &lines {\n                        if line.starts_with(\"data: \") {\n                            let data = &line[6..]; // remove \"data: \" prefix\n\n                            if data == \"[DONE]\" {\n                                // stream ended\n                                return;\n                            }\n\n                            // try to parse JSON\n                            if let Ok(stream_response) =\n                                serde_json::from_str::<OpenAIStreamResponse>(data)\n                            {\n                                if let Some(choice) = stream_response.choices.first() {\n                                    if let Some(content) = &choice.delta.content {\n                                        if !content.is_empty() {\n                                            if tx.send(Ok(content.clone())).await.is_err() {\n                                                return; // receiver has been closed\n                                            }\n                                        }\n                                    }\n\n                                    // check whether complete\n                                    if choice.finish_reason.is_some() {\n                                        return;\n                                    }\n                                }\n                            }\n                            processed_lines += 1;\n                        } else if line.is_empty() {\n                            processed_lines += 1;\n                        } else {\n                            processed_lines += 1;\n                        }\n                    }\n\n                    // keep unprocessed part\n                    if processed_lines < lines.len() {\n                        buffer = lines[processed_lines..].join(\"\\n\");\n                    } else {\n                        buffer.clear();\n                    }\n                }\n                Err(e) => {\n                    let _ = tx.send(Err(format!(\"streaming response error: {}\", e).into())).await;\n                    return;\n                }\n            }\n        }\n    });\n\n    Ok(rx)\n}\n\n/// generate recommended follow-up questions\nfn generate_suggestions(ai_response: &str, _context: Option<&str>) -> Vec<String> {\n    let mut suggestions = Vec::new();\n\n    // generate related questions based on AI answer content\n    if ai_response.contains(\"architecture\") || ai_response.contains(\"design\") {\n        suggestions.push(\"What are the advantages and disadvantages of this architecture??\".to_string());\n        suggestions.push(\"What alternative designs are available??\".to_string());\n    }\n\n    if ai_response.contains(\"performance\") || ai_response.contains(\"latency\") {\n        suggestions.push(\"What performance optimization strategies does the project use??\".to_string());\n        suggestions.push(\"How can performance hotspots in the project be optimized??\".to_string());\n    }\n\n    if ai_response.contains(\"configuration\") || ai_response.contains(\"parameters\") {\n        suggestions.push(\"What are the default values of these configurations??\".to_string());\n        suggestions.push(\"How can these parameters be tuned?\".to_string());\n    }\n\n    // if there are no specific suggestions, provide general ones\n    if suggestions.is_empty() {\n        suggestions.push(\"Can you explain this in detail??\".to_string());\n        suggestions.push(\"Are there related examples??\".to_string());\n        suggestions.push(\"What best practices apply here?\".to_string());\n    }\n\n    // limit suggestion count\n    suggestions.truncate(3);\n    suggestions\n}\n\n/// Format bytes into human-readable format\nfn format_bytes(bytes: u64) -> String {\n    const UNITS: &[&str] = &[\"B\", \"KB\", \"MB\", \"GB\", \"TB\"];\n\n    if bytes == 0 {\n        return \"0 B\".to_string();\n    }\n\n    let mut size = bytes as f64;\n    let mut unit_index = 0;\n\n    while size >= 1024.0 && unit_index < UNITS.len() - 1 {\n        size /= 1024.0;\n        unit_index += 1;\n    }\n\n    if unit_index == 0 {\n        format!(\"{} {}\", bytes, UNITS[unit_index])\n    } else {\n        format!(\"{:.1} {}\", size, UNITS[unit_index])\n    }\n}\n\n/// Generate the main HTML page\nfn generate_index_html(tree_json: &str, docs_path: &str) -> String {\n    // Read the template file\n    let template_content = include_str!(\"../templates/index.html.tpl\");\n\n    // Replace the placeholders with actual data\n    template_content\n        .replace(\"{{ tree_json|safe }}\", tree_json)\n        .replace(\"{{ docs_path }}\", docs_path)\n}\n"
    },
    "complexity_metrics": {
      "cohesion_score": 0.85,
      "coupling_factor": 0.65,
      "cyclomatic_complexity": 32.0,
      "depth_of_inheritance": 0,
      "lines_of_code": 549,
      "number_of_classes": 13,
      "number_of_functions": 12
    },
    "dependencies": [
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "axum",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "futures",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "serde",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "tower_http",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "tracing",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "module",
        "is_external": false,
        "line_number": null,
        "name": "crate::filesystem",
        "path": "src/filesystem/mod.rs",
        "version": null
      },
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "reqwest",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "crate",
        "is_external": true,
        "line_number": null,
        "name": "async_stream",
        "path": null,
        "version": null
      }
    ],
    "detailed_description": "This component is the core HTTP API server built on the Axum framework. It provides four main capabilities: document browsing, full-text search, system statistics, and AI assistant streaming conversations. It defines route handlers that process frontend requests, including retrieving file content (rendering Markdown as HTML), retrieving the directory tree, executing full-text search, returning system statistics, health checks, and AI chat streaming responses. The AI chat function calls the GitHub Models OpenAI-compatible API, builds requests containing the system prompt, context, and history messages, and uses Server-Sent Events (SSE) to return AI responses to the frontend chunk by chunk. This component also generates the homepage HTML template and is the main boundary layer for user-system interaction.",
    "interfaces": [
      {
        "description": "Application state container used to share the document tree and document root path across multiple request handlers",
        "interface_type": "struct",
        "name": "AppState",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "doc_tree",
            "param_type": "DocumentTree"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "docs_path",
            "param_type": "String"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Query argument structure for file content requests",
        "interface_type": "struct",
        "name": "FileQuery",
        "parameters": [
          {
            "description": null,
            "is_optional": true,
            "name": "file",
            "param_type": "Option<String>"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Query argument structure for full-text search requests",
        "interface_type": "struct",
        "name": "SearchQuery",
        "parameters": [
          {
            "description": null,
            "is_optional": true,
            "name": "q",
            "param_type": "Option<String>"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Data structure for file content responses, containing raw content, rendered HTML, and metadata",
        "interface_type": "struct",
        "name": "FileResponse",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "content",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "html",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "path",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "size",
            "param_type": "Option<u64>"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "modified",
            "param_type": "Option<String>"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Data structure for search result responses",
        "interface_type": "struct",
        "name": "SearchResponse",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "results",
            "param_type": "Vec<SearchResult>"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "total",
            "param_type": "usize"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "query",
            "param_type": "String"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Data structure for system statistics responses",
        "interface_type": "struct",
        "name": "StatsResponse",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "total_files",
            "param_type": "usize"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "total_dirs",
            "param_type": "usize"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "total_size",
            "param_type": "u64"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "formatted_size",
            "param_type": "String"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Input data structure for AI chat requests",
        "interface_type": "struct",
        "name": "ChatRequest",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "message",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "context",
            "param_type": "Option<String>"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "history",
            "param_type": "Option<Vec<OpenAIMessage>>"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Message structure for communicating with the OpenAI API, representing a single message in a conversation",
        "interface_type": "struct",
        "name": "OpenAIMessage",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "role",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "content",
            "param_type": "String"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Complete argument structure for sending requests to an OpenAI-compatible API",
        "interface_type": "struct",
        "name": "OpenAIRequest",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "model",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "messages",
            "param_type": "Vec<OpenAIMessage>"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "temperature",
            "param_type": "f32"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "max_tokens",
            "param_type": "i32"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "stream",
            "param_type": "bool"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Structure for parsing a single choice in an OpenAI streaming response",
        "interface_type": "struct",
        "name": "OpenAIStreamChoice",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "delta",
            "param_type": "OpenAIStreamDelta"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "finish_reason",
            "param_type": "Option<String>"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Structure representing incremental content in a streaming response",
        "interface_type": "struct",
        "name": "OpenAIStreamDelta",
        "parameters": [
          {
            "description": null,
            "is_optional": true,
            "name": "content",
            "param_type": "Option<String>"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Top-level structure of an OpenAI streaming response",
        "interface_type": "struct",
        "name": "OpenAIStreamResponse",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "choices",
            "param_type": "Vec<OpenAIStreamChoice>"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      },
      {
        "description": "Standardized event structure received by the frontend SSE event listener",
        "interface_type": "struct",
        "name": "StreamEvent",
        "parameters": [
          {
            "description": null,
            "is_optional": false,
            "name": "event_type",
            "param_type": "String"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "content",
            "param_type": "Option<String>"
          },
          {
            "description": null,
            "is_optional": true,
            "name": "suggestions",
            "param_type": "Option<Vec<String>>"
          },
          {
            "description": null,
            "is_optional": false,
            "name": "finished",
            "param_type": "bool"
          }
        ],
        "return_type": null,
        "visibility": "pub"
      }
    ],
    "responsibilities": [
      "Expose RESTful API interfaces for frontend calls, including file reading, search, statistics, and AI conversations",
      "Manage and share document tree state (DocumentTree) as the core data source for all data operations",
      "Implement AI assistant streaming responses, integrate with external large-model APIs, and convert responses into SSE event streams",
      "Process frontend request arguments, perform input validation and error handling, and return standardized JSON responses",
      "Render Markdown content as HTML and generate the dynamic homepage template"
    ]
  },
  {
    "code_dossier": {
      "code_purpose": "entry",
      "description": null,
      "file_path": "src/cli.rs",
      "functions": [
        "validate",
        "server_url",
        "bind_address",
        "is_privileged"
      ],
      "importance_score": 0.8,
      "interfaces": [],
      "name": "cli.rs",
      "source_summary": "use clap::Parser;\nuse std::path::PathBuf;\n\n#[derive(Parser, Debug)]\n#[command(name = \"litho-book\")]\n#[command(about = \"A web-based reader for litho-generated documentation\")]\n#[command(version)]\npub struct Args {\n    /// Path to the markdown documentation directory\n    #[arg(short, long, value_name = \"DIR\")]\n    pub docs_dir: PathBuf,\n    \n    /// Port to serve the web interface on\n    #[arg(short, long, default_value = \"3000\", value_name = \"PORT\")]\n    pub port: u16,\n    \n    /// Host to bind the server to\n    #[arg(long, default_value = \"127.0.0.1\", value_name = \"HOST\")]\n    pub host: String,\n    \n    /// Open browser automatically after starting the server\n    #[arg(short, long)]\n    pub open: bool,\n    \n    /// Enable verbose logging\n    #[arg(short, long)]\n    pub verbose: bool,\n}\n\nimpl Args {\n    /// Validate the command line arguments\n    pub fn validate(&self) -> anyhow::Result<()> {\n        if !self.docs_dir.exists() {\n            anyhow::bail!(\n                \"Documentation directory does not exist: {}\",\n                self.docs_dir.display()\n            );\n        }\n        \n        if !self.docs_dir.is_dir() {\n            anyhow::bail!(\n                \"Path is not a directory: {}\",\n                self.docs_dir.display()\n            );\n        }\n        \n        // Check if port is available\n        if self.port < 1024 && !is_privileged() {\n            anyhow::bail!(\n                \"Port {} requires administrator privileges. Please use a port >= 1024 or run as administrator.\",\n                self.port\n            );\n        }\n        \n        Ok(())\n    }\n    \n    /// Get the server URL\n    pub fn server_url(&self) -> String {\n        format!(\"http://{}:{}\", self.host, self.port)\n    }\n    \n    /// Get the bind address\n    pub fn bind_address(&self) -> String {\n        format!(\"{}:{}\", self.host, self.port)\n    }\n}\n\n/// Check if the current process has elevated privileges\nfn is_privileged() -> bool {\n    #[cfg(unix)]\n    {\n        unsafe { libc::geteuid() == 0 }\n    }\n    \n    #[cfg(windows)]\n    {\n        // On Windows, we'll just return true for simplicity\n        // In a real implementation, you'd check for admin privileges\n        true\n    }\n    \n    #[cfg(not(any(unix, windows)))]\n    {\n        false\n    }\n}"
    },
    "complexity_metrics": {
      "cohesion_score": 0.9,
      "coupling_factor": 0.4,
      "cyclomatic_complexity": 9.0,
      "depth_of_inheritance": 0,
      "lines_of_code": 87,
      "number_of_classes": 1,
      "number_of_functions": 4
    },
    "dependencies": [
      {
        "dependency_type": "library",
        "is_external": true,
        "line_number": null,
        "name": "clap",
        "path": null,
        "version": null
      },
      {
        "dependency_type": "library",
        "is_external": true,
        "line_number": null,
        "name": "anyhow",
        "path": null,
        "version": null
      }
    ],
    "detailed_description": "This component is the command-line entry point for the Litho Book project. It uses the clap library to define the Args command-line argument parsing struct. It parses configuration such as the documentation directory path, service port, host address, whether to automatically open the browser, and whether to enable verbose logging. The validate method validates input arguments, ensuring the documentation directory exists and is a directory, and checks whether administrator privileges are available for privileged ports (<1024). It also provides the helper methods server_url and bind_address for generating service address strings. The component includes the platform-specific is_privileged function to detect whether the current process has administrator privileges and support cross-platform port-permission checks.",
    "interfaces": [],
    "responsibilities": [
      "Parse configuration arguments passed by the user through the command line",
      "Validate the documentation directory path (exists and is a directory)",
      "Check whether privileged ports (<1024) have administrator privileges",
      "Provide generation logic for service URLs and bind addresses",
      "Encapsulate cross-platform permission check logic to support Unix and Windows systems"
    ]
  }
]
```

## Memory Storage Statistics

**Total storage size**: 217372 bytes

- **studies_research**: 41482 bytes (19.1%)
- **preprocess**: 80239 bytes (36.9%)
- **documentation**: 95615 bytes (44.0%)
- **timing**: 36 bytes (0.0%)

## Generated Documentation Statistics

Number of generated documents: 7 documents

- Core Module and Component Research Report - Document Data Domain
- Core Module and Component Research Report - User Interaction Domain
- Boundary Calls
- Core Module and Component Research Report - System Support Domain
- Architecture Overview
- Project Overview
- Core Workflow
