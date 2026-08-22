---
name: memory
description: Cross-project memory and knowledge management system. Activate when the user asks to recall past decisions, lookup tool tips/bugs, search cross-project execution logs, or save new reusable findings.
---

# Cross-Project Memory & Knowledge Base (agent-memory)

Antigravity uses a hybrid two-tier memory system to share knowledge and logs across different workspaces and projects on the machine.

## Memory Architecture

1. **Human & AI Curated Knowledge (Markdown)**
   - Location: `~/.local/share/agent-memory/docs/`
   - Use for: Tool-specific tips, bug workarounds, architecture decisions, and reusable design patterns.
   - Format: Standard Markdown files organized into subdirectories (`tips/`, `decisions/`).
2. **AI Structured Execution Logs & History (SQLite)**
   - Location: `~/.local/share/agent-memory/memory.db`
   - Managed via: `agent-memory` CLI (`~/.local/bin/agent-memory`)
   - Use for: Full execution traces — reasoning, commands, outputs, and results.

---

## 1. Command Execution: `agent-memory exec` (Required)

**All shell commands MUST be executed via `agent-memory exec`.**

This automatically records the command, its output, and exit code to the shared memory database. Trivial commands (`ls`, `pwd`, etc.) are excluded by default via a configurable exclusion list.

### Basic Usage

```bash
# Execute a command with automatic recording
agent-memory exec -p <project> -- <command>

# With reasoning (recommended — explains WHY this command is run)
agent-memory exec -p <project> -r "<reasoning>" -- <command>

# One-off skip recording
agent-memory exec --no-record -- <command>
```

### Examples

```bash
# Investigating a build error
agent-memory exec -p my-app -r "ビルドエラーの原因調査" -- npm run build

# Checking tool version
agent-memory exec -p dotfiles -r "Neovim バージョン確認" -- nvim --version

# Trivial command (auto-excluded, no recording)
agent-memory exec -p dotfiles -- ls -la

# Complex shell expression
agent-memory exec -p my-app -r "エラーログの確認" -- bash -c "grep ERROR app.log | tail -20"
```

### Exclusion List
Commands matching the following prefixes are automatically excluded from recording (configurable via `~/.local/share/agent-memory/config.json`):

Default: `ls`, `pwd`, `which`, `type`, `true`, `false`

To customize, create `~/.local/share/agent-memory/config.json`:
```json
{
  "exclude_prefixes": ["ls", "pwd", "which", "type", "true", "false", "echo"]
}
```

Or set `AGENT_MEMORY_EXCLUDE` environment variable (comma-separated).

## 2. Searching & Listing Past Memory

### Listing Recent Memories (`agent-memory list` / `ls`)
View recent execution logs or records without needing search keywords:

```bash
# List recent 10 records (default)
agent-memory list

# Or use short alias
agent-memory ls

# Filter by project or tags, or change limit
agent-memory list -p <project> -n 20
agent-memory list --tags "<tag1,tag2>"

# Get structured JSON output
agent-memory list --format json
```

### Searching Past Memory (`agent-memory search`)
When encountering unfamiliar errors, complex tool behaviors, or past design discussions, search the memory database:

```bash
# Keyword search (returns concise summary of recent matches)
agent-memory search "<query>"

# Filter by project or tags
agent-memory search "<query>" --project "<project_name>" --tags "<tag1,tag2>"

# Get structured JSON output
agent-memory search "<query>" --format json

# Increase result limit
agent-memory search "<query>" --limit 10
```

### Viewing Full Details of a Record
To inspect detailed output, full error messages, or exact commands from a search result:

```bash
agent-memory show <ID>
agent-memory show <ID> --format json
```

---

## 3. Manual Recording: `agent-memory record`

For non-command knowledge (design decisions, investigation summaries, etc.):

```bash
# Direct argument recording
agent-memory record -p "<project>" -t "<title>" -d "<details>" --tags "<tags>" --status success

# With reasoning and command context
agent-memory record -p "<project>" -t "<title>" -r "<reasoning>" --cmd "<command>" -d "<details>"

# Recording multiline content via stdin
cat <<'EOF' | agent-memory record -p "<project>" -t "<title>" --tags "<tags>"
<multiline_content>
EOF
```

---

## 4. Managing Markdown Knowledge Base (`docs/`)

When knowledge is valuable for humans to read, review, or edit directly (e.g. tool tips, configuration guides, bug workarounds):

- **Path**: `~/.local/share/agent-memory/docs/`
  - `tips/`: Tool quirks, workaround commands, and troubleshooting guides (e.g. `tips/neovim.md`, `tips/kitty.md`).
  - `decisions/`: Cross-project architecture decisions or policy agreements.
- **Access**:
  - Read with `view_file` or search with `grep_search` within `~/.local/share/agent-memory/docs/`.
  - To initialize the directory structure if not present, run: `agent-memory init-docs`.

---

## 5. Best Practices for Agents

- **Always use `agent-memory exec`**: Do not bypass it for shell commands. The exclusion list handles trivial commands automatically.
- **Provide `--reasoning`**: When running diagnostic or investigative commands, always include `--reasoning` to capture *why* the command is being run.
- **Check memory before debugging**: If a tool or build setup throws an unusual error, search `agent-memory search "<tool/error>"` or check `~/.local/share/agent-memory/docs/tips/`.
- **Promote valuable logs to Markdown**: If a log entry in SQLite turns out to be a permanent, widely applicable tip, summarize it into a Markdown document in `~/.local/share/agent-memory/docs/tips/<tool>.md`.
