# improve-codebase-architecture

**Skill package:** `improve-codebase-architecture/`

## What it does

Explores the codebase for friction and proposes **deepening opportunities** (shallow → deep modules), using **`CONTEXT.md`** vocabulary and **`docs/adr/`** so suggestions match domain language and recorded decisions. After you pick a candidate, it runs a **grilling loop** (constraints, seam shape, tests) and can update `CONTEXT.md` or propose ADRs inline.

## Input

Repo access; optional domain glossary / ADRs; your interest in architecture, testability, or AI-navigability. You pick one candidate from the numbered list.

## Output

Numbered deepening candidates (files, problem, solution, benefits in locality/leverage terms); then collaborative refinement using bundled **LANGUAGE.md** and **INTERFACE-DESIGN.md** in the skill package, plus **grill-with-docs** formats where relevant.

## What it won’t do

Guarantee implementation; skip exploration—organic friction is the signal.

## How to use it

Let the agent explore with Explore sub-agents after reading glossary/ADRs. Review candidates; pick one; expect a focused grilling loop rather than jumping straight to an RFC issue.

## Examples

1. “Find shallow modules in `billing/`.”
2. “Candidate 2 — deepen the invoice boundary; grill the seam shape.”
3. Fold outcomes into backlog or ADRs as you prefer.

## Combinations

- **inherited-codebase-onboarding** — orientation first.
- **grill-with-docs** — shared discipline for `CONTEXT.md` / ADR updates during grilling.

## Quickstart

```text
@improve-codebase-architecture — Bounded pass on `src/payments/`. Number candidates; I’ll pick one to deepen.
```
