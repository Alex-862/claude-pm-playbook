#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/Alex-862/claude-pm-playbook.git"
TMP_DIR="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

echo "Setting up AI PM Playbook..."

echo "Cloning playbook..."
git clone --depth 1 "$REPO_URL" "$TMP_DIR" >/dev/null 2>&1

echo "Creating Claude directories..."
mkdir -p "$HOME/.claude/skills"
mkdir -p "$HOME/.claude/agents"

echo "Installing skills..."
cp -R "$TMP_DIR/skills/." "$HOME/.claude/skills/"

echo "Installing agents..."
cp -R "$TMP_DIR/agents/." "$HOME/.claude/agents/"

echo "Creating project docs folders..."
mkdir -p docs/prd
mkdir -p docs/bdd
mkdir -p docs/summaries

if [ ! -f "CLAUDE.md" ]; then
  echo "Adding starter CLAUDE.md to project root..."
  cp "$TMP_DIR/templates/CLAUDE.md" "./CLAUDE.md"
else
  echo "CLAUDE.md already exists in this project, leaving it unchanged."
fi

echo ""
echo "Done."
echo "Next steps:"
echo "1. Run: claude"
echo "2. Try: a skill like /analyse_feature or /draft_prd"