# create-rule

**Skill package:** `skills-cursor/create-rule/`

## What it does

Creates **Cursor project rules** as `.mdc` files under `.cursor/rules/` with YAML frontmatter for scope and globs.

## Input

Purpose; always vs file-scoped; **glob patterns** (e.g. `**/*.ts`) if scoped; can infer from conversation.

## Output

One focused `.mdc` per rule (under ~50 lines recommended); `description`, `globs`, `alwaysApply` as needed; examples inside.

## What it won’t do

Replace skills for long workflows; put rules in `skills-cursor` (that’s Cursor’s internal space).

## How to use it

Answer scope vs always-apply; give precise globs; keep one concern per file.

## Examples

1. “Always: error handling pattern for TS.”
2. `globs: **/*.tsx` — React conventions.
3. Split when a rule exceeds one concern.

## Combinations

- **create-skill** — heavier workflows.
- **migrate-to-skills** — convert old rules to skills.

## Quickstart

```text
@create-rule — Enforce: no empty catch blocks in TypeScript. Scope: **/*.ts only. Add description + example.
```
