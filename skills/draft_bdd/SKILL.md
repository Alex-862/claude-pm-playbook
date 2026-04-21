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

## Instructions

1. Identify the core user journeys and system behaviours
2. Break these into discrete scenarios
3. Write scenarios using Gherkin syntax:
   - Given
   - When
   - Then
4. Cover:
   - Happy paths
   - Edge cases
   - Failure scenarios
5. Ensure scenarios are:
   - Testable
   - Unambiguous
   - Independent where possible

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