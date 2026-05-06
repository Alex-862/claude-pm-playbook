# Module 07: Context Management and Integrations

## Learning Objective

Understand how to manage context effectively — what to put in CLAUDE.md, how to structure context for specific tasks, how to avoid context pollution, and how future integrations with Jira and Confluence will work.

## Why It Matters for PMs

The quality of Claude Code's output is a direct function of the quality of the context it is given. This is the most important skill to develop and refine over time. More than any individual tool, the ability to package and manage context is what separates a PM who gets mediocre AI outputs from one who gets genuinely useful ones.

Context management is also where governance matters most. What you include in your prompts — and what you must never include — has real implications in a regulated financial services environment.

---

## Concepts Covered

- What "context" means in AI-native workflows
- CLAUDE.md: the persistent project brief
- Task-specific context: how to brief Claude Code before a skill run
- Context pollution: what goes wrong when context is poor
- Context boundaries: what must never be included
- File structure as context
- Future integrations: Jira, Confluence, and enterprise PATs
- Version-controlled context as audit trail

---

## What Is Context?

In AI-native workflows, "context" means: everything the AI agent can see when it is working on a task.

This includes:
- Your `CLAUDE.md` file (read automatically at startup)
- Files in your repository that the agent reads
- Information you provide directly in the conversation
- The outputs of previous skills used in the same session

Context is not unlimited. Every AI model has a context window — the maximum amount of text it can hold in working memory. Beyond that limit, earlier content is forgotten (or summarised, losing detail). Well-managed context keeps the most relevant information visible throughout a task.

---

## CLAUDE.md: Your Persistent Project Brief

`CLAUDE.md` is the most important file in any project you work on with Claude Code. It is read every time Claude Code starts in that folder.

Think of it as a living briefing document — not the details of any specific feature, but the stable facts about your project, team, and constraints.

### What Belongs in CLAUDE.md

**Project identity:**
- What this product is
- Who the customers are (be precise: retail customers? SMEs? internal staff?)
- What domain it operates in (payments, identity, onboarding, etc.)

**Team context:**
- Who the audience is for product artefacts
- What terminology is standard in your team
- What abbreviations are used

**Document conventions:**
- Where PRDs are stored
- Where BDD files are stored
- What naming conventions to use
- What sections every PRD must include

**Constraints:**
- Regulatory and compliance requirements that apply to this product area
- Known technical constraints (systems that must be called, latency limits, etc.)
- What the agent must never assume or invent

**Quality expectations:**
- What "done" looks like for a PRD
- What level of edge case coverage is expected
- Whether this is a low-risk or high-risk product area

### What Does Not Belong in CLAUDE.md

- Feature-specific detail (put that in the relevant docs folder)
- Customer personal data of any kind
- Confidential customer or transaction data
- Data that changes frequently (put that in feature-specific files)
- Secrets, API keys, or credentials — ever

### Keeping CLAUDE.md Current

Update CLAUDE.md when:
- The team or audience changes
- A new constraint is added (new compliance requirement, new technical system)
- Naming conventions are updated
- A new document type is introduced

CLAUDE.md drift — where the file no longer reflects reality — is one of the most common causes of degrading AI output quality over time.

---

## Task-Specific Context

Beyond CLAUDE.md, every skill run benefits from task-specific context provided directly in the conversation.

### The Context Brief Template

Before running any skill, it is worth writing a short context brief. Use this structure:

```
Feature: [what feature you are working on]
Goal: [what you want the skill to produce or focus on]

Background:
- [Key fact 1 about this feature or decision]
- [Key fact 2]
- [Any constraints engineering or compliance have stated]

What exists already:
- [Relevant files: path/to/file.md]
- [Previous analysis or summaries]

Focus areas:
- [Specific things you want the agent to pay attention to]

Out of scope for this run:
- [Things you explicitly do not want covered yet]
```

This takes three minutes to write. It routinely doubles the usefulness of the output.

### Why Specificity Matters

Consider the difference:

**Vague:** "Write a PRD for the payment feature"

**Specific:** 
```
Feature: Increase payment limits for business customers with a verified credit score

Goal: Draft a PRD that can be reviewed by the risk team and handed to engineering

Background:
- Current limit is £10,000 per transaction. Business wants to increase to £50,000.
- Risk team requires enhanced fraud checks above £25,000
- Customers must have completed KYB (Know Your Business) verification
- Real-time fraud scoring from our Featurespace integration is available

What exists already:
- Current payment limits logic: docs/summaries/payment-limits-analysis.md
- Risk team's requirements email (summarised below): [paste key points]

Focus areas:
- Business rules around the £25k threshold
- What happens if the real-time fraud score fails
- Communication to the customer when limits are applied

Out of scope:
- Retail customers (this is business customers only)
- Changes to the KYB verification process itself
```

The second prompt produces a PRD that is specific, accurate, and genuinely useful as a handoff document.

---

## Context Pollution: What Goes Wrong

Context pollution happens when Claude Code is working with incorrect, outdated, or conflicting information. Symptoms include:

- Outputs that contradict known constraints
- Assumptions in the PRD that do not reflect reality
- BDD scenarios that describe behaviour you explicitly said was out of scope
- Spec reviews that miss obvious risks (because those risks were not in the context)

**Common causes:**

| Cause | Fix |
|-------|-----|
| CLAUDE.md is out of date | Review and update CLAUDE.md regularly |
| Conflicting information in multiple files | Keep one source of truth; link, don't duplicate |
| Providing too much loosely-structured context | Structure your context brief; use headings |
| Paste errors (wrong section copied) | Read your context brief before running the skill |
| Ambiguous terminology | Define terms explicitly in CLAUDE.md |

---

## Context Boundaries: What Must Never Be Included

**This section is critical for UK financial services.**

AI models process the text you provide. Any text you put into a prompt or into the files Claude Code reads is processed by the model. In a regulated environment, this creates serious obligations.

**Never include in any prompt, CLAUDE.md, or file in this repository:**

- Real customer names, addresses, dates of birth, or contact details
- Real account numbers, sort codes, card numbers, or IBANs
- Real transaction data or payment records
- National Insurance numbers or passport details
- Internal employee data
- Confidential commercially sensitive data that is not approved for AI processing
- Authentication credentials, API keys, passwords, or secrets

Use **fictional examples** when you need to illustrate a scenario. For example:
- Not: `Customer John Smith, account 12345678, sort code 60-00-01...`
- Yes: `Customer [EXAMPLE], account [EXAMPLE], attempted to update their address to...`

For full guidance, see [Governance and Guardrails](governance-and-guardrails.md).

---

## File Structure as Context

The way you organise files in your repository is itself a form of context. Well-organised files help Claude Code navigate efficiently and read the right documents.

**Conventions that help:**

- **Use descriptive file names**: `payment-limits-prd.md` not `feature1.md`
- **Keep PRDs in `/docs/prd/`** — Claude Code's skills know to look there
- **Keep BDD in `/docs/bdd/`** — consistent with the feature file convention
- **Use one file per feature** — do not bundle multiple unrelated features in one document
- **Link between related artefacts** — a BDD file should reference its source PRD

**A well-organised docs folder:**
```
docs/
├── prd/
│   ├── address-update.md
│   ├── payment-limits.md
│   └── notification-preferences.md
├── bdd/
│   ├── address-update.feature
│   ├── payment-limits.feature
│   └── notification-preferences.feature
└── summaries/
    ├── address-update-analysis.md
    └── payment-limits-analysis.md
```

---

## Future Integrations

### Jira Integration

In the near future, it will be possible to pull context from Jira directly into Claude Code using enterprise API tokens. This will allow:

- Pulling a Jira ticket summary as context for a PRD
- Linking PRD outputs back to Jira tickets
- Keeping artefact status in sync with ticket status

Until this integration is configured for your organisation:
- Copy-paste relevant Jira ticket descriptions into your context brief
- Reference Jira ticket IDs in your PRD and BDD files for traceability

### Confluence Integration

Similarly, Confluence pages can be used as context source once integration is configured:

- Product principles, design standards, and glossaries from Confluence can be referenced
- Technical architecture docs can be pulled in for feature analysis

Until then:
- Summarise relevant Confluence content and include it in `CLAUDE.md` or your context brief
- Link to the Confluence page URL in your artefacts for reference

### Personal Access Tokens

Integrations with Jira, Confluence, and other enterprise systems require Personal Access Tokens (PATs). These are credentials — treat them like passwords.

- Never paste a PAT into a prompt or a file in the repository
- Store PATs in environment variables or your organisation's approved secrets manager
- Follow your organisation's IT security guidance on PAT creation and rotation

See [Governance and Guardrails](governance-and-guardrails.md) for more detail.

---

## Version-Controlled Context as Audit Trail

One underappreciated benefit of keeping product context in a Git repository: every change is auditable.

If a compliance question arises six months from now about why a particular design decision was made:
- The PRD is in the repository with a full history
- The spec review critique is preserved
- The commit messages explain what changed and when
- The git blame shows who made each change

This is not just good practice. In a regulated environment, it may be a governance requirement. "It was in a Google Doc that someone updated" is not an audit trail. "It was committed to the repository on this date with this rationale" is.

---

## Practical Exercise

**Part 1: Review and improve your CLAUDE.md**

Open `templates/CLAUDE.md` in this repo. For a feature area you know well, draft a CLAUDE.md that reflects:
- Real product context (using fictional/anonymised data)
- Actual constraints you know about
- The terminology your team uses
- Where documents will be stored

**Part 2: Write a context brief**

Pick a feature you are currently working on or have recently worked on. Write a context brief using the template above. Be specific. Do not include any real customer data.

**Part 3: Compare output quality**

Run `/draft-prd` twice:
1. First with only a one-line description
2. Second with your full context brief

Compare the two PRDs. Write down the three biggest differences in quality or specificity.

---

## Expected Output

An updated CLAUDE.md ready for a real project. A context brief for a current or recent feature. Clear understanding of what must never be included in AI prompts. A habit of structuring context before running skills.

---

## Common Mistakes

- **Setting CLAUDE.md once and never updating it** — Stale context is worse than no context, because it actively misleads the agent.

- **Including too much in one prompt** — Massive prompts with everything you know are hard for the model to prioritise. Structure and prioritise.

- **Using real customer data to "test"** — Even in testing, use fictional examples. There is no safe version of including real customer data.

- **Forgetting to reference relevant files** — If there is a useful analysis already saved, tell the skill where to find it. Don't rely on it to guess.

- **Inconsistent terminology** — If your CLAUDE.md says "customer" means one thing and your PRD uses "user" to mean the same thing, the agent may treat them as different entities.

---

## Confidence Checklist

- [ ] I can describe what context means in AI-native workflows
- [ ] My project has an up-to-date CLAUDE.md
- [ ] I write a context brief before running any skill
- [ ] I know what must never be included in prompts or repo files
- [ ] I understand how file structure helps Claude Code navigate
- [ ] I can explain why version-controlled context is valuable for audit
- [ ] I know what Jira and Confluence integrations will enable (and the workaround until then)
- [ ] I handle PATs as credentials, not as config values
