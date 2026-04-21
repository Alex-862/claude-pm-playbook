# AI PM Playbook

A reusable Claude Code playbook for product managers.

This repository contains:
- Shared skills for common PM workflows
- Shared specialist agents
- A bootstrap script to install the playbook into any project
- Starter project templates such as `CLAUDE.md`

## Included skills

- `analyse_feature` — understand an existing feature, journey, or codebase area before drafting anything
- `draft_prd` — generate a structured Product Requirements Document from available context
- `draft_bdd` — convert requirements into clear, testable BDD scenarios
- `spec_review` — critique a PRD, feature, or proposal for gaps, ambiguity, and risk

## Included agents

- `repo-researcher` — explores a repository and explains it in plain English
- `requirements-critic` — identifies gaps, ambiguity, and missing requirements
- `bdd-writer` — converts requirements into precise Gherkin scenarios

## Repository structure

```text
.
├─ agents/
├─ skills/
├─ templates/
├─ bootstrap.sh
└─ README.md

## How to use this playbook

- New Project
mkdir my-project
cd my-project
git init

- Existing Project
git clone <repo-url>
cd <repo-name>

- Run the bootstrap script
curl -sSL https://raw.githubusercontent.com/Alex-862/claude-pm-playbook/main/bootstrap.sh | bash

- Start Claude
- Use standard skills and workflows

