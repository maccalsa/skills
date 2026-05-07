# aligned-implementation

**Skill package:** `aligned-implementation/`

## What it does

Keeps implementation work narrow, test-first in vertical slices, and aligned with you before scope grows.

## Input

A scope anchor (issue number/URL, path to markdown spec/plan, or pasted brief). If none: the agent proposes a short in/out/done paragraph and waits for approval. Your confirmation on public surface, prioritized behaviors, and “done” for this thread.

## Output

Phased work: align → one failing “tracer” test → minimal code → repeat; optional bounded architecture discussion; refactor only when green. Optional per-cycle checklist text you can paste.

## What it won’t do

Replace deep TDD or architecture skills; it orchestrates. Not for one-line fixes, pure explanation, or huge upfront design with no code when you asked for that.

## How to use it

`@mention` the skill. Do not let the agent write tests or code until Phase 0 is settled. Insist on one test → one behavior → minimal pass. Block “while we’re here” refactors and new docs unless you asked.

## Examples

1. “Issue #42 + `./plans/auth.md` section 2 — implement password reset slice only; align on API shape first.”
2. “No issue — here’s scope: [paste]. Approve before RED.”
3. After first green: “Next behavior only: expired token returns 401.”

## Combinations

- **tdd** — mechanics of red-green-refactor.
- **prd-to-plan** or **to-issues** — anchors for scope.
- **improve-codebase-architecture** — only for Phase 3 when coupling blocks the slice.

## Quickstart

```text
@aligned-implementation — Anchor: issue #42. Phase 0: public API is POST /reset with email + token; done = one happy path + one invalid token. Approve before tests.
```
