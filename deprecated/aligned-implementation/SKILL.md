---
name: aligned-implementation
description: Orchestrates aligned implementation with scope anchors (tracker issue and/or markdown), user approval before coding, TDD vertical slices (tracer bullets), optional bounded architecture exploration, and refactor only on green. Language- and stack-agnostic. Use when implementing features, refactors, or vertical slices; when the user wants tracer TDD, anti-wandering discipline, or explicit alignment before tests or code; or when they mention issues, plans, or acceptance criteria. For guaranteed application, the user should @mention this skill—relevance matching is not guaranteed for every chat.
---

# Aligned implementation (tracer TDD + gates)

## Purpose

Keep implementation work **narrow**, **test-first in vertical slices**, and **aligned with the user** before scope expands. This skill **orchestrates** process; it does not replace deeper material in other skills.

**Related skills (read when relevant):**

- [tdd](../tdd/SKILL.md) — red-green-refactor, tracer bullets, why not horizontal test batches.
- [improve-codebase-architecture](../improve-codebase-architecture/SKILL.md) — exploring coupling and deep modules; use only when this skill’s Phase 3 applies.

## When to use

- Implementing or refactoring with tests, any language.
- User supplied or implied: issue, spec, acceptance criteria, or “don’t wander.”

**Do not** use as a default for quick one-line fixes, pure explanation, or when the user explicitly asked for a large upfront design with no code yet.

## Phase 0 — Align (before any test or production code)

1. **Scope anchor** — Prefer at least one:
   - Tracker issue: number or URL (GitHub, GitLab, etc.).
   - Markdown artifact: path to spec slice, PRD excerpt, `plans/*.md`, or pasted body.

   If **neither** exists: propose a **short scope paragraph** (in scope / out of scope / done) and **stop for user approval** before Phase 1.

2. **Agree explicitly:**
   - Public surface to touch (API, module boundary, CLI, etc.).
   - **Prioritized behaviors** to prove (not every edge case unless requested).
   - What “done” means for **this** thread.

3. **Do not** start RED until the user has confirmed (or clearly implied agreement in the same message).

## Phase 1 — Tracer bullet

- **One** failing test that proves **one** behavior through a **public** interface.
- **Minimal** code to pass.
- No architecture detour unless **unblocking** this test is impossible without it—then state the blocker and the **smallest** change, and confirm if unsure.

## Phase 2 — Incremental loop

Repeat:

1. RED: next single behavior → fails.
2. GREEN: minimal change → passes.

Rules: one test at a time; no speculative APIs; no “while we’re here” refactors.

**Before broadening scope** (new module, new abstraction, extra files): pause and get user OK unless it is the only way to make the **current** test pass.

## Phase 3 — Architecture (optional, bounded)

Only when the **current vertical slice** exposes real coupling or the user asks.

- Present **one** concrete cluster (what’s coupled, why it hurts).
- Offer: smallest seam change, or **stop** and file/track an RFC/issue instead of coding a large refactor here.

For a full multi-option design pass, follow **improve-codebase-architecture** in a **separate** step after user approval.

## Phase 4 — Refactor

- Only when tests are **green**.
- **Never** refactor while RED.

## Anti-wandering (stop and ask)

- New public API or module without a failing test driving it (unless user already approved that design).
- Batch-writing many tests before any implementation (horizontal slice).
- Drive-by cleanup unrelated to the current behavior.
- New markdown/docs unless the user asked or the task requires it.

## Per-cycle checklist (optional paste for transparency)

```
Anchor: [issue # / URL / markdown path / "none—user approved summary"]
Phase: [0|1|2|3|4]
This cycle: [one sentence behavior]
RED→GREEN: [yes / N/A]
Refactor while green only: [yes / N/A]
Scope expanded: [no / yes—with user OK]
```

## Examples

See [examples.md](examples.md) for user messages and expected agent behavior.
