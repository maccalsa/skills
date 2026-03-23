# Usage examples — aligned implementation

These are **language-agnostic** patterns: replace placeholders with your repo’s issue, paths, and stack.

---

## 1. Issue only (tracker as source of truth)

**User message:**

> Implement https://github.com/org/repo/issues/42 using @aligned-implementation

**Expected agent shape:**

- Restate acceptance criteria from the issue (or ask one clarifying question if blocking).
- Phase 0 output: public surface, prioritized behaviors, done for this slice, explicit out-of-scope.
- Wait for confirmation if anything material is ambiguous.
- Phase 1: one failing test for the **smallest** end-to-end behavior that matches the issue.

---

## 2. Markdown spec only (issue empty or internal)

**User message:**

> @aligned-implementation — implement the slice described in `plans/feature-auth-slice.md` in this repo.

**Expected agent shape:**

- Treat that file as the anchor; quote or summarize in-scope / out-of-scope.
- If the doc contradicts itself, ask once, then proceed per user answer.
- Tracer: first test matches the **first** must-have bullet in the doc (in priority order you agree in Phase 0).

---

## 3. Issue + markdown (spec elaborates ticket)

**User message:**

> #88 — details in `plans/88-rate-limit.md`. Tracer TDD, don’t wander.

**Expected agent shape:**

- Issue owns the ID and links; markdown owns edge cases. Call out any conflict between them before RED.
- One vertical slice at a time; do not implement the whole plan in one horizontal batch of tests.

---

## 4. No issue and no file (greenfield thread)

**User message:**

> Add a small export command; keep it minimal.

**Expected agent shape:**

- Phase 0: propose a **short** scope paragraph + behaviors list + done.
- **Stop** until the user says go (or replies with edits to scope).
- Then tracer bullet: one test for the smallest observable behavior (e.g. “command runs and writes expected output”).

---

## 5. Optional architecture gate (after a slice exposes coupling)

**Situation:** The second vertical slice needs a new seam because the current module boundary cannot satisfy the test without lying in tests.

**Agent message (illustrative):**

> The failing test needs X; the cleanest seam is a small `Port` at `…`. Alternatives: (a) minimal interface + one adapter, (b) stop and track #… for a larger split. Which do you want for **this** thread?

**User:** “(a) for now.”

**Then:** Implement the **minimal** (a); do not redesign the whole subsystem in the same pass unless the user expands scope.

---

## 6. Strict adherence habit

**User message:**

> @aligned-implementation — same as always: anchor, align, then one test at a time.

Using **@mention** ensures the skill is in context; rely on this when the workflow must not be skipped.
