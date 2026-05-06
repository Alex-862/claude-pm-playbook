## Purpose

This project uses the AI PM Playbook to support AI-native product management workflows in Claude Code.

The goal is to help product managers:

- explore ambiguous opportunities

- synthesise discovery signals

- analyse existing features

- shape initiatives

- draft requirements

- review specifications

- generate behavioural scenarios

- prototype concepts

using structured and repeatable workflows.

---

## Operating Model

This playbook separates:

- project context

- reusable skills

- reusable agents

- generated outputs

### Skills

Skills are primarily used to:

- generate outputs

- structure thinking

- synthesise information

- produce artefacts

Examples include:

- discovery synthesis

- opportunity mapping

- PRD generation

- BDD generation

- prototype generation

### Agents

Agents are primarily used to:

- challenge thinking

- apply specialist reasoning lenses

- identify gaps, ambiguity and risk

- pressure-test generated outputs

Examples include:

- customer advocate

- commercial strategist

- systems thinker

- risk reviewer

- delivery challenger

### Human Judgement

Claude should support and augment product thinking, not replace it.

Do not:

- assume strategic decisions have been made

- assume customer problems are validated

- imply implementation commitment where ambiguity remains

- present generated outputs as final truth

---

## Audience

Outputs should be understandable by:

- product managers

- engineers

- designers

- delivery leads

- operational stakeholders

- risk/compliance stakeholders where relevant

---

## Repository Structure

Store generated artefacts in the appropriate project locations.

Typical folders may include:

```text

business-context/

feature/

discovery/

opportunities/

outputs/

prototype/

bdd/

```

Do not assume every project contains all folders.

---

## Core Principles

- prefer clarity over verbosity

- do not invent requirements, business rules or customer intent

- be explicit where something is inferred or assumed

- surface ambiguity rather than smoothing over it

- optimise for structured, reusable outputs

- distinguish evidence from interpretation

- challenge premature convergence on solutions

- preserve unresolved questions where appropriate

---

## Discovery Expectations

Discovery workflows should:

- remain exploratory where appropriate

- identify assumptions and weak signals

- surface research gaps

- identify opportunity spaces

- avoid prematurely locking implementation details

- distinguish customer problems from proposed solutions

Discovery outputs may include:

- synthesis documents

- opportunity maps

- hypothesis framing

- competitor analysis

- concept prototypes

Do not draft PRDs unless explicitly requested.

---

## Delivery Expectations

Delivery workflows should:

- clearly explain intended behaviour

- define scope and business logic

- identify dependencies and risks

- support implementation readiness

- reduce ambiguity for engineering and design teams

Delivery outputs may include:

- feature analysis

- PRDs

- BDD scenarios

- specification reviews

- delivery-stage prototypes

---

## Prototype Expectations

Prototypes are intended to:

- make concepts tangible

- support discussion and iteration

- validate journeys and interactions

- communicate ideas clearly

Unless explicitly requested:

- do not build production-ready systems

- use mocked data where appropriate

- keep implementation intentionally lightweight

- prioritise clarity over completeness

---

## Expectations by Artefact Type

### Feature Analysis

- explain current behaviour in plain English

- identify flows, dependencies, gaps and risks

- identify ambiguity and unresolved assumptions

### PRDs

- include problem framing, scope, journeys, business logic, dependencies, risks and open questions

- write requirements that can later be translated into BDD

### BDD

- use Gherkin format

- focus on observable behaviour

- cover happy paths, validation, failure scenarios and edge cases

- keep scenarios precise and testable

### Spec Reviews

- critique rather than restate

- prioritise ambiguity, gaps, risk and unresolved decisions

- identify missing edge cases and unclear logic

---

## Guardrails

Treat all generated content as draft output unless reviewed by a human.

Do not:

- assume compliance, fraud, operational or technical constraints are satisfied unless explicitly stated

- assume strategic alignment without evidence

- imply customer validation where none exists

- present speculative value as certain

Always:

- call out uncertainty

- identify assumptions

- highlight where additional stakeholder input or validation is required
