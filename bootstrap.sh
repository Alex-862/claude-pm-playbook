#!/usr/bin/env bash
set -e

PLAYBOOK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up AI PM Playbook..."

echo "Creating Claude directories..."
mkdir -p "$HOME/.claude/skills"
mkdir -p "$HOME/.claude/agents"

echo "Installing skills..."
cp -R "$PLAYBOOK_DIR/skills/." "$HOME/.claude/skills/"

echo "Installing agents..."
cp -R "$PLAYBOOK_DIR/agents/." "$HOME/.claude/agents/"

echo "Creating project docs folders..."
mkdir -p docs/prd
mkdir -p docs/bdd
mkdir -p docs/summaries

if [ ! -f "CLAUDE.md" ]; then
  echo "Adding starter CLAUDE.md to project root..."
  cp "$PLAYBOOK_DIR/templates/CLAUDE.md" "./CLAUDE.md"
else
  echo "CLAUDE.md already exists in this project, leaving it unchanged."
fi

echo ""
echo "Done."
echo "Next steps:"
echo "1. Run: claude"
echo "2. Try: /analyse_feature or /draft_prd"