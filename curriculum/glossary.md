# Glossary

Plain-English definitions of terms used in this curriculum. If you encounter a term that is not listed here, ask your champion or open an issue in this repository.

---

## A

**Agent (AI agent)**
An AI system that can take actions, read files, run workflows, and produce persistent outputs — as opposed to a chatbot that only responds to messages. Claude Code runs as an agent inside your repository. See also: *Chatbot*, *Skill*.

**API (Application Programming Interface)**
A way for software systems to communicate with each other. When Jira "talks to" your calendar, or when Claude Code accesses your Confluence, it does so via APIs. As a PM, you do not need to write APIs, but you will encounter the term when discussing integrations.

**API key**
A password-like credential that allows software to access an API. Treat like a password: never paste into a file or prompt. See [Governance and Guardrails](governance-and-guardrails.md).

**Artefact**
In this curriculum: a structured product document — a PRD, a BDD scenario file, a feature analysis. The AI skills in this repo produce artefacts. We use this word to mean a specific, persistent output, not a rough note or conversation.

---

## B

**BDD (Behaviour-Driven Development)**
A way of describing software behaviour using structured scenarios that can be understood by product managers, engineers, and QA teams alike. BDD scenarios use the *Gherkin* format. See also: *Gherkin*, *Scenario*, *Feature file*.

**Branch**
In Git, a parallel version of the repository where changes can be made independently before being merged back. Engineers use branches heavily. As a PM, you will mostly work on the `main` branch. See also: *Commit*, *Merge*, *Pull Request*.

**Bootstrap**
The setup script in this repository (`bootstrap.sh`) that installs the playbook skills and agents onto your machine in one command. "Bootstrapping" generally means getting a system to its initial working state.

---

## C

**Chatbot**
An AI system you interact with via conversation, with no access to your files or context beyond what you type. Claude.ai, Gemini, and ChatGPT are chatbots in their standard form. Different from an *AI agent*. See also: *Agent*, *Context window*.

**Claude Code**
The Anthropic AI assistant that runs in your terminal, reads your repository files, and runs structured workflows (skills). Different from Claude.ai (the website). See [Module 05](module-05-claude-code.md).

**CLAUDE.md**
A special file that Claude Code reads automatically at startup. It is your project's persistent briefing document — who the product is for, what constraints apply, where documents are stored. See [Module 07](module-07-context-management.md).

**Clone**
The Git operation that downloads a copy of a repository from GitHub to your local machine. Done once per repository. See [Module 03](module-03-github.md).

**Commit**
A saved checkpoint in Git history. A commit records what changed, when, and who made the change. You write a short message explaining the change. See [Module 03](module-03-github.md).

**Context (AI context)**
Everything an AI agent can "see" when working on a task — the files it has read, the conversation so far, the CLAUDE.md briefing. AI agents can only reason about what is in their context. See [Module 07](module-07-context-management.md).

**Context pollution**
When incorrect, outdated, or conflicting information in the context causes an AI agent to produce wrong or inconsistent outputs.

**Context window**
The maximum amount of text an AI model can hold in working memory at one time. Content beyond the context window is not visible to the model. Relevant because it means you cannot simply dump all your documents into a prompt.

---

## D

**Directory**
Another word for folder. Used frequently in terminal commands (`cd` = change directory, `mkdir` = make directory).

**Draft (artefact)**
Every output from a Claude Code skill is a draft. It is a strong starting point but requires human review before it is used for real decisions. See [Governance and Guardrails](governance-and-guardrails.md).

---

## E

**Environment variable**
A variable set in your terminal session that tools can read. Used to store credentials (like API keys) without putting them in files. Safe because they are not committed to Git.

---

## F

**Feature (Gherkin)**
The top-level element of a Gherkin file. Describes the feature being specified. Contains multiple *Scenarios*. Example: `Feature: Personalised spending alerts`.

**Feature file**
A file ending in `.feature` that contains BDD scenarios in Gherkin format. Stored in `docs/bdd/` in this playbook. See [Module 06](module-06-agent-workflows.md).

**Fork**
A copy of a repository under a different owner on GitHub. Engineers use forks to contribute to open-source projects. As a PM, you will usually clone directly rather than fork.

---

## G

**Gherkin**
The language used to write BDD scenarios. Uses a specific structure: `Feature`, `Scenario`, `Given`, `When`, `Then`. Designed to be readable by non-technical stakeholders while being precise enough for engineers and QA teams.

**Git**
Version control software that tracks changes to files. Runs on your local machine. See [Module 03](module-03-github.md). See also: *GitHub*.

**GitHub**
The website that hosts Git repositories online. Where the playbook lives. Where your team's product artefacts will live. Different from Git (the software on your machine). See [Module 03](module-03-github.md).

**Guardrail**
A constraint built into a workflow or tool to prevent errors or misuse. In this curriculum: rules about what data can be included in prompts, review requirements before artefacts are used, and model limitations to be aware of.

---

## H

**Handoff pack**
The complete set of artefacts passed from product to engineering at the end of the upstream product workflow. In this curriculum: feature analysis + reviewed PRD + reviewed BDD scenarios + current CLAUDE.md.

**Homebrew**
A package manager for Mac that installs software via terminal commands. Used to install Git and other tools. See [Module 01](module-01-machine-readiness.md).

---

## I

**Integration**
A connection between two software systems that allows them to exchange data. In this curriculum: the future connections between Claude Code and Jira or Confluence that will allow context to be pulled automatically.

---

## L

**Local (repository)**
The copy of a repository that lives on your machine, as opposed to the *remote* copy on GitHub. See [Module 03](module-03-github.md).

---

## M

**Markdown**
A lightweight formatting language used for all documents in this repository. Uses simple symbols (like `#` for headings, `**` for bold) to add structure to plain text. Renders beautifully on GitHub and in VS Code. See [Module 04](module-04-markdown.md).

**Merge**
The Git operation that combines changes from one branch into another. Engineers handle this in most PM workflows; you will encounter the term in Pull Requests.

**Module**
One section of this curriculum. Each module covers a specific topic, has a learning objective, and builds on previous modules.

---

## P

**PAT (Personal Access Token)**
A credential (like a password) used to authenticate to APIs. Required for integrations with Jira, Confluence, and GitHub. Must be treated as a secret — never pasted into files or prompts. See [Governance and Guardrails](governance-and-guardrails.md).

**PATH**
A system variable that tells your terminal where to find installed programs. If you install a tool but the terminal says "command not found", the tool is probably not on your PATH. See [Setup Guide](setup-guide-mac.md) for how to fix this.

**PII (Personally Identifiable Information)**
Any data that could identify a real individual: names, addresses, dates of birth, National Insurance numbers, account numbers. Must never be included in AI prompts or repository files.

**PRD (Product Requirements Document)**
A structured document that describes what a feature does, who it is for, the user journey, business rules, scope, and open questions. The central artefact in this workflow. See [Module 06](module-06-agent-workflows.md).

**Prompt**
The text you give to an AI model. Everything you type to Claude Code is a prompt. The quality of the prompt significantly affects the quality of the output.

**Pull**
The Git operation that downloads the latest changes from the remote repository to your local copy. Run this at the start of every work session. See [Module 03](module-03-github.md).

**Pull Request (PR)**
A GitHub mechanism for proposing changes to a repository. The contributor pushes their changes, opens a PR, and requests review before the changes are merged. Engineering teams use PRs extensively. Product teams may use them for significant changes to product artefacts.

**Push**
The Git operation that sends your committed local changes to the remote repository on GitHub. See [Module 03](module-03-github.md).

---

## R

**Remote (repository)**
The copy of a repository hosted on GitHub, as opposed to the *local* copy on your machine. See [Module 03](module-03-github.md).

**Repository (repo)**
A folder tracked by Git. Contains version-controlled files. Can be shared via GitHub. The playbook is a repository. Your product project is a repository. See [Module 03](module-03-github.md).

---

## S

**Scenario**
A single, testable behaviour described in Gherkin format. A scenario has a name, and uses `Given`, `When`, `Then` steps. A feature file contains multiple scenarios. Example:
```gherkin
Scenario: Customer successfully sets a spending alert
  Given I am an authenticated retail customer
  When I set a weekly spending alert of £500
  Then the alert is saved to my account
```

**Skill**
In Claude Code: a pre-built workflow triggered by a `/command`. The skills in this playbook are `analyse_feature`, `draft_prd`, `draft_bdd`, and `spec_review`. See [Module 06](module-06-agent-workflows.md).

**Spec-driven development**
An engineering approach where detailed specifications (PRDs, BDD scenarios) are written first, and AI or human developers implement them from the spec. This is why structured, machine-readable product artefacts matter.

**Stage (Git)**
Preparing a file to be included in the next commit. You stage files with `git add`. See [Module 03](module-03-github.md).

---

## T

**Terminal**
The text-based interface for giving instructions to your Mac. Also called the command line. See [Module 02](module-02-command-line.md) and [Setup Guide](setup-guide-mac.md).

---

## V

**Version control**
A system for tracking changes to files over time. Git is version control software. Version control records what changed, when, and who changed it — with a message explaining why. See [Module 03](module-03-github.md).

**VS Code (Visual Studio Code)**
A free text editor, highly recommended for editing Markdown files. Shows a formatted preview of Markdown. Install via: `brew install --cask visual-studio-code`. See [Setup Guide](setup-guide-mac.md).

---

## W

**Working directory**
The folder you are currently in, in Terminal. The result of the `pwd` command. See [Module 02](module-02-command-line.md).

---

## Common Abbreviations

| Abbreviation | Meaning |
|-------------|---------|
| API | Application Programming Interface |
| BDD | Behaviour-Driven Development |
| CI/CD | Continuous Integration / Continuous Deployment |
| FCA | Financial Conduct Authority |
| GDPR | General Data Protection Regulation |
| KYB | Know Your Business (business customer verification) |
| KYC | Know Your Customer (customer identity verification) |
| PAT | Personal Access Token |
| PII | Personally Identifiable Information |
| PR | Pull Request |
| PRD | Product Requirements Document |
| QA | Quality Assurance |
| TDD | Test-Driven Development |
| UI | User Interface |
| UX | User Experience |
