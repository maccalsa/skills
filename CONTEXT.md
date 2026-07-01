# Maccalsa Skills

A collection of AI-agnostic agent skills with a MkDocs documentation site.

## Language

**Skill**: A directory containing `SKILL.md` plus optional reference files or scripts.

**Bucket**: A top-level grouping under `skills/` such as `engineering`, `productivity`, `personal`, `misc`, `in-progress`, or `deprecated`.

**Promoted skill**: A stable skill listed in README, MkDocs, and plugin metadata.

**Deprecated skill**: A retained workflow that has been superseded, replaced, or intentionally removed from the active catalog.

## Repository Rules

- Keep `SKILL.md` focused on agent instructions.
- Put longer reference material beside the skill, not in the main file.
- Keep human-facing documentation under `docs/docs/`.
- Prefer AI-agnostic install and invocation language; mention Cursor, Claude, or another harness only when explaining harness-specific setup.
