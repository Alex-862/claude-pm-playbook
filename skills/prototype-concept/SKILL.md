# Prototype Concept

## Purpose

This skill helps generate lightweight local prototypes that make product ideas tangible enough for discussion, iteration and shaping.

The goal is not to create production-ready software.

The goal is to:
- communicate the concept clearly
- demonstrate the core customer experience
- support product thinking and iteration
- make opportunities easier to evaluate and discuss

---

## Typical Inputs

This skill may operate against:
- discovery outputs
- opportunity hypotheses
- feature context
- PRDs
- behavioural specifications
- business context
- customer context
- design-system.md

---

## Behaviour

When using this skill:

1. Identify the core product concept being demonstrated
2. Focus on:
   - the primary customer journey
   - the key value proposition
   - the main interaction model
3. Build a lightweight local prototype
4. Use mocked or fictional data where appropriate
5. Prioritise:
   - concept clarity
   - usability
   - simplicity
6. Keep implementation intentionally lightweight

---

## Prototype Expectations

Generated prototypes should:
- be runnable locally
- be easy to understand
- demonstrate the core idea clearly
- include a README.md
- include setup instructions
- avoid unnecessary technical complexity

---

## Technical Guidance

Unless otherwise specified:
- use React or Next.js
- use mocked data
- use simple local state
- avoid production infrastructure
- avoid unnecessary backend complexity

Generated prototypes should normally:
- create files inside `/prototype`
- run using:
  - `npm install`
  - `npm run dev`

---

## Important Constraints

Do not:
- build production-ready systems
- invent major functionality outside supplied context
- over-engineer architecture
- attempt to solve every edge case
- assume undefined business logic

Clearly distinguish:
- demonstrated behaviour
- mocked behaviour
- unresolved assumptions

---

## Discovery Usage

During discovery workflows:
- focus on opportunity exploration
- support hypothesis shaping
- make ambiguous concepts tangible
- optimise for discussion and iteration

Do not:
- prematurely lock implementation decisions
- imply delivery commitment

---

## Delivery Usage

During delivery workflows:
- represent proposed feature behaviour
- align to supplied PRD and BDD context
- support validation of journeys and interactions

---

## Outputs

Typical outputs may include:
- `/prototype`
- local React or Next.js apps
- prototype README documentation
- mocked customer journeys


---

## Example Prompt

Use the prototype_concept skill against:
- business-context/
- outputs/selected-direction.md
- opportunities/
- design-system.md

Build a lightweight local prototype inside:
- prototype/

The prototype should:
- demonstrate the core customer journey
- communicate the value proposition clearly
- use mocked data
- prioritise concept clarity over technical completeness

Do not build production-ready infrastructure.

Include:
- package.json
- README.md

Ensure the prototype runs locally using:
- npm install
- npm run dev