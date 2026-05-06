# Module 00: Mindset Shift — Why This Changes Everything

## Learning Objective

Understand why AI-native product development requires a different way of thinking about your role, your artefacts, and your relationship with engineering — and feel genuinely motivated to make the shift.

## Why It Matters for PMs

This module is not technical. It will not ask you to open a terminal. It will ask you to reconsider some assumptions about how product management works and where your leverage actually sits.

The most important thing to understand before learning any of the tools in this curriculum is *why* those tools exist and what problem they are solving. Without that understanding, the technical skills feel like chores. With it, they feel like genuine leverage.

---

## The Shift That Is Already Happening

Engineers are working differently. When a good specification exists, an AI-assisted engineer can move from spec to tested implementation faster than was possible two years ago. When the specification is vague or missing, nothing changes — the engineer still has to stop, ask questions, wait for answers, and re-interpret.

The bottleneck has moved.

In a traditional engineering workflow, speed was limited by how fast engineers could write code. That limitation is softening rapidly. The new limitation is the quality of the input — the requirements, the context, the decisions. That is PM territory.

This is not a threat to the PM role. It is an expansion of it. The PMs who grasp this become dramatically more valuable. The ones who do not become an increasingly visible drag on a faster pipeline.

---

## The Problem With How We Currently Work

Consider a typical product workflow:

1. A PM writes a feature description in a Google Doc
2. Comments are left by stakeholders, some are resolved, some are ignored
3. A Jira ticket is created with a shortened summary
4. A meeting happens where additional context is shared verbally
5. An engineer picks up the ticket, re-reads the doc, asks clarifying questions via Slack
6. Decisions get made in Slack threads that no one can find later
7. The engineer builds something, the PM reviews it and discovers three misunderstandings
8. Iteration happens

At every stage, context is lost. Decisions live in email threads, Slack messages, and meeting notes that exist in different systems, owned by different people, with no shared version history. No one has a complete picture. An engineer joining later — human or AI — has almost no way to reconstruct the reasoning behind what was built.

Now consider what happens when engineering is AI-assisted:

- The AI agent needs clear, structured context to produce good output
- Vague prose produces vague code
- Missing edge cases in the spec produce missing edge cases in the implementation
- Ambiguous requirements produce ambiguous systems

The old way of working was already inefficient. AI-assisted engineering makes the inefficiency structural.

---

## What Structured Product Thinking Looks Like

The solution is not to write more documents. It is to write *better-structured* documents in a place that AI systems can access and reason about.

Specifically:

**Instead of:** "Users should be able to update their address"

**Write:** A business rule in a PRD that specifies:
- What triggers the action
- Who can perform it and under what conditions
- What validation is required
- What happens if validation fails
- What downstream systems are notified
- What compliance or fraud checks apply
- What the user sees at each step

That level of specificity is not new — good PMs have always thought this way. The difference is that now, that specificity needs to be in a structured, machine-readable format, not embedded in narrative prose.

---

## The GitHub Insight

Here is the key reframe: **GitHub is not a developer tool. It is a structured, version-controlled knowledge base.**

When you save a product decision in a Google Doc, you get:
- A document that might be shared with some people
- Comments that may or may not be resolved
- A version history that shows who typed what, but not why

When you save a product decision in a Markdown file in a Git repository, you get:
- A structured document in a universal format
- A complete history of every change, with who made it and when
- The ability for any AI agent to read and reason about it directly
- Co-location with the code it describes
- A single source of truth that cannot fork into conflicting versions without that conflict being visible

This is not about making PMs do more technical work. It is about putting product context where it can actually be used.

---

## What AI Agents Are and Are Not

Before any of the technical modules, it is worth being precise about what we mean by AI agents.

**A chatbot** (like Gemini or ChatGPT in their basic form) takes a message, produces a response, and has no awareness of your files, your codebase, your history, or your context beyond what you paste into the conversation. Every conversation starts from scratch.

**An AI agent** (like Claude Code running in a repository) has access to your files, can read your documents, can search your codebase, can run structured workflows, and can produce artefacts that persist after the conversation ends. It operates *within* your context, not in isolation from it.

The skills in this repository — `analyse-feature`, `draft-prd`, `draft-bdd`, `spec-review` — are AI agent workflows. When you run them, you are not starting a conversation. You are running a structured, repeatable process that reads your product context, reasons about it, and produces a structured output.

This distinction matters enormously. A chatbot is a tool you use. An agent workflow is a capability you integrate into how you work.

---

## The PM Role in an AI-Native Team

Here is what this curriculum is preparing you for:

| Traditional PM Role | AI-Native PM Role |
|--------------------|-------------------|
| Write requirements in prose | Write structured, machine-readable specs |
| Share docs via email or Confluence | Maintain artefacts in version-controlled repo |
| Review engineering output manually | Review AI-generated specs before they reach engineers |
| Catch misunderstandings in review | Eliminate misunderstandings in structured artefacts |
| Keep context in your head | Externalise context into CLAUDE.md and structured docs |
| Use AI as a writing assistant | Use AI agents to critique, transform, and validate specs |

The skill set is different. But the underlying job — understanding what needs to be built and why, and ensuring that understanding is shared — is the same. You are just doing it at a different level of precision and in a different medium.

---

## Concepts Covered

- Why the bottleneck in AI-assisted engineering is upstream, in product
- The problem with current document-centric, conversation-based product workflows
- Why structured artefacts matter more than volume of documentation
- The difference between a chatbot and an AI agent
- GitHub as a version-controlled knowledge base for product context
- What changes and what stays the same in the PM role

---

## Practical Exercise

No terminal required for this module. Instead:

1. **Audit one of your recent product specs**. Pick a feature you have shipped in the last six months. Find the original requirements document.

2. **Ask yourself**: If an AI agent read only this document, could it produce a correct implementation? Write down the three biggest gaps — things that are missing, ambiguous, or buried in a Slack thread somewhere.

3. **Imagine the structured version**. What would need to be explicit, structured, and machine-readable for an AI to work from this spec confidently?

4. **Discuss with a colleague**: Where does context currently get lost in your team's workflow? What would it take to capture that context in a structured, persistent way?

---

## Expected Output

A clear mental model of why structured product artefacts matter and genuine motivation to learn the tools that make them possible. This is the most important output of the entire curriculum.

---

## Common Mistakes

- **"This is just for technical PMs"** — It is not. The technical skills in this curriculum are a small part. The bigger shift is in how you think about structuring product context.

- **"We already have good documentation"** — You may have good documents. The question is whether they are structured, version-controlled, and readable by AI agents. Most are not.

- **"GitHub is where engineers work"** — GitHub is where structured text lives with version history. That includes product context, decisions, and requirements.

- **"This will slow me down"** — The transition has a cost. The steady state is faster, more precise, and more traceable than current workflows.

---

## Confidence Checklist

Before moving to Module 01, you should be able to answer:

- [ ] Why is the bottleneck in AI-assisted development often in product, not engineering?
- [ ] What is the difference between a chatbot and an AI agent?
- [ ] Why does co-locating product context with code matter?
- [ ] What does "structured and machine-readable" mean for a product artefact?
- [ ] What stays the same about the PM role, and what changes?
