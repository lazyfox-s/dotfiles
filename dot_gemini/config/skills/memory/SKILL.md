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
   - Managed via: `agent-memory` CLI (or `~/.local/bin/agent-memory`)
   - Use for: Execution history, session summaries, error logs, and quick keyword/tag retrieval.

---

## 1. Using the `agent-memory` CLI

The `agent-memory` command is available in PATH (`~/.local/bin/agent-memory` or executable via `python3 ~/.local/bin/agent-memory`).

### Searching Past Memory
When encountering unfamiliar errors, complex tool behaviors, or past design discussions, search the memory database first:

```bash
# Keyword search (returns concise summary of recent matches)
agent-memory search "<query>"

# Filter by project or tags
agent-memory search "<query>" --project "<project_name>" --tags "<tag1,tag2>"

# Get structured JSON output
agent-memory search "<query>" --format json
```

### Viewing Full Details of a Record
To inspect detailed trace logs, full error messages, or exact steps from a search result:

```bash
agent-memory show <ID>
```

### Recording New Memory / Findings
When a non-trivial issue is resolved, or an important workflow/error recovery is discovered, record it:

```bash
# Direct argument recording
agent-memory record --project "<project_name>" --title "<short_title>" --details "<detailed_explanation>" --tags "<tag1,tag2>" --status success

# Recording multiline logs/stacktraces via stdin
cat <<'EOF' | agent-memory record --project "<project_name>" --title "<short_title>" --tags "<tags>" --status failed
<multiline_content>
EOF
```

---

## 2. Managing Markdown Knowledge Base (`docs/`)

When knowledge is valuable for humans to read, review, or edit directly (e.g. tool tips, configuration guides, bug workarounds):

- **Path**: `~/.local/share/agent-memory/docs/`
  - `tips/`: Tool quirks, workaround commands, and troubleshooting guides (e.g. `tips/neovim.md`, `tips/kitty.md`).
  - `decisions/`: Cross-project architecture decisions or policy agreements.
- **Access**:
  - Read with `view_file` or search with `grep_search` within `~/.local/share/agent-memory/docs/`.
  - To initialize the directory structure if not present, run: `agent-memory init-docs`.

---

## 3. Best Practices for Agents

- **Check memory before debugging recurring issues**: If a tool or build setup throws an unusual error, search `agent-memory search "<tool/error>"` or check `~/.local/share/agent-memory/docs/tips/`.
- **Keep record titles concise**: Make `--title` descriptive and keyword-rich so future searches easily hit it.
- **Promote valuable logs to Markdown**: If a log entry in SQLite turns out to be a permanent, widely applicable tip, summarize it into a Markdown document in `~/.local/share/agent-memory/docs/tips/<tool>.md`.
