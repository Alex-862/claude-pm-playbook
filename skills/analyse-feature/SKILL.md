---
name: analyse-feature
description: Analyse an existing feature, repo area, or project flow and explain what it does, how it works, and what is unclear.
---

# Analyse Feature

Understand an existing feature or capability before any drafting or solutioning begins.

Use available context such as:
- Relevant files or folders
- Existing code paths
- Docs or notes
- PRDs or tickets
- User-provided feature descriptions

## Agent orchestration

The agent should:
- inspect the relevant files, folders, and flows
- explain the feature in plain English
- identify dependencies, assumptions, and unknowns
- avoid inventing business intent without evidence

## Reasoning process

Before producing the final analysis, the repo-researcher agent should:

1. Identify the most relevant files, folders, docs, and code paths related to the feature
2. Determine what the feature appears to do based on available evidence
3. Separate:
   - explicit evidence
   - reasonable inferences
   - unknowns or missing context
4. Explain:
   - the user journey or flow
   - notable business logic or system behaviour
   - integrations and dependencies
5. Highlight:
   - risks
   - gaps in understanding
   - areas needing further validation
6. Then produce the final analysis

## Output format

Use these headings:

### Feature Summary
What the feature appears to do in plain English

### User Journey / Flow
How the feature works from a user and system perspective

### Key Logic and Behaviours
Important rules, states, or system behaviours observed

### Dependencies
Relevant systems, services, integrations, or files

### Risks / Gaps / Unknowns
What is unclear, missing, or potentially problematic

### Suggested Next Steps
What should be explored or clarified before drafting requirements

## Rules

- Do not invent requirements or business intent
- Be explicit when something is inferred rather than evidenced
- Prefer plain English over technical jargon
- Optimise for a product manager audience
- Do not expose internal reasoning steps in the output