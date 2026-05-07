# Recipe: calendar refresh (end-to-end flow)

**Scenario:** Calendar works but feels dated; creating events is slow; repeats are limited (week / month / bi-week, max 10 instances); notifications are unreliable; **visual design must stay strong**—you want smoother behavior without a visual rewrite.

Use this as a **sequence of chat threads** (or one long thread if you keep context). Each block is copy-paste ready and names the skill so the agent follows it.

---

## 0. Problem anchor (paste once at the top of thread 1)

```text
Context (do not rewrite—use as scope anchor):
- App has a calendar feature: looks good, interaction model is slow/clunky.
- Creating events takes too many steps / too long.
- Recurring events: only week, month, bi-week; max 10 instances.
- Notifications exist but behave unreliably (“ropey”).
- Non-negotiable: preserve current visual quality; improve flow and reliability.
```

---

## 1. Formalise the issue — `grill-me`

**Goal:** Close decisions that a plan will depend on (recurrence model, caps, notification guarantees, what “seamless” means in measurable terms).

**Copy-paste:**

```text
@grill-me

Context: [paste block from §0]

Grill me until we have explicit decisions for:
1) Primary user job for v1 (e.g. “create a one-off event fast” vs “manage recurring series”).
2) Recurrence: keep weekly/monthly/biweekly only, or expand (daily, custom RRULE, “forever” series)? Max instances vs end date?
3) Notifications: which channels (in-app, email, push), what “reliable” means (delivery SLA, dedupe, timezone), known failure modes.
4) What must not change visually (screens/components frozen) vs what can move (layout micro-tweaks for fewer steps).

One focused question at a time; after each answer, give your recommended default and short rationale.
```

**Optional next thread — `ubiquitous-language`** (only if “event / series / instance / reminder” get mixed):

```text
@ubiquitous-language

We’re standardising terms for calendar work. From this thread and prior answers, write UBIQUITOUS_LANGUAGE.md: Event vs Series vs Occurrence vs Reminder; what we call the 10-instance cap; notification vs alert.
```

**Written anchor (pick one):**

- **Lightweight:** open GitHub issue **“Calendar: UX + recurrence + notifications”** with §0 + answers from grill-me; note issue number as `#CAL` for later.
- **Heavier:** add `./prd.md` from those answers → `@prd-critique` → `./plans/prd-final.md`.

---

## 2. Interrogate the code — `inherited-codebase-onboarding`

**Goal:** Map routes/screens, data layer, recurrence storage, notification pipeline, tests—**no refactors**.

**Copy-paste:**

```text
@inherited-codebase-onboarding

Bounded reconnaissance only—no refactors.

Scope: calendar feature and anything that creates/edits events, stores recurrence (week/month/biweek, 10-instance cap), and sends or schedules notifications.

Deliver:
1) Entry points (routes, screens, jobs/cron).
2) Where recurrence rules and instance limits are enforced (client vs server).
3) Notification path (queue, provider, idempotency, retries)—where it can flake.
4) Test coverage map for the above.
5) Numbered list of follow-ups; I’ll reply with one number for the next thread.

Assume visual design files exist and are off-limits unless I say otherwise.
```

**If onboarding surfaces a specific bug** (“notifications lost on retry”): **new thread** `triage-issue`:

```text
@triage-issue

Symptom: [one sentence, e.g. duplicate reminders / missed push / wrong timezone].

Reproduce: [steps]. Investigate root cause and file a GitHub issue with a TDD fix plan (RED/GREEN). Do not implement in this thread unless I ask.
```

**If onboarding shows tangled modules** and you can’t slice features safely: **new thread** `improve-codebase-architecture`:

```text
@improve-codebase-architecture

From onboarding, the worst coupling is: [calendar + notifications / recurrence + DB / …]. Explore and propose numbered deep-module candidates; I’ll pick one for an RFC issue. No implementation.
```

---

## 3. Construct plan or issues

### Option A — Markdown plan — `prd-to-plan`

**Prereq:** PRD or summary in chat (paste §0 + grill-me decisions + 5 bullets from onboarding).

**Copy-paste:**

```text
@prd-to-plan

PRD/summary is below. Explore the repo only enough to name real integration layers (API, DB, jobs, UI)—not file-level refactors.

Summary:
[paste §0]
Decisions from grill-me:
[paste bullets]
Onboarding highlights:
[paste 3–5 bullets: where calendar lives, recurrence enforced, notification path]

Produce ./plans/calendar-refresh.md with:
- Architectural decisions that apply to all phases (auth, timezone storage, notification channel).
- Phases as vertical slices only (each phase demoable end-to-end).

Proposed phase themes (adjust after exploration):
1) Fast path: create a **single** non-recurring event with fewer steps (keep current look).
2) Recurrence: new rules and/or limits **as decided in grill-me** (replace 10-cap story if we’re changing product rules).
3) Notifications: one reliability slice (e.g. schedule + dedupe + test)—channel chosen in grill-me.

Quiz me on granularity; then write the file after I approve.
```

### Option B — GitHub issues — `to-issues`

**Prereq:** Parent issue exists (e.g. epic **#100** with §0 + decisions).

**Copy-paste:**

```text
@to-issues

Parent PRD/epic is issue #100 (calendar UX + recurrence + notifications). Break into vertical-slice child issues: prefer AFK; mark HITL only for product/security decisions. Show numbered breakdown with blockers; do not create until I approve; then create in dependency order.
```

### Option C — Refactor-first RFC — `request-refactor-plan`

Use when the **main risk is code structure**, not missing product clarity.

```text
@request-refactor-plan

Problem: calendar + notification code is tangled; we need a safe seam before feature slices.

Interview me, then file a GitHub issue: problem, solution, micro-commit plan, testing decisions, out of scope. No implementation in this thread.
```

---

## 4. Implement — tracer bullets — `aligned-implementation` + `tdd`

**Rule:** One thread **per vertical slice** (or one slice per PR). Each thread has one anchor: `./plans/calendar-refresh.md` section **or** issue number.

### Slice example A — fast single-event create

```text
@aligned-implementation @tdd

Anchor: ./plans/calendar-refresh.md — Phase 1 (fast single-event create). GitHub issue #101 if applicable.

Phase 0 — align now:
- Public surface: [e.g. create-event modal flow / API route—fill from onboarding]
- Behaviours to prove in order: (1) default duration/title valid submit, (2) cancel preserves calendar state, (3) error shown on invalid time
- Done for this thread: Phase 1 acceptance criteria checked for the single-event path only; **no** recurrence changes.

Stop for my explicit OK before RED.

Then: one failing test → minimal green → repeat. Refactor only when green.
```

### Slice example B — recurrence product change

```text
@aligned-implementation @tdd

Anchor: ./plans/calendar-refresh.md — Phase 2 (recurrence). Issue #102.

Phase 0:
- Recurrence rules we agreed in grill-me: [paste]
- Backward compatibility: existing series with 10-cap must [migrate / display legacy / …]

One behaviour per cycle; first test is smallest end-to-end proof (e.g. create biweekly series with new cap rule). Approve scope before RED.
```

### Slice example C — notifications reliability

```text
@aligned-implementation @tdd

Anchor: ./plans/calendar-refresh.md — Phase 3 (notifications). Issue #103.

Phase 0:
- Observable behaviour: [e.g. exactly one reminder per occurrence; idempotent schedule job]
- Out of scope: [e.g. new push provider]

First failing test should assert **user-visible or API-visible** outcome, not internal queue details unless that’s the only seam.
```

### When scope shifts mid-flight — `requirement-course-correction`

```text
@requirement-course-correction

Change: [e.g. “legal wants audit log on notification sends”]. Plan: ./plans/calendar-refresh.md. Parent issue #100.

Classify (bug vs spec vs requirement vs architecture), run impact checklist, propose plan/issue edits, stop for my “Approved: implement only [X]” before code.
```

---

## Order summary (calendar-shaped project)

| Order | Skill | Calendar-specific output |
|-------|--------|--------------------------|
| 1 | `grill-me` | Decisions on speed vs recurrence vs notifications; visual freeze |
| 2 | `ubiquitous-language` | Optional glossary |
| 3 | `inherited-codebase-onboarding` | Map + numbered next steps |
| 3b | `triage-issue` or `improve-codebase-architecture` | Only if bug or coupling blocks slices |
| 4 | `prd-to-plan` **or** `to-issues` | `./plans/calendar-refresh.md` or child issues |
| 5 | `aligned-implementation` + `tdd` | One thread per phase (fast create → recurrence → notifications) |
| — | `requirement-course-correction` | When requirements move mid-project |

This is a **usage flow**: skills do not chain automatically—you open each thread with the right `@` and paste the anchor text so behaviour matches the skill you invoked.

---

## See also

- [Skills catalog](../skills/index.md) — per-skill reference pages  
- [Cookbook: quick examples](../cookbook/quick-examples.md) — shorter single-shot prompts  
