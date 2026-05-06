# Module 04: Markdown and Structured Product Artefacts

## Learning Objective

Write clean, structured product documents in Markdown that are readable by humans and interpretable by AI agents.

## Why It Matters for PMs

Every artefact produced by the skills in this repo is a Markdown file. Every file in this repository that you will read, edit, and contribute to is Markdown. The PRDs, BDD scenarios, feature analyses, and spec reviews that Claude Code produces — all Markdown.

Markdown is a simple formatting language. It is not code. Learning it takes less than an hour. Using it well takes a bit of practice. The payoff is significant: structured, consistent artefacts that any person or AI agent can read without ambiguity.

Markdown matters for AI-native work for a specific reason: **AI agents reason better over structured text than unstructured prose**. A document with clear headings, explicit lists, and consistent formatting gives an agent clear signals about what is a heading, what is a list item, what is a rule, and what is a note. Prose buries those signals in sentences.

---

## Concepts Covered

- What Markdown is and why it is the right format for product artefacts
- Headings, paragraphs, and basic structure
- Lists: bullet, numbered, and nested
- Bold, italic, and code formatting
- Tables
- Links
- Code blocks
- Writing structured product artefacts in Markdown
- Viewing Markdown rendered vs raw
- Common mistakes that confuse AI agents

---

## What Is Markdown?

Markdown is plain text with simple symbols that add formatting. You write it in a plain text editor (or directly in GitHub) and it renders into formatted documents.

Instead of clicking a "Bold" button in Word, you wrap text in `**asterisks**`. Instead of using a heading style, you prefix a line with `#`.

The full Markdown specification is large. The part you need for product artefacts is small. What follows covers everything you will use.

---

## The Basics

### Headings

Use `#` symbols to create headings. More `#` symbols = smaller heading.

```markdown
# Heading 1 — Document title
## Heading 2 — Major section
### Heading 3 — Subsection
#### Heading 4 — Sub-subsection
```

Use headings consistently. A PRD should have the same heading structure every time — this is what makes it machine-readable.

### Paragraphs

Just write text. A blank line between blocks of text creates a new paragraph.

```markdown
This is a paragraph.

This is a separate paragraph.
```

### Bold and Italic

```markdown
**This is bold**
*This is italic*
```

Use bold for key terms, critical rules, and things that must not be missed. Use italic sparingly, mainly for emphasis.

### Lists

Unordered (bullet) list:
```markdown
- First item
- Second item
- Third item
```

Ordered (numbered) list:
```markdown
1. First step
2. Second step
3. Third step
```

Nested list:
```markdown
- Parent item
  - Child item
  - Another child item
- Another parent
```

For product artefacts, use ordered lists for steps and sequences. Use bullet lists for items where order does not matter.

### Tables

Tables are powerful for comparing options, listing rules, or showing structured data:

```markdown
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Row 1    | Data     | Data     |
| Row 2    | Data     | Data     |
```

Renders as:

| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Row 1    | Data     | Data     |
| Row 2    | Data     | Data     |

Tables are especially useful in PRDs for:
- Business rules (Trigger / Happy Path / Unhappy Path)
- Scope tables (In / Out)
- Success metrics (Metric / Target / How measured)

### Code Blocks

Use backtick fences for code or anything that should not be formatted as prose:

````markdown
```
This text will appear
exactly as written
```
````

Use inline code for short references: \`like this\` renders as `like this`.

In product artefacts, code blocks are useful for:
- Example API responses
- Example data formats
- BDD Gherkin scenarios (more on this in Module 06)

### Links

```markdown
[Link text](https://example.com)
[Link to another file](../docs/prd/my-feature.md)
```

Use links to connect related artefacts. A BDD file can link back to the PRD it was generated from. A spec review can link to the BDD file it reviewed.

---

## Structuring Product Artefacts in Markdown

### PRD Structure

A well-structured PRD in Markdown looks like this:

```markdown
# Feature Name — Product Requirements Document

## 1. Introduction and Background
[What problem this solves and who is affected]

## 2. Objectives and Success Metrics

| Metric | Target | How Measured |
|--------|--------|--------------|
| ...    | ...    | ...          |

## 3. User Journey

### 3.1 Happy Path
1. User does X
2. System responds with Y
3. User sees Z

### 3.2 Unhappy Path — [Condition]
1. User attempts X
2. System detects [condition]
3. User sees error message: "..."

## 4. Scope

**In scope:**
- ...

**Out of scope:**
- ...

## 5. Business Rules and Logic

| Trigger | Happy Path | Unhappy Path |
|---------|-----------|--------------|
| ...     | ...       | ...          |

## 6. Assumptions and Open Questions

**Assumptions:**
- ...

**Open questions:**
- [ ] Who owns the decision on X?
- [ ] What is the compliance requirement for Y?
```

Notice: the structure is consistent, hierarchical, and unambiguous. Every section has a clear heading. Lists are used for steps and items. Tables are used for rules. Checkboxes (`- [ ]`) are used for open questions.

This structure is what makes the PRD useful as input to the `draft-bdd` and `spec-review` skills.

### Why Consistent Structure Matters for AI Agents

When an AI agent reads a PRD, it uses the heading structure to understand what type of content each section contains. If every PRD has the same section names and structure, the agent can reliably find the business rules, the edge cases, the scope, and the open questions.

If the structure varies — sometimes business rules are in a table, sometimes buried in prose, sometimes in a list — the agent has to guess. Guessing introduces errors and inconsistency in the outputs.

**Consistency in structure is a form of quality.**

---

## Writing Style for AI-Readable Artefacts

Beyond formatting, the *content* of your Markdown matters. Some guidelines:

**Be explicit, not implicit.** Do not write "users can update their details" — write "authenticated users can update their home address, telephone number, and email address. They cannot update their date of birth or national insurance number."

**Use precise language.** "Sometimes", "usually", and "typically" are ambiguous. "In fewer than 5% of cases" is not.

**Flag uncertainty explicitly.** If you do not know something, write `> **Open question**: What validation rules apply here?` rather than leaving it out or making something up.

**One idea per bullet.** Do not combine two requirements into one list item.

**Write rules, not descriptions.** "The system validates the postcode" is a description. "The system rejects postcodes that do not match a valid UK postcode format and displays the error: 'Please enter a valid UK postcode'" is a rule.

---

## Editing Markdown

You can edit Markdown files directly in your terminal with a text editor. The simplest option on a Mac is **TextEdit** (set it to plain text mode), or install **Visual Studio Code** (free, highly recommended):

```bash
brew install --cask visual-studio-code
```

VS Code opens Markdown files and shows a live preview side-by-side. To preview: open a `.md` file, press `Command + Shift + V`.

You can also edit files directly in GitHub's web interface by clicking the pencil icon on any file.

---

## Practical Exercise

**Part 1: Basic formatting practice**

Open a new file in VS Code or a text editor. Create a document with:

- A heading and two sub-headings
- A paragraph under each
- One bullet list and one numbered list
- A two-column table with at least three rows
- One bold term and one link

Save it as `practice.md` and preview it in VS Code.

**Part 2: Write a mini-PRD**

Pick a simple feature you know well — something like "user can update their notification preferences." Write a short PRD in Markdown with at least these sections:

- Introduction and Background
- User Journey (happy path only, numbered steps)
- Scope (in/out table)
- Business Rules (at least one trigger/happy/unhappy row)
- Open Questions (at least two checkboxes)

Keep it brief — this is about structure, not completeness.

**Part 3: Critique your own structure**

Read your mini-PRD and ask: if an AI agent read only this document, what would it know? What would it be uncertain about? What would it have to guess?

Edit the document to reduce those uncertainties.

---

## Expected Output

A mini-PRD written in Markdown with consistent structure, explicit business rules, and flagged open questions. Comfort writing and previewing Markdown in VS Code.

---

## Common Mistakes

- **Writing headings without a space**: `#Heading` is wrong; `# Heading` is correct.

- **Inconsistent heading levels**: Jumping from `##` to `####` without a `###` in between creates confusing hierarchy.

- **Burying rules in prose**: "The user can update their address, though there are some restrictions around PO boxes which may be rejected in some cases depending on the delivery partner" should be a table row, not a sentence.

- **Using tables for everything or nothing**: Tables are best for rules and structured comparisons. Steps should be numbered lists. Prose should be prose.

- **Not flagging open questions**: Leaving gaps implicit is worse than making them explicit. Mark every unknown with an open question.

- **Forgetting the blank line**: In Markdown, a blank line between two items is required to separate them into different blocks. Without it, things can render unexpectedly.

---

## Confidence Checklist

- [ ] I can write all six heading levels correctly
- [ ] I can write bullet lists, numbered lists, and nested lists
- [ ] I can create a Markdown table
- [ ] I can use bold, italic, and code formatting
- [ ] I understand why consistent structure matters for AI agents
- [ ] I can write business rules as explicit rules, not descriptions
- [ ] I can flag open questions explicitly with checkbox syntax
- [ ] I have written a mini-PRD in Markdown
- [ ] I can preview Markdown in VS Code or GitHub
