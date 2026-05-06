---
name: spec-review
description: Critically review a PRD, feature, or proposal to identify gaps, risks, ambiguities, and missing requirements.
---

# Spec Review

Critically assess the current feature, PRD, or proposal.

Your goal is not to restate the spec — it is to challenge it.

Use available context such as:
- PRDs
- Feature analysis
- Existing flows or logic
- User input
- Relevant code or documentation where available

## Agent orchestration

Use the **requirements-critic** agent to perform the review.

The agent should:
- challenge assumptions
- identify missing or incomplete requirements
- surface ambiguity, contradictions, and unresolved decisions
- prioritise high-impact risks and gaps over minor issues

## Reasoning process

Before producing the final review, the requirements-critic agent should:

1. Identify the explicit requirements stated in the spec
2. Identify the implicit requirements needed for the feature to work coherently and safely
3. Check for:
   - missing requirements
   - contradictory statements
   - ambiguous logic
   - unowned decisions
   - missing edge cases
   - failure scenarios not addressed
4. Evaluate the spec across these lenses:
   - customer experience
   - operational handling
   - technical integration
   - fraud / abuse risk
   - compliance / policy considerations where relevant
   - testability
5. Prioritise the most material issues first
6. Then produce the final critique

## Output structure

### Executive Summary
- High-level assessment of spec quality

### Key Gaps
- Missing or incomplete requirements

### Risks
- Technical, operational, fraud, compliance

### Ambiguities
- Areas that could be interpreted multiple ways

### Missing Edge Cases
- Important scenarios not covered

### Recommendations
- Specific improvements to make

### Questions to Resolve
- Clear list of open questions

## Rules

- Be direct and candid — do not soften critique unnecessarily
- Do not assume intent — challenge unclear areas
- Prioritise high-impact issues over minor details
- Avoid rewriting the entire PRD — focus on critique
- Be explicit when something is inferred rather than evidenced
- Do not expose internal reasoning steps in the output