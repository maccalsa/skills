---
name: inherited-codebase-onboarding
description: Bounded reconnaissance of an unfamiliar repo—docs, entry points, tests, data boundaries, risk flags—without refactors. Use when inheriting a codebase, before large features or refactors, or when the user says onboard, orientation, or map the codebase.
---

# Inherited codebase onboarding (bounded)

## Purpose

In one session: entry points, test map, risk flags — **no refactors**. Pairs with **improve-codebase-architecture** when you need numbered coupling clusters next.

## Related skills

- [improve-codebase-architecture](../improve-codebase-architecture/SKILL.md) — deeper coupling clusters; user picks one.
- [request-refactor-plan](../request-refactor-plan/SKILL.md) — RFC after orientation.
- [triage-issue](../triage-issue/SKILL.md) — bugs before speculative refactors.

## Steps (agent)

1. **Locate** — README, CONTRIBUTING, ADR folder, CI config, package/manifest files.
2. **Entry points** — App main, HTTP routes, CLI commands, workers (list paths).
3. **Test pyramid** — Where tests live; how to run one fast suite; obvious coverage gaps from tree.
4. **Data boundaries** — DB, queues, external APIs (short bullet list or tiny diagram).
5. **Risk flags** — Missing tests on hot paths, large god modules, copy-paste clusters (optionally hand off to **improve-codebase-architecture** for numbered clusters).
6. **Output** — Short summary + **numbered** list of areas to improve or investigate; user picks **one** next step.

## User gate

User replies with one number or “feature X instead of refactor.”

## First message (example)

```text
@inherited-codebase-onboarding @improve-codebase-architecture — Bounded. Map entry points, tests, and data boundaries; then numbered risk/coupling clusters. I pick one next.
```
