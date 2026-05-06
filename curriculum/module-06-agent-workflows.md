# Module 06: Using the PM Skills in This Repo

## Learning Objective

Use each of the four skills in this playbook — `analyse-feature`, `draft-prd`, `draft-bdd`, and `spec-review` — to produce useful product artefacts from real context.

## Why It Matters for PMs

These four skills are the core PM workflows in this repo. Together, they cover the upstream product work that feeds directly into AI-assisted engineering: understand the feature, write the requirements, generate testable scenarios, and critique the result.

This module is primarily practical. It builds directly on Module 05 (Claude Code basics). By the end, you will have used all four skills against a real or realistic feature.

---

## The Four Skills and How They Connect

These skills are designed to be used in sequence:

```
1. /analyse-feature    →    understand what exists (or what is proposed)
2. /draft-prd          →    write structured requirements
3. /draft-bdd          →    generate testable scenarios from the PRD
4. /spec-review        →    critically assess the PRD or BDD before handoff
```

You do not always need to run all four. If you already have a PRD, start at `/draft-bdd`. If you want to critique an existing spec, start at `/spec-review`. But understanding the full flow is important.

---

## Skill 1: `/analyse-feature`

### What It Does

`analyse-feature` explores an existing feature — in code, in documents, or in a mix of both — and produces a structured summary that a PM can use as the foundation for a PRD.

It is backed by the `repo-researcher` agent, which reads files and reasons about what the feature does, how it works, where it is unclear, and what risks exist.

### When to Use It

- When picking up a feature you have not previously worked on
- When auditing what a feature *actually* does vs what the docs say it does
- When onboarding to a new area of the product
- As the first step before writing a PRD for an existing feature

### What to Give It

The more specific you are, the better the output:

```
/analyse-feature

Feature: Customer address update
Relevant files: src/customers/address.js, docs/summaries/address-flow.md
Context: We want to add self-service address updates via mobile. Currently this is call-centre only.
Questions I want answered:
- What validation currently happens on address updates?
- What downstream systems are notified?
- Where are the fraud or compliance checks?
```

### What It Produces

A structured analysis with:
- Feature summary
- User journey / flow
- Key logic and behaviours
- Dependencies
- Risks, gaps, and unknowns
- Suggested next steps

This becomes your input for `draft-prd`.

---

## Skill 2: `/draft-prd`

### What It Does

`draft-prd` generates a structured PRD from your context. It pulls together feature analysis, notes, and your input to produce a well-structured requirements document.

It saves the output to `docs/prd/<feature-name>.md`.

### When to Use It

- After running `analyse-feature` and having a summary to work from
- When starting a new feature and you want to structure your thinking
- When you need to turn rough notes and stakeholder input into a formal document

### What to Give It

The PRD skill benefits enormously from specific input. Before running it, write down:

- What the feature is and why it is being built
- Who the users are (customer, staff, admin)
- The happy path steps
- Key edge cases or failure modes you know about
- Any compliance, fraud, or operational constraints
- What is explicitly out of scope
- Open questions you cannot yet answer

Example:

```
/draft-prd

Feature: Self-service address update for retail customers via mobile app

Context:
- Currently address changes require a call-centre call
- We want customers to be able to update home address via the mobile app
- Identity re-verification required if account is less than 30 days old (compliance)
- Address verification API is async — cannot block the UI (engineering constraint)
- PO boxes are not accepted as a home address
- Out of scope: business customers, joint accounts, international addresses

User: Authenticated retail customer using iOS or Android mobile app

Open questions:
- Does the customer receive a confirmation letter, or is email sufficient?
- What is the max number of address changes allowed per year?
```

### What It Produces

A complete PRD in `docs/prd/` with sections covering:
- Introduction and background
- Objectives and success metrics
- User journey (happy and unhappy paths)
- Scope
- Business rules and logic
- Design and UX requirements
- Assumptions, dependencies, and risks
- Monitoring and alerting

**Always review and edit the PRD before passing it to `draft-bdd`.** The quality of your BDD scenarios depends directly on the quality of your PRD.

---

## Skill 3: `/draft-bdd`

### What It Does

`draft-bdd` converts a PRD into BDD (Behaviour-Driven Development) scenarios in Gherkin format. These scenarios describe the expected behaviour of a feature in a structured, testable way.

It is backed by the `bdd-writer` agent, which reads the PRD and generates scenarios covering happy paths, edge cases, validation errors, system failures, and fraud/abuse cases.

The output is saved to `docs/bdd/<feature-name>.feature`.

### When to Use It

- After a PRD has been reviewed and you are ready to move toward engineering handoff
- When you want to use BDD scenarios to validate that everyone agrees on the expected behaviour
- When the engineering or QA team has asked for formal acceptance criteria

### What Gherkin Looks Like

Gherkin is a simple, structured language for describing software behaviour. It uses plain English with a specific structure:

```gherkin
Feature: Self-service address update

  Scenario: Customer successfully updates their home address
    Given I am an authenticated retail customer on the mobile app
    And my account is more than 30 days old
    When I navigate to "Update Address" in my profile settings
    And I enter a valid UK home address
    And I confirm the update
    Then my address is updated in the system
    And I receive a confirmation email

  Scenario: Customer under 30 days old is required to re-verify
    Given I am an authenticated retail customer on the mobile app
    And my account is less than 30 days old
    When I navigate to "Update Address"
    Then I am prompted to complete identity verification before proceeding
```

Each scenario is independently testable. An engineer or QA analyst can look at each scenario and implement or test it without needing to ask follow-up questions.

### What to Give It

```
/draft-bdd

Please generate BDD scenarios from the PRD at docs/prd/address-update.md.
Focus especially on: identity re-verification edge cases, address validation errors, 
async API failure scenarios, and fraud edge cases.
```

### What It Produces

A `.feature` file with:
- A feature block describing the feature
- A set of scenarios covering the primary happy path
- Scenarios for validation errors (invalid postcode, PO box, etc.)
- Scenarios for system failures (API unavailable, timeout)
- Scenarios for fraud and edge cases
- Scenarios for user behaviour variations (returning to step, cancelling)

---

## Skill 4: `/spec-review`

### What It Does

`spec-review` critically reviews a PRD or BDD file and produces a structured critique identifying gaps, ambiguities, risks, and missing edge cases.

It is backed by the `requirements-critic` agent, which reads the spec honestly and directly — it will not tell you what you want to hear.

### When to Use It

- Before handing a PRD to engineering for development
- After generating BDD scenarios, to check for missing coverage
- When you want a second opinion on a spec before a design review or sign-off
- When returning to a spec after a period of time and wanting a fresh assessment

### What to Give It

```
/spec-review

Please review the PRD at docs/prd/address-update.md.
Pay particular attention to:
- Compliance and fraud edge cases
- What happens when the async address verification returns a failure
- Whether the scope boundaries are clear enough for engineering
```

### What It Produces

A critique document with:
- Executive summary of overall quality
- Key gaps (things that are missing)
- Risks (technical, operational, fraud, compliance)
- Ambiguities (things that could be interpreted more than one way)
- Missing edge cases
- Recommendations
- Specific questions to resolve before handoff

**This is not flattery.** The `requirements-critic` agent is designed to be direct. Expect it to find real problems. That is its job.

---

## The Iteration Loop

The real workflow is not linear — it is iterative:

```
analyse-feature
    ↓
draft-prd
    ↓
spec-review         ← review critique
    ↓
edit PRD            ← improve based on critique
    ↓
draft-bdd
    ↓
spec-review (BDD)   ← review BDD coverage
    ↓
edit BDD            ← fill gaps
    ↓
handoff to engineering
```

Running `spec-review` is not an admission that your PRD is poor. It is a quality gate. Every PRD should be reviewed before it reaches engineering.

---

## Practical Exercise

Use the sample feature brief in `curriculum/examples/sample-feature-brief.md` as your starting point.

**Step 1: Read the sample brief**
```bash
cat curriculum/examples/sample-feature-brief.md
```

**Step 2: Run feature analysis**
```
/analyse-feature

Feature: [from the sample brief]
Context: [paste the brief]
```

**Step 3: Draft a PRD**
```
/draft-prd

[provide the context from the brief and the analysis output]
```

Review the file saved to `docs/prd/`.

**Step 4: Run a spec review**
```
/spec-review

Please review docs/prd/<your-file>.md
```

Read the critique honestly. Identify the two most important gaps.

**Step 5: Edit the PRD**

Open the PRD file and fix the two most important gaps identified by the review. Save and commit.

**Step 6: Generate BDD scenarios**
```
/draft-bdd

Generate scenarios from docs/prd/<your-file>.md
Focus on the edge cases flagged in the spec review.
```

Review the `.feature` file saved to `docs/bdd/`.

---

## Expected Output

A complete set of artefacts for a single feature: a feature analysis, a reviewed and refined PRD, and a set of BDD scenarios. Understanding of how the four skills connect and when to use each one.

---

## Common Mistakes

- **Running `draft-bdd` before `spec-review`** — Generate BDD from a reviewed PRD, not a first draft. The BDD will inherit any gaps in the PRD.

- **Not reading the `spec-review` output carefully** — The critique can feel uncomfortable if it finds many problems. Resist the urge to dismiss it. Each item flagged is a real risk.

- **Treating AI outputs as finished artefacts** — Every output is a strong draft. It will miss things that require human context and judgement. Always read and edit before using.

- **Over-specifying in the Gherkin** — BDD scenarios should describe *what* happens, not *how* it is implemented. "I click the blue submit button" is implementation detail. "I confirm the update" is behaviour.

- **Under-specifying in the PRD** — Vague PRDs produce vague BDD. Time invested in the PRD pays back in the quality of everything downstream.

---

## Confidence Checklist

- [ ] I understand what each of the four skills does
- [ ] I can explain when to use each skill in the workflow
- [ ] I have successfully run `analyse-feature` against a real or sample feature
- [ ] I have successfully run `draft-prd` and reviewed its output
- [ ] I have run `spec-review` and read its critique honestly
- [ ] I have edited a PRD based on a spec review critique
- [ ] I have successfully run `draft-bdd` and reviewed the Gherkin scenarios
- [ ] I can read Gherkin format and judge whether a scenario is testable
