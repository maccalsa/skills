# greenfield-scaffold

**Skill package:** `greenfield-scaffold/`

## What it does

Scaffolds a new repo’s **Phase 0**: pins, format/lint, tests, CI, minimal entry point—before feature work.

## Input

Approved PRD/plan or explicit spike waiver; `./plans/<slug>.md` with Phase 0 acceptance criteria; empty folder or skeleton.

## Output

Repo with version pins, `test` / `lint` / `format` commands, CI on PR, minimal CLI `--help` or health check, short install/run notes; checkboxes aligned to plan.

## What it won’t do

Replace your feature design; build Phase 1+ unless you ask.

## How to use it

Ensure Phase 0 is written in the plan. Invoke with `@mention`s; say “Phase 0 only” if you want no features.

## Examples

1. “Phase 0 per `./plans/saas.md` — Node 22, eslint, vitest, GHA on PR.”
2. “CLI only: `mytool --help` exits 0.”
3. “After green CI, stop — no Phase 1.”

## Combinations

- **prd-to-plan** — produces phased plan.
- **aligned-implementation** + **tdd** — tests for Phase 0 smoke.

## Quickstart

```text
@greenfield-scaffold @aligned-implementation @tdd — Phase 0 only per ./plans/widget.md. Parent issue #5. Do not start Phase 1.
```
