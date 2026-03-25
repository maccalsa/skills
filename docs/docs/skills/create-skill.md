# create-skill

**Skill package:** `skills-cursor/create-skill/`

## What it does

Guides creation of **Agent Skills**: `skill-name/SKILL.md`, frontmatter, optional `reference.md`, `examples.md`, `scripts/`.

## Input

Purpose, personal vs project path, triggers, domain facts, output format; not in `~/.cursor/skills-cursor/`.

## Output

Valid `name` + `description` (third person, WHAT+WHEN); concise body (<500 lines); progressive disclosure pattern.

## What it won’t do

Teach the agent everything it already knows—stay token-efficient.

## How to use it

Follow discovery → design → implementation → verification; link references one level deep.

## Examples

1. Team PR review skill with checklist.
2. PDF skill with `scripts/extract.py`.
3. Description: “Processes X. Use when user mentions Y or Z.”

## Combinations

- **create-rule** — lighter persistence.
- **migrate-to-skills** — from `.mdc` rules.

## Quickstart

```text
@create-skill — Skill: generate release notes from merged PRs. Project: .cursor/skills/. Triggers: release, changelog, ship.
```
