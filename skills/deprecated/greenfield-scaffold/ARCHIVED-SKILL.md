---
name: greenfield-scaffold
description: Scaffolds a new repo for Phase 0—language pins, format/lint, test runner, CI, minimal entry point—before feature work. Use when prd-to-plan includes Phase 0 or first slice is repo plus tooling; when starting a greenfield CLI or SaaS; or when the user says scaffold, bootstrap, or CI setup for a new project.
---

# Greenfield scaffold (CLI or SaaS)

## Purpose

Deliver a minimal repo that runs locally, runs tests in CI, and fails the build on lint/test **before** feature code. Complements **prd-to-plan** (phases) and **aligned-implementation** + **tdd** (implementation).

## When to use

- `./plans/<slug>.md` has **Phase 0** or equivalent: repo, tooling, CI.
- User is starting from an empty folder or skeleton and needs a concrete checklist.

## Preconditions

- Parent PRD or spec issue is approved (or user explicitly waives for a spike).
- Plan file lists Phase 0 acceptance criteria; add that section if missing.

## Steps (minimal)

1. **Repo shape** — Single package vs monorepo; document in one README section or issue comment (do not write long docs unless the user asked).
2. **Language defaults** — Version pinfile (`package.json` engines, `.tool-versions`, `go.mod`, etc.).
3. **Format + lint** — One command each; same commands in CI.
4. **Test runner** — One `test` script; zero tests is OK if CI runs and passes.
5. **CI** — GitHub Actions (or project standard): on PR, run format check (optional), lint, test.
6. **Entry point** — CLI: `--help` exits 0. Web: health route or smoke test if agreed in plan.
7. **Definition of done for Phase 0** — Confirm checkboxes in the plan or issue:
   - README or issue lists how to install and run tests
   - CI green on default branch
   - No secrets in repo

## Related skills

- [aligned-implementation](../aligned-implementation/SKILL.md) — scope anchor and approval before code.
- [tdd](../tdd/SKILL.md) — red-green-refactor for Phase 0 tests if any.
- [prd-to-plan](../prd-to-plan/SKILL.md) — produces phased plan including Phase 0.

## First message (example)

```text
@greenfield-scaffold @aligned-implementation @tdd — Phase 0 only per ./plans/<slug>.md. Parent issue #N. Do not start Phase 1.
```
