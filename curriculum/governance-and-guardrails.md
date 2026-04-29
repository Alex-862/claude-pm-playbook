# Governance and Guardrails

## For Product Managers in UK Financial Services

This guidance applies to all use of Claude Code and related AI tools for product management work within a UK financial services environment. It is written to complement, not replace, your organisation's data governance policy, AI acceptable use policy, and information security standards.

**When in doubt, do not include it in a prompt. Ask your information security or data governance team first.**

---

## Core Principles

### 1. AI tools process what you give them

When you type text into Claude Code — or when Claude Code reads a file in your repository — that text is processed by the AI model. This processing happens on infrastructure operated by Anthropic or your enterprise AI provider. Treating this like a private conversation is incorrect.

Operate under this assumption: **anything you put into a prompt or a repository file that Claude Code reads could, in theory, be seen by someone other than you.**

This is why data governance matters here as much as it does in any other system.

### 2. Use only enterprise-approved tools

Your organisation should maintain an approved list of AI tools that have been assessed for security, data handling, and contractual compliance. Claude Code accessed via an enterprise agreement is different from Claude.ai accessed via a personal account.

- Use only the enterprise-approved instance
- Use only enterprise credentials (not personal API keys)
- Do not use the free public version of any AI tool for work tasks

If you are unsure whether your organisation has an approved enterprise agreement for Claude Code, ask your IT or information security team before proceeding.

### 3. The repository is not a secure document store

A Git repository is a shared, collaborative environment. Treat everything in the repository as accessible to anyone with repository access — which, in your organisation, may include all engineers and product team members.

Do not store anything in the repository that you would not be comfortable with any authorised team member reading.

---

## What Must Never Go in a Prompt or Repository File

The following categories of information must never be included in:
- Any prompt you type to Claude Code
- Any file that Claude Code reads (including CLAUDE.md, PRDs, BDD files, summaries)
- Any commit to the repository

### Customer personal data (PII)

- Real customer names
- Addresses, phone numbers, email addresses
- Dates of birth
- National Insurance numbers
- Passport or driving licence numbers
- Any combination of data that could identify a real customer

**Use fictional examples instead.** If you need to illustrate a scenario, use clearly invented data:
- Not: "Customer John Smith, account 12345678..."
- Yes: "Customer [EXAMPLE NAME], account [EXAMPLE ACCOUNT]..."

### Financial account data

- Real account numbers or sort codes
- IBANs or BIC codes
- Card numbers (even partial)
- Real transaction amounts or histories
- Credit scores or creditworthiness data

### Authentication credentials and secrets

- Passwords of any kind
- API keys or tokens (including Personal Access Tokens)
- Private keys or certificates
- OAuth secrets
- Any credentials for internal systems

**How to handle PATs and API keys**: Store them in environment variables or your organisation's approved secrets manager (e.g., HashiCorp Vault, AWS Secrets Manager). Never paste them into a file or prompt. See the [PAT Handling](#pat-handling-and-secrets-management) section below.

### Commercially sensitive information

- Undisclosed financial performance data
- Merger or acquisition discussions
- Regulatory breach or enforcement information
- Confidential pricing or contract terms with named third parties

### Classified or restricted internal information

Follow your organisation's data classification scheme. If a document is classified as RESTRICTED or above, it should not be processed by an external AI tool.

---

## Using Anonymised and Fictional Examples

You often need examples to make your requirements concrete. Use fictional data that cannot be traced to any real person or account.

**Good practice:**
```
Given customer [EXAMPLE] has a current account balance of £850
And they have set a weekly spending alert threshold of £500
When their weekly spending reaches £500...
```

**Not acceptable:**
```
Given Sarah Johnson from our pilot group (account 20384756) has...
```

If you are working from a real customer journey or case that informed the feature design, abstract it before including it in any prompt:
- Replace real names with "[Customer A]", "[Business B]"
- Replace real amounts with representative amounts (not actual figures)
- Remove any details that could identify the original case

---

## Approval Workflows

AI-generated product artefacts should pass through the same review and approval processes as human-written ones. The fact that an AI produced a draft does not exempt it from governance.

### Minimum review requirements

| Artefact | Required reviews before use |
|----------|----------------------------|
| PRD (draft) | PM review + line manager awareness |
| PRD (final / for engineering handoff) | PM, engineering lead, and compliance sign-off for regulated features |
| BDD scenarios | PM review + engineering review |
| Feature analysis | PM review (informational, lower risk) |
| Spec review critique | PM review — decisions based on critique require standard approval |

### Do not treat AI outputs as authoritative

Claude Code produces drafts. Even an excellent draft:
- May have hallucinated details or made incorrect inferences
- Does not know your organisation's internal policies unless you told it
- Cannot assess legal or regulatory risk — it can flag areas for review, not approve them
- May miss context that is obvious to a human who knows the system

**Every AI-generated artefact requires human review before it influences a real decision.**

### Compliance and regulatory matters

For any feature that touches:
- Customer data handling or consent
- Financial crime or fraud controls
- Credit or affordability
- FCA or PRA regulatory requirements
- Consumer Duty
- GDPR or data subject rights

...the PRD must be reviewed by your compliance team, not just by product and engineering. An AI-generated PRD can help you structure the right questions for compliance — it cannot substitute for a compliance assessment.

---

## Auditability

One of the genuine governance benefits of this approach is auditability. Version-controlled product artefacts create a durable, queryable record of what was decided, when, and by whom.

To maximise this benefit:

**Write meaningful commit messages.** Not "update PRD" but "Add FCA consumer duty constraints to scope — per compliance review on [date]".

**Record decisions in the artefact.** When you make a product decision in response to a stakeholder input or constraint, note it in the PRD with a date and rationale:
```
> **Decision 2024-03-15**: Weekly alerting uses a rolling 7-day window, not a calendar week.
> Rationale: Calendar weeks create a reset edge case on Sunday that feels confusing to customers.
```

**Do not squash commits.** The individual commit history is more valuable for audit than a single squashed commit representing multiple decisions.

**Tag or annotate major versions.** When a PRD is submitted for compliance review, or when BDD scenarios are handed off to engineering, tag the commit so you can retrieve the exact state at that point:
```bash
git tag -a v1.0-compliance-review -m "Version submitted for compliance review"
```

---

## Model Limitations

Be explicit with stakeholders about what AI-generated artefacts are and are not.

| What AI can do | What AI cannot do |
|----------------|------------------|
| Structure requirements clearly | Make regulatory determinations |
| Surface potential edge cases | Guarantee completeness |
| Identify ambiguities in a spec | Resolve ambiguities — that requires a human |
| Generate BDD scenarios from a PRD | Assess whether the PRD reflects actual customer needs |
| Critique a spec for gaps | Approve a spec as ready to build |
| Suggest compliance areas to consider | Provide legal or compliance advice |

AI-generated artefacts are tools for thinking, not substitutes for it. They surface options, gaps, and structure — humans make decisions.

---

## PAT Handling and Secrets Management

Personal Access Tokens (PATs) are credentials. They provide authenticated access to systems. Treat them like passwords.

### Do

- Store PATs in environment variables set on your machine, not in files
- Use your organisation's approved secrets manager if one is provided
- Set expiry dates on PATs when the system allows
- Scope PATs to the minimum permissions needed
- Rotate PATs regularly (quarterly at minimum)
- Revoke PATs when you leave a project or role

### Do Not

- Paste a PAT into a prompt or a file in the repository
- Share PATs with colleagues — each person should have their own
- Commit PATs to Git (even accidentally — contact security immediately if this happens)
- Use PATs created for one system to access another
- Use personal PATs for enterprise access — use enterprise credentials

### If You Accidentally Commit a Secret

Act immediately:
1. Revoke the PAT immediately in the system that issued it
2. Contact your information security team
3. Do not try to fix it by deleting the file or overwriting the commit — the secret is in the Git history and needs to be purged properly
4. Follow your organisation's incident response process

This is not a career-ending mistake, but it does need to be handled correctly and quickly.

### How to Set Environment Variables Safely

On a Mac, you can set an environment variable for your terminal session:

```bash
export JIRA_PAT="your-token-here"
```

This makes the token available to tools that need it without it ever being in a file. It is cleared when you close Terminal.

For persistent tokens, add them to your `~/.zprofile` (ask your champion or an engineer to help with this — it is a two-minute task).

---

## Human Review Checklist

Before any AI-generated artefact is submitted for approval, review it against this checklist:

- [ ] I have read the entire document, not just skimmed it
- [ ] I have verified that no real customer data is included
- [ ] I have verified that no credentials or secrets are included
- [ ] I have checked that the document does not contradict known organisational policy
- [ ] I have flagged any compliance or regulatory areas for specialist review
- [ ] I have confirmed that scope statements are accurate (not invented by the AI)
- [ ] I have confirmed that business rules reflect actual decisions, not AI inferences
- [ ] I have resolved (or explicitly flagged) all open questions
- [ ] I have committed the reviewed version with a meaningful commit message
- [ ] I am comfortable putting my name to this document

---

## Reporting Concerns

If you are unsure whether a particular use of Claude Code is appropriate:

- Ask your line manager
- Contact your information security or data governance team
- Refer to your organisation's AI acceptable use policy
- When in doubt, do not proceed

If you discover that restricted data has been included in a prompt or committed to the repository:
- Do not try to fix it yourself by deleting files
- Contact your information security team immediately
- Follow your incident response process

The governance framework exists to protect customers, the organisation, and you. Engage with it, do not work around it.
