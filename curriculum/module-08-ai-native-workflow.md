# Module 08: AI-Native Product Workflow — Idea to Engineering Handoff

## Learning Objective

Execute a complete, end-to-end AI-native product workflow from an initial feature idea through structured requirements, BDD scenarios, spec review, and a clean engineering handoff package.

## Why It Matters for PMs

Everything in this curriculum has been building to this. This module brings it all together into a repeatable workflow that raises the quality of your product artefacts, reduces misunderstanding in engineering handoff, and positions your team to work effectively with AI-assisted development.

This is not a theoretical workflow. It is what you do on a real feature, with real tools, producing artefacts that your engineering team can act on.

---

## Concepts Covered

- The complete workflow: idea → analysis → PRD → BDD → review → handoff
- What a "machine-ready" handoff pack looks like
- How AI-assisted engineering consumes product artefacts
- Where human judgement is irreplaceable
- How to maintain artefact quality over time
- Connecting to spec-driven development
- Measuring the quality of your own workflow

---

## The AI-Native PM Workflow

```
┌─────────────────────────────────────────────┐
│  UPSTREAM: PM TERRITORY                     │
│                                             │
│  1. Feature Idea                            │
│     ↓                                       │
│  2. Context Brief (CLAUDE.md + notes)       │
│     ↓                                       │
│  3. /analyse-feature → Feature Analysis     │
│     ↓                                       │
│  4. /draft-prd → PRD Draft                  │
│     ↓                                       │
│  5. Human Review + Edit                     │
│     ↓                                       │
│  6. /spec-review → Critique                 │
│     ↓                                       │
│  7. Resolve Gaps + Stakeholder Input        │
│     ↓                                       │
│  8. /draft-bdd → BDD Scenarios             │
│     ↓                                       │
│  9. /spec-review (BDD) → BDD Critique       │
│     ↓                                       │
│  10. Handoff Pack                           │
│                                             │
└─────────────────────────────────────────────┘
         ↓
┌─────────────────────────────────────────────┐
│  DOWNSTREAM: ENGINEERING TERRITORY          │
│                                             │
│  11. Engineering reads structured specs     │
│  12. AI-assisted code generation            │
│  13. Test implementation from BDD           │
│  14. Review against PRD acceptance criteria │
│                                             │
└─────────────────────────────────────────────┘
```

---

## Step by Step

### Step 1: Feature Idea

Every feature starts somewhere — a stakeholder request, a customer complaint, a regulatory requirement, an OKR gap. At this stage, you have a rough idea, some context, and a set of open questions.

**Your job at this step:**
- Write down everything you know about the feature, even if it is rough
- Identify what you do not know
- Identify who needs to be consulted (compliance, risk, engineering, design)
- Do not write a PRD yet — gather first

### Step 2: Context Brief

Before touching Claude Code, write your context brief (see Module 07). This is five to ten minutes of work that shapes everything that follows.

Ensure:
- CLAUDE.md for the project is current
- You have noted the file paths of any relevant existing documents
- You have gathered input from key stakeholders (compliance requirements, technical constraints)
- You have anonymised or fictionalised any examples — no real customer data

### Step 3: Feature Analysis (`/analyse-feature`)

If this feature builds on something that already exists, run `analyse-feature` first. This gives you a structured understanding of the current state before writing requirements for the future state.

Give it:
- The feature you want to understand
- Relevant file paths (code, existing docs, prior summaries)
- Specific questions you want answered

Review the output. Make notes. Update your context brief with anything important you learned.

If this is a genuinely new feature with no existing code, you can skip this step and go straight to PRD drafting.

### Step 4: Draft the PRD (`/draft-prd`)

Now write the PRD. Use your context brief as input. Be specific about:
- The problem being solved
- The user (be precise — which segment, which context)
- The happy path (numbered steps)
- The unhappy paths (what goes wrong and how)
- The edge cases you know about
- Out of scope (explicit, not implied)
- Business rules (precise, not approximate)
- Open questions (flagged explicitly, not buried)

The PRD is saved to `docs/prd/<feature-name>.md`.

### Step 5: Human Review

**This step cannot be skipped.** Read the PRD before the spec review. Ask yourself:

- Does this accurately represent the feature as I understand it?
- Are there things the AI invented or assumed that are not true?
- Are there things I know that are missing?
- Is the language precise enough to be unambiguous?

Edit the PRD directly. Commit your changes.

### Step 6: Spec Review (`/spec-review`)

Run the spec review. This is your quality gate.

Read the critique honestly. For each issue flagged:
- Decide whether it is a real gap or something you can explicitly de-scope
- If it is real, note what additional input you need (stakeholder, compliance, engineering)
- Do not dismiss items because they feel uncomfortable

The critique is not a judgement of your work. It is a preview of the misunderstandings your engineering team would have encountered.

### Step 7: Resolve Gaps

Based on the spec review, identify what you need before the PRD is ready to hand off:

- Questions for compliance or risk
- Technical clarifications from engineering
- UX decisions that are still open
- Edge cases that need a decision

Chase these down. Update the PRD with the answers. Mark open questions as resolved or explicitly de-scoped.

Commit the updated PRD. Your commit message should explain what changed: `"Add compliance constraint on identity re-verification timeline"` not `"update PRD"`.

### Step 8: Generate BDD Scenarios (`/draft-bdd`)

With a reviewed, gap-filled PRD, generate the BDD scenarios. This is the most valuable single step for engineering handoff.

Good BDD scenarios from a good PRD:
- Eliminate the most common sources of misunderstanding in development
- Give QA engineers a direct testing framework
- Make it possible for AI-assisted development to produce correct code faster
- Serve as living documentation that can be re-run as regression tests

Give the skill:
- The path to the reviewed PRD
- Any specific edge cases or failure modes to emphasise
- Anything the spec review flagged that should be reflected in scenario coverage

### Step 9: BDD Review (`/spec-review` on the BDD file)

Run a spec review against the BDD `.feature` file. Check:
- Is every requirement in the PRD covered by at least one scenario?
- Are the scenarios testable and unambiguous?
- Are the edge cases from the spec review reflected in the scenarios?
- Is the Gherkin precise (avoiding vague terms like "appropriate" or "correctly")?

Edit the BDD file to fix any gaps. Commit.

### Step 10: The Handoff Pack

A complete handoff pack consists of:

```
docs/
├── prd/
│   └── feature-name.md          ← reviewed, gap-filled PRD
├── bdd/
│   └── feature-name.feature     ← reviewed BDD scenarios
└── summaries/
    └── feature-name-analysis.md ← feature analysis (if run)
```

Plus:
- A CLAUDE.md that gives any AI tool working downstream full project context
- Clear commit history showing the evolution of the spec
- Any open questions still outstanding, explicitly flagged in the PRD

### What a Good Handoff Pack Enables

An engineering team (human or AI-assisted) receiving this pack can:

1. Understand the problem and why it is being solved
2. Understand who the user is and what they are trying to do
3. Know precisely what is in scope and what is not
4. Have explicit business rules to implement
5. Have testable scenarios to write tests against
6. Know where the remaining open questions are and who owns them
7. Have a version-controlled history of every decision and why it was made

This is a fundamentally different quality of handoff than a Jira ticket pointing to a Google Doc.

---

## Where Human Judgement Is Irreplaceable

AI tools do not replace PM judgement. They amplify it. The things that remain entirely human:

- **Deciding what to build** — AI can structure options but cannot make prioritisation decisions
- **Stakeholder relationships** — Getting compliance sign-off, aligning with risk, influencing direction
- **Ethical considerations** — What is right for customers, beyond what is required by rules
- **Resolving genuine uncertainty** — When the spec review surfaces an open question, a human must answer it
- **Reviewing AI outputs critically** — The agent can draft; the PM is responsible for the draft
- **Connecting features to strategy** — The "why" behind the feature comes from you, not the AI

The workflow amplifies your product thinking. It does not substitute for it.

---

## Spec-Driven Development: The Engineering Connection

Many engineering teams experimenting with AI-assisted development use a technique called spec-driven development: they write detailed specs first, then use AI to generate code from the spec.

When your PRDs and BDD scenarios are structured, precise, and machine-readable, they are directly usable as input to spec-driven development workflows. The quality of your upstream artefacts becomes the quality ceiling for the downstream implementation.

This is the connection between PM workflow and AI-native engineering. It is why this curriculum exists.

---

## Measuring Your Own Workflow Quality

Over time, track these signals:

| Signal | Good | Needs improvement |
|--------|------|-------------------|
| Spec review critique length | Short, few issues | Long, many gaps |
| Engineering questions after handoff | Few, on edge cases | Many, on basic requirements |
| BDD scenarios needing revision post-development | Rare | Frequent |
| PRD clarifications during sprint | Occasional | Constant |
| Onboarding time for new team member on a feature | Hours (read the repo) | Days (needs meetings) |

If your engineering team is asking many questions after handoff, the gap is usually in the PRD — not in their understanding.

---

## Practical Exercise

Run the full workflow using the [End-to-End Workshop](workshop-end-to-end.md).

For self-study: pick a feature you are currently working on and run steps 1–10. Time yourself. Note where you get stuck, where Claude Code surprises you, and what the spec review finds that you had not anticipated.

---

## Expected Output

A complete, version-controlled handoff pack for one real or realistic feature: feature analysis, reviewed PRD, reviewed BDD scenarios, and a current CLAUDE.md. Confidence in the end-to-end workflow as a repeatable practice.

---

## Common Mistakes

- **Skipping human review between steps** — AI-to-AI without human review in the middle produces compounding errors. Human review at Steps 5 and 7 is not optional.

- **Treating the handoff pack as the end** — The handoff pack starts a conversation with engineering, not a monologue. Be available to answer questions about the spec.

- **Not committing frequently** — Commit after each significant edit. The version history is part of the value.

- **Ignoring the spec review** — If the critique says the fraud edge cases are missing, they are missing. Do not ship the PRD without addressing this.

- **Starting too big** — Your first few complete workflows should be small, simple features. Build the habit before applying it to complex, multi-team initiatives.

---

## Confidence Checklist

- [ ] I can execute all ten steps of the workflow without prompting
- [ ] I write a context brief before every skill run
- [ ] I perform human review between draft and spec review
- [ ] I resolve open questions before generating BDD
- [ ] My handoff packs include PRD, BDD, and summary in the right folders
- [ ] I commit changes with meaningful commit messages
- [ ] I can explain to an engineering team what each artefact is for
- [ ] I know where human judgement is irreplaceable in this workflow
- [ ] I understand how this connects to spec-driven development
