# AI PM Playbook

A standardised workflow for AI-native product development

This repository contains:
- Shared skills for common PM workflows
- Shared specialist agents
- A bootstrap script to install the playbook into any project
- Starter project templates such as `CLAUDE.md`

## How to use this playbook

- New Project
```bash
mkdir my-project
cd my-project
git init
```
- Existing Project
```bash
git clone <repo-url>
cd <repo-name>
```
- Run the bootstrap script
```bash
curl -sSL https://raw.githubusercontent.com/Alex-862/claude-pm-playbook/main/bootstrap.sh | bash
```
- Start Claude
- Use standard skills and workflows


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
├─ curriculum/          ← PM learning programme (start here if you're new)
├─ bootstrap.sh
└─ README.md
```

## Learning programme

New to Claude Code or AI-native product workflows? Start with the curriculum:

**[curriculum/README.md](curriculum/README.md)** — Overview, executive summary, and module index

| Module | Topic |
|--------|-------|
| [Module 00](curriculum/module-00-mindset.md) | Why this changes everything |
| [Module 01](curriculum/module-01-machine-readiness.md) | Machine setup |
| [Module 02](curriculum/module-02-command-line.md) | Command line basics |
| [Module 03](curriculum/module-03-github.md) | GitHub for PMs |
| [Module 04](curriculum/module-04-markdown.md) | Markdown and structured artefacts |
| [Module 05](curriculum/module-05-claude-code.md) | Claude Code basics |
| [Module 06](curriculum/module-06-agent-workflows.md) | Using the skills in this repo |
| [Module 07](curriculum/module-07-context-management.md) | Context management |
| [Module 08](curriculum/module-08-ai-native-workflow.md) | End-to-end AI-native workflow |
| [Workshop](curriculum/workshop-end-to-end.md) | Hands-on end-to-end workshop |

Supporting documents: [Setup Guide](curriculum/setup-guide-mac.md) · [Governance](curriculum/governance-and-guardrails.md) · [Adoption Plan](curriculum/adoption-plan.md) · [Glossary](curriculum/glossary.md)
