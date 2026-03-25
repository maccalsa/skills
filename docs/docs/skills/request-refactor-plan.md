# request-refactor-plan

**Skill package:** `request-refactor-plan/`

## What it does

Interviews you, explores the repo, alternatives, scope, tests; splits work into **tiny commits**; creates a **GitHub issue** with the refactor template.

## Input

Long description of problem and ideas; willingness to answer detailed questions.

## Output

`gh issue create` with: problem, solution, commits list, decisions, testing decisions, out of scope—**no** file paths/snippets in the issue per skill.

## What it won’t do

Skip the interview; guarantee the refactor is executed in the same session.

## How to use it

Come prepared with problem statement; engage on alternatives and test strategy; use issue as execution guide.

## Examples

1. “Extract payment adapter; plan micro-commits.”
2. “Insufficient tests — agent asks your plan.”
3. Issue becomes team RFC.

## Combinations

- **improve-codebase-architecture** — RFC from exploration.
- **tdd** — execute plan in slices.
- **requirement-course-correction** — architecture debt path.

## Quickstart

```text
@request-refactor-plan — Problem: god module in billing. Goal: seam for providers. I want tiny commits and a gh issue at the end.
```
