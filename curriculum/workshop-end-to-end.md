# Workshop: End-to-End AI-Native Product Workflow

**Duration**: Half day (approximately 3.5–4 hours)  
**Format**: Individual or pair practice  
**Prerequisites**: Modules 00–07 completed, machine fully set up, repo cloned  
**Facilitator note**: This workshop can be run as a team session with a facilitator demonstrating Steps 1–4 live, then participants working independently on Steps 5–10.

---

## Workshop Overview

In this workshop, you will take a feature idea from brief to engineering handoff using Claude Code. You will use all four skills from this playbook. By the end, you will have a complete, version-controlled artefact set that is ready to hand to an engineering team.

You may use:
- **The sample feature brief** (`curriculum/examples/sample-feature-brief.md`) — recommended for first run
- **A real feature you are currently working on** — ensure no real customer data is used

---

## The Sample Feature

If using the sample feature brief, the scenario is:

> **Spending Alerts**  
> Allow retail banking customers to set personalised spending alerts on their current account. Customers can set an alert threshold (e.g., "alert me when I spend more than £500 in a week") and choose to receive notifications via push, SMS, or email. The feature is being built as a mobile-first experience but should also work on web.

Read the full brief in `curriculum/examples/sample-feature-brief.md` before starting.

---

## Step 0: Preparation (15 minutes)

Before opening Claude Code, complete these steps manually.

### 0a. Set up your project environment

```bash
cd ~/Documents
mkdir spending-alerts-project
cd spending-alerts-project
git init
mkdir -p docs/prd docs/bdd docs/summaries
```

Copy the starter CLAUDE.md from the playbook:
```bash
cp ~/Documents/claude-pm-playbook/templates/CLAUDE.md ./CLAUDE.md
```

### 0b. Customise your CLAUDE.md

Open `CLAUDE.md` in VS Code and update it for this project. Include:

- What this project is (spending alerts for retail current account customers)
- Who the audience is (PM, engineering, QA, risk)
- Where documents are stored
- Key constraints you know about:
  - FCA consumer duty: alerts must be clear and actionable, not misleading
  - Notification delivery cannot be guaranteed (SMS/push may fail) — system must handle gracefully
  - Regulatory requirement: customers must be able to turn off all marketing alerts separately from service alerts
- Terminology:
  - "Customer" = authenticated retail banking customer
  - "Alert threshold" = the amount or condition that triggers a notification
  - "Notification channel" = push notification, SMS, or email

Save and commit:
```bash
git add CLAUDE.md
git commit -m "Add project CLAUDE.md for spending alerts feature"
```

### 0c. Write your context brief

On paper or in a scratchpad, write your context brief for the PRD. Include:
- What the feature is
- What problem it solves
- Who it is for
- What the happy path looks like (rough steps)
- Edge cases you can think of
- Constraints from the CLAUDE.md
- Things you do not yet know

Do this before opening Claude Code. Three to five minutes of structured thinking here pays back significantly in output quality.

---

## Step 1: Feature Analysis (30 minutes)

Open Claude Code in your project folder:

```bash
claude
```

Run the feature analysis skill. For this workshop, we will analyse the sample brief rather than a codebase (since spending alerts may not exist in your repo):

```
/analyse-feature

Feature: Personalised spending alerts for retail current account customers

Feature brief:
Customers can set alert thresholds on their current account (e.g., "alert me when I spend more than £500 in a week"). They choose from three notification channels: push, SMS, or email. Mobile-first but also needs web support.

Questions I want answered:
1. What are all the failure modes for alert delivery (push, SMS, email)?
2. What edge cases exist around threshold types — weekly resets, partial weeks, etc.?
3. What regulatory or compliance considerations should a spending alert feature include in a UK retail banking context?
4. What dependencies would this feature likely have on other systems?
5. What are the fraud or misuse risks?
```

**When the output appears:**
- Read it carefully
- Identify the three most useful insights
- Note any questions it raises that you had not thought of
- Save the analysis:

```bash
# Claude Code should save this automatically, but if not:
# Copy the output and save to:
# docs/summaries/spending-alerts-analysis.md
```

Commit:
```bash
git add docs/summaries/
git commit -m "Add spending alerts feature analysis"
```

**Checkpoint question**: What did the analysis surface that you had not considered? Write down at least two things.

---

## Step 2: Draft the PRD (45 minutes)

Now draft the PRD. Take your context brief and the analysis output and run:

```
/draft-prd

Feature: Personalised spending alerts — retail current account

Background:
- Feature analysis is in docs/summaries/spending-alerts-analysis.md
- Key constraints from analysis:
  [paste the 3-4 most important constraints from your analysis output]

Context:
- FCA consumer duty applies: alerts must be clear and not misleading
- Push/SMS delivery cannot be guaranteed — graceful failure required
- Customers must be able to disable all alerts independently
- Web support required in addition to mobile (mobile is primary)
- No real-time balance required — alerts are based on transaction events

Happy path:
1. Customer navigates to Alerts in mobile app settings
2. Customer taps "Add spending alert"
3. Customer selects alert type (weekly spend threshold)
4. Customer enters threshold amount (e.g., £500)
5. Customer selects notification channel(s) (push, SMS, email — can select multiple)
6. Customer saves the alert
7. When the threshold is met, customer receives notification on chosen channel(s)

Out of scope for this release:
- Category-based alerts (e.g., "alert me when I spend on dining")
- Savings account alerts
- Joint account alerts
- Automatic alert suggestions based on spending history

Open questions I cannot yet answer:
- Can a customer have multiple simultaneous alerts? (e.g., £200/week AND £1000/month)
- What is the maximum number of alerts per customer?
- How is "weekly" calculated — calendar week or rolling 7 days?
- Can the alert fire multiple times in a period or only once per threshold crossing?
```

**When the PRD draft appears:**
- Do not accept it immediately
- Read every section
- Identify anything that is incorrect, invented, or missing
- Note anything that requires a stakeholder decision

Edit the PRD directly in VS Code. Make at least three substantive improvements based on your review.

Commit:
```bash
git add docs/prd/spending-alerts.md
git commit -m "Add initial spending alerts PRD draft"
```

---

## Step 3: First Spec Review (30 minutes)

Run the spec review on your edited PRD:

```
/spec-review

Please review the PRD at docs/prd/spending-alerts.md.

Pay particular attention to:
- FCA consumer duty implications — is it clear enough for compliance review?
- Failure handling for notification delivery
- Edge cases around threshold calculation (weekly resets, etc.)
- Whether the scope boundaries are clear enough for engineering to build from
- Missing monitoring and alerting requirements
```

**When the critique appears:**
- Read every item honestly
- Categorise each issue:
  - "Need stakeholder input" — requires a decision before the PRD can be finalised
  - "PM decision" — I can decide this myself and update the PRD now
  - "Engineering clarification" — need technical input
  - "Explicitly de-scoped" — this is intentionally not in scope; I should make that explicit

For each "PM decision" item, make the decision and update the PRD now. For others, add explicit open questions.

Commit:
```bash
git add docs/prd/spending-alerts.md
git commit -m "Update PRD based on spec review — resolve threshold calculation and notification failure handling"
```

**Checkpoint question**: What was the single most important gap the spec review found? Why had you not caught it yourself?

---

## Step 4: Resolve Open Questions (20 minutes)

Review the open questions remaining in your PRD. In a real workflow, this is where you would:
- Send a message to compliance about the FCA consumer duty question
- Ask engineering about the maximum alerts per customer limit
- Get a product decision on rolling vs calendar week

For this workshop: make reasonable product decisions for each open question and document your rationale directly in the PRD. Use this format:

```markdown
> **Decision [date]**: A "week" is defined as a rolling 7-day period, not a calendar week. Rationale: calendar weeks create a reset edge case on Sunday nights that could feel confusing to customers. Rolling 7 days is consistent and predictable.
```

Update and commit:
```bash
git add docs/prd/spending-alerts.md
git commit -m "Resolve open questions — week definition, multi-alert support, notification retry logic"
```

---

## Step 5: Generate BDD Scenarios (30 minutes)

With a reviewed, gap-filled PRD, generate BDD scenarios:

```
/draft-bdd

Generate BDD scenarios from the PRD at docs/prd/spending-alerts.md.

Please ensure coverage of:
- Happy path: setting up a spending alert successfully
- Alert fires correctly when threshold is crossed
- Alert does not double-fire in the same period
- Notification delivery failures (push off, SMS fails, etc.)
- Customer disabling/deleting an alert
- Multiple alerts on one account
- Edge case: threshold crossed multiple times in rolling window
- Weekly reset behaviour
- New customer with no spending history sets an alert
- Customer editing an existing alert
```

**When the BDD scenarios appear:**
- Read each scenario carefully
- Check: is each scenario independently testable?
- Check: does any scenario contain vague language ("correctly", "appropriately", "as expected")?
- Check: is every major business rule covered by at least one scenario?

Edit the BDD file to fix any vague scenarios. Commit:
```bash
git add docs/bdd/spending-alerts.feature
git commit -m "Add spending alerts BDD scenarios"
```

---

## Step 6: BDD Review (20 minutes)

Run a spec review on the BDD file:

```
/spec-review

Please review the BDD scenarios at docs/bdd/spending-alerts.feature.

Check:
- Is every business rule from the PRD covered by at least one scenario?
- Are there scenarios with vague language that should be made more precise?
- What edge cases are missing?
- Are the Given/When/Then steps independently verifiable?
```

Make final edits to the BDD file based on the critique.

Final commit:
```bash
git add docs/bdd/spending-alerts.feature
git commit -m "Refine BDD scenarios based on review — add API failure and multi-alert edge cases"
```

---

## Step 7: Assemble the Handoff Pack (15 minutes)

Verify your handoff pack is complete:

```bash
ls -la docs/prd/
ls -la docs/bdd/
ls -la docs/summaries/
cat CLAUDE.md
```

Your handoff pack should contain:
- [ ] `docs/summaries/spending-alerts-analysis.md`
- [ ] `docs/prd/spending-alerts.md` — reviewed, with resolved questions
- [ ] `docs/bdd/spending-alerts.feature` — reviewed, complete coverage
- [ ] `CLAUDE.md` — current project context
- [ ] Clean git history with meaningful commit messages

Review the git log:
```bash
git log --oneline
```

Read the commit messages. Do they tell the story of how this feature was specified? Would someone joining the project be able to understand the evolution?

---

## Step 8: Retrospective (15 minutes)

Reflect individually or discuss as a group:

1. **What did Claude Code produce that surprised you?** (Positively or negatively)

2. **What did the spec review surface that you had not anticipated?**

3. **How does this handoff pack compare to your current best-practice handoff?**

4. **Where did you spend the most time?** Was that time well spent?

5. **What would you do differently on your next feature?**

6. **What would you need to change about your current workflow to make this the default?**

---

## Workshop Outputs

At the end of the workshop, each participant should have:

- A Git repository with clean commit history
- A feature analysis summary
- A reviewed, version-controlled PRD
- A complete set of BDD scenarios with edge case coverage
- A project CLAUDE.md that would allow anyone (or any AI agent) to understand the context
- Personal notes on gaps in the workflow and what to improve next time

---

## Facilitator Notes

**For team sessions:**
- Run Step 0 as a group — show everyone what a good CLAUDE.md looks like
- Demonstrate Step 1 (feature analysis) as a live walkthrough
- Let participants work independently for Steps 2–6
- Reconvene for the retrospective
- Allow 30 minutes for setup issues — someone will always have a machine problem

**Common points of confusion:**
- "Why is the spec review so critical?" — show the commit history and what changed between draft and final; make the critique visible
- "The PRD feels too detailed" — it is not too detailed; ask them to imagine a QA engineer reading it with no other context
- "I'm not sure what to put in CLAUDE.md" — start with what the product area is, who the users are, and one real constraint; add more over time

**Signs it is going well:**
- Participants are surprised by spec review findings
- The PRD changes meaningfully between first draft and final commit
- BDD scenarios are specific enough to be read by a QA engineer without questions
- The git log tells a clear story
