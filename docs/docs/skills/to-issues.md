# to-issues

**Skill package:** `to-issues/`

## What it does

Breaks a **plan, spec, or PRD** into **vertical-slice** issues on the project issue tracker (tracer bullets), quizzes you, then publishes one ticket per slice in dependency order. Uses your repo’s triage vocabulary (`setup-matt-pocock-skills`).

## Input

Parent issue reference (number, URL, or path) if the source is already on the tracker; otherwise conversation context; optional codebase exploration; your approval on breakdown.

## Output

Numbered proposal (title, HITL/AFK, blocked by, user stories); then created issues with parent reference, acceptance criteria, blockers.

## What it won’t do

Close or modify the parent issue; horizontal “all DB then all API” tickets.

## How to use it

Pass the parent issue or paste the plan; iterate on granularity; confirm HITL vs AFK; let the agent publish issues blockers-first.

## Examples

1. “PRD #100 — slice into AFK issues where possible.”
2. “Local plan in chat — turn it into tracker issues.”
3. “Merge slices 2 and 3 — too thin.”

## Combinations

- **prd-to-plan** — local phased plan vs tracker issues.
- **aligned-implementation** — implement one issue per thread.

## Quickstart

```text
@to-issues — Parent is issue #100. Vertical slices only; prefer AFK; show breakdown before creating issues.
```
