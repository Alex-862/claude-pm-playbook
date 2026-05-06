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


## Delivery Skills

Delivery skills are intended to support the definition, refinement, and execution phases of the product lifecycle.

These workflows help product managers:
- structure intent
- reduce ambiguity
- define behaviour clearly
- critique specifications
- accelerate handoff into engineering and design workflows

Examples:

- `analyse_feature` — analyse an existing feature, journey, or product area to understand current behaviour, strengths, weaknesses, constraints, and opportunities before proposing change
- `draft_prd` — generate a structured Product Requirements Document using available feature, business, customer, and operational context
- `draft_bdd` — translate product requirements into clear, testable behavioural scenarios focused on system outcomes and customer-visible behaviour
- `spec_review` — review a PRD, feature proposal, or specification for ambiguity, gaps, risk, inconsistency, and implementation concerns

---

## Discovery Skills

Discovery skills are intended to support earlier-stage product thinking where problems, opportunities, and customer needs are less clearly defined.

These workflows help product managers:
- synthesise fragmented signals
- explore opportunity spaces
- compare market and competitor patterns
- identify assumptions and knowledge gaps
- shape hypotheses before moving into delivery definition

The emphasis is on:
- exploration
- synthesis
- strategic thinking
- opportunity framing

Not immediate implementation.

Examples:

- `discovery_synthesis` — synthesise customer, business, operational, and market signals into themes, tensions, assumptions, and opportunity areas
- `opportunity_mapping` — compare and structure potential opportunity spaces across customer value, strategic fit, differentiation, feasibility, and risk
- `competitor_analysis` — analyse competitors, challengers, and adjacent experiences to identify market patterns, positioning, convergence, and differentiation opportunities

These workflows are intentionally exploratory and are designed to support product discovery before PRD generation.

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
