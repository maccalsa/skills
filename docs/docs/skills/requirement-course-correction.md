# requirement-course-correction

**Skill package:** `requirement-course-correction/`

## What it does

Classifies mid-flight change (bug vs spec vs requirement vs architecture), updates plan/issues, gets **Approved** for one slice, implements one vertical slice with **aligned-implementation + tdd**.

## Input

Summary of change; `./plans/<slug>.md`; parent issue #; explicit “Approved” for what to implement.

## Output

Classification + impact checklist updates; one implemented slice anchored to updated issue/plan.

## What it won’t do

Large refactor without **request-refactor-plan**; silent scope creep.

## How to use it

`@mention` with change summary; review classification; approve single anchor; one slice per thread.

## Examples

1. “Business rule changed — update PRD phases 3–4 and issue #12.”
2. “Bug vs spec: use triage-issue for bug.”
3. “Approved: implement only subsection 2.1.”

## Combinations

Use with **triage-issue** (bugs), **request-refactor-plan** (big refactors), **prd-to-plan** (plan updates), **aligned-implementation**, and **tdd**—pick by change class.

## Quickstart

```text
@requirement-course-correction — Requirement change: [summary]. Plan: ./plans/app.md. Parent #N. Classify, propose edits, stop for Approved before code.
```
