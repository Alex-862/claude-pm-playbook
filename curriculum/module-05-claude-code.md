# Module 05: Claude Code Basics

## Learning Objective

Understand what Claude Code is, how it differs from chat-based AI, and be able to start it, give it context, and have a productive first interaction in a repository.

## Why It Matters for PMs

Everything in this curriculum leads to this: running Claude Code in a repository context and using it to produce and improve product artefacts. But Claude Code is not a chatbot. If you approach it like one, you will get poor results. This module explains the difference and sets you up for success.

---

## Concepts Covered

- The fundamental difference between a chatbot and Claude Code
- What a context window is and why it matters
- What CLAUDE.md is and why it is the most important file in your project
- How to start Claude Code
- How to give Claude Code useful context
- How to run a skill
- How to navigate Claude Code's responses
- What Claude Code cannot do

---

## Chatbot vs Claude Code: The Critical Difference

**A chatbot** (Claude.ai, Gemini, ChatGPT) works like this:
- You open a conversation
- You type a message
- It responds based on its training and what you have told it in that conversation
- The conversation ends, and the next conversation starts from scratch
- It has no access to your files, your codebase, or your organisational context

**Claude Code** works like this:
- You run it inside a folder (your repository)
- It reads the files in that folder — your documents, your specs, your CLAUDE.md context file
- It has access to the full contents of your project
- It can run pre-built workflows (skills) that produce structured, persistent outputs
- Those outputs are saved as files in your repository — they persist after the session ends

The mental model shift: Claude Code is not a conversation partner. It is a context-aware agent running inside your knowledge base.

---

## What Is a Context Window?

Every AI model has a context window — the amount of text it can hold in "working memory" at any one time. Anything outside the context window, the model cannot see or reason about.

For a chatbot, the context window is filled with your conversation history.

For Claude Code, the context window can be filled with:
- The contents of your files
- The output of searches through your repository
- Your CLAUDE.md project context
- Your conversation

This is why the *content and structure of your files* matters so much. When Claude Code reads your PRD, it is literally reading the text into its context window. A well-structured, explicit PRD gives it a coherent picture. A vague, incomplete one leaves gaps it will have to guess at.

**Practical implication**: Keep individual artefact files focused and well-structured. Do not dump everything into one enormous document.

---

## What Is CLAUDE.md?

`CLAUDE.md` is a special file that Claude Code always reads first when it starts up in a project folder. It is your project's persistent briefing document.

Think of it as the brief you would give a new consultant before their first day. It should contain:

- What this project is for
- Who the audience is for product artefacts
- Where different types of documents are stored
- What conventions to follow
- What constraints apply
- What not to do

The `templates/CLAUDE.md` in this repo contains a starter version. When you bootstrap a new project from this playbook, it gets copied into your project root.

**Read your CLAUDE.md before every session, and update it whenever something important changes about your project or team context.** Claude Code reads it fresh each time.

Example of what a CLAUDE.md might contain:

```markdown
# Project Context

## What This Is
This repo contains product requirements for the Customer Identity platform at [Organisation].

## Audience
Product managers, engineers, designers, risk and compliance.

## Document Locations
- PRDs: /docs/prd
- BDD scenarios: /docs/bdd
- Summaries: /docs/summaries

## Key Constraints
- This is a regulated financial service. All artefacts must flag compliance implications.
- Do not invent technical implementation details — call out where engineering input is needed.
- Fraud and operational edge cases must be explicitly called out, not assumed.

## Terminology
- "Customer" means an authenticated retail banking customer
- "User" means an internal staff member
```

---

## Starting Claude Code

Navigate to your project folder in Terminal, then run:

```bash
claude
```

Claude Code will start and read your `CLAUDE.md` (if one exists). You will see a prompt indicating it is ready.

You can also start it and immediately give it a task:

```bash
claude "Analyse the payment limits feature"
```

Or open it in interactive mode and type commands as you go.

---

## Running a Skill

Skills are pre-built workflows. They are triggered by typing a `/` followed by the skill name.

To see all available skills:
```
/help
```

To run the feature analysis skill:
```
/analyse_feature
```

To draft a PRD:
```
/draft_prd
```

To draft BDD scenarios from an existing PRD:
```
/draft_bdd
```

To run a spec review:
```
/spec_review
```

When you run a skill, Claude Code will typically ask you for relevant context — which feature to analyse, which files to read, or which PRD to work from. Provide this context clearly and specifically.

---

## Giving Claude Code Good Context

The single most impactful thing you can do to improve Claude Code's outputs is to give it clear, specific context.

**Weak context:**
```
/draft_prd — please write a PRD for the address update feature
```

**Strong context:**
```
/draft_prd

The feature is: Allow authenticated retail customers to update their home address via the mobile app.

Relevant context:
- The feature analysis summary is in docs/summaries/address-update-analysis.md
- Compliance have confirmed address changes require identity re-verification if the account is less than 30 days old
- Engineering have said they cannot call the address verification API synchronously — it must be async
- The current flow for address updates requires a call centre agent — this is a self-service replacement
- Out of scope: business customers, joint accounts, international addresses
```

The second version gives Claude Code everything it needs to produce a specific, useful PRD rather than a generic template.

**Rule of thumb**: Before running a skill, write down what the AI would need to know to do a good job. Then give it that information.

---

## What Claude Code Produces

When you run a skill, Claude Code:

1. Reads the relevant files in your repository
2. Reasons about the task given your context
3. Produces a structured output
4. Saves that output as a file in the appropriate folder

For example, `/draft_prd` saves its output to `docs/prd/<feature-name>.md`. You can then open that file, review it, edit it, and use it as input for the next skill in the workflow.

**Always review the output.** Claude Code produces drafts, not final artefacts. Every output needs human judgement applied to it before it is used for real decisions.

---

## Navigating Claude Code's Responses

Claude Code responses can be long. Some navigation tips:

- **Scroll up** in your terminal to see earlier output
- **The file is the output** — when a skill saves a file, open the file in VS Code to read it comfortably
- **Ask follow-up questions** — Claude Code maintains context within a session, so you can ask it to clarify, expand, or revise
- **Be specific in follow-ups**: "Make the user journey section more detailed" is better than "improve it"

---

## What Claude Code Cannot Do

It is important to be clear about limitations:

- **It cannot invent facts about your organisation, customers, or systems** — it can only work with the context you give it
- **It cannot access external systems** (Jira, Confluence, Salesforce) without integration configured by your team
- **It cannot guarantee compliance** — it can flag where compliance review is needed, but it is not a substitute for a compliance professional
- **It is not a search engine** — it cannot browse the internet or retrieve live data unless specifically configured to do so
- **It can make mistakes** — especially if given vague or incomplete context. Review every output critically.

---

## Practical Exercise

**Part 1: Start Claude Code in the playbook repo**

```bash
cd ~/Documents/claude-pm-playbook
claude
```

Type `/help` to see available skills. Read the list.

**Part 2: Ask Claude Code about the repo**

Without using a skill, just ask:

```
What files are in this repository and what does each skill do?
```

Read the response. Notice how it is reading actual files — this is not a generic answer; it is based on the real contents of the repo.

**Part 3: Run a skill with minimal context**

```
/analyse_feature

Feature: the draft_prd skill in this repo
```

Read the output. Note the structure of the analysis.

**Part 4: Run the same skill with richer context**

Now try again with more specific context. Ask it to analyse the BDD writer agent specifically, and tell it what you are trying to understand:

```
/analyse_feature

I want to understand how the bdd-writer agent works. 
Specifically: what inputs does it need, what does it do with them, and what does it produce?
I am a PM who wants to know if this agent's output is suitable for handing to an engineering QA team.
```

Compare the two outputs. Notice the difference that context makes.

---

## Expected Output

Comfort starting Claude Code, running a skill, and giving context effectively. A clear mental model of how Claude Code differs from a chatbot and why context quality determines output quality.

---

## Common Mistakes

- **Treating Claude Code like a chatbot** — Claude Code is most powerful when given structured context and run against a well-organised repository. Casual one-line prompts produce generic outputs.

- **Not reviewing outputs critically** — Claude Code produces drafts. They are often very good starting points but always require human review, especially for regulated domains.

- **Ignoring the CLAUDE.md file** — If your project CLAUDE.md is out of date or empty, Claude Code is working without a briefing. Keep it current.

- **Expecting Claude Code to know your organisation** — It only knows what is in the files. If key context lives in someone's head, a Slack thread, or a Jira comment, it is not available to Claude Code.

- **Running skills without enough context** — The most common source of disappointing outputs. Give it the relevant background before running a skill.

---

## Confidence Checklist

- [ ] I can explain the difference between Claude Code and Claude.ai
- [ ] I understand what a context window is
- [ ] I know what CLAUDE.md is and why it matters
- [ ] I can start Claude Code from the terminal
- [ ] I can run a skill using `/skill-name`
- [ ] I can give effective context before running a skill
- [ ] I have run at least two skills and compared the quality of their outputs
- [ ] I review Claude Code outputs critically before using them
