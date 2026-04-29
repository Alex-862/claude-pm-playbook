# GitHub as a Product Knowledge Base

## The Core Reframe

Most Product Managers think of GitHub as "where the code lives." That framing is limiting and, for our purposes, wrong.

GitHub is a structured, version-controlled system for managing any text-based content. Code is one type of content it manages. Product requirements, decisions, context, design rationale, compliance notes, and AI workflows are others.

When you put product artefacts in GitHub instead of Google Docs or Confluence, you are not doing developer work. You are choosing a better medium for the kind of structured, collaborative, auditable content that product teams need to produce.

---

## Why Markdown Matters

Markdown is the language of GitHub. Every file in this repository is Markdown.

Markdown has three properties that make it ideal for product artefacts:

**1. It is plain text.** Plain text has no proprietary format. It opens in any editor, on any machine, in any system. It will not break. It will not require a licence to read. A Markdown file written today will be readable in twenty years.

**2. It is structured.** Headings, lists, tables, and code blocks give Markdown documents clear, consistent structure. That structure is machine-readable — an AI agent can identify a heading, a list item, a table row, or a code block and reason about them accordingly.

**3. It renders beautifully.** On GitHub, in VS Code, and in most modern tools, Markdown renders into a clean, formatted document. Your PRD written in Markdown looks professional when viewed on GitHub, without any additional effort.

The alternative — Word documents, PowerPoint slides, Google Docs — produces files that are readable by humans but not by AI agents. They cannot be meaningfully parsed, searched at the content level, or transformed by automated workflows.

---

## Why Version Control Matters

When you save a document in Google Docs:
- The version history is automatic but opaque — you can see what changed, but not why
- Multiple people can edit simultaneously, creating conflicts that are hard to resolve
- The "latest" version is wherever the file cursor happens to be
- Linking to specific versions is unreliable

When you save a document in Git:
- Every change is a deliberate, named commit with a message explaining what changed and why
- Conflicts are explicit and must be resolved before changes are accepted
- Every version is permanently addressable — you can retrieve the exact state of a file on any date
- The history is searchable and auditable

For a regulated financial services environment, this is not a minor quality-of-life improvement. It is the difference between a documentation system that is defensible in a regulatory review and one that is not.

**"We had a document in Confluence" is not an audit trail.**

**"This requirement was added on [date], in [commit], by [person], with the note: [rationale]" is.**

---

## Why Repo Structure Matters

How you organise files in a repository affects:

- How easy it is to find things
- How well AI agents can navigate the project
- Whether related artefacts are connected or isolated
- How a new team member (human or AI) can get up to speed

A well-structured product repo looks like this:

```
my-product-project/
├── CLAUDE.md                    ← AI briefing and project context
├── README.md                    ← Human-readable project overview
├── docs/
│   ├── prd/                     ← Product Requirements Documents
│   │   └── feature-name.md
│   ├── bdd/                     ← BDD/Gherkin scenarios
│   │   └── feature-name.feature
│   └── summaries/               ← Feature analyses and supporting notes
│       └── feature-name-analysis.md
└── curriculum/                  ← Learning materials (in this repo)
```

This structure has conventions: PRDs go in `docs/prd/`, BDD files go in `docs/bdd/`. When these conventions are followed consistently, anyone (and any AI agent) working in the repo knows where to look.

Inconsistent structure — PRDs scattered in a `misc` folder, some as Word docs, some as Markdown, some filed by date and some by feature — creates friction for humans and is almost unusable for AI agents.

**Structure is a form of quality.**

---

## Why This Helps AI Agents

AI agents like Claude Code read files. The quality of what they can do is directly constrained by the quality of what they read.

When you give an AI agent:
- Well-structured Markdown files with consistent headings
- Clear separation between different types of artefacts (PRD vs BDD vs summary)
- A CLAUDE.md that explains the project context
- Version history that shows how decisions evolved

…the agent can navigate intelligently, reason about the content accurately, and produce outputs that are specific and useful.

When you give an agent:
- Unstructured prose in a Google Doc link
- A Jira ticket with a three-line description pointing to a Confluence page
- Verbal context from a meeting that was never recorded

…the agent has nothing to work with. It falls back on generics and guesswork.

The structured, version-controlled repository is not just convenient for AI. It is the prerequisite for AI-native product workflows.

---

## GitHub vs Google Docs and Confluence

This is not a competition. Different tools have different strengths. The question is: what belongs where?

| Concern | Google Docs / Confluence | GitHub (Markdown) |
|---------|--------------------------|-------------------|
| Real-time collaborative editing | Excellent | Requires pull/push cycle |
| Comment threads and discussion | Excellent | Pull Requests and Issues |
| Visual formatting and diagrams | Excellent | Possible but limited |
| Version history with rationale | Limited | Excellent |
| AI agent readability | Poor | Excellent |
| Searchability | Reasonable | Excellent (Git + grep) |
| Audit trail | Poor | Excellent |
| Integration with codebase | None | Native |
| Access control | Folder permissions | Repository permissions |
| Long-term stability | Dependent on tool | Plain text, permanent |

**Recommendation for financial services PM teams:**

- Use Google Docs or Confluence for **early-stage collaboration and discussion** — when a document is in flux and multiple people are editing simultaneously
- Use GitHub (Markdown) for **finalised, structured product artefacts** — PRDs, BDD scenarios, feature analyses, decisions
- Never use GitHub to store **sensitive customer data** — that is what secure internal systems are for
- Use Confluence for **broad organisational knowledge** (how-to guides, team documentation) and link to GitHub for **artefact-level detail**

The goal is not to replace all your existing tools. It is to use the right tool for the right kind of content.

---

## How to Avoid Creating Duplication and Chaos

The main risk when introducing a new tool is fragmentation: the same information existing in multiple places, out of sync, with no single source of truth.

**Rules to prevent fragmentation:**

**1. Single source of truth per artefact type.** A PRD should have exactly one home. If it starts in a Google Doc during discovery and migrates to GitHub when structured, the Google Doc should be clearly marked as superseded and link to the GitHub version.

**2. Link, do not copy.** If a Jira ticket references requirements, link to the PRD in GitHub rather than copying the content into the ticket. Copies diverge; links point to the current truth.

**3. Name things consistently.** Feature names should be consistent across Jira, Confluence, and GitHub. If the feature is called "Spending Alerts" in Jira, the GitHub file should be `spending-alerts.md`, not `CustomerAlertFeature_v3.md`.

**4. Archive, do not delete.** When a document is superseded, mark it as archived with a link to the current version. Do not delete it — the history may be needed for audit.

**5. Keep CLAUDE.md current.** This is the AI agent's map of the project. If it is out of date, everything downstream degrades. Assign someone to review and update it monthly.

**6. Use pull requests for significant changes.** On team repositories, use pull requests (PRs) for changes to finalised artefacts. This creates a review process and a documented record of why changes were made.

---

## Getting Started Without Disrupting Everything

You do not need to migrate your entire product knowledge base to GitHub overnight. The pragmatic approach:

**Month 1**: Use this playbook to produce AI-native artefacts for one feature. Keep your current tools for everything else.

**Month 2**: Extend the approach to your current sprint's features. Share the outputs with engineering — ask for feedback on quality.

**Month 3**: Establish naming and structure conventions with your team. Agree on what types of content belong in GitHub vs Confluence.

**Month 6**: Review which types of content genuinely need to live in GitHub and which are better elsewhere. Adjust accordingly.

The goal is not to use GitHub for everything. The goal is to have a version-controlled, AI-readable home for structured product artefacts that need to be precise, auditable, and machine-usable.
