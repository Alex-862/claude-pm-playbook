# PM Curriculum: AI-Native Product Development with Claude Code

## Executive Summary

### For Leadership: Why This Matters

Engineering teams across financial services are already working with AI-assisted development tools — Claude, Copilot, Windsurf, and spec-driven development workflows are becoming standard practice. The quality of what those tools produce is directly constrained by the quality of the product context fed into them.

If Product Managers continue to express requirements in unstructured prose, slide decks, and fragmented Jira comments, the AI-assisted engineering pipeline has nothing coherent to work with. The bottleneck moves upstream — to product.

This curriculum exists to fix that bottleneck.

### Why Product Needs to Keep Pace with Engineering

AI-assisted engineering is not a future capability — it is happening now. Engineers using Claude Code or Copilot can turn a well-structured specification into tested, reviewed code far faster than before. But the word *well-structured* is doing a lot of work in that sentence.

A PRD written in a Google Doc, emailed around for comments, and summarised in a Jira ticket is not well-structured for an AI agent. It lacks precision, traceability, version history, and machine-readable format. It is designed for humans reading linearly, not AI systems reasoning about requirements.

Product Managers who learn to express their thinking in structured, version-controlled, AI-readable artefacts become a force multiplier for their engineering teams. Those who do not become an increasingly visible bottleneck.

### Why GitHub as a Product Knowledge Base is Valuable

GitHub is not just where code lives. It is a structured, version-controlled system for managing any kind of text-based artefact — including product requirements, decisions, context, and workflows.

When product artefacts live in GitHub:

- Every change is tracked, with who made it and why
- Requirements are co-located with the codebase they describe
- AI agents can read, reason about, and transform them directly
- The full history of a decision is available for audit, not buried in email chains
- Teams work from a single source of truth, not competing document versions

For a regulated financial services organisation, this is not just about efficiency. It is about governance, auditability, and defensibility. A product decision recorded in a version-controlled repository is traceable in a way that a Confluence page last edited by an unknown contributor three years ago is not.

### How This Supports AI-Native Product Development

The thesis of this curriculum is simple:

> **Product Managers do not need to become developers. They need to become fluent enough in structured artefacts, context management, and agentic workflows that their product thinking can be used directly by AI-assisted engineering.**

This repository contains a set of AI skills built specifically for Product Managers: tools to analyse features, draft PRDs, generate BDD scenarios, and run spec reviews — all from the command line, against a version-controlled knowledge base.

Learning to use these tools is not about learning to code. It is about learning to think in a structured way that machines can act on.

---

## Curriculum Overview

This curriculum is split into nine modules plus a hands-on workshop. It takes a Product Manager from no terminal experience to confidently running AI-native product workflows.

| Module | Title | Estimated Time |
|--------|-------|----------------|
| [00](module-00-mindset.md) | Mindset Shift: Why This Changes Everything | 1 hour |
| [01](module-01-machine-readiness.md) | Machine Readiness | 2 hours |
| [02](module-02-command-line.md) | Command Line Foundations | 2 hours |
| [03](module-03-github.md) | GitHub and Repo Basics for PMs | 2 hours |
| [04](module-04-markdown.md) | Markdown and Structured Artefacts | 1.5 hours |
| [05](module-05-claude-code.md) | Claude Code Basics | 2 hours |
| [06](module-06-agent-workflows.md) | Using the PM Skills in This Repo | 2 hours |
| [07](module-07-context-management.md) | Context Management and Integrations | 2 hours |
| [08](module-08-ai-native-workflow.md) | AI-Native Workflow End to End | 2 hours |
| Workshop | [End-to-End Hands-On Workshop](workshop-end-to-end.md) | Half day |

**Total estimated learning time**: 18–20 hours across sessions, plus ongoing practice.

---

## Supporting Documents

| Document | Purpose |
|----------|---------|
| [Setup Guide (Mac)](setup-guide-mac.md) | Step-by-step terminal setup for non-technical PMs |
| [GitHub as a Knowledge Base](github-as-knowledge-base.md) | Positioning GitHub for product teams |
| [Governance and Guardrails](governance-and-guardrails.md) | Data handling, compliance, secrets for UK FS |
| [Adoption Plan](adoption-plan.md) | Rollout plan for a product organisation |
| [Glossary](glossary.md) | Plain-English definitions of all key terms |

---

## Repository Structure

```
claude-pm-playbook/
├── README.md                  — Main project readme
├── bootstrap.sh               — One-command setup script
├── agents/                    — Specialist AI agents
│   ├── repo-researcher.md
│   ├── requirements-critic.md
│   └── bdd-writer.md
├── skills/                    — PM workflow skills
│   ├── analyse_feature/
│   ├── draft_prd/
│   ├── draft_bdd/
│   └── spec_review/
├── templates/                 — Starter templates for new projects
│   ├── CLAUDE.md
│   └── docs/
│       ├── prd/
│       ├── bdd/
│       └── summaries/
└── curriculum/                — This learning programme
    ├── README.md
    ├── module-00 through module-08
    ├── workshop-end-to-end.md
    ├── setup-guide-mac.md
    ├── governance-and-guardrails.md
    ├── adoption-plan.md
    ├── github-as-knowledge-base.md
    ├── glossary.md
    └── examples/
```

---

## Who This Is For

This curriculum is designed for Product Managers who:

- Are comfortable with Google Docs, Jira, and Confluence
- Use AI tools like Gemini or ChatGPT as a chatbot, but haven't used agentic AI
- Have little or no experience with terminal, Git, or GitHub
- Work in or alongside engineering teams experimenting with AI-assisted development
- Are motivated to improve how they express and structure product thinking

It is **not** designed to teach PMs to write code, manage infrastructure, or become engineers. The goal is structured, high-quality product artefacts that can be read, critiqued, and transformed by AI agents.

---

## How to Use This Curriculum

**As an individual learner**: Work through modules in order. Each module builds on the previous one. The workshop at the end is designed to be done with a real feature idea you are working on.

**As a team lead or facilitator**: Use the [Adoption Plan](adoption-plan.md) to design your rollout. Run Module 00 as a team session first to align on why this matters before diving into the technical setup.

**As a champion or coach**: Focus on Modules 05–08 and the workshop. The earlier modules can be self-served. Your value is in supporting people through their first real workflow.

**Start here if you have not set up your machine**: [Setup Guide for Mac](setup-guide-mac.md)
