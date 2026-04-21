# AI PM Playbook Context

## Purpose
This project uses the AI PM Playbook to support product management workflows in Claude Code.

The goal is to help product managers analyse features, draft requirements, review specifications and generate BDD scenarios in a structured and repeatable way.

## Audience
Outputs should be written so they are understandable by:
- Product managers
- Engineers
- Designers
- Delivery leads
- Risk / compliance stakeholders where relevant

## Document locations
Store generated artefacts in these locations:

- PRDs: /docs/prd
- BDD scenarios: /docs/bdd
- Supporting summaries or notes: /docs/summaries

## Core principles
- Prefer clarity over verbosity
- Do not invent requirements, business rules, or customer intent
- Be explicit when something is assumed or inferred
- Use the terminology already present in the project where possible
- Surface ambiguity rather than smoothing over it
- Optimise for structured, reusable outputs

## Expectations by artefact type

### Feature analysis
- Explain what exists today in plain English
- Identify flows, dependencies, gaps, and risks
- Highlight what is unclear

### PRDs
- Include problem, success metrics, scope, journeys, business logic & requirements, dependencies, risks and open questions
- Write requirements so they can later be converted into BDD

### BDD
- Use Gherkin format
- Cover happy paths, validation, failure scenarios, and edge cases
- Keep scenarios precise and testable

### Spec reviews
- Critique rather than restate
- Prioritise high-impact gaps, ambiguities, and risks
- Highlight missing edge cases and unclear logic

## Guardrails
- Treat generated content as draft output unless reviewed by a human
- Do not assume compliance, fraud, operational, or technical constraints are satisfied unless stated
- Call out where additional stakeholder input or validation is needed