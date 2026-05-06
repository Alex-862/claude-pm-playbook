# Claude PM Playbook

A reusable standardisation layer for AI-native product management workflows using Claude Code.

This repository provides:

- Reusable skills
- Reusable agents
- Lightweight workflow standards
- Project templates
- Structured operating patterns

The goal is to help product managers move beyond ad-hoc prompting and towards repeatable, context-driven AI workflows.

---

## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/Alex-862/claude-pm-playbook.git
cd claude-pm-playbook
```

### 2. Install global skills and agents

```bash
bash bootstrap.sh
```

This installs skills and agents into:

```text
~/.claude/skills
~/.claude/agents
```

### 3. Create a new project

#### Discovery project

Use when the problem space is ambiguous, opportunities are still being explored, and discovery or ideation is the focus.

```bash
mkdir my-discovery-project
cd my-discovery-project
git init

bash ~/claude-pm-playbook/bootstrap.sh --type discovery
```

#### Feature optimisation project

Use when an existing feature already exists, current behaviour is understood, metrics and BDD are available, and a known opportunity area exists.

```bash
mkdir my-feature-project
cd my-feature-project
git init

bash ~/claude-pm-playbook/bootstrap.sh --type feature
```

### 4. Open Claude Code

From inside your project folder:

```bash
claude
```

### 5. Run a workflow

Example discovery workflow:

```text
Use the discovery-synthesis skill against:
- business-context/
- discovery/

Write outputs to:
- outputs/discovery-synthesis.md

Do not draft a PRD yet.

Focus on:
- themes
- tensions
- assumptions
- opportunity spaces
- research gaps
```

---

## Overview

Most product teams currently use AI in fragmented ways:

- Drafting PRDs
- Rewriting documents
- Summarising meetings
- Generating acceptance criteria
- Accelerating admin tasks

This playbook is designed to support a more structured approach.

The core idea is:

```text
Reusable workflows
+ structured product context
+ Claude Code
= repeatable AI-native product workflows
```

The repository acts as a standardisation layer.

Each PM or project then adds its own:

- Feature context
- Business context
- Discovery inputs
- Customer insights
- Metrics
- Behavioural specifications

Claude workflows operate over that context to support:

- Discovery
- Opportunity shaping
- PRD generation
- BDD generation
- Specification review
- Prototype generation

---

## Mental Model

This playbook intentionally separates:

| Layer | Purpose |
|---|---|
| Standardisation Layer | Shared skills, agents, templates and workflow patterns |
| Project Context Layer | Product-specific context, strategy, metrics and constraints |
| Outputs Layer | Generated analysis, PRDs, BDD, prototypes and synthesis |

The emphasis is on:

- Structured context
- Repeatability
- Reasoning
- Iteration
- Human judgement

Not autonomous product management.

---

## Repository Structure

```text
agents/
skills/
templates/
bootstrap.sh
README.md
```

---

## Skills

Skills are lightweight reusable workflows that help Claude operate consistently across product tasks.

The repository currently separates skills into:

- Discovery workflows
- Delivery workflows

---

## Delivery Skills

Delivery skills support the definition, refinement, and execution phases of the product lifecycle.

These workflows help product managers:

- Structure intent
- Reduce ambiguity
- Define behaviour clearly
- Critique specifications
- Accelerate handoff into engineering and design workflows

Examples:

- `analyse-feature` — analyse an existing feature, journey, or product area to understand current behaviour, strengths, weaknesses, constraints, and opportunities before proposing change
- `draft-prd` — generate a structured Product Requirements Document using available feature, business, customer, and operational context
- `draft-bdd` — translate product requirements into clear, testable behavioural scenarios focused on system outcomes and customer-visible behaviour
- `spec-review` — review a PRD, feature proposal, or specification for ambiguity, gaps, risk, inconsistency, and implementation concerns

---

## Discovery Skills

Discovery skills support earlier-stage product thinking where problems, opportunities, and customer needs are less clearly defined.

These workflows help product managers:

- Synthesise fragmented signals
- Explore opportunity spaces
- Compare market and competitor patterns
- Identify assumptions and knowledge gaps
- Shape hypotheses before moving into delivery definition

The emphasis is on:

- Exploration
- Synthesis
- Strategic thinking
- Opportunity framing

Not immediate implementation.

Examples:

- `discovery-synthesis` — synthesise customer, business, operational, and market signals into themes, tensions, assumptions, and opportunity areas
- `opportunity-mapping` — compare and structure potential opportunity spaces across customer value, strategic fit, differentiation, feasibility, and risk
- `competitor-analysis` — analyse competitors, challengers, and adjacent experiences to identify market patterns, positioning, convergence, and differentiation opportunities

---

## Shared Skills

Shared skills support workflows that span both discovery and delivery phases.

These workflows help product managers:
- make ideas tangible
- visualise journeys and concepts
- reduce ambiguity
- support discussion and iteration
- evolve thinking across the product lifecycle

Unlike discovery or delivery skills, shared skills are not tied to a single phase of work.

Examples:

- `prototype-concept` — generate lightweight local prototypes that make product ideas tangible enough for exploration, validation, discussion and iteration across both discovery and delivery workflows

---

## Agents

Agents are specialist thinking lenses used to challenge, review or reason about product work.

Current agents:

* discovery-facilitator — supports ambiguous discovery, surfaces assumptions, and prevents premature solutioning
* customer-advocate — challenges whether ideas genuinely solve customer problems
* commercial-strategist — assesses strategic fit, differentiation and commercial value
* risk-reviewer — identifies risk, compliance, customer harm and operational concerns
* delivery-challenger — pressure-tests whether work is clear enough for delivery
* systems-thinker — considers dependencies, data flows, edge cases and unintended consequences

Agents are not intended to duplicate skills. They should not be the main way to generate PRDs, BDD or delivery artefacts. Instead, they provide specialist review and reasoning perspectives.

---

## Project Templates

The repository includes starter templates for common AI-native PM workflows.

---

### Discovery Project Template

Use when:

- The problem space is ambiguous
- Opportunities are still being explored
- Discovery signals need synthesis
- Customer needs are not yet fully understood

Example use cases:

- New product exploration
- Strategic opportunity discovery
- Market expansion ideas
- Early-stage concept shaping

Create a discovery project:

```bash
bash bootstrap.sh --type discovery
```

This creates a starter structure including:

- Business context
- Discovery inputs
- Customer signals
- Opportunity outputs
- Lightweight prototype structure

---

### Feature Optimisation Project Template

Use when:

- An existing feature or journey already exists
- Current behaviour is understood
- Metrics and behavioural context are available
- A known opportunity area exists

Example use cases:

- Onboarding improvements
- Authentication improvements
- Notification preference enhancements
- Feature redesigns

Create a feature optimisation project:

```bash
bash bootstrap.sh --type feature
```

This creates a starter structure including:

- Feature context
- Metrics
- BDD
- Outputs
- Prototype folders

---

## Suggested Workflow

A typical discovery workflow may look like:

```text
Discovery signals
→ synthesis
→ opportunity selection
→ initiative shaping
→ PRD
→ BDD
→ prototype
→ implementation
```

For an existing feature, the workflow may look like:

```text
Current feature context
→ feature analysis
→ scoped initiative
→ PRD
→ BDD
→ prototype
→ implementation
```

---

## Philosophy

This repository is intentionally designed around several principles.

### Structured context matters

Claude performs significantly better when operating over:

- Persistent context
- Clear behavioural expectations
- Structured product information
- Defined constraints

### Human judgement remains essential

The playbook is designed to:

- Augment PM thinking
- Accelerate workflows
- Improve synthesis
- Reduce repetitive work

It is not intended to replace:

- Prioritisation
- Strategic judgement
- Stakeholder management
- Customer understanding

### Discovery and delivery are different

Discovery workflows optimise for:

- Ambiguity
- Synthesis
- Exploration
- Hypothesis generation

Delivery workflows optimise for:

- Clarity
- Behavioural definition
- Implementation readiness
- Specification quality

The playbook intentionally separates these concerns.

---

## Example Project Structures

### Discovery Project

```text
business-context/
discovery/
opportunities/
outputs/
prototype/
```

### Feature Optimisation Project

```text
feature/
business-context/
bdd/
outputs/
prototype/
```

---

## Future Evolution

Potential future enhancements include:

- Jira integrations
- Confluence integrations
- Telemetry ingestion
- Customer research ingestion
- Multi-agent orchestration
- Prototype workflows
- Automated regression validation
- Spec-driven delivery support

---

## Important Notes

- This repository is intended for experimentation and workflow standardisation
- Outputs generated by Claude still require human review and validation
- The workflows are intentionally lightweight and adaptable
- This repository does not prescribe a rigid product development lifecycle

