# migrate-to-skills

**Skill package:** `skills-cursor/migrate-to-skills/`

## What it does

Migrates **“Applied intelligently”** `.cursor/rules/*.mdc` (no globs, not `alwaysApply`) and **slash commands** `.cursor/commands/*.md` to `.cursor/skills/<name>/SKILL.md`, **verbatim body**.

## Input

Project or user `~/.cursor/commands`; rules matching migration criteria; Task sub-agents when available for parallel work.

## Output

New `SKILL.md` files; originals deleted; summary list; undo instructions if asked.

## What it won’t do

Migrate **alwaysApply** or **globs** rules (those stay rules); modify body content (forbidden).

## How to use it

Back up or commit first; run migration; verify skills; ask agent to undo by restoring originals if needed.

## Examples

1. “Intelligent” rules → skills for model discovery.
2. `/commit` command → skill with `disable-model-invocation: true`.
3. Team adopts skills directory convention.

## Combinations

- **create-skill** — author new skills after migration.
- **create-rule** — what stays as rules.

## Quickstart

```text
@migrate-to-skills — Migrate eligible project rules and commands under .cursor/ to .cursor/skills/. Preserve bodies exactly.
```
