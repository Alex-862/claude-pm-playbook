---
name: draft-prd
description: Generate a structured Product Requirements Document from available context such as repo files, notes, or prior analysis.
---

# Draft PRD

Create a clear, structured Product Requirements Document (PRD) based on available context.

This may include:
- Feature analysis
- Existing code or flows
- Notes or prompts from the user
- Prior outputs (e.g. from analyse-feature)

## Instructions

1. Use all available context to infer the feature scope
2. Do not invent business requirements — clearly label assumptions
3. Optimise for clarity and completeness without unnecessary verbosity
4. Write for a cross-functional audience (PM, engineering, design, risk)

## Output structure

Use the following sections:

### 1. Introduction & Background
- What problem are we solving?
- Who is affected?

### 2. Objectives & Success Metrics
- Define measurable outcomes (e.g. conversion rate, success rate, latency)

### 3. Customer/User Journey
- Step-by-step flows
- Include variations if relevant

### 4. Scope
- What is included
- What is explicitly out of scope

### 5. Business Rules & Logic
- These plain-English rules define the system behaviour. 
- Avoid vague language
- Follow Trigger, Happy Path, Unhappy Path structure

### 6. Design & UX Requirements
- Any constraints, considerations or non-negotiables for design and UX

### 7. Assumptions, Dependencies & Risk
- Systems, teams, third parties

### 8. Key Stakeholder Guardrails
- Technical, operational, fraud, compliance

### 9. Monitoring, Tracking & Alerting
- data flakes, dashbaords, alerts (thresholds)

## Output location

Save the PRD to:
docs/prd/<feature-name>.md

## Rules

- Be explicit about uncertainty
- Prefer structured bullet points over long paragraphs
- Do not assume implementation details unless clearly implied
- If context is missing, call it out rather than guessing