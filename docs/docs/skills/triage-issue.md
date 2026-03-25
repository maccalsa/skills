# triage-issue

**Skill package:** `triage-issue/`

## What it does

Explores the codebase for **root cause**, then creates a **GitHub issue** with problem, RCA, and **TDD fix plan** (RED/GREEN cycles)—minimal user questions.

## Input

Brief problem description (or one question to get it).

## Output

Issue URL; RCA in behavior/contract terms (not fragile layout); numbered RED/GREEN cycles + optional REFACTOR.

## What it won’t do

Replace your reproduction; guarantee fix in same session.

## How to use it

Describe symptom; let agent explore with Explore; read issue and execute plan with **tdd**.

## Examples

1. “Checkout doubles tax on discount.”
2. Issue links for sprint.
3. **requirement-course-correction** uses triage for bug class.

## Combinations

- **aligned-implementation** + **tdd** — execute.
- **triage-issue** output matches **tdd** philosophy.

## Quickstart

```text
@triage-issue — Login redirect drops query string on mobile. Investigate and file gh issue with TDD plan.
```
