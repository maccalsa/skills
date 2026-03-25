# grill-me

**Skill package:** `grill-me/`

## What it does

Interviews you until the plan or design is explicit enough that tradeoffs and dependencies are clear.

## Input

A plan, design, or decision to stress-test; optional repo context.

## Output

One focused question at a time (or a tight cluster), each with a **recommended** answer and rationale; branches closed with agreed decision or deferral; codebase facts when discoverable.

## What it won’t do

Replace implementation; stay hostile; ask endless questions without using the repo when answers are there.

## How to use it

Say “grill me on [topic].” Answer precisely; override recommendations when needed. Expect hidden assumptions, constraints, and contract clarity (errors, idempotency).

## Examples

1. “Grill me on the caching plan for exports.”
2. “Before more questions, read the export pipeline and then ask about idempotency.”
3. Close branch: “We agree Redis + 5m TTL; owner = platform team.”

## Combinations

- **prd-critique** — hardens product docs.
- **request-refactor-plan** — turns grilled decisions into an RFC issue.

## Quickstart

```text
@grill-me — Plan: migrate auth to OAuth2. Resolve decision tree: tenants, rollback, session invalidation. One question at a time.
```
