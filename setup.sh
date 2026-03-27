#!/usr/bin/env bash
# Context Manager - Setup Script
# Creates the directory structure and initial files for the hybrid memory system
# Version: 1.2 (Safety Update)

set -e

# Allow custom memory directory via argument (default: ./context-memory)
MEMORY_DIR="${1:-./context-memory}"

echo "🚀 Setting up Context Manager memory system..."

# Create directory structure
mkdir -p "$MEMORY_DIR/knowledge/concepts"
mkdir -p "$MEMORY_DIR/knowledge/technology"
mkdir -p "$MEMORY_DIR/knowledge/workflows"
mkdir -p "$MEMORY_DIR/knowledge/preferences"
mkdir -p "$MEMORY_DIR/knowledge/tools"
mkdir -p "$MEMORY_DIR/logs"
mkdir -p "$MEMORY_DIR/scratchpad" # Added: for temporary/high-velocity notes

# Create master INDEX.md (Safety check added)
if [ ! -f "$MEMORY_DIR/INDEX.md" ]; then
cat > "$MEMORY_DIR/INDEX.md" << 'EOF'
# Context Memory Index

## Overview
Master index for all stored knowledge and conversation history.

## Knowledge Categories
- `knowledge/concepts/`     — Abstract concepts and theories
- `knowledge/technology/`   — APIs, libraries, tools, technical specs
- `knowledge/workflows/`    — Procedures and best practices
- `knowledge/preferences/`  — User preferences and project settings
- `knowledge/tools/`        — Tool configurations and usage patterns
- `scratchpad/`             — Temporary notes and high-velocity drafts

## Daily Logs
- `logs/YYYY-MM-DD.md` — Conversation history (one file per day)

## Quick Search
Use `grep -r "keyword" ./context-memory/` or the `colgrep` skill for semantic search.

---
*Initialized with context-manager skill — $(date '+%Y-%m-%d')*
EOF
echo "✅ Created INDEX.md"
else
echo "⚠️  INDEX.md already exists. Skipping to prevent overwriting."
fi

# Create knowledge base README (Safety check added)
if [ ! -f "$MEMORY_DIR/knowledge/README.md" ]; then
cat > "$MEMORY_DIR/knowledge/README.md" << 'EOF'
# Knowledge Base

Structured long-term memory for the AI agent.

Follow the templates provided in **SKILL.md** for consistent formatting.

## Categories
- **concepts/** — Ideas, theories, principles
- **technology/** — Technical knowledge, APIs, specifications
- **workflows/** — Processes and repeatable procedures
- **preferences/** — User preferences and project-specific rules
- **tools/** — Tool usage patterns and configurations

## Best Practices
- Always add clear metadata (Learned date, Importance, Tags)
- Keep summaries concise
- Link related entries using `[[filename]]`
- Update INDEX.md when adding important new knowledge

Memory system ready.
EOF
echo "✅ Created knowledge/README.md"
else
echo "⚠️  knowledge/README.md already exists. Skipping."
fi

echo "✅ Directory structure updated at: $MEMORY_DIR/"
echo ""
echo "Memory system is now ready!"
echo "Next step: Use the 'context-manager' skill to store and retrieve knowledge."