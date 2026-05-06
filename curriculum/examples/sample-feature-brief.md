# Sample Feature Brief: Personalised Spending Alerts

**Use this brief as your starting point for the end-to-end workshop.**

This is a realistic feature brief in the style of an early-stage product idea — the kind of thing that might arrive from a stakeholder meeting or a product discovery session. It is deliberately incomplete. Part of the exercise is identifying what is missing.

---

## The Idea

We want to let customers set personalised spending alerts on their current account. The idea came from customer research showing that people lose track of their spending and feel anxious about overdrafts. A spending alert that fires before they hit a threshold would help customers feel more in control.

Engineering thinks this is technically feasible and has flagged that the transaction event stream already exists. We could build the alert logic on top of it.

---

## What We Know

**The customer problem:**
- Customers don't always know how much they've spent in a given period
- They worry about going overdrawn unexpectedly
- Our NPS data shows 'financial control' is a consistent theme in low-scoring responses

**What we're thinking:**
- Let customers set a weekly spend threshold (e.g., "tell me when I've spent £500 this week")
- Send a notification when they hit that threshold
- Notification channels: push notification on mobile, SMS, email
- Accessible from account settings on mobile app
- Should also work on web (not mobile-only)

**What we've heard from engineering:**
- The transaction event stream is available and real-time
- Push notifications infrastructure already exists
- SMS would need a new integration (we use Twilio for other products)
- They'd want to know how many alerts a customer can have at once

**What compliance said informally:**
- FCA Consumer Duty means the alert needs to be clear and not misleading
- There was a comment about making sure customers can turn off all alerts — need to follow up

**What we haven't figured out:**
- What types of alerts (just weekly spend? Daily? Category-based?)
- How a "week" is defined
- Whether the alert fires once per week or every time the threshold is crossed again
- What happens if a notification fails to deliver
- Whether joint accounts are in scope
- Maximum number of alerts per customer
- What the customer sees if they have no spending history yet
- Do we need any fraud controls (e.g., someone maliciously triggering alerts for another customer)?

---

## Rough Scope Thinking

**Probably in:**
- Weekly spending alerts on current account
- Push, SMS, email notifications
- Setting up, editing, and deleting alerts
- Mobile app (primary) + web (secondary)

**Probably out (first release):**
- Category-level alerts
- Savings account alerts
- Joint accounts
- Daily alerts
- AI-suggested alert thresholds

---

## Stakeholders

| Role | Person | Input needed |
|------|--------|-------------|
| Compliance | TBC | FCA consumer duty specifics |
| Engineering | TBC | Technical constraints, notification infrastructure |
| Risk | TBC | Fraud edge cases |
| Design | TBC | Mobile UX for alert setup |
| Data | TBC | Transaction event stream reliability |

---

## Timeline

This is being discussed for the next planning cycle. No committed date yet.

---

## Your Task (Workshop)

Using this brief as your starting point:

1. Run `/analyse-feature` to surface gaps, edge cases, and considerations not mentioned here
2. Use the analysis + this brief to run `/draft-prd`
3. Run `/spec-review` to identify what is still missing
4. Resolve open questions with reasonable product decisions
5. Run `/draft-bdd` from the reviewed PRD
6. Run `/spec-review` on the BDD
7. Assemble your handoff pack

Note what this brief gets wrong, what it misses, and how the AI-native workflow helped you catch those gaps before reaching engineering.
