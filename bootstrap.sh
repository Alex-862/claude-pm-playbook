#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CLAUDE_DIR="$HOME/.claude"
AGENTS_TARGET="$CLAUDE_DIR/agents"
SKILLS_TARGET="$CLAUDE_DIR/skills"

echo "Installing Claude PM Playbook..."

mkdir -p "$AGENTS_TARGET"
mkdir -p "$SKILLS_TARGET"

echo "Syncing agents..."

if [ -d "$SCRIPT_DIR/agents" ]; then
  for agent in "$SCRIPT_DIR/agents"/*; do
    [ -d "$agent" ] || continue
    name="$(basename "$agent")"
    rm -rf "$AGENTS_TARGET/$name"
    cp -R "$agent" "$AGENTS_TARGET/$name"
    echo "  installed agent: $name"
  done
fi

echo "Syncing skills..."

if [ -d "$SCRIPT_DIR/skills" ]; then
  for skill in "$SCRIPT_DIR/skills"/*; do
    [ -d "$skill" ] || continue
    name="$(basename "$skill")"
    rm -rf "$SKILLS_TARGET/$name"
    cp -R "$skill" "$SKILLS_TARGET/$name"
    echo "  installed skill: $name"
  done
fi

if [ "$1" = "--type" ] && [ "$2" = "discovery" ]; then
  echo "Creating discovery project structure..."

  if [ ! -d "$SCRIPT_DIR/templates/project-discovery" ]; then
    echo "Error: discovery template not found."
    exit 1
  fi

  cp -R "$SCRIPT_DIR/templates/project-discovery/"* .
  echo "Discovery project template created"

elif [ "$1" = "--type" ] && [ "$2" = "feature" ]; then
  echo "Creating feature optimisation project structure..."

  if [ ! -d "$SCRIPT_DIR/templates/project-feature-optimisation" ]; then
    echo "Error: feature optimisation template not found."
    exit 1
  fi

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