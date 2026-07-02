<!doctype html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Litho Book</title>
        <!-- Load fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Geist:wght@300;400;500;600;700&family=Noto+Sans+SC:wght@300;400;500;600;700&family=Noto+Serif+SC:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@300;400;500;600;700&display=swap"
            rel="stylesheet"
        />
        <!-- Font display optimization -->
        <style>
            @font-face {
                font-family: 'Noto Sans SC';
                font-display: swap;
            }
            @font-face {
                font-family: 'Noto Serif SC';
                font-display: swap;
            }
            @font-face {
                font-family: 'Geist';
                font-display: swap;
            }
            @font-face {
                font-family: 'Inter';
                font-display: swap;
            }
        </style>

        <style>
            :root {
                /* Light theme */
                --bg-primary: #ffffff;
                --bg-secondary: #f8f9fa;
                --bg-tertiary: #e9ecef;
                --text-primary: #333333;
                --text-secondary: #6c757d;
                --text-tertiary: #495057;
                --border-color: #e9ecef;
                --accent-color: #007bff;
                --accent-hover: #0056b3;
                --header-bg: #2c3e50;
                --header-text: #ffffff;
                --sidebar-bg: #f8f9fa;
                --code-bg: #f1f3f4;
                --code-text: #e83e8c;
                --pre-bg: #f8f9fa;
                --table-stripe: #f8f9fa;
                --blockquote-bg: #f8f9fa;
                --shadow: rgba(0, 0, 0, 0.1);

                /* Font settings */
                --font-family:
                    "Geist", -apple-system, BlinkMacSystemFont, "Segoe UI",
                    "Helvetica Neue", Arial, sans-serif;
                --font-size-base: 16px;
                --font-size-scale: 1;
            }

            /* Dark theme */
            [data-theme="dark"] {
                --bg-primary: #1a1a1a;
                --bg-secondary: #2d2d2d;
                --bg-tertiary: #404040;
                --text-primary: #e0e0e0;
                --text-secondary: #b0b0b0;
                --text-tertiary: #d0d0d0;
                --border-color: #404040;
                --accent-color: #4a9eff;
                --accent-hover: #357abd;
                --header-bg: #1e1e1e;
                --header-text: #ffffff;
                --sidebar-bg: #2d2d2d;
                --code-bg: #3a3a3a;
                --code-text: #ff6b9d;
                --pre-bg: #2d2d2d;
                --table-stripe: #2d2d2d;
                --blockquote-bg: #2d2d2d;
                --shadow: rgba(0, 0, 0, 0.3);
            }

            /* Morandi theme */
            [data-theme="morandi"] {
                --bg-primary: oklch(0.99 0.0057 84.57);
                --bg-secondary: oklch(0.95 0.008 84.57);
                --bg-tertiary: oklch(0.9 0.012 84.57);
                --text-primary: oklch(0.25 0.02 84.57);
                --text-secondary: oklch(0.45 0.015 84.57);
                --text-tertiary: oklch(0.35 0.018 84.57);
                --border-color: oklch(0.85 0.01 84.57);
                --accent-color: oklch(0.55 0.08 84.57);
                --accent-hover: oklch(0.45 0.1 84.57);
                --header-bg: oklch(0.3 0.025 84.57);
                --header-text: oklch(0.95 0.005 84.57);
                --sidebar-bg: oklch(0.95 0.008 84.57);
                --code-bg: oklch(0.92 0.01 84.57);
                --code-text: oklch(0.45 0.06 320);
                --pre-bg: oklch(0.95 0.008 84.57);
                --table-stripe: oklch(0.95 0.008 84.57);
                --blockquote-bg: oklch(0.95 0.008 84.57);
                --shadow: oklch(0.2 0.01 84.57 / 0.1);
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: var(--font-family);
                font-size: calc(var(--font-size-base) * var(--font-size-scale));
                height: 100vh;
                overflow: hidden;
                background-color: var(--bg-primary);
                color: var(--text-primary);
                transition: all 0.3s ease;
                /* Font rendering optimization */
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
                text-rendering: optimizeLegibility;
                font-feature-settings: "kern" 1;
                font-variant-ligatures: common-ligatures;
            }

            .header {
                height: 60px;
                background: var(--header-bg);
                color: var(--header-text);
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 2rem;
                box-shadow: 0 2px 4px var(--shadow);
                z-index: 1000;
            }

            .header-left {
                display: flex;
                align-items: center;
            }

            .header-right {
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .header h1 {
                font-size: calc(1.1rem * var(--font-size-scale));
                font-weight: 300;
                display: flex;
                align-items: center;
                margin: 0;
            }

            .header-subtitle {
                font-size: calc(0.9rem * var(--font-size-scale));
                color: var(--text-secondary);
                font-weight: 400;
            }

            .settings-btn {
                background: none;
                border: none;
                color: var(--header-text);
                cursor: pointer;
                padding: 0.5rem;
                border-radius: 6px;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .settings-btn:hover {
                background-color: rgba(255, 255, 255, 0.1);
                transform: rotate(90deg);
            }

            .settings-btn svg {
                width: 20px;
                height: 20px;
                stroke: currentColor;
            }

            /* Settings panel styles */
            .settings-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 2000;
                display: none;
                align-items: center;
                justify-content: center;
            }

            .settings-panel {
                background: var(--bg-primary);
                border-radius: 12px;
                width: 90%;
                max-width: 500px;
                max-height: 80vh;
                box-shadow: 0 10px 30px var(--shadow);
                border: 1px solid var(--border-color);
                display: flex;
                flex-direction: column;
            }

            .settings-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 2rem 2rem 1rem 2rem;
                border-bottom: 1px solid var(--border-color);
                background: var(--bg-primary);
                border-radius: 12px 12px 0 0;
                position: sticky;
                top: 0;
                z-index: 10;
                flex-shrink: 0;
            }

            .settings-content {
                padding: 0 2rem 2rem 2rem;
                overflow-y: auto;
                flex: 1;
            }

            .settings-title {
                font-size: calc(1.5rem * var(--font-size-scale));
                font-weight: 600;
                color: var(--text-primary);
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .settings-title svg {
                width: 20px;
                height: 20px;
                stroke: var(--text-primary);
            }

            .settings-close {
                background: none;
                border: none;
                cursor: pointer;
                color: var(--text-secondary);
                padding: 0.5rem;
                border-radius: 6px;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .settings-close:hover {
                background-color: var(--bg-tertiary);
                color: var(--text-primary);
                transform: scale(1.1);
            }

            .settings-close svg {
                width: 20px;
                height: 20px;
                stroke: currentColor;
            }

            .settings-section {
                margin-bottom: 2rem;
            }

            .settings-section-title {
                font-size: calc(1.1rem * var(--font-size-scale));
                font-weight: 600;
                color: var(--text-primary);
                margin-bottom: 1rem;
            }

            .settings-group {
                margin-bottom: 1.5rem;
            }

            .settings-label {
                display: block;
                font-size: calc(0.9rem * var(--font-size-scale));
                font-weight: 500;
                color: var(--text-tertiary);
                margin-bottom: 0.5rem;
            }

            .theme-options {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
                gap: 0.75rem;
            }

            .theme-option {
                padding: 0.75rem;
                border: 2px solid var(--border-color);
                border-radius: 8px;
                cursor: pointer;
                text-align: center;
                transition: all 0.2s ease;
                background: var(--bg-secondary);
                font-size: calc(0.85rem * var(--font-size-scale));
                color: var(--text-primary);
                position: relative;
                overflow: hidden;
            }

            .theme-option:hover {
                border-color: var(--accent-color);
                transform: translateY(-1px);
                box-shadow: 0 4px 8px var(--shadow);
            }

            .theme-option.active {
                border-color: var(--accent-color);
                background: var(--accent-color);
                color: white;
            }

            /* Theme preview styles */
            .theme-preview {
                width: 100%;
                height: 60px;
                border-radius: 6px;
                margin-bottom: 0.5rem;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                border: 1px solid rgba(0, 0, 0, 0.1);
            }

            .theme-option[data-theme="light"] .theme-preview {
                background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
                color: #333333;
                border-color: #e9ecef;
            }

            .theme-option[data-theme="dark"] .theme-preview {
                background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
                color: #e0e0e0;
                border-color: #404040;
            }

            .theme-option[data-theme="morandi"] .theme-preview {
                background: linear-gradient(
                    135deg,
                    oklch(0.99 0.0057 84.57) 0%,
                    oklch(0.95 0.008 84.57) 100%
                );
                color: oklch(0.25 0.02 84.57);
                border-color: oklch(0.85 0.01 84.57);
            }

            .theme-name {
                font-weight: 500;
                color: var(--text-primary);
                transition: color 0.2s ease;
            }

            .theme-option.active .theme-name {
                color: white;
            }

            .font-select,
            .font-size-select {
                width: 100%;
                padding: 0.75rem;
                border: 1px solid var(--border-color);
                border-radius: 6px;
                background: var(--bg-secondary);
                color: var(--text-primary);
                font-size: calc(0.9rem * var(--font-size-scale));
                font-family: var(--font-family);
            }

            .font-size-controls {
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .font-size-btn {
                background: var(--bg-secondary);
                border: 1px solid var(--border-color);
                color: var(--text-primary);
                width: 36px;
                height: 36px;
                border-radius: 6px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: calc(1.1rem * var(--font-size-scale));
                transition: all 0.2s ease;
            }

            .font-size-btn:hover {
                background: var(--accent-color);
                color: white;
                border-color: var(--accent-color);
            }

            .font-size-display {
                font-size: calc(0.9rem * var(--font-size-scale));
                color: var(--text-secondary);
                min-width: 60px;
                text-align: center;
            }

            .reset-btn {
                background: var(--bg-tertiary);
                border: 1px solid var(--border-color);
                color: var(--text-primary);
                padding: 0.75rem 1.5rem;
                border-radius: 6px;
                cursor: pointer;
                font-size: calc(0.9rem * var(--font-size-scale));
                transition: all 0.2s ease;
                width: 100%;
                margin-top: 1rem;
            }

            .reset-btn:hover {
                background: var(--accent-color);
                color: white;
                border-color: var(--accent-color);
            }

            /* Font preview styles */
            .font-preview {
                background: var(--bg-secondary);
                border: 1px solid var(--border-color);
                border-radius: 8px;
                margin-top: 0.5rem;
                overflow: hidden;
                transition: all 0.3s ease;
            }

            .font-preview-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0.75rem 1rem;
                background: var(--bg-tertiary);
                border-bottom: 1px solid var(--border-color);
                cursor: pointer;
                transition: all 0.2s ease;
            }

            .font-preview-header:hover {
                background: var(--accent-color);
                color: white;
            }

            .font-preview-title {
                font-size: calc(0.9rem * var(--font-size-scale));
                font-weight: 500;
                color: var(--text-primary);
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .font-preview-header:hover .font-preview-title {
                color: white;
            }

            .font-preview-toggle {
                background: none;
                border: none;
                color: var(--text-secondary);
                cursor: pointer;
                padding: 0.25rem;
                border-radius: 4px;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .font-preview-header:hover .font-preview-toggle {
                color: white;
            }

            .font-preview-toggle svg {
                width: 16px;
                height: 16px;
                stroke: currentColor;
                transition: transform 0.3s ease;
            }

            .font-preview-toggle.collapsed svg {
                transform: rotate(-90deg);
            }

            .font-preview-content {
                padding: 1rem;
                transition: all 0.3s ease;
                max-height: 500px;
                overflow: hidden;
            }

            .font-preview-content.collapsed {
                max-height: 0;
                padding: 0 1rem;
            }

            .font-preview-text {
                font-family: var(--font-family);
                line-height: 1.6;
            }

            .font-preview-text p {
                margin: 0.5rem 0;
                font-size: calc(0.9rem * var(--font-size-scale));
                color: var(--text-primary);
            }

            .font-preview-text p:first-child {
                font-weight: 400;
            }

            .font-preview-text p:nth-child(2) {
                font-weight: 500;
                color: var(--accent-color);
            }

            .font-preview-text p:nth-child(3) {
                font-family: 'JetBrains Mono', 'SF Mono', 'Monaco', monospace;
                background: var(--code-bg);
                padding: 0.25rem 0.5rem;
                border-radius: 4px;
                font-size: calc(0.85rem * var(--font-size-scale));
            }

            .font-preview-text p:last-child {
                font-size: calc(0.8rem * var(--font-size-scale));
                color: var(--text-secondary);
            }

            .font-info {
                margin-top: 0.75rem;
                padding-top: 0.75rem;
                border-top: 1px solid var(--border-color);
            }

            .font-info small {
                color: var(--text-secondary);
                font-size: calc(0.75rem * var(--font-size-scale));
                font-family: 'JetBrains Mono', 'SF Mono', 'Monaco', monospace;
                word-break: break-all;
                line-height: 1.4;
            }

            .container {
                display: flex;
                height: calc(100vh - 60px);
            }

            .sidebar {
                width: 320px;
                height: 100vh;
                background: var(--sidebar-bg);
                border-right: 1px solid var(--border-color);
                display: flex;
                flex-direction: column;
                transition: width 0.3s ease;
                overflow: hidden;
            }

            .sidebar.collapsed {
                width: 0;
                padding: 0;
                overflow: hidden;
            }

            .sidebar-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1rem;
                padding: 1rem 1rem 0.5rem 1rem;
                border-bottom: 1px solid var(--border-color);
                flex-shrink: 0;
                height: 60px;
            }

            .sidebar-title {
                font-size: calc(1.1rem * var(--font-size-scale));
                font-weight: 600;
                color: var(--text-tertiary);
            }

            .toggle-btn {
                background: none;
                border: none;
                cursor: pointer;
                padding: 0.5rem;
                border-radius: 6px;
                color: var(--text-secondary);
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .toggle-btn:hover {
                background-color: var(--bg-tertiary);
                color: var(--text-primary);
                transform: scale(1.1);
            }

            .toggle-btn svg {
                width: 16px;
                height: 16px;
                stroke: currentColor;
            }

            .content {
                flex: 1;
                overflow-y: auto;
                overflow-x: hidden;
                padding: 0;
                background: var(--bg-primary);
                position: relative;
            }

            .content-header {
                display: flex;
                align-items: center;
                padding: 1rem 2rem;
                background: var(--bg-primary);
                border-bottom: 1px solid var(--border-color);
                position: sticky;
                top: 0;
                z-index: 100;
                backdrop-filter: blur(10px);
                box-shadow: 0 2px 4px var(--shadow);
            }

            #content-container {
                padding: 2rem;
            }

            .sidebar-toggle {
                background: none;
                border: none;
                cursor: pointer;
                padding: 0.5rem;
                border-radius: 6px;
                margin-right: 1rem;
                color: var(--text-secondary);
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .sidebar-toggle:hover {
                background-color: var(--bg-secondary);
                color: var(--text-primary);
                transform: scale(1.05);
            }

            .sidebar-toggle svg {
                width: 20px;
                height: 20px;
                stroke: currentColor;
            }

            .tree-node {
                margin: 0.25rem 0;
            }

            .tree-item {
                display: flex;
                align-items: center;
                padding: 0.5rem 0rem;
                cursor: pointer;
                border-radius: 6px;
                transition: all 0.2s ease;
                font-size: calc(0.9rem * var(--font-size-scale));
                color: var(--text-primary);
            }

            .tree-item:hover {
                background-color: var(--bg-tertiary);
            }

            .tree-item.active {
                background-color: var(--accent-color);
                color: white;
            }

            .tree-item.file {
                padding-left: 0rem;
            }

            .tree-icon {
                margin-right: 0.5rem;
                width: 16px;
                text-align: center;
                font-size: calc(0.9rem * var(--font-size-scale));
            }

            .tree-children {
                margin-left: 1rem;
                border-left: 2px solid var(--border-color);
                padding-left: 0.5rem;
            }

            .tree-children.collapsed {
                display: none;
            }

            .folder-icon::before {
                content: "📁";
            }

            .folder-icon.open::before {
                content: "📂";
            }

            .file-icon::before {
                content: "📄";
            }

            .loading {
                text-align: center;
                padding: 4rem 2rem;
                color: var(--text-secondary);
            }

            .loading-spinner {
                display: inline-block;
                width: 2rem;
                height: 2rem;
                border: 3px solid var(--bg-tertiary);
                border-top: 3px solid var(--accent-color);
                border-radius: 50%;
                animation: spin 1s linear infinite;
                margin-bottom: 1rem;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            .error {
                color: #dc3545;
                padding: 1.5rem;
                background: var(--bg-secondary);
                border: 1px solid var(--border-color);
                border-radius: 8px;
                margin: 1rem 0;
            }

            .error h3 {
                margin-bottom: 0.5rem;
            }

            /* Markdown styles */
            .markdown-content {
                max-width: none;
                line-height: 1.7;
                color: var(--text-primary);
            }

            .markdown-content h1,
            .markdown-content h2,
            .markdown-content h3,
            .markdown-content h4,
            .markdown-content h5,
            .markdown-content h6 {
                margin: 2rem 0 1rem 0;
                color: var(--text-primary);
                font-weight: 600;
            }

            .markdown-content h1 {
                font-size: calc(2.25rem * var(--font-size-scale));
                border-bottom: 3px solid var(--accent-color);
                padding-bottom: 0.5rem;
            }

            .markdown-content h2 {
                font-size: calc(1.75rem * var(--font-size-scale));
                border-bottom: 2px solid var(--border-color);
                padding-bottom: 0.3rem;
            }

            .markdown-content h3 {
                font-size: calc(1.5rem * var(--font-size-scale));
            }

            .markdown-content h4 {
                font-size: calc(1.25rem * var(--font-size-scale));
            }

            .markdown-content p {
                margin: 1rem 0;
                text-align: left;
                /* Text layout optimization */
                line-height: 1.8;
                word-break: break-word;
                overflow-wrap: break-word;
                hyphens: auto;
            }

            .markdown-content ul,
            .markdown-content ol {
                margin: 1rem 0;
                padding-left: 2rem;
            }

            .markdown-content li {
                margin: 0.5rem 0;
            }

            .markdown-content code {
                background: var(--code-bg);
                padding: 0.2rem 0.4rem;
                border-radius: 4px;
                font-family:
                    "JetBrains Mono", "SF Mono", "Monaco", "Inconsolata",
                    "Source Code Pro", "Menlo", "Consolas", "DejaVu Sans Mono",
                    "Liberation Mono", "Courier New", monospace;
                font-size: calc(0.9em * var(--font-size-scale));
                color: var(--code-text);
                /* Code font optimization */
                font-variant-ligatures: common-ligatures;
                font-feature-settings: "calt" 1, "liga" 1;
            }

            .markdown-content pre {
                background: var(--pre-bg);
                padding: 1.5rem;
                border-radius: 8px;
                overflow-x: auto;
                margin: 1.5rem 0;
                border: 1px solid var(--border-color);
            }

            .markdown-content pre code {
                background: none;
                padding: 0;
                color: var(--text-primary);
            }

            .markdown-content table {
                border-collapse: collapse;
                width: 100%;
                margin: 1.5rem 0;
                box-shadow: 0 1px 3px var(--shadow);
                border-radius: 8px;
                overflow: hidden;
            }

            .markdown-content th,
            .markdown-content td {
                border: 1px solid var(--border-color);
                padding: 0.75rem 1rem;
                text-align: left;
                /* Let long content (URLs, UUIDs, inline code) break so the table
                   fits its container width and grows in height instead of
                   overflowing horizontally. */
                overflow-wrap: anywhere;
                word-break: break-word;
            }

            /* Inline code is nowrap in prose so snippets stay whole, but inside a
               table cell that would force the column wider than the page. Allow it
               to wrap within cells so the table fits the content width. */
            .markdown-content th .inline-code-wrapper,
            .markdown-content td .inline-code-wrapper,
            .markdown-content th .inline-code-wrapper > code,
            .markdown-content td .inline-code-wrapper > code {
                white-space: normal;
            }

            /* In a cell the code wraps and the wrapper fills the column, so the
               prose right-edge anchoring (left:100%) drops the button at the far
               cell edge with a big gap. Keep it absolutely positioned -- so
               revealing it never reflows the table -- but let it fall at its
               static position (right after the code's last line) via auto insets. */
            .markdown-content th .inline-code-copy-btn,
            .markdown-content td .inline-code-copy-btn {
                left: auto;
                top: auto;
                transform: none;
                margin-left: 4px;
            }

            .markdown-content th {
                background-color: var(--bg-secondary);
                font-weight: 600;
                color: var(--text-tertiary);
            }

            .markdown-content tr:nth-child(even) {
                background-color: var(--table-stripe);
            }

            .markdown-content blockquote {
                border-left: 4px solid var(--accent-color);
                padding: 1rem 1.5rem;
                color: var(--text-secondary);
                margin: 1.5rem 0;
                background: var(--blockquote-bg);
                border-radius: 0 8px 8px 0;
            }

            .markdown-content blockquote p {
                margin: 0.5rem 0;
            }

            /* Mermaid diagram styles */
            .mermaid {
                text-align: center;
                margin: 2rem 0;
                background: var(--bg-primary);
                border-radius: 8px;
                padding: 1rem;
                box-shadow: 0 2px 8px var(--shadow);
            }

            /* Search box styles */
            .search-input-container {
                position: relative;
                padding: 0 1rem;
                flex-shrink: 0;
            }

            .search-input {
                width: 100%;
                padding: 0.5rem 2.5rem 0.5rem 0.75rem;
                border: 1px solid var(--border-color);
                border-radius: 6px;
                font-size: calc(0.9rem * var(--font-size-scale));
                background: var(--bg-secondary);
                color: var(--text-primary);
                transition: all 0.2s ease;
            }

            .search-input:focus {
                outline: none;
                border-color: var(--accent-color);
                box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
            }

            .search-clear-btn {
                position: absolute;
                right: 1.5rem;
                top: 50%;
                transform: translateY(-50%);
                background: none;
                border: none;
                color: var(--text-secondary);
                cursor: pointer;
                padding: 0.25rem;
                border-radius: 3px;
                display: none;
                transition: all 0.2s ease;
            }

            .search-clear-btn:hover {
                color: var(--text-primary);
                background: var(--bg-tertiary);
            }

            .search-clear-btn.show {
                display: block;
            }

            /* Search mode toggle */
            .search-mode-toggle {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                border-bottom: 1px solid var(--border-color);
                background: var(--bg-secondary);
            }

            .search-mode-btn {
                padding: 0.25rem 0.5rem;
                border: 1px solid var(--border-color);
                background: var(--bg-primary);
                color: var(--text-secondary);
                border-radius: 4px;
                font-size: calc(0.8rem * var(--font-size-scale));
                cursor: pointer;
                transition: all 0.2s ease;
            }

            .search-mode-btn.active {
                background: var(--accent-color);
                color: white;
                border-color: var(--accent-color);
            }

            .search-mode-btn:hover:not(.active) {
                background: var(--bg-tertiary);
                color: var(--text-primary);
            }

            /* Search result styles */
            .search-results {
                padding: 0;
            }

            .search-result-item {
                margin-bottom: 1rem;
                border: 1px solid var(--border-color);
                border-radius: 8px;
                background: var(--bg-secondary);
                transition: all 0.2s ease;
                cursor: pointer;
            }

            .search-result-item:hover {
                border-color: var(--accent-color);
                box-shadow: 0 2px 8px var(--shadow);
                transform: translateY(-1px);
            }

            .search-result-header {
                padding: 0.75rem 1rem;
                border-bottom: 1px solid var(--border-color);
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .search-result-title {
                font-weight: 600;
                color: var(--text-primary);
                font-size: calc(0.9rem * var(--font-size-scale));
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .search-result-title .file-icon::before {
                content: "📄";
                font-size: calc(0.8rem * var(--font-size-scale));
            }

            .search-result-score {
                background: var(--accent-color);
                color: white;
                padding: 0.2rem 0.5rem;
                border-radius: 12px;
                font-size: calc(0.75rem * var(--font-size-scale));
                font-weight: 500;
            }

            .search-result-matches {
                padding: 0;
            }

            .search-match {
                padding: 0.75rem 1rem;
                border-bottom: 1px solid var(--border-color);
                position: relative;
            }

            .search-match:last-child {
                border-bottom: none;
            }

            .search-match-line {
                font-size: calc(0.85rem * var(--font-size-scale));
                color: var(--text-secondary);
                margin-bottom: 0.25rem;
            }

            .search-match-content {
                font-family: 'SF Mono', 'Monaco', 'Inconsolata', monospace;
                font-size: calc(0.85rem * var(--font-size-scale));
                line-height: 1.5;
                color: var(--text-primary);
                background: var(--bg-primary);
                padding: 0.5rem;
                border-radius: 4px;
                border: 1px solid var(--border-color);
                margin-bottom: 0.5rem;
                word-wrap: break-word;
                overflow-wrap: break-word;
            }

            .search-match-content mark {
                background: var(--accent-color);
                color: white;
                padding: 0.1rem 0.2rem;
                border-radius: 2px;
                font-weight: 600;
            }

            .search-match-context {
                font-size: calc(0.8rem * var(--font-size-scale));
                color: var(--text-secondary);
                font-style: italic;
                margin-top: 0.25rem;
                padding-left: 1rem;
                border-left: 2px solid var(--border-color);
            }

            .search-stats {
                padding: 0.75rem 1rem;
                margin: 0 0 1rem 0;
                background: var(--bg-secondary);
                border-bottom: 1px solid var(--border-color);
                border-radius: 6px;
                font-size: calc(0.85rem * var(--font-size-scale));
                color: var(--text-secondary);
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .search-loading {
                text-align: center;
                padding: 2rem 1rem;
                color: var(--text-secondary);
            }

            .search-loading-spinner {
                display: inline-block;
                width: 1.5rem;
                height: 1.5rem;
                border: 2px solid var(--bg-tertiary);
                border-top: 2px solid var(--accent-color);
                border-radius: 50%;
                animation: spin 1s linear infinite;
                margin-bottom: 0.5rem;
            }

            .search-empty {
                text-align: center;
                padding: 3rem 1rem;
                color: var(--text-secondary);
            }

            .search-empty-icon {
                font-size: 2rem;
                margin-bottom: 1rem;
                opacity: 0.5;
            }

            /* Table of contents container styles */
            .tree-container {
                height: calc(100vh - 120px);
                overflow-y: auto;
                overflow-x: hidden;
                padding: 0 1rem 1rem 1rem;
            }

            /* Responsive design */
            @media (max-width: 768px) {
                .sidebar {
                    position: fixed;
                    left: 0;
                    top: 60px;
                    height: calc(100vh - 60px);
                    z-index: 999;
                    transform: translateX(-100%);
                    transition: transform 0.3s ease;
                }

                .sidebar.show {
                    transform: translateX(0);
                }

                .sidebar-header {
                    padding: 1rem;
                }

                .search-box {
                    padding: 0 1rem;
                }

                .tree-container {
                    padding: 0 1rem 1rem 1rem;
                }

                .content-header {
                    padding: 1rem;
                }

                #content-container {
                    padding: 1rem;
                }

                .markdown-content h1 {
                    font-size: calc(1.75rem * var(--font-size-scale));
                }

                .markdown-content h2 {
                    font-size: calc(1.5rem * var(--font-size-scale));
                }

                .settings-panel {
                    width: 95%;
                    margin: 1rem;
                    padding: 1.5rem;
                }

                .theme-options {
                    grid-template-columns: 1fr;
                }
            }

            /* Document table of contents styles */
            .doc-toc {
                position: fixed;
                right: 2rem;
                top: 50%;
                transform: translateY(-50%);
                background: var(--bg-primary);
                border: 1px solid var(--border-color);
                border-radius: 12px;
                box-shadow: 0 8px 24px var(--shadow);
                max-width: 280px;
                max-height: 70vh;
                overflow: hidden;
                z-index: 1500;
                transition: all 0.3s ease;
                backdrop-filter: blur(10px);
            }

            .doc-toc.collapsed {
                transform: translateY(-50%) translateX(calc(100% - 40px));
            }

            .doc-toc-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0.2rem;
                border-bottom: 1px solid var(--border-color);
                background: var(--bg-secondary);
                border-radius: 12px 12px 0 0;
            }

            .doc-toc-title {
                font-size: calc(0.9rem * var(--font-size-scale));
                font-weight: 600;
                color: var(--text-primary);
                margin-left: 0.5em;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .doc-toc-title svg {
                width: 16px;
                height: 16px;
                stroke: var(--text-primary);
            }

            .doc-toc-toggle {
                background: none;
                border: none;
                color: var(--text-secondary);
                cursor: pointer;
                padding: 0.5rem;
                border-radius: 6px;
                transition: all 0.2s ease;
                min-width: 32px;
                min-height: 32px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .doc-toc-toggle:hover {
                background: var(--bg-tertiary);
                color: var(--text-primary);
                transform: scale(1.05);
            }

            .doc-toc-toggle svg {
                width: 18px;
                height: 18px;
                stroke: currentColor;
                transition: all 0.2s ease;
            }

            .doc-toc-content {
                padding: 0.5rem 0;
                max-height: calc(70vh - 60px);
                overflow-y: auto;
                overflow-x: hidden;
            }

            .doc-toc.collapsed .doc-toc-content {
                display: none;
            }

            .toc-item {
                display: block;
                padding: 0.4rem 1rem;
                color: var(--text-secondary);
                text-decoration: none;
                font-size: calc(0.85rem * var(--font-size-scale));
                line-height: 1.4;
                border-left: 3px solid transparent;
                transition: all 0.2s ease;
                cursor: pointer;
                word-wrap: break-word;
                overflow-wrap: break-word;
            }

            .toc-item:hover {
                background: var(--bg-secondary);
                color: var(--text-primary);
                border-left-color: var(--accent-color);
            }

            .toc-item.active {
                background: var(--bg-secondary);
                color: var(--accent-color);
                border-left-color: var(--accent-color);
                font-weight: 500;
            }

            .toc-item.level-1 {
                padding-left: 1rem;
                font-weight: 600;
                font-size: calc(0.9rem * var(--font-size-scale));
            }

            .toc-item.level-2 {
                padding-left: 1.5rem;
            }

            .toc-item.level-3 {
                padding-left: 2rem;
                font-size: calc(0.8rem * var(--font-size-scale));
            }

            .toc-item.level-4 {
                padding-left: 2.5rem;
                font-size: calc(0.8rem * var(--font-size-scale));
            }

            .toc-item.level-5 {
                padding-left: 3rem;
                font-size: calc(0.75rem * var(--font-size-scale));
            }

            .toc-item.level-6 {
                padding-left: 3.5rem;
                font-size: calc(0.75rem * var(--font-size-scale));
            }

            /* Styles when table of contents is collapsed */
            .doc-toc.collapsed .doc-toc-header {
                border-radius: 12px;
                border-bottom: none;
            }

            .doc-toc.collapsed .doc-toc-title {
                display: none;
            }

            /* Responsive design - hide table of contents on mobile */
            @media (max-width: 1024px) {
                .doc-toc {
                    display: none;
                }
            }

            /* AI assistant styles */
            .ai-assistant-trigger {
                position: fixed;
                bottom: 2rem;
                right: 2rem;
                width: 60px;
                height: 60px;
                background: var(--accent-color);
                color: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                box-shadow: 0 4px 16px rgba(0, 123, 255, 0.3);
                transition: all 0.3s ease;
                z-index: 1000;
            }

            .ai-assistant-trigger:hover {
                background: var(--accent-hover);
                transform: scale(1.1);
                box-shadow: 0 6px 20px rgba(0, 123, 255, 0.4);
            }

            .ai-assistant-trigger.hidden {
                display: none;
            }

            .ai-assistant-panel {
                position: fixed;
                bottom: 2rem;
                right: 2rem;
                width: 700px;
                height: 90%;
                background: var(--bg-primary);
                border: 1px solid var(--border-color);
                border-radius: 16px;
                box-shadow: 0 8px 32px var(--shadow);
                display: none;
                flex-direction: column;
                z-index: 1001;
                overflow: hidden;
                backdrop-filter: blur(10px);
            }

            .ai-assistant-panel.show {
                display: flex;
                animation: slideInUp 0.3s ease-out;
            }

            @keyframes slideInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .ai-assistant-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 1rem 1.5rem;
                background: var(--bg-secondary);
                border-bottom: 1px solid var(--border-color);
                border-radius: 16px 16px 0 0;
            }

            .ai-assistant-title {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                font-weight: 600;
                color: var(--text-primary);
                font-size: 1.1rem;
            }

            .ai-assistant-title svg {
                stroke: var(--accent-color);
            }

            .ai-assistant-controls {
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .ai-assistant-clear,
            .ai-assistant-close {
                background: none;
                border: none;
                color: var(--text-secondary);
                cursor: pointer;
                padding: 0.5rem;
                border-radius: 6px;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .ai-assistant-clear:hover,
            .ai-assistant-close:hover {
                background: var(--bg-tertiary);
                color: var(--text-primary);
            }

            .ai-assistant-clear:hover {
                color: #dc3545; /* Red indicates a delete action */
            }

            .ai-assistant-content {
                flex: 1;
                display: flex;
                flex-direction: column;
                overflow: hidden;
            }

            .ai-chat-messages {
                flex: 1;
                padding: 1rem;
                overflow-y: auto;
                display: flex;
                flex-direction: column;
                gap: 1rem;
            }

            .ai-message {
                display: flex;
                flex-direction: column;
                max-width: 85%;
            }

            .ai-message-user {
                align-self: flex-end;
            }

            .ai-message-assistant {
                align-self: flex-start;
            }

            .ai-message-content {
                padding: 0.75rem 1rem;
                border-radius: 12px;
                font-size: 0.9rem;
                line-height: 1.5;
                word-wrap: break-word;
            }

            .ai-message-user .ai-message-content {
                background: var(--accent-color);
                color: white;
                border-bottom-right-radius: 4px;
            }

            .ai-message-assistant .ai-message-content {
                background: var(--bg-secondary);
                color: var(--text-primary);
                border: 1px solid var(--border-color);
                border-bottom-left-radius: 4px;
            }

            .ai-message-loading {
                align-self: flex-start;
            }

            .ai-message-loading .ai-message-content {
                background: var(--bg-secondary);
                border: 1px solid var(--border-color);
                display: flex;
                align-items: center;
                gap: 0.5rem;
                color: var(--text-secondary);
            }

            .ai-typing-indicator {
                display: flex;
                gap: 0.25rem;
            }

            .ai-typing-dot {
                width: 6px;
                height: 6px;
                background: var(--text-secondary);
                border-radius: 50%;
                animation: typingDot 1.4s infinite ease-in-out;
            }

            .ai-typing-dot:nth-child(1) { animation-delay: -0.32s; }
            .ai-typing-dot:nth-child(2) { animation-delay: -0.16s; }

            @keyframes typingDot {
                0%, 80%, 100% {
                    transform: scale(0.8);
                    opacity: 0.5;
                }
                40% {
                    transform: scale(1);
                    opacity: 1;
                }
            }

            .ai-suggestions {
                border-top: 1px solid var(--border-color);
                background: var(--bg-secondary);
                transition: all 0.3s ease;
            }

            .ai-suggestions.collapsed {
                border-top: none;
            }

            .ai-suggestions-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 1rem;
                cursor: pointer;
                transition: all 0.2s ease;
                border-top: 1px solid var(--border-color);
            }

            .ai-suggestions.collapsed .ai-suggestions-header {
                padding: 0.5rem 1rem;
                border-top: none;
                background: var(--bg-primary);
            }

            .ai-suggestions-header:hover {
                background: var(--bg-tertiary);
            }

            .ai-suggestions.collapsed .ai-suggestions-header:hover {
                background: var(--bg-secondary);
            }

            .ai-suggestions-title {
                font-size: 0.85rem;
                font-weight: 600;
                color: var(--text-secondary);
                margin: 0;
            }

            .ai-suggestions-toggle {
                background: none;
                border: none;
                color: var(--text-secondary);
                cursor: pointer;
                padding: 0.25rem;
                border-radius: 4px;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                transform: rotate(0deg);
            }

            .ai-suggestions.collapsed .ai-suggestions-toggle {
                transform: rotate(-90deg);
            }

            .ai-suggestions-toggle:hover {
                background: var(--bg-tertiary);
                color: var(--text-primary);
            }

            .ai-suggestions-list {
                display: flex;
                flex-direction: column;
                gap: 0.5rem;
                padding: 0 1rem 1rem 1rem;
                max-height: 300px;
                overflow: hidden;
                transition: all 0.3s ease;
            }

            .ai-suggestions.collapsed .ai-suggestions-list {
                max-height: 0;
                padding: 0 1rem;
                opacity: 0;
            }

            .ai-suggestion-item {
                background: var(--bg-primary);
                border: 1px solid var(--border-color);
                border-radius: 8px;
                padding: 0.5rem 0.75rem;
                font-size: 0.85rem;
                color: var(--text-primary);
                cursor: pointer;
                transition: all 0.2s ease;
                text-align: left;
                line-height: 1.4;
            }

            .ai-suggestion-item:hover {
                background: var(--accent-color);
                color: white;
                border-color: var(--accent-color);
                transform: translateY(-1px);
            }

            .ai-assistant-input {
                padding: 1rem;
                border-top: 1px solid var(--border-color);
                background: var(--bg-primary);
                border-radius: 0 0 16px 16px;
            }

            .ai-input-container {
                display: flex;
                flex-direction: column;
                gap: 0.75rem;
                background: var(--bg-secondary);
                border: 1px solid var(--border-color);
                border-radius: 12px;
                padding: 0.75rem;
                transition: border-color 0.2s ease;
            }

            .ai-input-container:focus-within {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.1);
            }

            #contextTagsContainer {
                display: flex;
                flex-wrap: wrap;
                gap: 0.5rem;
                width: 100%;
            }

            .ai-input {
                flex: 1;
                background: none;
                border: none;
                outline: none;
                color: var(--text-primary);
                font-size: 0.9rem;
                line-height: 1.4;
                resize: none;
                min-height: 20px;
                max-height: 100px;
                font-family: var(--font-family);
                width: 100%;
            }

            .ai-input::placeholder {
                color: var(--text-secondary);
            }

            .ai-send-btn {
                background: var(--accent-color);
                border: none;
                border-radius: 8px;
                width: 36px;
                height: 36px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: all 0.2s ease;
                flex-shrink: 0;
                align-self: flex-end;
                margin-top: 0.5rem;
            }

            .ai-send-btn:hover:not(:disabled) {
                background: var(--accent-hover);
                transform: scale(1.05);
            }

            .ai-send-btn:disabled {
                background: var(--bg-tertiary);
                cursor: not-allowed;
                opacity: 0.5;
            }

            .ai-send-btn svg {
                stroke: white;
            }

            .ai-send-btn:disabled svg {
                stroke: var(--text-secondary);
            }

            /* Streaming output cursor animation */
            .ai-cursor {
                display: inline-block;
                background: var(--accent-color);
                width: 2px;
                height: 1.2em;
                margin-left: 2px;
                animation: blink 1s infinite;
            }

            @keyframes blink {
                0%, 50% { opacity: 1; }
                51%, 100% { opacity: 0; }
            }

            /* Responsive design */
            @media (max-width: 768px) {
                .ai-assistant-trigger {
                    bottom: 1rem;
                    right: 1rem;
                    width: 50px;
                    height: 50px;
                }

                .ai-assistant-panel {
                    bottom: 0;
                    right: 0;
                    left: 0;
                    width: 100%;
                    height: 70vh;
                    border-radius: 16px 16px 0 0;
                    max-height: 600px;
                }

                .ai-assistant-panel.show {
                    animation: slideInUpMobile 0.3s ease-out;
                }

                @keyframes slideInUpMobile {
                    from {
                        transform: translateY(100%);
                    }
                    to {
                        transform: translateY(0);
                    }
                }
            }

            /* Scrollbar styles */
            ::-webkit-scrollbar {
                width: 8px;
            }

            ::-webkit-scrollbar-track {
                background: var(--bg-secondary);
            }

            ::-webkit-scrollbar-thumb {
                background: var(--text-secondary);
                border-radius: 4px;
            }

            ::-webkit-scrollbar-thumb:hover {
                background: var(--text-tertiary);
            }

            /* Table of contents scrollbar styles */
            .doc-toc-content::-webkit-scrollbar {
                width: 4px;
            }

            .doc-toc-content::-webkit-scrollbar-track {
                background: transparent;
            }

            .doc-toc-content::-webkit-scrollbar-thumb {
                background: var(--border-color);
                border-radius: 2px;
            }

            /* AI chat message scrollbar styles */
            .ai-chat-messages::-webkit-scrollbar {
                width: 4px;
            }

            .ai-chat-messages::-webkit-scrollbar-track {
                background: transparent;
            }

            .ai-chat-messages::-webkit-scrollbar-thumb {
                background: var(--border-color);
                border-radius: 2px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="header-left">
                <h1><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAAEDCAMAAADtOCr6AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAKpUExURSdedzpqgTiFkUCLmUFzi3Szy4DL3Zrs/Yb5/oTt+pHe8VaRnpv3/3L4+mP5+F7x717p8Vnj7Fzb6GjQ31r5+FL080ny8lPu807t7Enr9Efm81Hi8m7m66n9/071+lXo+Evs9mTp9arv+3jr+2Pu/Fbz+U3w9kzr/kro+Unk+Uzl90rg9YPL6Ej09kvv8kfg+lzj9WPg8MT9/1Tf+Eno9kbj9oK52U3c90zb7UPf80Xf92OnvErY91nV74Db+W7e7GTQ9miYsEbd+krZ+zY5kUVGpE1PuldZ0IJRzpQyorAprXIjbTanqVBa6V9f36tCyso30uAx3/8x//Iv7lHV+l9i7llj+WNm/GVm/yklzScr9Cgno1okjSkq5DEz/gYhykjU+iQiuSMjjCkxaQIIsouLt66wrWNiiVLP/enp6dna2aWrpOXl5QUG5ePj49TU1H5+gYyOjMfIyN7f3kjS/sLCws7Ozpyenrm4ub69vrWys29raREnUQALN6OjvHNzw5QfIbImJ6AvLw2LicssLt4tK+0yMv80M8pVVp8MDPUgHAa2svsCA9cFBI0ND+QCA5lwcATCwEnN/sYFBAHOzV4hJLIFCHoUFNc8Pu8BAoY5Po9aW1XI9jyY3VS2+HS89AmloTKq6126+0qy+EZTYU3F/ku+/12t/D8ySLC6tESs/0Oo/kjJ/ESw/0Cz/zWn9nlZFnpUU0txS6i2HOrqGs7RHhZAWczMc/7+BHOvHwmzDA2iEDyt/wLCBALPAjZwtMhwcUSrLg+VEA5eDweICUOk/EKj/jiB0QSSBSqzIj+U8cCTlAt/DI6qjXKqcyJNZBwbFw1qDz2n/kCf/khcEggxDxdOHAl1Cz+Y/QKbAkGb/5WbGmmNaVSuVUid+mKm+GCHyGmb1gAAAM2EBTcAAADjdFJOU/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8AzF4BsAAAAAlwSFlzAAAOwwAADsMBx2+oZAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS45bG7aPgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAABgAAAAAQAAAGAAAAABAAAAUGFpbnQuTkVUIDUuMS45AAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAAEzPwEglj9egAAAsdElEQVR4Xu2di19U17n3MVUBRQUVuYwyg1yEGREIEC4BIYCS0zY0bUEiFARPJM5mO6N7Zw+zsW+CxhsEmAQUHWPT9Fg8jRBzP6c1QmxAQiNJi6RBTZNz3vlL3s/zrLUvs5lBBsa8GHhmuLjDAL/v+q1nPeuySYBrkUeA9sJiiyUA2guLLZYAaC8stlgCoL2w2GIJgPbCYoslANoLiy2WAGgvLLZYAqC9sNhiCYD2wmKLJQDaC4stlgBoLyy2WAKgvbDYYgmA9sJiiyUA2guLLZYAaC8stlgCoL2w2GIJgPbCYoslANoLiy2WAGgvLLZYAqC9sNjCzwAClj322GM/mR6P+RzLli0LgND+BH+H/37A8hUrA4P8FcFyrFq5TPuT/Bp+ArB6ZUhQ0Jo1a9eukyNU+fQBof3KUBJhYevXr1+/YcMqP/2OnsMf33z5ypCQoDVr167duHHjxvBNm8Ix1oWvi1gXGb4uMjwyPHLmCFP/IyoqKlqn0+nofwpbs3ml9gf6M+YP4LFVW1D9OlAdE0PUR2Csi1gH78MjycXw8PDICLXWSPgiXYQ+Qq+LiIyKjIo0GPQGg0Gv1+sBgU6nC9NFhsYGa3+kP2O+AJZvDQmKi1+7MTwhITwhBiIxISYhIYEQgAAY4fAkj4iIiEh4UPkRESBXryfKDXr9Nv22bUnJeqPRZDQigwUNIGD7lqDY0LUbw1NiYlJQfkxMzLaYxJjExMRE2ug7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" alt="Litho Book" style="width: 32px; height: 32px; margin-right: 8px;"> Litho Book</h1>
            </div>
            <div class="header-right">
                <div class="header-subtitle" id="docs-path"></div>
                <button
                    class="settings-btn"
                    onclick="openSettings()"
                    title="{{ i18n.settings_title }}"
                >
                    <svg
                        width="20"
                        height="20"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                    >
                        <circle cx="12" cy="12" r="3"></circle>
                        <path
                            d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1 1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"
                        ></path>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Settings panel -->
        <div class="settings-overlay" id="settingsOverlay">
            <div class="settings-panel">
                <div class="settings-header">
                    <div class="settings-title">
                        <svg
                            width="20"
                            height="20"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        >
                            <circle cx="12" cy="12" r="3"></circle>
                            <path
                                d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1 1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"
                            ></path>
                        </svg>
                        {{ i18n.settings_title }}
                    </div>
                    <button class="settings-close" onclick="closeSettings()">
                        <svg
                            width="20"
                            height="20"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        >
                            <path d="M18 6L6 18M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>

                <div class="settings-content">
                    <div class="settings-section">
                    <div class="settings-section-title">🎨 Theme</div>
                    <div class="settings-group">
                        <div class="theme-options">
                            <div class="theme-option active" data-theme="light">
                                <div class="theme-preview">🌕</div>
                                <div class="theme-name">Light</div>
                            </div>
                            <div class="theme-option" data-theme="dark">
                                <div class="theme-preview">🌑</div>
                                <div class="theme-name">Dark</div>
                            </div>
                            <div class="theme-option" data-theme="morandi">
                                <div class="theme-preview">🎨</div>
                                <div class="theme-name">Morandi</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="settings-section">
                    <div class="settings-section-title">🔤 Font</div>
                    <div class="settings-group">
                        <label class="settings-label">Font family</label>
                        <select class="font-select" id="fontSelect">
                            <option value="geist">
                                Geist（modern sans-serif font, clean and clear）
                            </option>
                            <option value="inter">
                                Inter（compact sans-serif font, light and modern）
                            </option>
                            <option value="noto-sans-sc">
                                Noto Sans SC（modern sans-serif font, clear and readable）
                            </option>
                            <option value="noto-serif-sc">
                                Noto Serif SC（traditional serif font, classic and readable）
                            </option>
                            <option value="pingfang">
                                PingFang（macOS modern font）
                            </option>
                        </select>
                    </div>
                    <div class="settings-group">
                        <div class="font-preview" id="fontPreview">
                            <div class="font-preview-header" onclick="toggleFontPreview()">
                                <div class="font-preview-title">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M4 7h16M10 11h4M8 15h8M4 3h16a1 1 0 0 1 1 1v16a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z"></path>
                                    </svg>
                                    Font preview
                                </div>
                                <button class="font-preview-toggle collapsed" id="fontPreviewToggle">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M6 9l6 6 6-6"></path>
                                    </svg>
                                </button>
                            </div>
                            <div class="font-preview-content collapsed" id="fontPreviewContent">
                                <div class="font-preview-text">
                                    <p>The quick brown fox jumps over the lazy dog.</p>
                                    <p>Font preview: This sample text tests the selected font rendering.</p>
                                    <p>Number test：0123456789</p>
                                    <p>Punctuation: ,.?!;:""''()[]</p>
                                </div>
                                <div class="font-info" id="fontInfo">
                                    <small>Current font stack：Geist, Noto Sans SC, PingFang SC...</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="settings-section">
                    <div class="settings-section-title">📏 Font size</div>
                    <div class="settings-group">
                        <label class="settings-label">Font size</label>
                        <div class="font-size-controls">
                            <button
                                class="font-size-btn"
                                onclick="adjustFontSize(-0.05)"
                            >
                                −
                            </button>
                            <div class="font-size-display" id="fontSizeDisplay">
                                100%
                            </div>
                            <button
                                class="font-size-btn"
                                onclick="adjustFontSize(0.05)"
                            >
                                +
                            </button>
                        </div>
                    </div>
                </div>

                <button class="reset-btn" onclick="resetSettings()">
                    🔄 Restore defaults
                </button>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="sidebar" id="sidebar">
                <div class="sidebar-header">
                    <div class="sidebar-title">{{ i18n.sidebar_title }}</div>
                    <button class="toggle-btn" onclick="toggleSidebar()">
                        <svg
                            width="16"
                            height="16"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        >
                            <path d="M18 6L6 18M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>
                <div class="search-input-container">
                    <input
                        type="text"
                        class="search-input"
                        placeholder="Search document content..."
                        id="searchInput"
                        onkeyup="handleSearchInput()"
                    />
                    <button class="search-clear-btn" id="searchClearBtn" onclick="clearSearch()">
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M18 6L6 18M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>

                <div class="search-mode-toggle" id="searchModeToggle" style="display: none;">
                    <button class="search-mode-btn active" data-mode="content" onclick="setSearchMode('content')">
                        Content search
                    </button>
                    <button class="search-mode-btn" data-mode="filename" onclick="setSearchMode('filename')">
                        File name
                    </button>
                </div>
                <div id="tree-container" class="tree-container"></div>
            </div>

            <div class="content">
                <div class="content-header">
                    <button class="sidebar-toggle" onclick="toggleSidebar()">
                        <svg
                            width="20"
                            height="20"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        >
                            <path d="M3 6h18M3 12h18M3 18h18"></path>
                        </svg>
                    </button>
                    <div id="breadcrumb"></div>
                </div>
                <div id="content-container">
                    <div class="loading">
                        <p>📖 Select a document on the left to start reading</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Document contents -->
        <div class="doc-toc collapsed" id="docToc">
            <div class="doc-toc-header">
                <h3 class="doc-toc-title">
                    <svg
                        width="16"
                        height="16"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                    >
                        <line x1="8" y1="6" x2="21" y2="6"></line>
                        <line x1="8" y1="12" x2="21" y2="12"></line>
                        <line x1="8" y1="18" x2="21" y2="18"></line>
                        <line x1="3" y1="6" x2="3.01" y2="6"></line>
                        <line x1="3" y1="12" x2="3.01" y2="12"></line>
                        <line x1="3" y1="18" x2="3.01" y2="18"></line>
                    </svg>
                    Contents
                </h3>
                <button
                    class="doc-toc-toggle"
                    onclick="toggleToc()"
                    id="tocToggleBtn"
                >
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="8" y1="6" x2="21" y2="6"></line>
                        <line x1="8" y1="12" x2="21" y2="12"></line>
                        <line x1="8" y1="18" x2="21" y2="18"></line>
                        <line x1="3" y1="6" x2="3.01" y2="6"></line>
                        <line x1="3" y1="12" x2="3.01" y2="12"></line>
                        <line x1="3" y1="18" x2="3.01" y2="18"></line>
                    </svg>
                </button>
            </div>
            <div class="doc-toc-content" id="tocContent">
                <!-- TOC items are generated dynamically with JavaScript -->
            </div>
        </div>

        <!-- AI assistant button -->
        <div class="ai-assistant-trigger" id="aiAssistantTrigger" onclick="toggleAiAssistant()">
            <svg fill="#ffffff" viewBox="-6 -6 36 36" role="img" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><title>OpenAI icon</title><path d="M22.2819 9.8211a5.9847 5.9847 0 0 0-.5157-4.9108 6.0462 6.0462 0 0 0-6.5098-2.9A6.0651 6.0651 0 0 0 4.9807 4.1818a5.9847 5.9847 0 0 0-3.9977 2.9 6.0462 6.0462 0 0 0 .7427 7.0966 5.98 5.98 0 0 0 .511 4.9107 6.051 6.051 0 0 0 6.5146 2.9001A5.9847 5.9847 0 0 0 13.2599 24a6.0557 6.0557 0 0 0 5.7718-4.2058 5.9894 5.9894 0 0 0 3.9977-2.9001 6.0557 6.0557 0 0 0-.7475-7.0729zm-9.022 12.6081a4.4755 4.4755 0 0 1-2.8764-1.0408l.1419-.0804 4.7783-2.7582a.7948.7948 0 0 0 .3927-.6813v-6.7369l2.02 1.1686a.071.071 0 0 1 .038.052v5.5826a4.504 4.504 0 0 1-4.4945 4.4944zm-9.6607-4.1254a4.4708 4.4708 0 0 1-.5346-3.0137l.142.0852 4.783 2.7582a.7712.7712 0 0 0 .7806 0l5.8428-3.3685v2.3324a.0804.0804 0 0 1-.0332.0615L9.74 19.9502a4.4992 4.4992 0 0 1-6.1408-1.6464zM2.3408 7.8956a4.485 4.485 0 0 1 2.3655-1.9728V11.6a.7664.7664 0 0 0 .3879.6765l5.8144 3.3543-2.0201 1.1685a.0757.0757 0 0 1-.071 0l-4.8303-2.7865A4.504 4.504 0 0 1 2.3408 7.872zm16.5963 3.8558L13.1038 8.364 15.1192 7.2a.0757.0757 0 0 1 .071 0l4.8303 2.7913a4.4944 4.4944 0 0 1-.6765 8.1042v-5.6772a.79.79 0 0 0-.407-.667zm2.0107-3.0231l-.142-.0852-4.7735-2.7818a.7759.7759 0 0 0-.7854 0L9.409 9.2297V6.8974a.0662.0662 0 0 1 .0284-.0615l4.8303-2.7866a4.4992 4.4992 0 0 1 6.6802 4.66zM8.3065 12.863l-2.02-1.1638a.0804.0804 0 0 1-.038-.0567V6.0742a4.4992 4.4992 0 0 1 7.3757-3.4537l-.142.0805L8.704 5.459a.7948.7948 0 0 0-.3927.6813zm1.0976-2.3654l2.602-1.4998 2.6069 1.4998v2.9994l-2.5974 1.4997-2.6067-1.4997Z"></path></g></svg>
        </div>

        <!-- AI assistant panel -->
        <div class="ai-assistant-panel" id="aiAssistantPanel">
            <div class="ai-assistant-header">
                <div class="ai-assistant-title">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M12 2a3 3 0 0 0-3 3v7a3 3 0 0 0 6 0V5a3 3 0 0 0-3-3Z"></path>
                        <path d="M19 10v2a7 7 0 0 1-14 0v-2"></path>
                        <line x1="12" y1="19" x2="12" y2="22"></line>
                        <line x1="8" y1="22" x2="16" y2="22"></line>
                    </svg>
                    Litho Advisor
                </div>
                <div class="ai-assistant-controls">
                    <button class="ai-assistant-clear" onclick="clearChatHistory()" title="Clear chat history">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 6h18"></path>
                            <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path>
                            <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path>
                        </svg>
                    </button>
                    <button class="ai-assistant-close" onclick="toggleAiAssistant()">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6L6 18M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>
            </div>

            <div class="ai-assistant-content">
                <div class="ai-chat-messages" id="aiChatMessages">
                    <div class="ai-message ai-message-assistant">
                        <div class="ai-message-content">
                            <p>👋 Hello! I am<strong>Litho Advisor</strong>，your documentation assistant. I can help you understand and analyze document content. Ask me anything!</p>
                        </div>
                    </div>
                </div>

                <div class="ai-suggestions" id="aiSuggestions">
                    <div class="ai-suggestions-header" onclick="toggleSuggestions()">
                        <div class="ai-suggestions-title">💡 Suggested questions</div>
                        <button class="ai-suggestions-toggle" id="aiSuggestionsToggle">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M6 9l6 6 6-6"></path>
                            </svg>
                        </button>
                    </div>
                    <div class="ai-suggestions-list" id="aiSuggestionsList">
                        <button class="ai-suggestion-item" onclick="sendSuggestion('What are the main features of this project?')">
                            What are the main features of this project?
                        </button>
                        <button class="ai-suggestion-item" onclick="sendSuggestion('How do I get started with this project?')">
                            How do I get started with this project?
                        </button>
                        <button class="ai-suggestion-item" onclick="sendSuggestion('What is the technical architecture of this project?')">
                            What is the technical architecture of this project?
                        </button>
                    </div>
                </div>
            </div>

            <div class="ai-assistant-input">
                <div class="ai-input-container">
                    <!-- Add context tag container -->
                    <div id="contextTagsContainer" style="margin-bottom: 0.5rem; display: flex; flex-wrap: wrap;"></div>
                    <textarea
                        class="ai-input"
                        id="aiInput"
                        placeholder="Enter your question... (type @ to select documents)"
                        rows="1"
                        onkeydown="handleAiInputKeydown(event)"
                        oninput="adjustTextareaHeight(this)"
                    ></textarea>
                    <button class="ai-send-btn" id="aiSendBtn" onclick="sendMessage()" disabled>
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 2L11 13"></path>
                            <path d="M22 2L15 22L11 13L2 9L22 2Z"></path>
                        </svg>
                    </button>
                </div>
            </div>

                </div>
            </div>
        </div>

        <!-- Load Mermaid.js -->
        <script src="https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.min.js"></script>

        <script>
            // Settings management
            const Settings = {
                theme: 'light',
                fontFamily: 'geist',
                fontSizeScale: 1,

                // Font mapping - optimized multilingual font support
                fontFamilies: {
                    // Modern sans-serif font - Geist first
                    'geist': "'Geist', 'Noto Sans SC', 'PingFang SC', 'Hiragino Sans GB', sans-serif",

                    // Noto Sans SC - modern sans-serif, clear and readable
                    'noto-sans-sc': "'Noto Sans SC', 'PingFang SC', 'Hiragino Sans GB', sans-serif",

                    // Noto Serif SC - traditional serif, suitable for long-form reading
                    'noto-serif-sc': "'Noto Serif SC',  'Songti SC', 'STSong', serif",

                    // Inter - modern UI font with Noto Sans SC fallback
                    'inter': "'Inter', 'Noto Sans SC', 'PingFang SC', 'Hiragino Sans GB', sans-serif",

                    // PingFang - modern macOS font
                    'pingfang': "'PingFang SC', 'Noto Sans SC', 'Hiragino Sans GB', sans-serif",
                },

                // Load settings
                load() {
                    const saved = localStorage.getItem('litho-book-settings');
                    if (saved) {
                        const settings = JSON.parse(saved);
                        this.theme = settings.theme || 'light';
                        this.fontFamily = settings.fontFamily || 'geist';
                        this.fontSizeScale = settings.fontSizeScale || 1;
                    }
                    this.apply();
                },

                // Save settings
                save() {
                    localStorage.setItem('litho-book-settings', JSON.stringify({
                        theme: this.theme,
                        fontFamily: this.fontFamily,
                        fontSizeScale: this.fontSizeScale
                    }));
                },

                // Apply settings
                apply() {
                    // Apply theme
                    if (this.theme === 'light') {
                        document.documentElement.removeAttribute('data-theme');
                    } else {
                        document.documentElement.setAttribute('data-theme', this.theme);
                    }

                    // Apply font
                    document.documentElement.style.setProperty('--font-family', this.fontFamilies[this.fontFamily]);

                    // Apply font size
                    document.documentElement.style.setProperty('--font-size-scale', this.fontSizeScale);

                    // Reinitialize and render Mermaid diagrams for the new theme
                    if (typeof mermaid !== 'undefined' && typeof initializeMermaid === 'function') {
                        try {
                            initializeMermaid();
                            // Use debounced rerender function
                            if (typeof debouncedRerenderMermaid === 'function') {
                                debouncedRerenderMermaid();
                            }
                        } catch (error) {
                            console.warn('Failed to initialize Mermaid while switching theme:', error);
                        }
                    }

                    // Update UI
                    this.updateUI();
                },

                // Update UI display
                updateUI() {
                    // Update theme selection
                    document.querySelectorAll('.theme-option').forEach(option => {
                        option.classList.remove('active');
                        if (option.dataset.theme === this.theme) {
                            option.classList.add('active');
                        }
                    });

                    // Update font selection
                    const fontSelect = document.getElementById('fontSelect');
                    if (fontSelect) {
                        fontSelect.value = this.fontFamily;
                    }

                    // Update font size display
                    const fontSizeDisplay = document.getElementById('fontSizeDisplay');
                    if (fontSizeDisplay) {
                        fontSizeDisplay.textContent = Math.round(this.fontSizeScale * 100) + '%';
                    }

                    // Update font preview
                    const fontPreview = document.getElementById('fontPreview');
                    if (fontPreview) {
                        const previewText = fontPreview.querySelector('.font-preview-text');
                        if (previewText) {
                            previewText.style.fontFamily = this.fontFamilies[this.fontFamily];
                            previewText.style.fontSize = `calc(0.9rem * ${this.fontSizeScale})`;
                        }

                        // Update font info
                        const fontInfo = fontPreview.querySelector('.font-info small');
                        if (fontInfo) {
                            // Delay font detection to ensure fonts are loaded
                            setTimeout(() => {
                                const actualFontInfo = this.getActualFontInfo();
                                fontInfo.innerHTML = `Font availability：${actualFontInfo}<br>Full font stack：${this.fontFamilies[this.fontFamily]}`;
                            }, 100);
                        }
                    }
                },

                // Set theme
                setTheme(theme) {
                    this.theme = theme;
                    this.apply();
                    this.save();
                },

                // Set font
                setFont(fontFamily) {
                    this.fontFamily = fontFamily;
                    this.apply();
                    this.save();
                },

                // Adjust font size
                adjustFontSize(delta) {
                    this.fontSizeScale = Math.max(0.5, Math.min(2, this.fontSizeScale + delta));
                    this.apply();
                    this.save();
                },

                // Reset settings
                reset() {
                    this.theme = 'light';
                    this.fontFamily = 'geist';
                    this.fontSizeScale = 1;
                    this.apply();
                    this.save();
                },

                // Detect whether font is available
                checkFontAvailability(fontName) {
                    const canvas = document.createElement('canvas');
                    const context = canvas.getContext('2d');

                    // Draw text with default font
                    context.font = '12px monospace';
                    const defaultWidth = context.measureText('Test fontTest Font').width;

                    // Draw text with selected font
                    context.font = `12px "${fontName}", monospace`;
                    const testWidth = context.measureText('Test fontTest Font').width;

                    // If widths differ, the font is available
                    return defaultWidth !== testWidth;
                },

                // Get actual font information
                getActualFontInfo() {
                    const fontStack = this.fontFamilies[this.fontFamily].split(',').map(f => f.trim().replace(/['"]/g, ''));
                    const availableFonts = [];

                    for (const font of fontStack) {
                        if (font.startsWith('-') || font === 'sans-serif' || font === 'serif' || font === 'monospace') {
                            availableFonts.push(font);
                            continue;
                        }

                        if (this.checkFontAvailability(font)) {
                            availableFonts.push(`✓ ${font}`);
                        } else {
                            availableFonts.push(`✗ ${font}`);
                        }
                    }

                    return availableFonts.slice(0, 5).join(', ') + (fontStack.length > 5 ? '...' : '');
                }
            };

            // Settings panel controls
            function openSettings() {
                document.getElementById('settingsOverlay').style.display = 'flex';
                Settings.updateUI();
            }

            function closeSettings() {
                document.getElementById('settingsOverlay').style.display = 'none';
            }

            function adjustFontSize(delta) {
                Settings.adjustFontSize(delta);
            }

            function resetSettings() {
                Settings.reset();
            }

            // Font preview collapse behavior
            function toggleFontPreview() {
                const content = document.getElementById('fontPreviewContent');
                const toggle = document.getElementById('fontPreviewToggle');

                if (content && toggle) {
                    const isCollapsed = content.classList.contains('collapsed');

                    if (isCollapsed) {
                        content.classList.remove('collapsed');
                        toggle.classList.remove('collapsed');
                    } else {
                        content.classList.add('collapsed');
                        toggle.classList.add('collapsed');
                    }
                }
            }

            // Table of contents features
            const TableOfContents = {
                isCollapsed: true,
                headings: [],
                activeHeading: null,

                // Toggle table of contents visibility
                toggle() {
                    const toc = document.getElementById('docToc');
                    const toggleBtn = document.getElementById('tocToggleBtn');

                    this.isCollapsed = !this.isCollapsed;

                    if (this.isCollapsed) {
                        toc.classList.add('collapsed');
                        toggleBtn.innerHTML = `
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <line x1="8" y1="6" x2="21" y2="6"></line>
                                <line x1="8" y1="12" x2="21" y2="12"></line>
                                <line x1="8" y1="18" x2="21" y2="18"></line>
                                <line x1="3" y1="6" x2="3.01" y2="6"></line>
                                <line x1="3" y1="12" x2="3.01" y2="12"></line>
                                <line x1="3" y1="18" x2="3.01" y2="18"></line>
                            </svg>
                        `;
                        toggleBtn.title = 'Expand contents';
                    } else {
                        toc.classList.remove('collapsed');
                        toggleBtn.innerHTML = `
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M18 6L6 18M6 6l12 12"></path>
                            </svg>
                        `;
                        toggleBtn.title = 'Collapse contents';
                    }
                },

                // Generate table of contents
                generate() {
                    const content = document.querySelector('.markdown-content');
                    if (!content) {
                        this.hide();
                        return;
                    }

                    const headings = content.querySelectorAll('h1, h2, h3, h4, h5, h6');
                    if (headings.length === 0) {
                        this.hide();
                        return;
                    }

                    this.headings = Array.from(headings);
                    this.show();
                    this.render();
                    this.setupScrollSpy();
                },

                // Render table of contents
                render() {
                    const tocContent = document.getElementById('tocContent');
                    tocContent.innerHTML = '';

                    this.headings.forEach((heading, index) => {
                        const level = parseInt(heading.tagName.charAt(1));
                        const text = heading.textContent.trim();
                        const id = `heading-${index}`;

                        // Add IDs to headings for anchor navigation
                        heading.id = id;

                        // Create table of contents item
                        const tocItem = document.createElement('a');
                        tocItem.className = `toc-item level-${level}`;
                        tocItem.textContent = text;
                        tocItem.href = `#${id}`;
                        tocItem.dataset.target = id;

                        // Click event
                        tocItem.addEventListener('click', (e) => {
                            e.preventDefault();
                            this.scrollToHeading(heading);
                            this.setActiveHeading(tocItem);
                        });

                        tocContent.appendChild(tocItem);
                    });
                },

                // Scroll to selected heading
                scrollToHeading(heading) {
                    const contentContainer = document.querySelector('.content');
                    const headerHeight = 60; // Header height
                    const offset = 20; // Extra offset

                    const targetPosition = heading.offsetTop - headerHeight - offset;

                    contentContainer.scrollTo({
                        top: targetPosition,
                        behavior: 'smooth'
                    });
                },

                // Set active heading
                setActiveHeading(tocItem) {
                    // Remove all active states
                    document.querySelectorAll('.toc-item').forEach(item => {
                        item.classList.remove('active');
                    });

                    // Set current active state
                    if (tocItem) {
                        tocItem.classList.add('active');
                        this.activeHeading = tocItem;
                    }
                },

                // Set up scroll listener
                setupScrollSpy() {
                    const contentContainer = document.querySelector('.content');
                    if (!contentContainer) return;

                    let ticking = false;

                    const updateActiveHeading = () => {
                        const scrollTop = contentContainer.scrollTop;
                        const headerHeight = 60;
                        const threshold = 100;

                        let activeHeading = null;
                        let minDistance = Infinity;

                        this.headings.forEach((heading, index) => {
                            const rect = heading.getBoundingClientRect();
                            const containerRect = contentContainer.getBoundingClientRect();
                            const headingTop = rect.top - containerRect.top + scrollTop;
                            const distance = Math.abs(headingTop - scrollTop - headerHeight);

                            if (headingTop <= scrollTop + headerHeight + threshold && distance < minDistance) {
                                minDistance = distance;
                                activeHeading = document.querySelector(`[data-target="heading-${index}"]`);
                            }
                        });

                        if (activeHeading !== this.activeHeading) {
                            this.setActiveHeading(activeHeading);
                        }

                        ticking = false;
                    };

                    contentContainer.addEventListener('scroll', () => {
                        if (!ticking) {
                            requestAnimationFrame(updateActiveHeading);
                            ticking = true;
                        }
                    });
                },

                // Show table of contents
                show() {
                    const toc = document.getElementById('docToc');
                    toc.style.display = 'block';
                },

                // Hide table of contents
                hide() {
                    const toc = document.getElementById('docToc');
                    toc.style.display = 'none';
                },

                // Clear table of contents
                clear() {
                    const tocContent = document.getElementById('tocContent');
                    tocContent.innerHTML = '';
                    this.headings = [];
                    this.activeHeading = null;
                }
            };

            // Table of contents toggle function
            function toggleToc() {
                TableOfContents.toggle();
            }

            // Mermaid theme configuration
            function getMermaidTheme() {
                const currentTheme = document.documentElement.getAttribute('data-theme');
                return currentTheme === 'dark' ? 'dark' : 'default';
            }

            // Get actual color values for the current theme
            function getMermaidThemeVariables() {
                const currentTheme = document.documentElement.getAttribute('data-theme');
                const computedStyle = getComputedStyle(document.documentElement);

                // Get actual CSS variable value
                function getCSSVar(varName) {
                    const value = computedStyle.getPropertyValue(varName).trim();
                    return value || (currentTheme === 'dark' ? '#ffffff' : '#000000');
                }

                if (currentTheme === 'dark') {
                    return {
                        primaryColor: '#3b82f6',
                        primaryTextColor: '#f8fafc',
                        primaryBorderColor: '#374151',
                        lineColor: '#6b7280',
                        secondaryColor: '#1f2937',
                        tertiaryColor: '#111827',
                        background: '#0f172a',
                        mainBkg: '#0f172a',
                        secondBkg: '#1e293b',
                        tertiaryBkg: '#334155',
                        edgeLabelBackground: '#0f172a',
                        clusterBkg: '#1e293b',
                        altBackground: '#1e293b',
                        nodeTextColor: '#f8fafc'
                    };
                } else {
                    return {
                        primaryColor: '#3b82f6',
                        primaryTextColor: '#1e293b',
                        primaryBorderColor: '#e5e7eb',
                        lineColor: '#6b7280',
                        secondaryColor: '#f8fafc',
                        tertiaryColor: '#ffffff',
                        background: '#ffffff',
                        mainBkg: '#ffffff',
                        secondBkg: '#f8fafc',
                        tertiaryBkg: '#f1f5f9',
                        edgeLabelBackground: '#ffffff',
                        clusterBkg: '#f8fafc',
                        altBackground: '#f8fafc',
                        nodeTextColor: '#1e293b'
                    };
                }
            }

            // Initialize Mermaid
            function initializeMermaid() {
                try {
                    const theme = getMermaidTheme();
                    const themeVariables = getMermaidThemeVariables();

                    console.log('Initializing Mermaid, theme:', theme);

                    mermaid.initialize({
                        startOnLoad: false,
                        theme: theme,
                        securityLevel: 'loose',
                        fontFamily: 'inherit',
                        themeVariables: themeVariables,
                        // Add error handling configuration
                        errorLevel: 'warn',
                        logLevel: 'warn'
                    });

                    console.log('Mermaid initialized, theme:', theme);
                } catch (error) {
                    console.error('Mermaid initialization failed:', error);
                }
            }

            // Rerender all Mermaid diagrams
            async function rerenderMermaidDiagrams() {
                try {
                    const mermaidElements = document.querySelectorAll('.mermaid');

                    // Return immediately if there are no Mermaid elements
                    if (mermaidElements.length === 0) {
                        return;
                    }

                    console.log('Starting Mermaid diagram rerender, count:', mermaidElements.length);

                    // Clear all existing Mermaid renders
                    mermaidElements.forEach(element => {
                        // Save original content if not already saved
                        let originalContent = element.getAttribute('data-original-content');
                        if (!originalContent) {
                            // Try to get original content from current text
                            const currentText = element.textContent.trim();
                            if (currentText && !currentText.includes('<svg')) {
                                originalContent = currentText;
                                element.setAttribute('data-original-content', originalContent);
                            }
                        }

                        // Clear existing content and markers
                        if (originalContent) {
                            element.innerHTML = '';
                            element.textContent = originalContent;
                        }
                        element.removeAttribute('data-processed');
                        element.removeAttribute('data-enhanced');
                        element.dataset.needsReenhancement = 'true';

                        // Remove existing control buttons
                        const existingControls = element.querySelector('.mermaid-controls');
                        if (existingControls) {
                            existingControls.remove();
                        }
                    });

                    // Wait for DOM update to complete
                    await new Promise(resolve => setTimeout(resolve, 100));

                    // Use mermaid.run() to rerender all diagrams
                    try {
                        await mermaid.run({
                            nodes: Array.from(mermaidElements)
                        });
                        console.log('Mermaid diagrams rerendered successfully');
                    } catch (error) {
                        console.warn('mermaid.run() failed; trying one-by-one rendering:', error);

                        // Fall back to one-by-one rendering if mermaid.run() fails
                        for (let i = 0; i < mermaidElements.length; i++) {
                            const element = mermaidElements[i];
                            try {
                                const originalContent = element.getAttribute('data-original-content');
                                if (originalContent) {
                                    element.textContent = originalContent;
                                    element.removeAttribute('data-processed');

                                    // Render single diagram with mermaid.run()
                                    await mermaid.run(undefined, element);
                                }
                            } catch (singleError) {
                                console.warn(`Diagram ${i} render failed:`, singleError);
                                // Keep original text content
                                const originalContent = element.getAttribute('data-original-content');
                                if (originalContent) {
                                    element.innerHTML = '';
                                    element.textContent = originalContent;
                                }
                            }
                        }
                    }

                    // Enhance Mermaid diagrams again
                    setTimeout(() => {
                        enhanceMermaidDiagrams();
                    }, 200);

                } catch (error) {
                    console.error('Error rerendering Mermaid diagrams:', error);
                }
            }

            // Debounce variables
            let mermaidRerenderTimeout = null;
            let isRerenderingMermaid = false;

            // Simple rerender function
            function simpleRerenderMermaid() {
                // Clear previous timer
                if (mermaidRerenderTimeout) {
                    clearTimeout(mermaidRerenderTimeout);
                }

                // Skip if currently rerendering
                if (isRerenderingMermaid) {
                    return;
                }

                mermaidRerenderTimeout = setTimeout(() => {
                    if (isRerenderingMermaid) return;

                    isRerenderingMermaid = true;
                    try {
                        console.log('Starting simple rerender');

                        // Reinitialize Mermaid
                        initializeMermaid();

                        // Find all Mermaid elements and rerender
                        const mermaidElements = document.querySelectorAll('.mermaid');
                        mermaidElements.forEach((element, index) => {
                            try {
                                // Get original content
                                let originalContent = element.getAttribute('data-original-content');
                                if (!originalContent) {
                                    // If original content was not saved, try to extract it from current content
                                    const currentText = element.textContent.trim();
                                    if (currentText && !currentText.includes('<svg') && !currentText.includes('#mermaid-')) {
                                        originalContent = currentText;
                                        element.setAttribute('data-original-content', originalContent);
                                    }
                                }

                                if (originalContent) {
                                    // Clean element
                                    element.innerHTML = '';
                                    element.textContent = originalContent;
                                    element.removeAttribute('data-processed');
                                    element.removeAttribute('data-enhanced');

                                    // Remove control buttons
                                    const controls = element.querySelector('.mermaid-controls');
                                    if (controls) {
                                        controls.remove();
                                    }

                                    console.log(`Preparing to rerender diagram ${index}:`, originalContent.substring(0, 50));
                                }
                            } catch (error) {
                                console.warn(`Cleaning diagram ${index} failed:`, error);
                            }
                        });

                        // Wait briefly, then rerender
                        setTimeout(() => {
                            try {
                                mermaid.run(undefined, '.mermaid');
                                console.log('Mermaid rerender complete');

                                // Enhance again
                                setTimeout(() => {
                                    enhanceMermaidDiagrams();
                                }, 300);
                            } catch (error) {
                                console.error('Mermaid rerender failed:', error);
                            } finally {
                                isRerenderingMermaid = false;
                            }
                        }, 200);

                    } catch (error) {
                        console.error('Simple rerender failed:', error);
                        isRerenderingMermaid = false;
                    }
                }, 150);
            }

            // Debounced rerender function (kept for backward compatibility)
            const debouncedRerenderMermaid = simpleRerenderMermaid;

            // Global error handling
            window.addEventListener('unhandledrejection', function(event) {
                if (event.reason && event.reason.toString().includes('mermaid')) {
                    console.warn('Caught Mermaid-related unhandled Promise error:', event.reason);
                    event.preventDefault(); // Prevent error from appearing in the console
                }
            });

            // Initialize Mermaid
            initializeMermaid();

            // Document tree data
            let treeData = {{ tree_json|safe }};
            let treeDataSnapshot = JSON.stringify(treeData);
            let currentFile = null;
            const currentFileStorageKey = 'litho-book-current-file';
            let allFiles = [];
            let originalTreeData = null;

            // Search-related variables
            let searchMode = 'content'; // 'content' or 'filename'
            let searchTimeout = null;
            let isSearching = false;

            // Collect all files for search
            function collectFiles(node, path = '') {
                const currentPath = path ? `${path}/${node.name}` : node.name;

                if (node.is_file) {
                    allFiles.push({
                        name: node.name,
                        path: node.path,
                        fullPath: currentPath
                    });
                }

                if (node.children) {
                    node.children.forEach(child => collectFiles(child, currentPath));
                }
            }

            // Handle search input
            function handleSearchInput() {
                const query = document.getElementById('searchInput').value.trim();
                const clearBtn = document.getElementById('searchClearBtn');
                const modeToggle = document.getElementById('searchModeToggle');

                // Show/hide clear button
                if (query) {
                    clearBtn.classList.add('show');
                    modeToggle.style.display = 'flex';
                } else {
                    clearBtn.classList.remove('show');
                    modeToggle.style.display = 'none';
                }

                // Debounced search
                if (searchTimeout) {
                    clearTimeout(searchTimeout);
                }

                searchTimeout = setTimeout(() => {
                    if (query) {
                        performSearch(query);
                    } else {
                        clearSearch();
                    }
                }, 300);
            }

            // Run search
            async function performSearch(query) {
                if (isSearching) return;

                isSearching = true;
                const treeContainer = document.getElementById('tree-container');

                if (searchMode === 'filename') {
                    // File-name search (legacy logic)
                    searchFiles();
                    isSearching = false;
                    return;
                }

                // Show loading state
                treeContainer.innerHTML = `
                    <div class="search-loading">
                        <div class="search-loading-spinner"></div>
                        <p>Searching...</p>
                    </div>
                `;

                try {
                    const response = await fetch(`/api/search?q=${encodeURIComponent(query)}`);
                    if (!response.ok) {
                        throw new Error(`Search failed: ${response.status}`);
                    }

                    const data = await response.json();
                    displaySearchResults(data);
                } catch (error) {
                    console.error('Search error:', error);
                    treeContainer.innerHTML = `
                        <div class="search-empty">
                            <div class="search-empty-icon">⚠️</div>
                            <p>Search failed</p>
                            <p style="font-size: 0.8rem; margin-top: 0.5rem;">${error.message}</p>
                        </div>
                    `;
                } finally {
                    isSearching = false;
                }
            }

            // Display search results
            function displaySearchResults(data) {
                const treeContainer = document.getElementById('tree-container');

                if (data.total === 0) {
                    treeContainer.innerHTML = `
                        <div class="search-empty">
                            <div class="search-empty-icon">🔍</div>
                            <p>No matching content found</p>
                            <p style="font-size: 0.8rem; margin-top: 0.5rem;">Try different keywords</p>
                        </div>
                    `;
                    return;
                }

                let html = `
                    <div class="search-stats">
                        <span>Found ${data.total} results</span>
                        <span>Query: "${data.query}"</span>
                    </div>
                    <div class="search-results">
                `;

                data.results.forEach(result => {
                    const title = result.title || result.file_name;
                    const score = Math.round(result.relevance_score * 10) / 10;

                    html += `
                        <div class="search-result-item" onclick="loadFile('${result.file_path}')">
                            <div class="search-result-header">
                                <div class="search-result-title">
                                    <span class="file-icon"></span>
                                    <span>${title}</span>
                                </div>
                                <div class="search-result-score">${score}</div>
                            </div>
                            <div class="search-result-matches">
                    `;

                    // Limit number of displayed matches
                    const maxMatches = 3;
                    const matches = result.matches.slice(0, maxMatches);

                    matches.forEach(match => {
                        html += `
                            <div class="search-match">
                                <div class="search-match-line">Line ${match.line_number} </div>
                                <div class="search-match-content">${match.highlighted_content}</div>
                        `;

                        if (match.context_before || match.context_after) {
                            html += '<div class="search-match-context">';
                            if (match.context_before) {
                                html += `<div>... ${match.context_before}</div>`;
                            }
                            if (match.context_after) {
                                html += `<div>${match.context_after} ...</div>`;
                            }
                            html += '</div>';
                        }

                        html += '</div>';
                    });

                    if (result.matches.length > maxMatches) {
                        html += `
                            <div class="search-match" style="text-align: center; color: var(--text-secondary); font-style: italic;">
                                 ${result.matches.length - maxMatches} more matches...
                            </div>
                        `;
                    }

                    html += `
                            </div>
                        </div>
                    `;
                });

                html += '</div>';
                treeContainer.innerHTML = html;
            }

            async function refreshDocumentTreeFromServer() {
                try {
                    const response = await fetch('/api/tree');
                    if (!response.ok) {
                        throw new Error(`HTTP ${response.status}: ${response.statusText}`);
                    }

                    const nextTreeData = await response.json();
                    const nextSnapshot = JSON.stringify(nextTreeData);
                    if (nextSnapshot === treeDataSnapshot) {
                        return;
                    }

                    treeData = nextTreeData;
                    treeDataSnapshot = nextSnapshot;
                    originalTreeData = nextTreeData;
                    allFiles = [];
                    collectFiles(treeData);

                    const treeContainer = document.getElementById('tree-container');
                    const query = document.getElementById('searchInput')?.value.trim();
                    if (query) {
                        performSearch(query);
                    } else {
                        treeContainer.innerHTML = '';
                        renderTreeChildren(treeData, treeContainer);
                    }

                    if (currentFile) {
                        await loadFile(currentFile, {
                            updateHistory: false,
                            forceReload: true,
                        });
                    }
                } catch (error) {
                    console.warn('Failed to refresh document tree:', error);
                }
            }

            // Set search mode
            function setSearchMode(mode) {
                searchMode = mode;

                // Update button state
                document.querySelectorAll('.search-mode-btn').forEach(btn => {
                    btn.classList.remove('active');
                    if (btn.dataset.mode === mode) {
                        btn.classList.add('active');
                    }
                });

                // Update search input placeholder
                const searchInput = document.getElementById('searchInput');
                if (mode === 'content') {
                    searchInput.placeholder = 'Search document content...';
                } else {
                    searchInput.placeholder = 'Search file names...';
                }

                // Rerun search if query exists
                const query = searchInput.value.trim();
                if (query) {
                    performSearch(query);
                }
            }

            // Clear search
            function clearSearch() {
                const searchInput = document.getElementById('searchInput');
                const clearBtn = document.getElementById('searchClearBtn');
                const modeToggle = document.getElementById('searchModeToggle');
                const treeContainer = document.getElementById('tree-container');

                searchInput.value = '';
                clearBtn.classList.remove('show');
                modeToggle.style.display = 'none';

                // Restore original document tree
                treeContainer.innerHTML = '';
                if (originalTreeData) {
                    renderTreeChildren(originalTreeData, treeContainer);
                }
            }

            // Legacy file-name search function (kept for compatibility)
            function searchFiles() {
                const query = document.getElementById('searchInput').value.toLowerCase().trim();
                const treeContainer = document.getElementById('tree-container');

                if (!query) {
                    // When search is cleared, rerender original tree
                    treeContainer.innerHTML = '';
                    if (originalTreeData) {
                        renderTreeChildren(originalTreeData, treeContainer);
                    }
                    return;
                }

                const filteredFiles = allFiles.filter(file =>
                    file.name.toLowerCase().includes(query) ||
                    file.fullPath.toLowerCase().includes(query)
                ).sort((a, b) => {
                    // Use smart sorting for search results too
                    const getNumberPrefix = (name) => {
                        const match = name.match(/^(\d+)[^\d]/);
                        return match ? parseInt(match[1], 10) : null;
                    };

                    const aNumber = getNumberPrefix(a.name);
                    const bNumber = getNumberPrefix(b.name);

                    if (aNumber !== null && bNumber !== null) {
                        if (aNumber !== bNumber) {
                            return aNumber - bNumber;
                        }
                        return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
                    }

                    if (aNumber !== null && bNumber === null) return -1;
                    if (aNumber === null && bNumber !== null) return 1;

                    return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
                });

                treeContainer.innerHTML = '';

                if (filteredFiles.length === 0) {
                    treeContainer.innerHTML = `
                        <div class="search-empty">
                            <div class="search-empty-icon">📁</div>
                            <p>No matching files found</p>
                        </div>
                    `;
                    return;
                }

                filteredFiles.forEach(file => {
                    const nodeDiv = document.createElement('div');
                    nodeDiv.className = 'tree-node';

                    const itemDiv = document.createElement('div');
                    itemDiv.className = 'tree-item file';

                    const iconSpan = document.createElement('span');
                    iconSpan.className = 'tree-icon file-icon';

                    const nameSpan = document.createElement('span');
                    nameSpan.textContent = file.name;
                    nameSpan.title = file.fullPath;

                    itemDiv.addEventListener('click', () => loadFile(file.path));

                    itemDiv.appendChild(iconSpan);
                    itemDiv.appendChild(nameSpan);
                    nodeDiv.appendChild(itemDiv);
                    treeContainer.appendChild(nodeDiv);
                });
            }

            // Smart file-name sorting (sort by name regardless of folder/file)
            function smartSort(a, b) {
                // Regex for extracting numeric prefix
                const getNumberPrefix = (name) => {
                    const match = name.match(/^(\d+)[^\d]/);
                    return match ? parseInt(match[1], 10) : null;
                };

                const aNumber = getNumberPrefix(a.name);
                const bNumber = getNumberPrefix(b.name);

                // If both have numeric prefixes, sort numerically
                if (aNumber !== null && bNumber !== null) {
                    if (aNumber !== bNumber) {
                        return aNumber - bNumber;
                    }
                    // If numbers are equal, sort by string
                    return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
                }

                // If only one has a numeric prefix, it comes first
                if (aNumber !== null && bNumber === null) return -1;
                if (aNumber === null && bNumber !== null) return 1;

                // If neither has a numeric prefix, sort alphabetically
                return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
            }

            // Render document tree children (excluding root)
            function renderTreeChildren(node, container) {
                if (node.children && node.children.length > 0) {
                    // Sort children with smart sort
                    const sortedChildren = [...node.children].sort(smartSort);

                    sortedChildren.forEach(child => {
                        renderTree(child, container, 0);
                    });
                }
            }

            // Render document tree
            function renderTree(node, container, level = 0) {
                const nodeDiv = document.createElement('div');
                nodeDiv.className = 'tree-node';

                const itemDiv = document.createElement('div');
                itemDiv.className = 'tree-item';

                const iconSpan = document.createElement('span');
                iconSpan.className = 'tree-icon';

                const nameSpan = document.createElement('span');
                nameSpan.textContent = node.name;

                if (node.is_file) {
                    iconSpan.className += ' file-icon';
                    itemDiv.className += ' file';
                    itemDiv.dataset.path = node.path;
                    itemDiv.addEventListener('click', () => loadFile(node.path));
                } else {
                    iconSpan.className += ' folder-icon';
                    itemDiv.addEventListener('click', () => toggleFolder(nodeDiv, iconSpan));
                }

                itemDiv.appendChild(iconSpan);
                itemDiv.appendChild(nameSpan);
                nodeDiv.appendChild(itemDiv);

                if (!node.is_file && node.children && node.children.length > 0) {
                    const childrenDiv = document.createElement('div');
                    // Collapse all folders by default
                    childrenDiv.className = 'tree-children collapsed';

                    // Sort children with smart sort
                    const sortedChildren = [...node.children].sort(smartSort);

                    sortedChildren.forEach(child => {
                        renderTree(child, childrenDiv, level + 1);
                    });

                    nodeDiv.appendChild(childrenDiv);
                }

                container.appendChild(nodeDiv);
            }

            // Toggle folder expanded/collapsed
            function toggleFolder(nodeDiv, iconSpan) {
                const childrenDiv = nodeDiv.querySelector('.tree-children');
                if (childrenDiv) {
                    childrenDiv.classList.toggle('collapsed');
                    iconSpan.classList.toggle('open');
                }
            }

            function selectedFileFromUrl() {
                return new URLSearchParams(window.location.search).get('file');
            }

            function updateSelectedFileLocation(filePath, replace = false) {
                const url = new URL(window.location.href);
                if (url.searchParams.get('file') === filePath) {
                    return;
                }

                url.searchParams.set('file', filePath);
                const state = { file: filePath };
                if (replace) {
                    window.history.replaceState(state, '', url);
                } else {
                    window.history.pushState(state, '', url);
                }
            }

            function revealActiveTreeItem(activeItem) {
                if (!activeItem) return;

                let parent = activeItem.closest('.tree-children');
                while (parent) {
                    parent.classList.remove('collapsed');

                    const parentNode = parent.parentElement;
                    const parentItem = parentNode?.firstElementChild;
                    const parentIcon = parentItem?.querySelector('.tree-icon.folder-icon');
                    if (parentIcon) {
                        parentIcon.classList.add('open');
                    }

                    parent = parentNode?.closest('.tree-children');
                }

                activeItem.scrollIntoView({ block: 'nearest' });
            }

            // Toggle sidebar
            function toggleSidebar() {
                const sidebar = document.getElementById('sidebar');
                if (window.innerWidth <= 768) {
                    sidebar.classList.toggle('show');
                } else {
                    sidebar.classList.toggle('collapsed');
                }
            }

            // Update breadcrumb navigation
            function updateBreadcrumb(filePath) {
                const breadcrumb = document.getElementById('breadcrumb');
                if (!filePath) {
                    breadcrumb.innerHTML = '';
                    return;
                }

                const parts = filePath.split('/');
                const breadcrumbHtml = parts.map((part, index) => {
                    if (index === parts.length - 1) {
                        return `<span style="color: var(--accent-color); font-weight: 600;">${part}</span>`;
                    }
                    return `<span style="color: var(--text-secondary);">${part}</span>`;
                }).join(' <span style="color: var(--text-secondary);">></span> ');

                breadcrumb.innerHTML = breadcrumbHtml;
            }

            // Load file content
            async function loadFile(filePath, options = {}) {
                if (currentFile === filePath && !options.forceReload) return;
                const updateHistory = options.updateHistory !== false;
                const replaceHistory = options.replaceHistory === true;
                const throwOnError = options.throwOnError === true;

                const contentContainer = document.getElementById('content-container');
                contentContainer.innerHTML = `
                    <div class="loading">
                        <div class="loading-spinner"></div>
                        <p>Loading document...</p>
                    </div>
                `;

                try {
                    const response = await fetch(`/api/file?file=${encodeURIComponent(filePath)}`);
                    if (!response.ok) {
                        throw new Error(`HTTP ${response.status}: ${response.statusText}`);
                    }

                    const data = await response.json();

                    // Update current selection state
                    document.querySelectorAll('.tree-item').forEach(item => {
                        item.classList.remove('active');
                    });

                    const activeItem = Array.from(document.querySelectorAll('.tree-item'))
                        .find(item => item.dataset.path === filePath);
                    if (activeItem) {
                        activeItem.classList.add('active');
                        revealActiveTreeItem(activeItem);
                    }

                    currentFile = filePath;
                    localStorage.setItem(currentFileStorageKey, filePath);
                    if (updateHistory) {
                        updateSelectedFileLocation(filePath, replaceHistory);
                    }
                    updateBreadcrumb(filePath);

                    // Render Markdown content
                    contentContainer.innerHTML = `<div class="markdown-content">${data.html}</div>`;

                    // Render Mermaid diagrams
                    const mermaidElements = contentContainer.querySelectorAll('code.language-mermaid, pre code.language-mermaid');

                    // Handle each Mermaid element separately so one error does not affect all renders
                    for (let i = 0; i < mermaidElements.length; i++) {
                        const element = mermaidElements[i];
                        const mermaidCode = element.textContent;
                        const mermaidId = `mermaid-${Date.now()}-${i}`;

                        const mermaidDiv = document.createElement('div');
                        mermaidDiv.className = 'mermaid';
                        mermaidDiv.id = mermaidId;
                        mermaidDiv.textContent = mermaidCode;

                        // Replace original element
                        const parentElement = element.closest('pre') || element;
                        parentElement.replaceWith(mermaidDiv);

                        // Try to render a single Mermaid diagram
                        try {
                            await mermaid.run(undefined, `#${mermaidId}`);
                        } catch (error) {
                            console.warn(`Mermaid diagram render failed (${mermaidId}):`, error);

                            // Create error display container
                            const errorContainer = document.createElement('div');
                            errorContainer.style.cssText = `
                                border: 2px dashed var(--border-color);
                                border-radius: 8px;
                                padding: 1rem;
                                margin: 1rem 0;
                                background: var(--bg-secondary);
                                position: relative;
                            `;

                            // Add error title
                            const errorTitle = document.createElement('div');
                            errorTitle.style.cssText = `
                                color: #dc3545;
                                font-weight: 600;
                                font-size: 0.9rem;
                                margin-bottom: 0.5rem;
                                display: flex;
                                align-items: center;
                                gap: 0.5rem;
                            `;
                            errorTitle.innerHTML = `
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                                    <line x1="12" y1="9" x2="12" y2="13"></line>
                                    <line x1="12" y1="17" x2="12.01" y2="17"></line>
                                </svg>
                                Mermaid diagram render failed
                            `;

                            // Add original code display
                            const codeBlock = document.createElement('pre');
                            codeBlock.style.cssText = `
                                background: var(--pre-bg);
                                padding: 1rem;
                                border-radius: 6px;
                                margin: 0;
                                border: 1px solid var(--border-color);
                                font-family: 'SF Mono', 'Monaco', 'Inconsolata', monospace;
                                font-size: 0.9em;
                                color: var(--text-primary);
                                overflow-x: auto;
                                white-space: pre-wrap;
                                word-wrap: break-word;
                            `;

                            const code = document.createElement('code');
                            code.textContent = mermaidCode;
                            codeBlock.appendChild(code);

                            // Add optional error details
                            const errorDetails = document.createElement('details');
                            errorDetails.style.cssText = `
                                margin-top: 0.5rem;
                                color: var(--text-secondary);
                                font-size: 0.85rem;
                            `;

                            const errorSummary = document.createElement('summary');
                            errorSummary.style.cssText = `
                                cursor: pointer;
                                color: #dc3545;
                                font-weight: 500;
                            `;
                            errorSummary.textContent = 'View error details';

                            const errorMessage = document.createElement('pre');
                            errorMessage.style.cssText = `
                                margin-top: 0.5rem;
                                padding: 0.5rem;
                                background: var(--bg-tertiary);
                                border-radius: 4px;
                                font-size: 0.8rem;
                                white-space: pre-wrap;
                                word-wrap: break-word;
                            `;
                            errorMessage.textContent = error.message || error.toString();

                            errorDetails.appendChild(errorSummary);
                            errorDetails.appendChild(errorMessage);

                            // Assemble error container
                            errorContainer.appendChild(errorTitle);
                            errorContainer.appendChild(codeBlock);
                            errorContainer.appendChild(errorDetails);

                            // Replace failed Mermaid element
                            mermaidDiv.replaceWith(errorContainer);
                        }
                    }

                    // Add "copy" buttons to code blocks and inline code
                    addCodeCopyButtons(contentContainer);

                    // Generate document table of contents
                    setTimeout(() => {
                        TableOfContents.generate();
                    }, 100);

                    // Scroll to top
                    contentContainer.scrollTop = 0;

                    // Automatically hide sidebar on mobile
                    if (window.innerWidth <= 768) {
                        document.getElementById('sidebar').classList.remove('show');
                    }

                    // Update AI assistant context tags
                    updateContextOnFileChange(filePath);

                } catch (error) {
                    if (throwOnError) {
                        throw error;
                    } else {
                        contentContainer.innerHTML = `
                            <div class="error">
                                <h3>📋 Load failed</h3>
                                <p><strong>File:</strong> ${filePath}</p>
                                <p><strong>Error:</strong> ${error.message}</p>
                            </div>
                        `;
                    }
                }
            }

            // ---- Code copy buttons ---------------------------------------

            // Icon shared by the block and inline copy buttons.
            const CODE_COPY_ICON = '<svg viewBox="0 0 16 16" width="1em" height="1em" fill="none" stroke="currentColor" stroke-width="1.4" aria-hidden="true"><rect x="5.5" y="5.5" width="8" height="9" rx="1.5"/><path d="M11 5.5V3.5A1.5 1.5 0 0 0 9.5 2h-6A1.5 1.5 0 0 0 2 3.5v7A1.5 1.5 0 0 0 3.5 12h2"/></svg>';

            // Injects the styles for the copy buttons once. Kept in JS (rather
            // than the template <style>) so the whole feature is self-contained.
            function ensureCodeCopyStyles() {
                if (document.getElementById('code-copy-styles')) return;
                const style = document.createElement('style');
                style.id = 'code-copy-styles';
                style.textContent = `
                    .markdown-content pre { position: relative; }
                    /* Non-scrolling wrapper so the copy button stays pinned to the
                       corner even when the <pre> scrolls horizontally. */
                    .code-block-wrapper { position: relative; }
                    .code-copy-btn {
                        position: absolute;
                        top: 0.4rem;
                        right: 0.4rem;
                        display: inline-flex;
                        align-items: center;
                        gap: 0.3rem;
                        padding: 0.2rem 0.5rem;
                        font-size: 0.72rem;
                        line-height: 1.2;
                        color: var(--text-secondary, #57606a);
                        background: var(--bg-primary, #ffffff);
                        border: 1px solid var(--border-color, #d0d7de);
                        border-radius: 6px;
                        cursor: pointer;
                        opacity: 0;
                        transition: opacity 0.12s ease, color 0.12s ease, border-color 0.12s ease;
                        z-index: 2;
                    }
                    .code-block-wrapper:hover .code-copy-btn,
                    .code-copy-btn:focus-visible { opacity: 1; }
                    .code-copy-btn:hover { color: var(--text-primary, #24292f); }
                    .code-copy-btn.copied { color: #1a7f37; border-color: #1a7f37; }
                    .code-copy-btn svg { flex: 0 0 auto; }

                    /* Inline code: keep each snippet whole (never split across
                       lines) by wrapping it in an inline-block; a hover-reveal
                       copy button sits just past its right edge, positioned
                       purely with CSS (no JS tracking). */
                    .inline-code-wrapper {
                        position: relative;
                        display: inline-block;
                        white-space: nowrap;
                    }
                    .inline-code-wrapper > code { white-space: nowrap; }
                    .inline-code-copy-btn {
                        position: absolute;
                        top: 50%;
                        left: 100%;
                        transform: translateY(-50%);
                        margin-left: 4px;
                        display: inline-flex;
                        align-items: center;
                        justify-content: center;
                        width: 1.3rem;
                        height: 1.3rem;
                        padding: 0;
                        color: var(--text-secondary, #57606a);
                        background: var(--bg-primary, #ffffff);
                        border: 1px solid var(--border-color, #d0d7de);
                        border-radius: 5px;
                        cursor: pointer;
                        opacity: 0;
                        pointer-events: none;
                        /* Delay only the fade-out so the button lingers ~0.3s
                           after the cursor leaves instead of vanishing instantly. */
                        transition: opacity 0.12s ease 0.3s, color 0.12s ease;
                        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.15);
                        z-index: 2;
                    }
                    .inline-code-wrapper:hover .inline-code-copy-btn,
                    .inline-code-copy-btn:focus-visible { opacity: 1; pointer-events: auto; transition-delay: 0s; }
                    .inline-code-copy-btn:hover { color: var(--text-primary, #24292f); }
                    .inline-code-copy-btn.copied { color: #1a7f37; border-color: #1a7f37; }
                    .inline-code-copy-btn svg { width: 0.85em; height: 0.85em; }
                `;
                document.head.appendChild(style);
            }

            // Copies text to the clipboard, with a fallback for insecure
            // contexts / older browsers. Returns whether it succeeded.
            async function copyTextToClipboard(text) {
                try {
                    await navigator.clipboard.writeText(text);
                    return true;
                } catch (err) {
                    try {
                        const ta = document.createElement('textarea');
                        ta.value = text;
                        ta.style.position = 'fixed';
                        ta.style.opacity = '0';
                        document.body.appendChild(ta);
                        ta.select();
                        const ok = document.execCommand('copy');
                        document.body.removeChild(ta);
                        return ok;
                    } catch (fallbackErr) {
                        console.warn('Copy to clipboard failed:', fallbackErr);
                        return false;
                    }
                }
            }

            // Briefly show a "copied" state on a button.
            function flashCopied(btn, labelSpan) {
                btn.classList.add('copied');
                const previous = labelSpan ? labelSpan.textContent : null;
                if (labelSpan) labelSpan.textContent = 'Copied';
                setTimeout(() => {
                    btn.classList.remove('copied');
                    if (labelSpan && previous !== null) labelSpan.textContent = previous;
                }, 1200);
            }

            // Adds hover-reveal "copy" buttons to fenced code blocks (<pre>) and
            // inline code (<code>) inside the given container.
            function addCodeCopyButtons(container) {
                if (!container) return;
                ensureCodeCopyStyles();

                // Fenced code blocks: button pinned to the top-right corner of a
                // non-scrolling wrapper (so it doesn't move when the <pre> scrolls
                // horizontally).
                container.querySelectorAll('pre').forEach(pre => {
                    if (pre.dataset.copyEnhanced) return;
                    pre.dataset.copyEnhanced = '1';
                    const codeEl = pre.querySelector('code') || pre;

                    const parent = pre.parentNode;
                    let wrapper = pre.parentElement;
                    if (!wrapper || !wrapper.classList.contains('code-block-wrapper')) {
                        wrapper = document.createElement('div');
                        wrapper.className = 'code-block-wrapper';
                        if (parent) {
                            parent.insertBefore(wrapper, pre);
                            wrapper.appendChild(pre);
                        }
                    }

                    const btn = document.createElement('button');
                    btn.type = 'button';
                    btn.className = 'code-copy-btn';
                    btn.setAttribute('aria-label', 'Copy code to clipboard');
                    btn.innerHTML = CODE_COPY_ICON;
                    const label = document.createElement('span');
                    label.textContent = 'Copy';
                    btn.appendChild(label);

                    btn.addEventListener('click', async (e) => {
                        e.preventDefault();
                        e.stopPropagation();
                        const ok = await copyTextToClipboard(codeEl.textContent);
                        if (ok) flashCopied(btn, label);
                    });
                    wrapper.appendChild(btn);
                });

                // Inline code (<code> outside <pre>): wrap each snippet in an
                // inline-block so it stays whole, and add a copy button that the
                // CSS reveals on hover at the wrapper's right edge. No mouse/scroll
                // tracking -- the button is anchored to the snippet itself.
                container.querySelectorAll('code').forEach(code => {
                    if (code.closest('pre')) return;
                    if (code.dataset.inlineCopy) return;
                    const parent = code.parentNode;
                    if (!parent) return;
                    if (parent.classList && parent.classList.contains('inline-code-wrapper')) return;
                    code.dataset.inlineCopy = '1';

                    const wrap = document.createElement('span');
                    wrap.className = 'inline-code-wrapper';
                    parent.insertBefore(wrap, code);
                    wrap.appendChild(code);

                    const btn = document.createElement('button');
                    btn.type = 'button';
                    btn.className = 'inline-code-copy-btn';
                    btn.setAttribute('aria-label', 'Copy code to clipboard');
                    btn.innerHTML = CODE_COPY_ICON;
                    btn.addEventListener('click', async (e) => {
                        e.preventDefault();
                        e.stopPropagation();
                        const ok = await copyTextToClipboard(code.textContent);
                        if (ok) flashCopied(btn, null);
                    });
                    wrap.appendChild(btn);
                });
            }

            // Update AI assistant context when file changes
            function updateContextOnFileChange(filePath) {
                // Get current file name
                const currentFileName = filePath ? filePath.split('/').pop() : null;

                if (!currentFileName) return;

                // Check whether current file is already selected
                const isAlreadySelected = selectedContextFiles.some(file => file.path === filePath);

                // Add current file if it is not selected
                if (!isAlreadySelected) {
                    selectedContextFiles.push({
                        name: currentFileName,
                        path: filePath
                    });
                }

                // Update context tag display
                updateContextTags();
            }

            // Update context tag display
            function updateContextTags() {
                const tagsContainer = document.getElementById('contextTagsContainer');
                if (!tagsContainer) return;

                // Clear existing tags
                tagsContainer.innerHTML = '';

                // Get current file name
                const currentFileName = currentFile ? currentFile.split('/').pop() : null;

                // Create a tag for each selected file
                selectedContextFiles.forEach((file, index) => {
                    const tag = document.createElement('div');
                    tag.style.cssText = `
                        display: inline-flex;
                        align-items: center;
                        background: var(--accent-color);
                        color: white;
                        border-radius: 12px;
                        padding: 0.25rem 0.75rem;
                        margin-right: 0.5rem;
                        margin-bottom: 0.5rem;
                        font-size: 0.85rem;
                    `;

                    const nameSpan = document.createElement('span');
                    nameSpan.textContent = file.name;
                    nameSpan.style.cssText = `
                        margin-right: 0.5rem;
                        max-width: 150px;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                    `;

                    // If this is the current file, do not show remove button
                    if (currentFileName && file.name === currentFileName) {
                        tag.style.background = 'var(--text-secondary)'; // Different color indicates it cannot be removed
                        tag.appendChild(nameSpan);
                    } else {
                        // Show remove button for other files
                        const removeBtn = document.createElement('button');
                        removeBtn.innerHTML = '&times;';
                        removeBtn.style.cssText = `
                            background: none;
                            border: none;
                            color: white;
                            cursor: pointer;
                            font-size: 1.2rem;
                            line-height: 1;
                            padding: 0;
                            width: 16px;
                            height: 16px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                        `;

                        removeBtn.onclick = () => {
                            // Remove from selected list
                            selectedContextFiles = selectedContextFiles.filter(f => f.path !== file.path);
                            // Update tag display
                            updateContextTags();
                            // Update checkbox state in document selector if open
                            const checkbox = document.querySelector(`input[type="checkbox"][data-path="${file.path}"]`);
                            if (checkbox) {
                                checkbox.checked = false;
                            }
                        };

                        tag.appendChild(nameSpan);
                        tag.appendChild(removeBtn);
                    }

                    tagsContainer.appendChild(tag);
                });
            }

            // Initialize default context
            function initializeDefaultContext() {
                // Add the architecture overview document by default.
                selectedContextFiles = [{
                    name: '2-architecture-overview.md',
                    path: '2-architecture-overview.md'
                }];

                // Also add current file to context if present
                if (currentFile) {
                    const currentFileName = currentFile.split('/').pop();
                    // Check whether it has already been added
                    const isAlreadyAdded = selectedContextFiles.some(file => file.name === currentFileName);
                    if (!isAlreadyAdded) {
                        selectedContextFiles.push({
                            name: currentFileName,
                            path: currentFile
                        });
                    }
                }

                // Update context tag display
                updateContextTags();
            }

            // Responsive handling
            window.addEventListener('resize', () => {
                const sidebar = document.getElementById('sidebar');
                if (window.innerWidth > 768) {
                    sidebar.classList.remove('show');
                }
            });

            // Initialize page
            document.addEventListener('DOMContentLoaded', () => {
                // Load settings
                Settings.load();

                // Theme selection event
                document.querySelectorAll('.theme-option').forEach(option => {
                    option.addEventListener('click', () => {
                        Settings.setTheme(option.dataset.theme);
                    });
                });

                // Font selection event
                const fontSelect = document.getElementById('fontSelect');
                if (fontSelect) {
                    fontSelect.addEventListener('change', (e) => {
                        Settings.setFont(e.target.value);
                    });
                }

                // Click overlay to close settings panel
                document.getElementById('settingsOverlay').addEventListener('click', (e) => {
                    if (e.target === e.currentTarget) {
                        closeSettings();
                    }
                });

                // ESC closes settings panel
                document.addEventListener('keydown', (e) => {
                    if (e.key === 'Escape') {
                        closeSettings();
                    }
                });

                // Set document path
                const docsPath = '{{ docs_path }}';
                document.getElementById('docs-path').textContent = docsPath;

                // Save original tree data
                originalTreeData = treeData;

                // Collect all files for search
                collectFiles(treeData);

                // Render document tree (excluding root)
                const treeContainer = document.getElementById('tree-container');
                renderTreeChildren(treeData, treeContainer);

                // Initialize default document loading (with fallback strategy)
                initializeDefaultDocument();
                setInterval(refreshDocumentTreeFromServer, 2000);
            });

            window.addEventListener('popstate', () => {
                const requestedFile = selectedFileFromUrl();
                if (requestedFile) {
                    loadFile(requestedFile, { updateHistory: false });
                } else {
                    initializeDefaultDocument();
                }
            });

            // Initialize default document loading (with fallback strategy)
            async function initializeDefaultDocument() {
                const requestedFile = selectedFileFromUrl();
                if (requestedFile) {
                    try {
                        await loadFile(requestedFile, { updateHistory: false, throwOnError: true });
                        return;
                    } catch (error) {
                        console.warn(`Failed to restore document from URL: ${requestedFile}`, error);
                    }
                }

                const storedFile = localStorage.getItem(currentFileStorageKey);
                if (storedFile) {
                    try {
                        await loadFile(storedFile, { replaceHistory: true, throwOnError: true });
                        return;
                    } catch (error) {
                        console.warn(`Failed to restore previously selected document: ${storedFile}`, error);
                        localStorage.removeItem(currentFileStorageKey);
                    }
                }

                const defaultFiles = ['1-project-overview.md', '1.Overview.md', 'README.md', 'Overview.md'];

                for (const fileName of defaultFiles) {
                    try {
                        const response = await fetch(`/api/file?file=${encodeURIComponent(fileName)}`);
                        if (response.ok) {
                            // Found available file; loading it
                            await loadFile(fileName, { replaceHistory: true });
                            console.info(`Successfully loaded default document: ${fileName}`);
                            return;
                        }
                    } catch (error) {
                        console.warn(`Attempt to load ${fileName} failed:`, error);
                    }
                }

                // If all default files fail, show welcome message
                console.info('No default document file found; showing welcome screen');
                const contentContainer = document.getElementById('content-container');
                contentContainer.innerHTML = `
                    <div class="loading">
                        <div style="text-align: center; padding: 4rem 2rem; color: var(--text-secondary);">
                            <div style="font-size: 3rem; margin-bottom: 1rem;">📚</div>
                            <h2 style="color: var(--text-primary); margin-bottom: 1rem;">Welcome to Litho Book</h2>
                            <p style="margin-bottom: 1.5rem;">Select a document on the left to start reading</p>
                            <div style="background: var(--bg-secondary); padding: 1.5rem; border-radius: 8px; border: 1px solid var(--border-color); text-align: left; max-width: 500px; margin: 0 auto;">
                                <h4 style="color: var(--text-primary); margin-bottom: 1rem;">💡 Tips</h4>
                                <ul style="color: var(--text-secondary); line-height: 1.6; margin: 0; padding-left: 1.5rem;">
                                    <li>Supports full Markdown syntax rendering</li>
                                    <li>Automatically renders Mermaid diagrams and flowcharts</li>
                                    <li>Provides real-time search and smart navigation</li>
                                    <li>Responsive design supports access from multiple devices</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                `;

                // Initialize AI assistant default context
                setTimeout(() => {
                    initializeDefaultContext();
                }, 100);
            }

            // Mermaid diagram enhancements
            function enhanceMermaidDiagrams() {
                document.querySelectorAll('.mermaid').forEach(mermaidElement => {
                    // Check whether it has been rendered as SVG
                    const svg = mermaidElement.querySelector('svg');
                    if (!svg) {
                        console.log('Skipping unrendered Mermaid element:', mermaidElement);
                        return;
                    }

                    // Avoid duplicate enhancement (allow re-enhancement after theme switch)
                    if (mermaidElement.dataset.enhanced && !mermaidElement.dataset.needsReenhancement) return;
                    mermaidElement.dataset.enhanced = 'true';
                    mermaidElement.dataset.needsReenhancement = 'false';

                    console.log('Enhancing Mermaid diagram:', mermaidElement);

                    // Ensure Mermaid element has relative positioning
                    mermaidElement.style.position = 'relative';
                    mermaidElement.style.cursor = 'pointer';
                    mermaidElement.style.transition = 'all 0.2s ease';

                    // Add hover effect
                    mermaidElement.addEventListener('mouseenter', () => {
                        mermaidElement.style.boxShadow = '0 4px 16px rgba(0, 0, 0, 0.1)';
                        mermaidElement.style.transform = 'translateY(-2px)';
                    });

                    mermaidElement.addEventListener('mouseleave', () => {
                        mermaidElement.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.1)';
                        mermaidElement.style.transform = 'translateY(0)';
                    });

                    // Add click preview behavior
                    mermaidElement.addEventListener('click', () => {
                        openMermaidPreview(mermaidElement);
                    });

                    // Create control button container
                    const controlsContainer = document.createElement('div');
                    controlsContainer.className = 'mermaid-controls';
                    controlsContainer.style.cssText = `
                        position: absolute;
                        top: 0.5rem;
                        right: 0.5rem;
                        display: flex;
                        gap: 0.25rem;
                        opacity: 0;
                        transition: opacity 0.2s ease;
                        z-index: 10;
                    `;

                    // Download button
                    const downloadBtn = document.createElement('button');
                    downloadBtn.innerHTML = '⬇️';
                    downloadBtn.title = 'Download image';
                    downloadBtn.style.cssText = `
                        background: #007bff;
                        color: white;
                        border: none;
                        border-radius: 4px;
                        padding: 0.25rem;
                        cursor: pointer;
                        width: 28px;
                        height: 28px;
                        font-size: 12px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                        transition: all 0.2s ease;
                    `;

                    downloadBtn.addEventListener('mouseenter', () => {
                        downloadBtn.style.background = '#0056b3';
                        downloadBtn.style.transform = 'scale(1.1)';
                    });

                    downloadBtn.addEventListener('mouseleave', () => {
                        downloadBtn.style.background = '#007bff';
                        downloadBtn.style.transform = 'scale(1)';
                    });

                    downloadBtn.addEventListener('click', (e) => {
                        e.stopPropagation();
                        downloadMermaidImage(mermaidElement);
                    });

                    // Copy button
                    const copyBtn = document.createElement('button');
                    copyBtn.innerHTML = '📋';
                    copyBtn.title = 'Copy image';
                    copyBtn.style.cssText = `
                        background: #28a745;
                        color: white;
                        border: none;
                        border-radius: 4px;
                        padding: 0.25rem;
                        cursor: pointer;
                        width: 28px;
                        height: 28px;
                        font-size: 12px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                        transition: all 0.2s ease;
                    `;

                    copyBtn.addEventListener('mouseenter', () => {
                        copyBtn.style.background = '#1e7e34';
                        copyBtn.style.transform = 'scale(1.1)';
                    });

                    copyBtn.addEventListener('mouseleave', () => {
                        copyBtn.style.background = '#28a745';
                        copyBtn.style.transform = 'scale(1)';
                    });

                    copyBtn.addEventListener('click', (e) => {
                        e.stopPropagation();
                        copyMermaidImage(mermaidElement);
                    });

                    // Add buttons to container
                    controlsContainer.appendChild(downloadBtn);
                    controlsContainer.appendChild(copyBtn);
                    mermaidElement.appendChild(controlsContainer);

                    // Show/hide control buttons on hover
                    mermaidElement.addEventListener('mouseenter', () => {
                        controlsContainer.style.opacity = '1';
                    });

                    mermaidElement.addEventListener('mouseleave', () => {
                        controlsContainer.style.opacity = '0';
                    });
                });
            }

            // Global variables track current preview state
            let currentPreviewModal = null;
            let isPreviewOpen = false;
            let isPreviewOpening = false; // Prevent repeated clicks

            // Replace preview content (avoid recreating modal)
            function replacePreviewContent(mermaidElement) {
                if (!currentPreviewModal || !isPreviewOpen) return;

                const svg = mermaidElement.querySelector('svg');
                if (!svg) return;

                // Find current preview content container
                const contentContainer = currentPreviewModal.querySelector('.content');
                if (!contentContainer) return;

                // Reset zoom state
                window.currentZoom = 1;
                window.currentTranslate = { x: 0, y: 0 };

                // Remove old SVG and zoom info
                const oldSvg = contentContainer.querySelector('#previewSvg');
                const oldZoomInfo = contentContainer.querySelector('#zoomInfo');
                if (oldSvg) oldSvg.remove();
                if (oldZoomInfo) oldZoomInfo.remove();

                // Create new SVG content (reuse existing clone logic)
                const clonedSvg = createClonedSvg(svg);
                const zoomInfo = createZoomInfo();

                // Add new content
                contentContainer.appendChild(clonedSvg);
                contentContainer.appendChild(zoomInfo);

                // Reset event listeners
                setupSvgInteractions(clonedSvg);

                // Update zoom info display
                updateZoomInfo();
            }

            // Create cloned SVG (extracted as helper)
            function createClonedSvg(svg) {
                // Clone SVG and preserve exact styles
                const clonedSvg = svg.cloneNode(true);
                clonedSvg.id = 'previewSvg';

                // Deep-copy all style information
                function copyElementStyles(source, target) {
                    const sourceStyles = window.getComputedStyle(source);

                    // Copy all important style properties
                    const importantStyles = [
                        'color', 'backgroundColor', 'fill', 'stroke', 'strokeWidth',
                        'fontFamily', 'fontSize', 'fontWeight', 'fontStyle',
                        'textAnchor', 'dominantBaseline', 'opacity'
                    ];

                    importantStyles.forEach(prop => {
                        const value = sourceStyles.getPropertyValue(prop);
                        if (value && value !== 'initial' && value !== 'inherit') {
                            target.style.setProperty(prop, value);
                        }
                    });

                    // Process child elements recursively
                    for (let i = 0; i < source.children.length; i++) {
                        if (target.children[i]) {
                            copyElementStyles(source.children[i], target.children[i]);
                        }
                    }
                }

                // Apply copied styles
                copyElementStyles(svg, clonedSvg);

                // Set base styles for preview mode
                clonedSvg.style.cssText += `
                    max-width: 100%;
                    max-height: 100%;
                    width: auto;
                    height: auto;
                    transition: transform 0.2s ease;
                    cursor: grab;
                `;

                // Preserve all original SVG attributes
                const originalSvgRect = svg.getBoundingClientRect();
                const originalWidth = svg.getAttribute('width') || originalSvgRect.width;
                const originalHeight = svg.getAttribute('height') || originalSvgRect.height;

                // Preserve original dimensions and viewBox
                if (originalWidth && originalHeight) {
                    clonedSvg.setAttribute('width', originalWidth);
                    clonedSvg.setAttribute('height', originalHeight);
                }

                if (svg.getAttribute('viewBox')) {
                    clonedSvg.setAttribute('viewBox', svg.getAttribute('viewBox'));
                }

                // Copy all SVG attributes
                Array.from(svg.attributes).forEach(attr => {
                    if (attr.name !== 'id' && attr.name !== 'style') {
                        clonedSvg.setAttribute(attr.name, attr.value);
                    }
                });

                return clonedSvg;
            }

            // Create zoom info display (extracted as helper)
            function createZoomInfo() {
                const zoomInfo = document.createElement('div');
                zoomInfo.id = 'zoomInfo';
                zoomInfo.style.cssText = `
                    position: absolute;
                    bottom: 1rem;
                    left: 50%;
                    transform: translateX(-50%);
                    background: var(--bg-secondary);
                    color: var(--text-primary);
                    padding: 0.5rem 1rem;
                    border-radius: 6px;
                    font-size: 0.9rem;
                    font-weight: 500;
                    pointer-events: none;
                    border: 1px solid var(--border-color);
                    min-width: 60px;
                    text-align: center;
                    z-index: 10;
                `;
                return zoomInfo;
            }

            // Set SVG interaction events (extracted as helper)
            function setupSvgInteractions(clonedSvg) {
                let isDragging = false;
                let dragStart = { x: 0, y: 0 };

                // Add drag behavior
                clonedSvg.addEventListener('mousedown', (e) => {
                    isDragging = true;
                    dragStart = { x: e.clientX, y: e.clientY };
                    clonedSvg.style.cursor = 'grabbing';
                });

                document.addEventListener('mousemove', (e) => {
                    if (!isDragging) return;

                    const deltaX = e.clientX - dragStart.x;
                    const deltaY = e.clientY - dragStart.y;

                    window.currentTranslate.x += deltaX;
                    window.currentTranslate.y += deltaY;

                    window.updateSvgTransform();
                    dragStart = { x: e.clientX, y: e.clientY };
                });

                document.addEventListener('mouseup', () => {
                    isDragging = false;
                    clonedSvg.style.cursor = 'grab';
                });

                // Mouse-wheel zoom
                clonedSvg.addEventListener('wheel', (e) => {
                    e.preventDefault();
                    const delta = e.deltaY > 0 ? 0.9 : 1.1;
                    window.currentZoom *= delta;
                    window.currentZoom = Math.max(0.1, Math.min(5, window.currentZoom));
                    window.updateSvgTransform();
                });
            }

            // Global close preview function
            function closeAllMermaidPreviews() {
                // Close all possible preview modals
                const existingModals = document.querySelectorAll('[id^="mermaidPreviewModal"]');
                existingModals.forEach(modal => {
                    modal.style.opacity = '0';
                    setTimeout(() => {
                        if (document.body.contains(modal)) {
                            document.body.removeChild(modal);
                        }
                    }, 200);
                });

                // Reset global state
                currentPreviewModal = null;
                isPreviewOpen = false;
                isPreviewOpening = false;

                // Remove all keyboard event listeners
                document.removeEventListener('keydown', globalKeydownHandler);
            }

            // Global keyboard event handler
            function globalKeydownHandler(e) {
                if (e.key === 'Escape') {
                    closeAllMermaidPreviews();
                } else if (isPreviewOpen && currentPreviewModal) {
                    // Handle zoom shortcuts
                    const previewSvg = currentPreviewModal.querySelector('#previewSvg');
                    if (previewSvg && typeof window.updateSvgTransform === 'function') {
                        if (e.key === '+' || e.key === '=') {
                            e.preventDefault();
                            window.currentZoom *= 1.2;
                            window.updateSvgTransform();
                        } else if (e.key === '-') {
                            e.preventDefault();
                            window.currentZoom *= 0.8;
                            window.updateSvgTransform();
                        } else if (e.key === '0') {
                            e.preventDefault();
                            window.currentZoom = 1;
                            window.currentTranslate = { x: 0, y: 0 };
                            window.updateSvgTransform();
                        }
                    }
                }
            }

            // Open Mermaid preview modal
            function openMermaidPreview(mermaidElement) {
                const svg = mermaidElement.querySelector('svg');
                if (!svg) return;

                // Prevent repeated clicks
                if (isPreviewOpening) {
                    return;
                }

                // If preview is already open, check whether it is the same element
                if (isPreviewOpen && currentPreviewModal) {
                    // If clicked diagram is the same, return without action
                    const currentSvg = currentPreviewModal.querySelector('#previewSvg');
                    if (currentSvg) {
                        // Compare SVG outerHTML to determine whether it is the same diagram
                        const currentSvgHTML = currentSvg.outerHTML;
                        const newSvgHTML = svg.outerHTML;
                        if (currentSvgHTML === newSvgHTML) {
                            return;
                        }
                    }

                    // If it is a different diagram, replace content instead of recreating modal
                    replacePreviewContent(mermaidElement);
                    return;
                }

                // Set preview state
                isPreviewOpening = true;
                isPreviewOpen = true;

                // Create modal (with unique ID)
                const modal = document.createElement('div');
                const modalId = `mermaidPreviewModal_${Date.now()}`;
                modal.id = modalId;
                currentPreviewModal = modal;
                modal.style.cssText = `
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, 0.8);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    z-index: 9999;
                    opacity: 0;
                    transition: opacity 0.2s ease;
                `;

                // Create container
                const container = document.createElement('div');
                container.style.cssText = `
                    position: relative;
                    width: 95vw;
                    height: 95vh;
                    max-width: none;
                    max-height: none;
                    background: var(--bg-primary);
                    border-radius: 8px;
                    border: 1px solid var(--border-color);
                    overflow: hidden;
                    display: flex;
                    flex-direction: column;
                `;

                // Create header
                const header = document.createElement('div');
                header.style.cssText = `
                    padding: 1rem;
                    background: var(--bg-secondary);
                    border-bottom: 1px solid var(--border-color);
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    flex-shrink: 0;
                `;

                const title = document.createElement('div');
                title.textContent = 'Mermaid diagram preview';
                title.style.cssText = `
                    font-weight: 600;
                    color: var(--text-primary);
                    font-size: 1.1rem;
                `;

                // Create control button group
                const controls = document.createElement('div');
                controls.style.cssText = `
                    display: flex;
                    gap: 0.5rem;
                    align-items: center;
                `;

                // Zoom in button
                const zoomInBtn = createControlButton('+', 'Zoom in', () => {
                    window.currentZoom *= 1.2;
                    window.updateSvgTransform();
                });

                // Zoom out button
                const zoomOutBtn = createControlButton('-', 'Zoom out', () => {
                    window.currentZoom *= 0.8;
                    window.updateSvgTransform();
                });

                // Reset button
                const resetBtn = createControlButton('Reset', 'Reset zoom', () => {
                    window.currentZoom = 1;
                    window.currentTranslate = { x: 0, y: 0 };
                    window.updateSvgTransform();
                });

                // Close button
                const closeBtn = createControlButton('Close', 'Close preview', () => {
                    closeAllMermaidPreviews();
                }, '#dc3545');

                controls.appendChild(zoomOutBtn);
                controls.appendChild(zoomInBtn);
                controls.appendChild(resetBtn);
                controls.appendChild(closeBtn);

                header.appendChild(title);
                header.appendChild(controls);

                // Create content area
                const content = document.createElement('div');
                content.className = 'content'; // Add class name for later lookup
                content.style.cssText = `
                    padding: 2rem;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    flex: 1;
                    overflow: auto;
                    position: relative;
                    background: var(--bg-primary);
                    min-height: 0;
                `;

                // Ensure preview container inherits correct theme styles
                const currentTheme = document.documentElement.getAttribute('data-theme');
                if (currentTheme) {
                    container.setAttribute('data-theme', currentTheme);
                    modal.setAttribute('data-theme', currentTheme);
                }

                // Apply original SVG parent container styles to preview container
                const originalParent = svg.closest('.mermaid');
                if (originalParent) {
                    const parentStyles = window.getComputedStyle(originalParent);
                    content.style.backgroundColor = parentStyles.backgroundColor;
                    content.style.color = parentStyles.color;
                }

                // Reset zoom state
                window.currentZoom = 1;
                window.currentTranslate = { x: 0, y: 0 };

                // Update SVG transform function
                window.updateSvgTransform = function() {
                    const clonedSvg = currentPreviewModal?.querySelector('#previewSvg');
                    if (clonedSvg) {
                        clonedSvg.style.transform = `translate(${window.currentTranslate.x}px, ${window.currentTranslate.y}px) scale(${window.currentZoom})`;
                        const zoomInfo = currentPreviewModal?.querySelector('#zoomInfo');
                        if (zoomInfo) {
                            zoomInfo.textContent = `${Math.round(window.currentZoom * 100)}%`;
                        }
                    }
                };

                // Use extracted function to create SVG and zoom info
                const clonedSvg = createClonedSvg(svg);
                const zoomInfo = createZoomInfo();

                // Set SVG interaction
                setupSvgInteractions(clonedSvg);

                // Update zoom info display
                zoomInfo.textContent = `${Math.round(window.currentZoom * 100)}%`;

                content.appendChild(clonedSvg);
                content.appendChild(zoomInfo);

                container.appendChild(header);
                container.appendChild(content);
                modal.appendChild(container);
                document.body.appendChild(modal);

                // Show animation
                setTimeout(() => {
                    modal.style.opacity = '1';
                    // Reset opening state after animation
                    setTimeout(() => {
                        isPreviewOpening = false;
                    }, 200);
                }, 10);

                // Click background to close
                modal.addEventListener('click', (e) => {
                    if (e.target === modal) {
                        closeAllMermaidPreviews();
                    }
                });

                // Add global keyboard event listener
                document.addEventListener('keydown', globalKeydownHandler);
            }

            // Create control button
            function createControlButton(text, title, onClick, bgColor = '#6c757d') {
                const btn = document.createElement('button');
                btn.textContent = text;
                btn.title = title;
                btn.style.cssText = `
                    background: ${bgColor};
                    color: white;
                    border: none;
                    border-radius: 4px;
                    padding: 0.5rem 1rem;
                    cursor: pointer;
                    font-size: 14px;
                    font-weight: 500;
                    transition: background-color 0.2s ease;
                    white-space: nowrap;
                `;

                btn.addEventListener('click', onClick);

                btn.addEventListener('mouseenter', () => {
                    btn.style.opacity = '0.8';
                });

                btn.addEventListener('mouseleave', () => {
                    btn.style.opacity = '1';
                });

                return btn;
            }

            // Download Mermaid image
            async function downloadMermaidImage(mermaidElement) {
                const svg = mermaidElement.querySelector('svg');
                if (!svg) return;

                try {
                    // Method 1: download SVG file directly
                    const svgData = new XMLSerializer().serializeToString(svg);
                    const svgBlob = new Blob([svgData], { type: 'image/svg+xml;charset=utf-8' });
                    const url = URL.createObjectURL(svgBlob);

                    const link = document.createElement('a');
                    link.download = `mermaid-diagram-${Date.now()}.svg`;
                    link.href = url;
                    link.click();

                    URL.revokeObjectURL(url);
                    showToast('SVG image downloaded successfully!');

                    // Try converting to PNG if supported
                    setTimeout(() => {
                        convertSvgToPng(svg, svgData).catch(() => {
                            // Fallback for PNG conversion failure is handled in convertSvgToPng
                        });
                    }, 100);

                } catch (error) {
                    console.error('Download failed:', error);
                    showToast('Download failed, please try again', 'error');
                }
            }

            // Convert SVG to PNG
            async function convertSvgToPng(svg, svgData) {
                try {
                    // Clean SVG data and remove potentially unsafe content
                    let cleanSvgData = svgData;

                    // Ensure SVG has the correct namespace
                    if (!cleanSvgData.includes('xmlns="http://www.w3.org/2000/svg"')) {
                        cleanSvgData = cleanSvgData.replace('<svg', '<svg xmlns="http://www.w3.org/2000/svg"');
                    }

                    // Get SVG dimensions
                    const svgRect = svg.getBoundingClientRect();
                    const svgWidth = svgRect.width || 800;
                    const svgHeight = svgRect.height || 600;

                    // Create canvas
                    const canvas = document.createElement('canvas');
                    const ctx = canvas.getContext('2d');

                    // Set canvas dimensions
                    canvas.width = svgWidth * 2;
                    canvas.height = svgHeight * 2;
                    ctx.scale(2, 2);

                    // Create image
                    const img = new Image();
                    img.crossOrigin = 'anonymous'; // Try to avoid cross-origin issues

                    // Use data URL instead of blob URL
                    const dataUrl = 'data:image/svg+xml;base64,' + btoa(unescape(encodeURIComponent(cleanSvgData)));

                    img.onload = () => {
                        try {
                            // White background
                            ctx.fillStyle = 'white';
                            ctx.fillRect(0, 0, svgWidth, svgHeight);

                            // Draw SVG
                            ctx.drawImage(img, 0, 0, svgWidth, svgHeight);

                            // Download PNG
                            canvas.toBlob((blob) => {
                                if (blob) {
                                    const url = URL.createObjectURL(blob);
                                    const link = document.createElement('a');
                                    link.download = `mermaid-diagram-${Date.now()}.png`;
                                    link.href = url;
                                    link.click();
                                    URL.revokeObjectURL(url);
                                    showToast('PNG image downloaded successfully!');
                                } else {
                                    showToast('PNG conversion failed; SVG was downloaded', 'warning');
                                }
                            }, 'image/png');

                        } catch (canvasError) {
                            console.warn('Canvas operation failed:', canvasError);
                            showToast('PNG conversion failed; SVG was downloaded', 'warning');
                        }
                    };

                    img.onerror = () => {
                        console.warn('Image load failed; PNG conversion failed');
                        showToast('PNG conversion failed; SVG was downloaded', 'warning');
                    };

                    img.src = dataUrl;

                } catch (error) {
                    console.warn('PNG conversion failed:', error);
                    showToast('PNG conversion failed; SVG was downloaded', 'warning');
                }
            }

            // Copy Mermaid image
            async function copyMermaidImage(mermaidElement) {
                const svg = mermaidElement.querySelector('svg');
                if (!svg) return;

                try {
                    const svgData = new XMLSerializer().serializeToString(svg);
                    // Convert directly to PNG and copy to clipboard
                    await convertSvgToPngAndCopy(svg, svgData);
                } catch (error) {
                    console.error('Copy failed:', error);
                    showToast('Copy failed, please try again', 'error');
                }
            }

            // Convert SVG to PNG and copy
            async function convertSvgToPngAndCopy(svg, svgData) {
                try {
                    // Clean SVG data
                    let cleanSvgData = svgData;
                    if (!cleanSvgData.includes('xmlns="http://www.w3.org/2000/svg"')) {
                        cleanSvgData = cleanSvgData.replace('<svg', '<svg xmlns="http://www.w3.org/2000/svg"');
                    }

                    // Get SVG dimensions
                    const svgRect = svg.getBoundingClientRect();
                    const svgWidth = svgRect.width || 800;
                    const svgHeight = svgRect.height || 600;

                    // Create canvas
                    const canvas = document.createElement('canvas');
                    const ctx = canvas.getContext('2d');

                    canvas.width = svgWidth * 2;
                    canvas.height = svgHeight * 2;
                    ctx.scale(2, 2);

                    // Create image
                    const img = new Image();
                    img.crossOrigin = 'anonymous';

                    // Use data URL
                    const dataUrl = 'data:image/svg+xml;base64,' + btoa(unescape(encodeURIComponent(cleanSvgData)));

                    img.onload = () => {
                        try {
                            // White background
                            ctx.fillStyle = 'white';
                            ctx.fillRect(0, 0, svgWidth, svgHeight);

                            // Draw SVG
                            ctx.drawImage(img, 0, 0, svgWidth, svgHeight);

                            // Copy to clipboard
                            canvas.toBlob(async (blob) => {
                                if (blob) {
                                    try {
                                        await navigator.clipboard.write([
                                            new ClipboardItem({ 'image/png': blob })
                                        ]);
                                        showToast('PNG image copied to clipboard!');
                                    } catch (clipboardError) {
                                        console.warn('Failed to copy PNG:', clipboardError);
                                        showToast('Image copy failed, please try again', 'error');
                                    }
                                } else {
                                    showToast('Image conversion failed, please try again', 'error');
                                }
                            }, 'image/png');

                        } catch (canvasError) {
                            console.warn('Canvas operation failed:', canvasError);
                            showToast('Image copy failed, please try again', 'error');
                        }
                    };

                    img.onerror = () => {
                        console.warn('Image load failed');
                        showToast('Image copy failed, please try again', 'error');
                    };

                    img.src = dataUrl;

                } catch (error) {
                    console.warn('PNG conversion failed:', error);
                    showToast('Image copy failed, please try again', 'error');
                }
            }

            // Show toast message
            function showToast(message, type = 'success') {
                const toast = document.createElement('div');
                toast.textContent = message;

                let backgroundColor;
                switch (type) {
                    case 'success':
                        backgroundColor = '#28a745';
                        break;
                    case 'error':
                        backgroundColor = '#dc3545';
                        break;
                    case 'warning':
                        backgroundColor = '#ffc107';
                        break;
                    default:
                        backgroundColor = '#28a745';
                }

                toast.style.cssText = `
                    position: fixed;
                    top: 20px;
                    right: 20px;
                    background: ${backgroundColor};
                    color: ${type === 'warning' ? '#212529' : 'white'};
                    padding: 0.75rem 1rem;
                    border-radius: 6px;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
                    z-index: 10000;
                    font-size: 0.9rem;
                    animation: slideInRight 0.3s ease;
                    max-width: 300px;
                    word-wrap: break-word;
                `;

                document.body.appendChild(toast);

                setTimeout(() => {
                    toast.style.animation = 'slideOutRight 0.3s ease';
                    setTimeout(() => {
                        if (document.body.contains(toast)) {
                            document.body.removeChild(toast);
                        }
                    }, 300);
                }, 3000); // Extend display time to 3 seconds
            }

            // Add animation styles and preview-mode styles
            const style = document.createElement('style');
            style.textContent = `
                @keyframes slideInRight {
                    from { transform: translateX(100%); opacity: 0; }
                    to { transform: translateX(0); opacity: 1; }
                }
                @keyframes slideOutRight {
                    from { transform: translateX(0); opacity: 1; }
                    to { transform: translateX(100%); opacity: 0; }
                }

                /* Ensure Mermaid diagram styles are consistent in preview mode */
                #mermaidPreviewModal {
                    --preview-bg: var(--bg-primary);
                    --preview-text: var(--text-primary);
                    --preview-border: var(--border-color);
                }

                #mermaidPreviewModal[data-theme="dark"] {
                    --preview-bg: var(--bg-primary);
                    --preview-text: var(--text-primary);
                    --preview-border: var(--border-color);
                }

                #mermaidPreviewModal[data-theme="light"] {
                    --preview-bg: var(--bg-primary);
                    --preview-text: var(--text-primary);
                    --preview-border: var(--border-color);
                }

                #mermaidPreviewModal[data-theme="morandi"] {
                    --preview-bg: var(--bg-primary);
                    --preview-text: var(--text-primary);
                    --preview-border: var(--border-color);
                }

                /* SVG style inheritance in preview mode */
                #mermaidPreviewModal svg {
                    background: transparent !important;
                }

                #mermaidPreviewModal svg * {
                    font-family: inherit !important;
                }

                /* Ensure preview container background matches theme */
                #mermaidPreviewModal .content {
                    background: var(--preview-bg) !important;
                }
            `;
            document.head.appendChild(style);



            // Enhance Mermaid diagrams after page load
            setTimeout(() => {
                enhanceMermaidDiagrams();
            }, 1000);

            // Watch content changes and automatically enhance new Mermaid diagrams
            const mermaidObserver = new MutationObserver((mutations) => {
                let shouldEnhance = false;
                mutations.forEach((mutation) => {
                    mutation.addedNodes.forEach((node) => {
                        if (node.nodeType === Node.ELEMENT_NODE) {
                            if (node.classList && node.classList.contains('mermaid')) {
                                shouldEnhance = true;
                            } else if (node.querySelectorAll) {
                                const mermaidElements = node.querySelectorAll('.mermaid');
                                if (mermaidElements.length > 0) {
                                    shouldEnhance = true;
                                }
                            }
                        }
                    });
                });

                if (shouldEnhance) {
                    setTimeout(() => {
                        enhanceMermaidDiagrams();
                    }, 100);
                }
            });

            mermaidObserver.observe(document.body, {
                childList: true,
                subtree: true
            });

            // AI assistant features
            let isAiAssistantOpen = false;
            let isAiLoading = false;
            let isSuggestionsCollapsed = false;
            let hasUserSentMessage = false;
            let chatHistory = []; // Store chat history
            let selectedContextFiles = []; // Store context files selected by the user

            // Toggle AI assistant panel
            function toggleAiAssistant() {
                const trigger = document.getElementById('aiAssistantTrigger');
                const panel = document.getElementById('aiAssistantPanel');

                isAiAssistantOpen = !isAiAssistantOpen;

                if (isAiAssistantOpen) {
                    trigger.classList.add('hidden');
                    panel.classList.add('show');
                    // Focus input
                    setTimeout(() => {
                        document.getElementById('aiInput').focus();
                    }, 300);
                } else {
                    trigger.classList.remove('hidden');
                    panel.classList.remove('show');
                }
            }

            // Clear chat history
            function clearChatHistory() {
                if (confirm('Are you sure you want to clear all chat history?')) {
                    // Clear chat history array
                    chatHistory = [];

                    // Clear chat UI, but keep welcome message
                    const messagesContainer = document.getElementById('aiChatMessages');
                    messagesContainer.innerHTML = `
                        <div class="ai-message ai-message-assistant">
                            <div class="ai-message-content">
                                <p>👋 Hello! I am<strong>Litho Advisor</strong>，your documentation assistant. I can help you understand and analyze document content. Ask me anything!</p>
                            </div>
                        </div>
                    `;

                    // Reset state
                    hasUserSentMessage = false;

                    // Expand suggestions if collapsed
                    if (isSuggestionsCollapsed) {
                        toggleSuggestions();
                    }

                    // Restore initial suggested questions
                    const suggestionsContainer = document.querySelector('.ai-suggestions-list');
                    suggestionsContainer.innerHTML = `
                        <button class="ai-suggestion-item" onclick="sendSuggestion('What are the main features of this project?')">
                            What are the main features of this project?
                        </button>
                        <button class="ai-suggestion-item" onclick="sendSuggestion('How do I get started with this project?')">
                            How do I get started with this project?
                        </button>
                        <button class="ai-suggestion-item" onclick="sendSuggestion('What is the technical architecture of this project?')">
                            What is the technical architecture of this project?
                        </button>
                    `;
                }
            }

            // Toggle suggestions collapsed state
            function toggleSuggestions() {
                const suggestions = document.getElementById('aiSuggestions');
                const toggle = document.getElementById('aiSuggestionsToggle');

                isSuggestionsCollapsed = !isSuggestionsCollapsed;

                if (isSuggestionsCollapsed) {
                    suggestions.classList.add('collapsed');
                } else {
                    suggestions.classList.remove('collapsed');
                }
            }

            // Auto-collapse suggestions after the user sends a message
            function autoCollapseSuggestions() {
                if (!hasUserSentMessage && !isSuggestionsCollapsed) {
                    hasUserSentMessage = true;
                    setTimeout(() => {
                        toggleSuggestions();
                    }, 1000); // Auto-collapse after 1 second
                }
            }

            // Send suggested question
            function sendSuggestion(question) {
                const input = document.getElementById('aiInput');
                input.value = question;
                updateSendButton();
                sendMessage();
            }

            // Get current document content as context
            function getCurrentDocumentContext() {
                const contentContainer = document.querySelector('.markdown-content');
                if (contentContainer) {
                    // Extract text content and remove HTML tags
                    const text = contentContainer.textContent || contentContainer.innerText || '';
                    // Limit context length to avoid oversized requests
                    return text.substring(0, 3000);
                }
                return null;
            }

            // Get content from all selected context files
            async function getSelectedContextFilesContent() {
                const contextContents = [];

                // Add user-selected context files
                for (const file of selectedContextFiles) {
                    // Skip current file (handled separately)
                    if (currentFile && file.path === currentFile) {
                        continue;
                    }

                    try {
                        const response = await fetch(`/api/file?file=${encodeURIComponent(file.path)}`);
                        if (response.ok) {
                            const data = await response.json();
                            contextContents.push({
                                name: file.name,
                                content: data.content.substring(0, 3000)
                            });
                        }
                    } catch (error) {
                        console.warn(`Failed to load file ${file.name}:`, error);
                    }
                }

                // Add current document if present and not duplicated
                const currentContent = getCurrentDocumentContext();
                const currentFileName = currentFile ? currentFile.split('/').pop() : null;

                if (currentContent && currentFileName) {
                    contextContents.push({
                        name: currentFileName,
                        content: currentContent
                    });
                }

                // Format context content
                if (contextContents.length > 0) {
                    let contextText = "User-selected context file content：\n";
                    contextContents.forEach((item, index) => {
                        contextText += `\n[${index + 1}] File: ${item.name}\n${item.content}\n`;
                    });
                    return contextText;
                }

                return null;
            }

            // Show document selector panel
            function showDocumentSelector() {
                // Create modal
                const modal = document.createElement('div');
                modal.id = 'documentSelectorModal';
                modal.style.cssText = `
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, 0.5);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    z-index: 10000;
                `;

                const container = document.createElement('div');
                container.style.cssText = `
                    background: var(--bg-primary);
                    border-radius: 12px;
                    width: 80%;
                    max-width: 600px;
                    max-height: 80vh;
                    overflow: hidden;
                    display: flex;
                    flex-direction: column;
                    border: 1px solid var(--border-color);
                `;

                const header = document.createElement('div');
                header.style.cssText = `
                    padding: 1rem 1.5rem;
                    background: var(--bg-secondary);
                    border-bottom: 1px solid var(--border-color);
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                `;

                const title = document.createElement('h3');
                title.textContent = 'Select documents to add to context';
                title.style.cssText = `
                    margin: 0;
                    color: var(--text-primary);
                    font-size: 1.2rem;
                `;

                const closeBtn = document.createElement('button');
                closeBtn.innerHTML = '&times;';
                closeBtn.style.cssText = `
                    background: none;
                    border: none;
                    font-size: 1.5rem;
                    cursor: pointer;
                    color: var(--text-secondary);
                    padding: 0;
                    width: 30px;
                    height: 30px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                `;
                closeBtn.onclick = () => document.body.removeChild(modal);

                const content = document.createElement('div');
                content.style.cssText = `
                    padding: 1rem;
                    overflow-y: auto;
                    flex: 1;
                `;

                // Create document list
                const fileList = document.createElement('div');
                fileList.id = 'documentList';
                fileList.style.cssText = `
                    max-height: 60vh;
                    overflow-y: auto;
                `;

                // Render document tree recursively
                function renderFileNode(node, container, level = 0) {
                    const itemDiv = document.createElement('div');
                    itemDiv.style.cssText = `
                        display: flex;
                        align-items: center;
                        padding: 0.5rem;
                        margin: 0.25rem 0;
                        border-radius: 6px;
                        cursor: pointer;
                        transition: background 0.2s;
                    `;

                    // Set different click behavior for folders and files
                    if (node.is_file) {
                        itemDiv.onmouseenter = () => {
                            itemDiv.style.background = 'var(--bg-secondary)';
                        };

                        itemDiv.onmouseleave = () => {
                            itemDiv.style.background = 'transparent';
                        };
                    } else {
                        // Folders do not respond to hover effects
                        itemDiv.style.cursor = 'default';
                    }

                    const checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    checkbox.style.cssText = `
                        margin-right: 0.5rem;
                    `;

                    // Set data attribute for later lookup
                    checkbox.setAttribute('data-path', node.path);

                    // Check whether file is already selected
                    const isSelected = selectedContextFiles.some(f => f.path === node.path);
                    checkbox.checked = isSelected;

                    // Select the architecture overview document by default.
                    if (node.name === '2-architecture-overview.md') {
                        checkbox.checked = true;
                        // Add to selected list if not already added
                        if (!isSelected) {
                            selectedContextFiles.push({
                                name: node.name,
                                path: node.path
                            });
                        }
                    }

                    // Current file is selected by default and cannot be deselected
                    const currentFileName = currentFile ? currentFile.split('/').pop() : null;
                    if (node.is_file && currentFileName && node.name === currentFileName) {
                        checkbox.checked = true;
                        checkbox.disabled = true; // Current file cannot be deselected
                    }

                    // Folders cannot be selected
                    if (!node.is_file) {
                        checkbox.style.visibility = 'hidden'; // Hide folder checkbox
                        checkbox.disabled = true;
                    }

                    checkbox.onchange = (e) => {
                        if (e.target.checked) {
                            // Add to selected list
                            selectedContextFiles.push({
                                name: node.name,
                                path: node.path
                            });
                        } else {
                            // Remove from selected list
                            selectedContextFiles = selectedContextFiles.filter(f => f.path !== node.path);
                        }
                        // Update context tag display
                        updateContextTags();
                    };

                    const icon = document.createElement('span');
                    icon.style.cssText = `
                        margin-right: 0.5rem;
                        width: 20px;
                        text-align: center;
                    `;

                    if (node.is_file) {
                        icon.textContent = '📄';
                    } else {
                        icon.textContent = '📁';
                    }

                    const nameSpan = document.createElement('span');
                    nameSpan.textContent = node.name;
                    nameSpan.style.cssText = `
                        flex: 1;
                        color: var(--text-primary);
                    `;

                    // Add indentation
                    itemDiv.style.paddingLeft = `${0.5 + level * 1}rem`;

                    // Allow clicking the entire row to select files
                    if (node.is_file) {
                        itemDiv.onclick = (e) => {
                            // Do not handle direct checkbox clicks to avoid duplicate triggers
                            if (e.target === checkbox) return;

                            // Do not allow deselecting the current file
                            const currentFileName = currentFile ? currentFile.split('/').pop() : null;
                            if (currentFileName && node.name === currentFileName) return;

                            // Toggle checkbox state
                            checkbox.checked = !checkbox.checked;
                            checkbox.onchange({ target: checkbox });
                        };
                    }

                    itemDiv.appendChild(checkbox);
                    itemDiv.appendChild(icon);
                    itemDiv.appendChild(nameSpan);

                    container.appendChild(itemDiv);

                    // Render child nodes for folders
                    if (!node.is_file && node.children && node.children.length > 0) {
                        node.children.forEach(child => {
                            renderFileNode(child, container, level + 1);
                        });
                    }
                }

                // Render entire document tree (skip root node)
                if (originalTreeData && originalTreeData.children) {
                    originalTreeData.children.forEach(child => {
                        renderFileNode(child, fileList, 0);
                    });
                }

                content.appendChild(fileList);

                const footer = document.createElement('div');
                footer.style.cssText = `
                    padding: 1rem;
                    background: var(--bg-secondary);
                    border-top: 1px solid var(--border-color);
                    display: flex;
                    justify-content: flex-end;
                    gap: 0.5rem;
                `;

                const cancelBtn = document.createElement('button');
                cancelBtn.textContent = 'Cancel';
                cancelBtn.style.cssText = `
                    padding: 0.5rem 1rem;
                    background: var(--bg-tertiary);
                    border: 1px solid var(--border-color);
                    border-radius: 6px;
                    color: var(--text-primary);
                    cursor: pointer;
                `;
                cancelBtn.onclick = () => document.body.removeChild(modal);

                const confirmBtn = document.createElement('button');
                confirmBtn.textContent = 'Confirm selection';
                confirmBtn.style.cssText = `
                    padding: 0.5rem 1rem;
                    background: var(--accent-color);
                    border: 1px solid var(--accent-color);
                    border-radius: 6px;
                    color: white;
                    cursor: pointer;
                `;
                confirmBtn.onclick = () => {
                    // Update context tag display
                    updateContextTags();
                    document.body.removeChild(modal);
                };

                footer.appendChild(cancelBtn);
                footer.appendChild(confirmBtn);

                header.appendChild(title);
                header.appendChild(closeBtn);

                container.appendChild(header);
                container.appendChild(content);
                container.appendChild(footer);

                modal.appendChild(container);
                document.body.appendChild(modal);

                // Click background to close
                modal.onclick = (e) => {
                    if (e.target === modal) {
                        document.body.removeChild(modal);
                    }
                };
            }

            // Update context tag display
            function updateContextTags() {
                const tagsContainer = document.getElementById('contextTagsContainer');
                if (!tagsContainer) return;

                // Clear existing tags
                tagsContainer.innerHTML = '';

                // Get current file name
                const currentFileName = currentFile ? currentFile.split('/').pop() : null;

                // Create a tag for each selected file
                selectedContextFiles.forEach((file, index) => {
                    const tag = document.createElement('div');
                    tag.style.cssText = `
                        display: inline-flex;
                        align-items: center;
                        background: var(--accent-color);
                        color: white;
                        border-radius: 12px;
                        padding: 0.25rem 0.75rem;
                        margin-right: 0.5rem;
                        margin-bottom: 0.5rem;
                        font-size: 0.85rem;
                    `;

                    const nameSpan = document.createElement('span');
                    nameSpan.textContent = file.name;
                    nameSpan.style.cssText = `
                        margin-right: 0.5rem;
                        max-width: 150px;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                    `;

                    // If this is the current file, do not show remove button
                    if (currentFileName && file.name === currentFileName) {
                        tag.style.background = 'var(--text-secondary)'; // Different color indicates it cannot be removed
                        tag.appendChild(nameSpan);
                    } else {
                        // Show remove button for other files
                        const removeBtn = document.createElement('button');
                        removeBtn.innerHTML = '&times;';
                        removeBtn.style.cssText = `
                            background: none;
                            border: none;
                            color: white;
                            cursor: pointer;
                            font-size: 1.2rem;
                            line-height: 1;
                            padding: 0;
                            width: 16px;
                            height: 16px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                        `;

                        removeBtn.onclick = () => {
                            // Remove from selected list
                            selectedContextFiles = selectedContextFiles.filter(f => f.path !== file.path);
                            // Update tag display
                            updateContextTags();
                            // Update checkbox state in document selector if open
                            const checkbox = document.querySelector(`input[type="checkbox"][data-path="${file.path}"]`);
                            if (checkbox) {
                                checkbox.checked = false;
                            }
                        };

                        tag.appendChild(nameSpan);
                        tag.appendChild(removeBtn);
                    }

                    tagsContainer.appendChild(tag);
                });
            }

            // Initialize default context
            function initializeDefaultContext() {
                // Add the architecture overview document by default.
                selectedContextFiles = [{
                    name: '2-architecture-overview.md',
                    path: '2-architecture-overview.md'
                }];

                // Also add current file to context if present
                if (currentFile) {
                    const currentFileName = currentFile.split('/').pop();
                    selectedContextFiles.push({
                        name: currentFileName,
                        path: currentFile
                    });
                }

                // Update context tag display
                updateContextTags();
            }

            // Handle input keyboard events
            function handleAiInputKeydown(event) {
                // Check whether IME composition is active
                if (event.isComposing || event.keyCode === 229) {
                    // Do not handle Enter while IME composition is active
                    return;
                }

                // Check whether @ was typed
                if (event.key === '@') {
                    // Delay showing document selector so @ is already inserted
                    setTimeout(() => {
                        showDocumentSelector();
                    }, 10);
                    return;
                }

                if (event.key === 'Enter' && !event.shiftKey) {
                    event.preventDefault();
                    sendMessage();
                } else if (event.key === 'Escape') {
                    toggleAiAssistant();
                }
            }

            // Auto-adjust textarea height
            function adjustTextareaHeight(textarea) {
                textarea.style.height = 'auto';
                textarea.style.height = Math.min(textarea.scrollHeight, 100) + 'px';
                updateSendButton();
            }

            // Update send button state
            function updateSendButton() {
                const input = document.getElementById('aiInput');
                const sendBtn = document.getElementById('aiSendBtn');
                const hasText = input.value.trim().length > 0;

                sendBtn.disabled = !hasText || isAiLoading;
            }

            // Send message (streaming version)
            async function sendMessage() {
                const input = document.getElementById('aiInput');
                const message = input.value.trim();

                if (!message || isAiLoading) return;

                // Clear input while preserving context indicator
                input.value = '';
                adjustTextareaHeight(input);
                updateSendButton();

                // Add user message to UI
                addMessage(message, 'user');

                // Add user message to history
                chatHistory.push({
                    role: 'user',
                    content: message
                });

                // Auto-collapse suggestions after the first sent message
                autoCollapseSuggestions();

                // Create AI message container for streaming display
                const aiMessageElement = addStreamingMessage();
                isAiLoading = true;
                updateSendButton();

                try {
                    // Get selected context file content
                    const context = await getSelectedContextFilesContent();

                    // Call streaming AI API
                    const response = await fetch('/api/chat', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'Accept': 'text/event-stream',
                        },
                        body: JSON.stringify({
                            message: message,
                            context: context,
                            history: chatHistory.slice(0, -1) // Send history excluding the current message
                        })
                    });

                    if (!response.ok) {
                        throw new Error(`HTTP ${response.status}: ${response.statusText}`);
                    }

                    // Handle streaming response
                    await handleStreamResponse(response, aiMessageElement);

                } catch (error) {
                    console.error('AI request failed:', error);

                    // Remove streaming message container
                    if (aiMessageElement && aiMessageElement.parentNode) {
                        aiMessageElement.parentNode.removeChild(aiMessageElement);
                    }

                    // Show error message
                    addMessage('Sorry, I cannot answer your question right now. Please try again later.', 'assistant', true);
                } finally {
                    isAiLoading = false;
                    updateSendButton();
                }
            }

            // Create streaming message container
            function addStreamingMessage() {
                const messagesContainer = document.getElementById('aiChatMessages');

                const messageDiv = document.createElement('div');
                messageDiv.className = 'ai-message ai-message-assistant';

                const contentDiv = document.createElement('div');
                contentDiv.className = 'ai-message-content';
                contentDiv.innerHTML = '<span class="ai-cursor">|</span>'; // Add cursor effect

                messageDiv.appendChild(contentDiv);
                messagesContainer.appendChild(messageDiv);

                // Scroll to bottom
                messagesContainer.scrollTop = messagesContainer.scrollHeight;

                return messageDiv;
            }

            // Handle streaming response
            async function handleStreamResponse(response, messageElement) {
                const reader = response.body.getReader();
                const decoder = new TextDecoder();
                let fullContent = '';
                const contentDiv = messageElement.querySelector('.ai-message-content');

                try {
                    while (true) {
                        const { done, value } = await reader.read();

                        if (done) break;

                        const chunk = decoder.decode(value, { stream: true });
                        const lines = chunk.split('\n');

                        for (const line of lines) {
                            if (line.startsWith('data: ')) {
                                const data = line.slice(6);

                                if (data === '[DONE]') {
                                    // Remove cursor
                                    contentDiv.innerHTML = renderSimpleMarkdown(fullContent);
                                    return;
                                }

                                try {
                                    const event = JSON.parse(data);

                                    if (event.event_type === 'content' && event.content) {
                                        fullContent += event.content;
                                        // Update displayed content while keeping cursor
                                        contentDiv.innerHTML = renderSimpleMarkdown(fullContent) + '<span class="ai-cursor">|</span>';

                                        // Scroll to bottom
                                        const messagesContainer = document.getElementById('aiChatMessages');
                                        messagesContainer.scrollTop = messagesContainer.scrollHeight;
                                    } else if (event.event_type === 'finish') {
                                        // Remove cursor
                                        contentDiv.innerHTML = renderSimpleMarkdown(fullContent);

                                        // Add AI response to history
                                        chatHistory.push({
                                            role: 'assistant',
                                            content: fullContent
                                        });

                                        // Update suggested questions
                                        if (event.suggestions) {
                                            updateSuggestions(event.suggestions);
                                        }
                                        return;
                                    } else if (event.event_type === 'error') {
                                        throw new Error(event.content || 'Streaming response error');
                                    }
                                } catch (parseError) {
                                    console.warn('Failed to parse SSE data:', parseError, 'data:', data);
                                }
                            }
                        }
                    }
                } catch (error) {
                    console.error('Streaming response handling error:', error);
                    // Remove cursor and show error
                    contentDiv.innerHTML = 'Sorry, an error occurred while processing the response.';
                    throw error;
                }
            }

            // Get current document content as context
            function getCurrentDocumentContext() {
                const contentContainer = document.querySelector('.markdown-content');
                if (contentContainer) {
                    // Extract text content and remove HTML tags
                    const text = contentContainer.textContent || contentContainer.innerText || '';
                    // Limit context length to avoid oversized requests
                    return text.substring(0, 3000);
                }
                return null;
            }

            // Add message to chat area
            function addMessage(content, type, isError = false) {
                const messagesContainer = document.getElementById('aiChatMessages');

                const messageDiv = document.createElement('div');
                messageDiv.className = `ai-message ai-message-${type}`;

                const contentDiv = document.createElement('div');
                contentDiv.className = 'ai-message-content';

                if (type === 'assistant' && !isError) {
                    // Render simple code formatting for AI responses
                    contentDiv.innerHTML = renderSimpleMarkdown(content);
                } else {
                    contentDiv.textContent = content;
                }

                if (isError) {
                    contentDiv.style.color = '#dc3545';
                }

                messageDiv.appendChild(contentDiv);
                messagesContainer.appendChild(messageDiv);

                // Scroll to bottom
                messagesContainer.scrollTop = messagesContainer.scrollHeight;

                return messageDiv;
            }

            // Add loading message
            function addLoadingMessage() {
                const messagesContainer = document.getElementById('aiChatMessages');

                const messageDiv = document.createElement('div');
                messageDiv.className = 'ai-message ai-message-loading';

                const contentDiv = document.createElement('div');
                contentDiv.className = 'ai-message-content';
                contentDiv.innerHTML = `
                    <span>AI is thinking</span>
                    <div class="ai-typing-indicator">
                        <div class="ai-typing-dot"></div>
                        <div class="ai-typing-dot"></div>
                        <div class="ai-typing-dot"></div>
                    </div>
                `;

                messageDiv.appendChild(contentDiv);
                messagesContainer.appendChild(messageDiv);

                // Scroll to bottom
                messagesContainer.scrollTop = messagesContainer.scrollHeight;

                return messageDiv;
            }

            // Remove loading message
            function removeLoadingMessage(loadingElement) {
                if (loadingElement && loadingElement.parentNode) {
                    loadingElement.parentNode.removeChild(loadingElement);
                }
            }

            // Simple code rendering
            function renderSimpleMarkdown(text) {
                // Handle Mermaid code blocks before normal code blocks
                const mermaidBlocks = [];
                const mermaidPlaceholders = [];

                text = text.replace(/```mermaid\n([\s\S]*?)\n```/g, (match, mermaidCode) => {
                    const mermaidId = `mermaid-ai-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
                    const placeholder = `__MERMAID_PLACEHOLDER_${mermaidId}__`;
                    mermaidBlocks.push({ id: mermaidId, code: mermaidCode.trim() });
                    mermaidPlaceholders.push({ placeholder, id: mermaidId, code: mermaidCode.trim() });
                    return placeholder;
                });

                // Handle normal code blocks excluding already handled Mermaid blocks
                text = text.replace(/```(\w+)?\n([\s\S]*?)\n```/g, (match, lang, code) => {
                    return `<pre><code class="language-${lang || ''}">${code}</code></pre>`;
                });

                // Handle other Markdown syntax, but not line breaks
                text = text
                    .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
                    .replace(/\*(.*?)\*/g, '<em>$1</em>')
                    .replace(/`(.*?)`/g, '<code>$1</code>');

                // Replace Mermaid placeholders with actual div elements
                mermaidPlaceholders.forEach(item => {
                    text = text.replace(item.placeholder, `<div class="mermaid" id="${item.id}">${item.code}</div>`);
                });

                // Handle line breaks last, after Mermaid processing
                text = text.replace(/\n/g, '<br>');

                // Render Mermaid diagrams asynchronously
                if (mermaidBlocks.length > 0) {
                    setTimeout(() => {
                        mermaidBlocks.forEach(block => {
                            const element = document.getElementById(block.id);
                            if (element && typeof mermaid !== 'undefined') {
                                try {
                                    console.log('Rendering Mermaid diagram in AI message:', block.id, 'code:', block.code);
                                    // Ensure element content is plain text without HTML tags
                                    element.textContent = block.code;

                                    // Render diagram with mermaid.run()
                                    mermaid.run(undefined, `#${block.id}`).then(() => {
                                        console.log('Mermaid diagram rendered successfully:', block.id);
                                        // Enhance diagram after render completes
                                        setTimeout(() => {
                                            enhanceMermaidDiagrams();
                                        }, 100);
                                    }).catch(error => {
                                        console.warn('Failed to render Mermaid diagram in AI message:', error);
                                        element.innerHTML = `
                                            <div style="border: 1px solid #dc3545; border-radius: 4px; padding: 1rem; background: #f8d7da; color: #721c24;">
                                                <strong>Mermaid diagram render failed</strong>
                                                <pre style="margin-top: 0.5rem; background: #fff; padding: 0.5rem; border-radius: 4px; overflow-x: auto;"><code>${block.code}</code></pre>
                                            </div>
                                        `;
                                    });
                                } catch (error) {
                                    console.warn('Failed to render Mermaid diagram in AI message:', error);
                                    element.innerHTML = `
                                        <div style="border: 1px solid #dc3545; border-radius: 4px; padding: 1rem; background: #f8d7da; color: #721c24;">
                                            <strong>Mermaid diagram render failed</strong>
                                            <pre style="margin-top: 0.5rem; background: #fff; padding: 0.5rem; border-radius: 4px; overflow-x: auto;"><code>${block.code}</code></pre>
                                        </div>
                                    `;
                                }
                            }
                        });
                    }, 100);
                }

                return text;
            }

            // Update suggested questions
            function updateSuggestions(suggestions) {
                const suggestionsContainer = document.querySelector('.ai-suggestions-list');

                if (!suggestions || suggestions.length === 0) {
                    return;
                }

                // Clear existing suggestions
                suggestionsContainer.innerHTML = '';

                // Add new suggestions
                suggestions.forEach(suggestion => {
                    const button = document.createElement('button');
                    button.className = 'ai-suggestion-item';
                    button.textContent = suggestion;
                    button.onclick = () => sendSuggestion(suggestion);
                    suggestionsContainer.appendChild(button);
                });

                // If suggestions are collapsed, they could be expanded here; keep them collapsed so users expand manually
                // This saves space while still allowing users to view new suggestions
            }

            // Listen for input changes
            document.addEventListener('DOMContentLoaded', () => {
                const input = document.getElementById('aiInput');
                if (input) {
                    input.addEventListener('input', () => {
                        adjustTextareaHeight(input);
                        updateSendButton();
                    });
                }

                // Initialize the default selected context file.
                initializeDefaultContext();
            });

            // Initialize default context
            function initializeDefaultContext() {
                // Add the architecture overview document by default.
                selectedContextFiles = [{
                    name: '2-architecture-overview.md',
                    path: '2-architecture-overview.md'
                }];

                // Update context tag display
                updateContextTags();
            }

            // Close AI assistant when clicking elsewhere on the page (optional)
            document.addEventListener('click', (event) => {
                const panel = document.getElementById('aiAssistantPanel');
                const trigger = document.getElementById('aiAssistantTrigger');

                if (isAiAssistantOpen &&
                    !panel.contains(event.target) &&
                    !trigger.contains(event.target)) {
                    // Optionally enable click-outside-to-close behavior
                    // toggleAiAssistant();
                }
            });
        </script>
    </body>
</html>
