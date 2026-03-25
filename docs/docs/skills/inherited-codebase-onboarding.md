# inherited-codebase-onboarding

**Skill package:** `inherited-codebase-onboarding/`

## What it does

Bounded reconnaissance: docs, entry points, tests, data boundaries, risk flags—**no refactors**.

## Input

Repo path; optional pairing with deeper architecture pass.

## Output

Short summary plus **numbered** follow-ups; you reply with one number or “feature X instead.”

## What it won’t do

Refactor or deep redesign—hand off to other skills.

## How to use it

`@mention` at start of inheriting a repo. Read the map; pick one numbered next step.

## Examples

1. “Map FastAPI routes and where tests live.”
2. “Reply `3` to dig into coupling next.”
3. Combine with architecture skill for numbered clusters.

## Combinations

- **improve-codebase-architecture** — next step.
- **triage-issue** — bugs before speculative refactors.
- **request-refactor-plan** — RFC after orientation.

## Quickstart

```text
@inherited-codebase-onboarding @improve-codebase-architecture — Map entry points, tests, data boundaries; numbered risks. I pick one next.
```
