---
name: spec_review
description: Critically review a PRD (scope/proposal) to identify gaps, risks, ambiguities, and missing requirements.
---

# Spec Review

Critically assess the PRD or proposal.

Your goal is not to restate the spec, it is to challenge it.

## Instructions

1. Review all available context:
   - PRDs
   - Feature analysis
   - Existing code or flows
   - User input

2. Identify:
   - Missing requirements
   - Ambiguities or unclear logic
   - Contradictions
   - Edge cases not covered
   - Failure scenarios not addressed
   - Dependencies and integration risks

3. Evaluate:
   - Testability (can this be turned into BDD?)
   - Operational impact
   - Fraud / compliance considerations (where relevant)
   - Customer experience risks

4. Suggest improvements:
   - What should be clarified or added
   - Where structure or wording should change
   - What decisions need to be made

## Output structure

### Executive Summary
- High-level assessment of spec quality

### Key Gaps
- Missing or incomplete requirements

### Risks
- Technical, operational, fraud, compliance

### Ambiguities
- Areas that could be interpreted multiple ways

### Edge Cases Missing
- Important scenarios not covered

### Recommendations
- Specific improvements to make

### Questions to Resolve
- Clear list of open questions

## Rules

- Be direct and candid - do not soften critique unnecessarily
- Do not assume intent - challenge unclear areas
- Prioritise high-impact issues over minor details
- Avoid rewriting the entire PRD - focus on critique