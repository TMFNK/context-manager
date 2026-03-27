---
name: context-manager
description: "Hybrid memory system for AI agents. Stores learned knowledge persistently and manages conversation context efficiently to reduce token usage. Use when: storing important information between sessions, retrieving previously learned concepts, maintaining user preferences, or optimizing token consumption in long conversations."
license: MIT
compatibility: opencode
metadata:
  audience: general
  use_case: knowledge management, context optimization
---

# Context Manager Skill

A clean, file-based hybrid memory system that combines **long-term structured knowledge** with **daily conversation logs** to dramatically reduce token usage while preserving context.

## Problem

- Token bloat from growing conversation history
- Important knowledge gets lost between sessions
- Repeated explanations waste tokens
- Hitting context window limits in long projects

## Solution

**3-Layer Memory Architecture:**

| Layer       | Scope              | Storage                        | Purpose                          |
|-------------|--------------------|--------------------------------|----------------------------------|
| Short-term  | Last 3–5 turns     | Context window                 | Conversation flow                |
| Mid-term    | Current day        | `logs/YYYY-MM-DD.md`           | Full daily history               |
| Long-term   | Permanent knowledge| `knowledge/` (structured)      | Curated, searchable insights     |

## Storage Location

All files are stored relative to your project:

```
./context-memory/
├── knowledge/                  # Long-term structured knowledge
│   ├── concepts/
│   ├── technology/
│   ├── workflows/
│   ├── preferences/
│   └── tools/
├── logs/                       # Daily conversation logs
│   └── YYYY-MM-DD.md
└── INDEX.md                    # Master index
```

## Installation

Run the setup script once:

```bash
curl -O https://raw.githubusercontent.com/TMFNK/context-manager/main/setup.sh
chmod +x setup.sh
./setup.sh
```
Or with a custom path:

```bash
./setup.sh ./my-memory-folder
```

## Workflow
### 1. Storing New Knowledge
```bash
# Example: Store technical knowledge
cat > ./context-memory/knowledge/technology/openai-api.md << 'EOF'
# OpenAI API Best Practices

## Metadata
- **Learned**: $(date '+%Y-%m-%d')
- **Source**: User conversation
- **Importance**: ⭐⭐⭐⭐
- **Tags**: #api #llm #best-practices

## Summary
Key guidelines for efficient API usage...

## Details
- Use streaming when possible
- ...

## Related
- [[token-optimization]]
EOF
```

### 2. Retrieving Knowledge

```bash
# Semantic or keyword search
colgrep "authentication" ./context-memory/
grep -r "token optimization" ./context-memory/knowledge/

# Read a file
cat ./context-memory/knowledge/technology/openai-api.md
```

###3. Daily Logging (optional manual)

```bash
echo "## $$   (date '+%H:%M') - Topic" >> ./context-memory/logs/   $$(date '+%Y-%m-%d').md
echo "- User: ..." >> ./context-memory/logs/$(date '+%Y-%m-%d').md
```

## File Templates

(Kept clean and improved — same high-quality templates as before, with better placeholders)

### Knowledge Entry Template

```markdown
# [Clear Title]

## Metadata
- **Learned**: YYYY-MM-DD
- **Source**: [conversation / documentation]
- **Importance**: ⭐⭐⭐ (1–5)
- **Tags**: #tag1 #tag2
- **Updated**: YYYY-MM-DD

## Summary
Concise 1–3 sentence overview.

## Details
Detailed explanation...

## Key Takeaways
- Bullet 1
- Bullet 2

## Related
- [[related-file.md]]
```

## Daily Log Entry
```markdown

## HH:MM Topic
- **User**: Summary of user input
- **AI**: Summary of response
- **Key Points**: Important insights learned
```

## Integration

Works great together with:
- colgrep: semantic search across memory
- spreadsheet: structured data tables
- humanizer: polishing final outputs

## Troubleshooting

- Knowledge not found? → Check INDEX.md and use grep / colgrep
- Storage too large? → Weekly review + consolidate old logs
- Dates wrong? → Make sure your system date is correct
