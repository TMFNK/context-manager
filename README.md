# context-manager

> A hybrid memory skill for [opencode](https://opencode.ai), with persistent knowledge storage
> and efficient context management to reduce token usage in long AI sessions.

---

## What It Does

AI agents forget everything between sessions and accumulate tokens fast in long
conversations. `context-manager` solves both with a **3-layer memory architecture**:

| Layer | Scope | Storage | Purpose |
|-------|-------|---------|---------|
| Short-term | Last 3–5 turns | Context window | Maintain conversational flow |
| Mid-term | Daily logs | `logs/YYYY-MM-DD.md` | Full session history |
| Long-term | Structured knowledge | `knowledge/` folders | Curated, reusable info |

**Token savings: up to 89%** on targeted retrieval vs. loading full history.

---

## Installation

### 1. Add the skill to opencode

Copy `SKILL.md` into your opencode skills directory:

```bash
curl -O https://raw.githubusercontent.com/YOUR_USERNAME/context-manager/main/SKILL.md
```

### 2. Initialize memory in your project

Run the setup script once per project to create the `./context-memory/` folder structure:

```bash
curl -O https://raw.githubusercontent.com/YOUR_USERNAME/context-manager/main/setup.sh
chmod +x setup.sh
./setup.sh
```

Or clone the repo and run from there:

```bash
git clone https://github.com/YOUR_USERNAME/context-manager.git
cd your-project
bash ../context-manager/setup.sh
```

> The script is safe to re-run — it won't overwrite existing knowledge files.

---

## What `setup.sh` Creates

```
./context-memory/
├── INDEX.md                  # Master knowledge index
├── knowledge/
│   ├── README.md             # Usage guide
│   ├── concepts/             # Abstract ideas, theories
│   ├── technology/           # APIs, tools, technical specs
│   ├── workflows/            # Procedures and processes
│   ├── preferences/          # User preferences, project settings
│   └── tools/                # Tool configurations
└── logs/
    └── YYYY-MM-DD.md         # Auto-dated daily logs (created at runtime)
```

---

## Usage

### Store new knowledge
```bash
cat > ./context-memory/knowledge/technology/example-api.md << 'EOF'
# Example API

## Metadata
- Learned: 2026-03-27
- Importance: ⭐⭐⭐⭐
- Tags: #api #integration

## Summary
Brief description of what was learned.

## Key Details
- Base URL: https://api.example.com/v1
- Auth: Bearer token in headers
EOF
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

| Approach | Est. Tokens | Notes |
|----------|-------------|-------|
| Full conversation history | 25,000+ | Costly in long sessions |
| Last 5 turns only | ~2,500 | Loses earlier context |
| Targeted retrieval | ~500 | Best for specific questions |
| **This skill (typical)** | **~2,700** | **~89% savings vs. full history** |

---

## Works Well With

- **[colgrep](https://github.com/huangyixiang520-tech/colgrep)** — semantic search across memory files

---

## Maintenance

| Cadence | Task |
|---------|------|
| Weekly | Consolidate duplicates, update `INDEX.md` |
| Monthly | Summarize or archive old logs |
| As needed | Update entries, add cross-links between concepts |

---

## Compatibility

- ✅ opencode
- 📄 License: 
- 👤 Audience: General

---

## Contributing

Issues and PRs welcome.
