#!/bin/bash
# Context Manager - Setup Script
# Creates the directory structure for the memory system

set -e

MEMORY_DIR="./context-memory"

echo "Setting up Context Manager memory system..."

# Create main directories
mkdir -p "$MEMORY_DIR/knowledge/concepts"
mkdir -p "$MEMORY_DIR/knowledge/technology"
mkdir -p "$MEMORY_DIR/knowledge/workflows"
mkdir -p "$MEMORY_DIR/knowledge/preferences"
mkdir -p "$MEMORY_DIR/knowledge/tools"
mkdir -p "$MEMORY_DIR/logs"

# Create INDEX.md
cat > "$MEMORY_DIR/INDEX.md" << 'EOF'
# Context Memory Index

## Overview
This is the master index for stored knowledge and conversation context.

## Knowledge Categories
- `knowledge/concepts/` - Abstract concepts and theories
- `knowledge/technology/` - APIs, tools, technical specifications
- `knowledge/workflows/` - Procedures and processes
- `knowledge/preferences/` - User preferences and settings
- `knowledge/tools/` - Tool configurations

## Logs
- `logs/YYYY-MM-DD.md` - Daily conversation logs

## Search
Use `grep` or `colgrep` to search across all memory files.

---
*System initialized via context-manager skill*
EOF

# Create knowledge base README
cat > "$MEMORY_DIR/knowledge/README.md" << 'EOF'
# Knowledge Base

Structured storage for all learned content. Follow the templates in SKILL.md for consistent formatting.

## Categories
- **concepts/** - Abstract concepts, theories, principles
- **technology/** - APIs, libraries, tools, technical specs
- **workflows/** - Procedures, processes, best practices
- **preferences/** - User preferences, project settings
- **tools/** - Tool configurations and usage patterns

## Adding Knowledge
1. Choose appropriate category folder
2. Create new .md file with metadata header
3. Use consistent formatting (see SKILL.md templates)
4. Add entry to INDEX.md
EOF

echo "✓ Created directory structure at $MEMORY_DIR/"
echo "✓ Created INDEX.md and knowledge README"
echo ""
echo "Memory system ready. Use the context-manager skill to store and retrieve knowledge."