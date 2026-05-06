#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing Claude PM Playbook..."

mkdir -p ~/.claude/agents
mkdir -p ~/.claude/skills

if [ -d "$SCRIPT_DIR/agents" ]; then
  cp -R "$SCRIPT_DIR/agents/"* ~/.claude/agents/
  echo "Installed agents"
fi

if [ -d "$SCRIPT_DIR/skills" ]; then
  cp -R "$SCRIPT_DIR/skills/"* ~/.claude/skills/
  echo "Installed skills"
fi

if [ "$1" = "--type" ] && [ "$2" = "discovery" ]; then
  echo "Creating discovery project structure..."
  cp -R "$SCRIPT_DIR/templates/project-discovery/"* .
  echo "Discovery project template created"

elif [ "$1" = "--type" ] && [ "$2" = "feature" ]; then
  echo "Creating feature optimisation project structure..."
  cp -R "$SCRIPT_DIR/templates/project-feature-optimisation/"* .
  echo "Feature optimisation project template created"

else
  echo "No project template selected"
  echo ""
  echo "Usage:"
  echo "  bash bootstrap.sh --type discovery"
  echo "  bash bootstrap.sh --type feature"
fi

echo "Done."