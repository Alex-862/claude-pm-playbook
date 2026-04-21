---
name: draft_bdd
description: Convert a PRD, feature description or analysis into clear, testable BDD scenarios using Gherkin format.
---

# Draft BDD

Convert the feature requirements into structured, testable BDD scenarios.

Use available context such as:
- PRDs (preferred & critical as it will contain business rules and logic)
- Feature analysis
- Existing flows or logic
- User input

## Agent orchestration

Use the **bdd-writer** agent to generate the scenarios.

The agent should:
- specialise in writing precise, testable Gherkin
- ensure strong scenario coverage
- avoid ambiguity and vague language

## Instructions

Before producing the final scenarios, the bdd-writer agent should:

1. Identify the core user journeys and system behaviours
2. Decompose each journey into discrete, testable behaviours
3. Identify:
   - Happy paths
   - Edge cases
   - Validation failures
   - System failures
   - User misuse or unexpected behaviour
4. Ensure each scenario represents a single behaviour
5. Validate that each scenario is independently testable

Then generate the final BDD output.

## Output structure

### Feature: <feature name>

#### Background (if needed)
Shared setup across scenarios

#### Scenarios

Use format:

Scenario: <short description>
  Given <initial context>
  And <additional context>
  When <action>
  Then <expected outcome>

## Coverage expectations

Include:
- Primary success path
- Validation errors
- System failures (timeouts, API errors etc.)
- User behaviour variations
- Security / fraud-related edge cases (where relevant)

## Output location

Save to:
docs/bdd/<feature-name>.feature

## Rules

- Use consistent terminology from the PRD or system
- Avoid vague language (e.g. “works correctly”)
- Each scenario should test one behaviour
- Do not combine multiple outcomes into one scenario
- Prefer more smaller scenarios over fewer complex ones
- Do not expose internal reasoning steps in the output