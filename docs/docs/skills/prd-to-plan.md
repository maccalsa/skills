# prd-to-plan

**Skill package:** `prd-to-plan/`

## What it does

Turns a PRD into a **multi-phase** tracer-bullet plan saved as `./plans/<feature>.md`.

## Input

PRD in chat or path; optional codebase exploration; durable decisions (routes, schema shape, auth).

## Output

Markdown plan: architectural decisions, then phases with “What to build” + acceptance criteria; no brittle file/function names.

## What it won’t do

Create tracker issues (use **to-issues**); skip your approval on breakdown.

## How to use it

Paste or point to PRD; answer granularity quiz; use Phase 0 with **greenfield-scaffold** when starting from scratch.

## Examples

1. “Plan for onboarding PRD → `./plans/user-onboarding.md`.”
2. “Split phase 2 — too big.”
3. Phases become sprint boundaries.

## Combinations

- **greenfield-scaffold** — Phase 0.
- **to-issues** — alternative artifact.
- **prd-critique** — sharpen PRD first.

## Quickstart

```text
@prd-to-plan — PRD is in ./prd.md. Explore repo briefly; propose vertical phases; write ./plans/onboarding.md after I approve.
```
