# prd-to-issues

**Skill package:** `prd-to-issues/`

## What it does

Breaks a PRD into **vertical-slice** GitHub issues (tracer bullets), quizzes you, then `gh issue create` per slice in dependency order.

## Input

PRD GitHub issue number or URL; optional codebase exploration; your approval on breakdown.

## Output

Numbered proposal (title, HITL/AFK, blocked by, user stories); then created issues with parent link, acceptance criteria, blockers.

## What it won’t do

Close or edit the parent PRD issue; horizontal “all DB then all API” tickets.

## How to use it

Provide PRD issue #; iterate on granularity; confirm HITL vs AFK; let agent create issues blockers-first.

## Examples

1. “PRD #100 — slice into AFK issues where possible.”
2. “Merge slices 2 and 3 — too thin.”
3. Track work from issue board.

## Combinations

- **prd-to-plan** — local phased plan vs GitHub issues.
- **aligned-implementation** — implement one issue per thread.

## Quickstart

```text
@prd-to-issues — Parent PRD is issue #100. Vertical slices only; prefer AFK; show breakdown before creating issues.
```
