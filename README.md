# context-manager

> A hybrid memory skill for OpenCode, with persistent knowledge storage
> and efficient context management to reduce token usage in long AI sessions.

---

## What It Does

AI agents forget everything between sessions and accumulate tokens fast in long
conversations. `context-manager` solves both with a **4-layer memory architecture**:

| Layer      | Scope                | Storage              | Purpose                      |
| ---------- | -------------------- | -------------------- | ---------------------------- |
| Short-term | Last 3–5 turns       | Context window       | Maintain conversational flow |
| Mid-term   | Daily logs           | `logs/YYYY-MM-DD.md` | Full session history         |
| Long-term  | Structured knowledge | `knowledge/` folders | Curated, reusable info       |
| Buffer     | Working notes        | `scratchpad/`        | High-velocity drafts         |

**Token savings: up to 89%** on targeted retrieval vs. loading full history.

## Installation

### 1. Add the skill to opencode

Copy `SKILL.md` into your opencode skills directory:

```bash
curl -O https://raw.githubusercontent.com/TMFNK/context-manager/main/SKILL.md
```

### 2. Initialize memory in your project

Run the setup script once per project to create the `./context-memory/` folder structure:

```bash
curl -O https://raw.githubusercontent.com/TMFNK/context-manager/main/setup.sh
chmod +x setup.sh
./setup.sh
```

Or clone the repo and run from there:

```bash
git clone https://github.com/TMFNK/context-manager.git
cd your-project
bash ../context-manager/setup.sh
```

> The script is safe to re-run, as it won't overwrite existing knowledge files.

---

## What `setup.sh` Creates

```markdown
./context-memory/
├── INDEX.md # Master knowledge index
├── scratchpad/ # Working drafts and temp notes
├── knowledge/ # Long-term memory
│ ├── concepts/ # Abstract ideas
│ ├── technology/ # APIs, specs
│ ├── workflows/ # Procedures
│ ├── preferences/ # User settings
│ └── tools/ # Tool configs
└── logs/
└── YYYY-MM-DD.md # Daily logs
```

---

## Usage

### Store new knowledge

```bash
cat > ./context-memory/knowledge/technology/example-api.md << EOF
# Example API

## Metadata
- Learned: YYYY-MM-DD
- Importance: ⭐⭐⭐⭐
- Tags: #api #integration

## Summary
Brief description of what was learned.

## Key Details
- Base URL: https://api.example.com/v1
- Auth: Bearer token in headers
'EOF'
```

### Retrieve knowledge

```bash
# Full-text search
grep -r "keyword" ./context-memory/knowledge/

# Semantic search (requires colgrep skill)
colgrep "search query" ./context-memory/
```

### Log a session

```bash
echo "## $(date '+%H:%M') Topic" >> ./context-memory/logs/$(date '+%Y-%m-%d').md
echo "- Key insight here" >> ./context-memory/logs/$(date '+%Y-%m-%d').md
```

### Resume a session

```bash
cat ./context-memory/INDEX.md
tail -30 ./context-memory/logs/$(date '+%Y-%m-%d').md
```

---

## Token Impact

| Approach                  | Est. Tokens | Notes                                                           |
| ------------------------- | ----------- | --------------------------------------------------------------- |
| Full conversation history | 25,000+     | Costly in long sessions                                         |
| Last 5 turns only         | ~2,500      | Loses earlier context                                           |
| Targeted retrieval        | ~500        | Best for specific questions                                     |
| **This skill (typical)**  | **~2,700**  | **~89% savings vs. full history** (estimated, depends on usage) |

---

## Based on

- **[memory-management-skill](https://github.com/huangyixing520-tech/memory-management-skill)**

---

## Maintenance

| Cadence   | Task                                             |
| --------- | ------------------------------------------------ |
| Weekly    | Consolidate duplicates, update `INDEX.md`        |
| Monthly   | Summarize or archive old logs                    |
| As needed | Update entries, add cross-links between concepts |

---

## Compatibility

- ✅ opencode
- 📄 License: GNU General Public License v3.0

---

## Contributing

Issues and PRs welcome.
