# Adoption Plan: Rolling Out AI-Native PM Workflows

## Overview

This plan covers the rollout of Claude Code and AI-native product workflows to a product organisation in a UK financial services enterprise. It assumes an organisation of 10–50 Product Managers, with existing use of Jira, Confluence, and Google Docs, and engineering teams already experimenting with AI-assisted development.

The plan is structured in four phases over approximately six months, with the option to accelerate or slow down based on organisational readiness.

---

## Guiding Principles for Rollout

**Start small and demonstrate value.** The most effective advocacy is a PM who can show a real artefact — a better PRD, a more complete BDD, a spec that engineering praised — produced in less time than before.

**Make it empowering, not mandatory.** Mandate creates resistance. Demonstrated value creates pull. Run the pilot openly, share the outputs, let curiosity drive adoption.

**Pair technical training with mindset work.** The tools are learnable in an afternoon. The shift in how PMs think about structured artefacts takes longer. Invest in Module 00 (mindset) before diving into setup.

**Involve engineering early.** The ultimate measure of success is whether engineering handoffs improve. Get engineering feedback early and let it shape the approach.

**Governance is not optional.** In a regulated environment, AI use without proper governance creates risk. Run the governance and guardrails training before anyone starts using the tools on real features.

---

## Phase 1: Pilot (Weeks 1–6)

### Objective
Validate the approach with a small group, produce visible examples, and identify what needs to be adapted for your organisation.

### Pilot Group

**Size**: 3–5 Product Managers

**Selection criteria**:
- Motivated and curious — not the most resistant or most junior
- Working on features that are suitable for AI assistance (not highly sensitive or under active regulatory scrutiny)
- Have supportive line managers
- Represent different product areas (not all from the same team)

**Avoid including** PMs who are resistant or sceptical — address their concerns separately before including them.

### Pilot Champions

Identify 1–2 champions who will:
- Be the go-to point of contact for questions
- Support others through setup issues
- Gather feedback actively
- Communicate progress to leadership

Champions should be enthusiastic early adopters, not necessarily the most senior PMs. Technical comfort helps but is not required — the setup guide is designed for nervous beginners.

### Pilot Activities

**Week 1:**
- [ ] Run Module 00 (mindset session) as a group — 60–90 minutes, facilitated
- [ ] Set up machines individually with champion support (use the Setup Guide)
- [ ] Clone the playbook repository

**Weeks 2–3:**
- [ ] Complete Modules 01–04 (self-paced with champion check-in)
- [ ] Run governance and guardrails session as a group — mandatory before any work on real features
- [ ] Identify one feature each pilot PM will use for their first AI-native workflow

**Weeks 4–5:**
- [ ] Complete Modules 05–07
- [ ] Each pilot PM runs their first real feature through the full workflow
- [ ] Champions provide support and capture friction points
- [ ] Engineering leads receive first AI-native handoff packs — capture their feedback

**Week 6:**
- [ ] Run Module 08 and the end-to-end workshop
- [ ] Pilot retrospective: what worked, what did not, what needs to change
- [ ] Produce a "before and after" artefact comparison for leadership

### Pilot Success Criteria

- All 3–5 pilot PMs have run at least one feature through the full workflow
- Engineering has reviewed at least one handoff pack and provided feedback
- No data governance incidents
- At least two pilot PMs describe measurable improvement in artefact quality
- A list of friction points and adaptations for broader rollout

---

## Phase 2: Champion Network (Weeks 7–12)

### Objective
Expand to 10–15 PMs, establish a champion network, and embed the workflow into team practice.

### Champion Network Structure

Recruit 4–6 champions from the pilot group and early adopters. Each champion:
- Supports 2–3 other PMs through their first few workflows
- Runs or co-facilitates the governance session
- Maintains office hours (see below)
- Contributes improvements to the playbook repository

### Training Programme

**Group sessions** (2 hours each, run twice — morning and afternoon to accommodate diaries):

| Session | Content | Audience |
|---------|---------|---------|
| Mindset and governance | Modules 00 + governance | All new participants |
| Machine setup | Module 01 + setup guide | Self-paced with champion support |
| Hands-on workflow | Modules 05–07 + workshop | Groups of 4–6 |

**Self-paced** (with champion check-in):
- Modules 02, 03, 04 — complete at own pace
- Expected: 4–6 hours over two weeks

### Office Hours

Champions run 30-minute office hours twice per week for the first eight weeks. Virtual. Drop-in format.

Common questions addressed:
- Setup and environment issues
- "How do I give Claude Code better context for this situation?"
- "The spec review said X — what should I do?"
- Governance questions ("Can I include this in a prompt?")

### Integration with Team Workflow

By Week 12:
- All sprint planning sessions reference the AI-native handoff pack format
- Engineering retrospectives include feedback on spec quality
- A shared team playbook repository is established (separate from this learning repo)
- CLAUDE.md templates are created for each product area

---

## Phase 3: Broad Rollout (Weeks 13–24)

### Objective
Extend to the full product organisation, refine the approach based on pilot learning, and establish governance and quality standards.

### Scaled Training

At this scale, self-paced learning with champion support is more sustainable than group sessions for every module. The structure:

1. **Mandatory group session**: Mindset + governance (all PMs must attend before using AI tools)
2. **Self-paced modules**: 01–07, with champion support available
3. **Optional group workshop**: End-to-end workshop run monthly as a cohort session
4. **Peer showcase**: Monthly 20-minute slot in all-hands where a PM shares a real AI-native artefact and what they learned

### Playbook Maintenance

By this phase, the playbook repository should be actively maintained by the team:
- CLAUDE.md templates for each product area
- Example PRDs and BDD files from real (anonymised) features
- A shared glossary adapted to your organisation's terminology
- Troubleshooting notes from common problems

### Integration with Engineering

By Week 20, establish a formal review cadence:
- Engineering leads review spec quality monthly and provide structured feedback
- BDD scenarios are formally reviewed by QA leads before sprint start
- A shared artefact standard is agreed between product and engineering

---

## Phase 4: Mature Practice (Month 6+)

### Objective
AI-native product workflows are the default, not the exception. The organisation is continuously improving the tooling and workflows.

### Signs of Mature Practice

- New PMs are onboarded to AI-native workflows as part of their first week
- The playbook repository is actively contributed to by multiple PMs
- Engineering teams explicitly request AI-native handoff packs
- Spec quality metrics show measurable improvement vs pre-adoption baseline
- Integration with Jira and Confluence is established (once PAT infrastructure is ready)
- Governance incidents: zero

### Continuous Improvement

Quarterly retrospective questions:
- Which skills are being used most? Which least? Why?
- Where does context still get lost between product and engineering?
- What new workflows should be built into the playbook?
- What training needs are emerging as the team grows?

---

## Success Measures

### Leading indicators (early signal that adoption is working)

- Number of PMs who have completed the setup and run at least one workflow
- Number of features with a complete AI-native handoff pack
- Champion office hours attendance
- Self-reported confidence scores from training cohorts

### Lagging indicators (evidence of real impact)

| Measure | How to capture |
|---------|---------------|
| Engineering questions per feature post-handoff | Track in Jira or retrospectives |
| PRD rework rate (features that require significant spec changes mid-sprint) | Sprint retrospective data |
| BDD coverage completeness (scenarios per feature vs baseline) | Repo statistics |
| Time from feature brief to handoff-ready artefact | PM self-reported |
| Engineering satisfaction with spec quality | Quarterly survey |

### Baseline measurement

Before starting the pilot, capture baseline data on:
- How many clarification questions engineering asks per feature on average
- How long it takes to go from initial brief to engineering-ready spec
- Engineering team satisfaction with current spec quality (survey)

Use this baseline to demonstrate improvement at the 3-month and 6-month mark.

---

## Risks and Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| Data governance incident (restricted data in prompt) | Medium | High | Mandatory governance training before first use; clear examples of what to exclude |
| Setup issues slow adoption | High | Medium | Dedicate champion time to setup support; test setup guide on multiple machine types |
| AI outputs treated as authoritative without review | Medium | High | Governance training; explicit "draft only" labelling on outputs |
| Engineering resistance ("PMs shouldn't be in GitHub") | Medium | Medium | Involve engineering leads early; frame as improving their inputs, not encroaching on their tools |
| PM resistance ("This is too technical") | Medium | Medium | Pair with supportive champion; demonstrate with a concrete example from their own feature area |
| Playbook becomes stale | Medium | Medium | Assign a playbook owner; quarterly review cycle |
| Jira/Confluence integration complexity delays ROI | High | Low | Manually paste relevant context until integrations are ready; do not block adoption on integrations |
| Turnover in champions | Low | High | Maintain 20% more champions than strictly needed; document champion knowledge in the repo |

---

## Communication Plan

### For leadership

- Monthly one-pager: adoption progress, qualitative examples, risks
- Quarterly: before/after artefact comparison + engineering satisfaction data
- Frame as: "We are keeping pace with AI-assisted engineering, not trailing behind it"

### For PMs

- Kick-off email from Head of Product framing the "why" (use the executive summary from [curriculum README](README.md))
- Monthly champions update email: new examples, tips, common questions
- Slack channel for day-to-day questions and sharing

### For engineering

- Briefing from engineering lead: "Here is what to expect from PM handoffs as we adopt this approach"
- Feedback mechanism: a simple form or retrospective question for engineering to rate spec quality
- Shared celebration when a feature handoff gets positive engineering feedback
