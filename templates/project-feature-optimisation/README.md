# Feature Optimisation Project Template

This template is for improving an existing feature or journey.

Use this when there is already a known feature, current behaviour, metrics, and a potential improvement area.

## Structure

- `feature/` — current feature context, metrics and system behaviour
- `business-context/` — wider strategy, customer and risk context
- `bdd/` — current behavioural regression scenarios
- `outputs/` — generated analysis, PRD, BDD and review outputs
- `prototype/` — optional local prototype

## Suggested workflow

1. Complete the feature context files
2. Add baseline BDD for current behaviour
3. Run `analyse_feature`
4. Select and scope an initiative
5. Run `draft_prd`
6. Run `draft_bdd`
7. Run `spec_review`
8. Build a prototype if useful