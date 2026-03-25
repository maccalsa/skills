# Cookbook: quick examples

Short, **copy-paste** patterns with real wording. Replace bracketed placeholders with your project facts.

---

## 1. Scoped API slice (auth + validation)

**Goal:** Add one endpoint with alignment and tests—no drive-by refactors.

!!! example "Prompt"
    ```text
    @aligned-implementation @tdd

    Anchor: issue #88 — POST /api/v1/invites.

    Phase 0 — align now:
    - Request body: { email, role } — role enum: admin | member.
    - Behaviors in order: (1) 201 + invite id when email new, (2) 409 when duplicate invite, (3) 400 when role invalid.
    - Done for this thread: handler + tests for this route only; no email sending implementation (stub port).

    Stop for my OK before RED. Then one failing test → minimal green → repeat.
    ```

**Why it works:** The anchor is **one issue**, behaviors are **ordered**, and out-of-scope work (real email) is explicitly stubbed.

---

## 2. Bug triage with a TDD fix plan

**Goal:** Root cause + GitHub issue with RED/GREEN steps—implementation optional in a follow-up.

!!! example "Prompt"
    ```text
    @triage-issue

    Symptom: Invoice PDF shows wrong tax when a line item has a discount; total matches but line tax does not.

    Reproduce: Add item $100, 10% discount, tax 8%; export PDF — line tax column ignores discount.

    Investigate, file a GitHub issue with RCA and a TDD plan. Do not implement the fix in this thread unless I ask.
    ```

**Pairs with:** `@tdd` + `@aligned-implementation` on a branch named from the new issue.

---

## 3. Neon: high egress from list endpoints

**Goal:** Map hot queries to application code and reduce bytes returned.

!!! example "Prompt"
    ```text
    @neon-postgres-egress-optimizer

    Symptom: Neon transfer/egress jumped after shipping dashboard v2. We use pg_stat_statements.

    Find top queries by rows returned; map to ORM/repo calls. Recommend: column lists, pagination, split JOINs, or cache for hot static reads. Prioritize by impact.
    ```

**Pairs with:** `@neon-postgres` for connection and platform details.

---

## 4. PRD → phased plan on disk

**Goal:** Local `./plans/feature.md` with vertical phases—not a pile of horizontal tasks.

!!! example "Prompt"
    ```text
    @prd-to-plan

    PRD path: ./prd.md (notifications reliability).

    Explore the repo only enough to name real integration points: DB, queue, mobile push, email provider.

    Output: ./plans/notifications-reliability.md with:
    - Cross-cutting decisions (idempotency, dedupe key, timezone).
    - Phases as vertical slices (each phase demoable end-to-end).

    Quiz me on granularity; write the file after I approve the outline.
    ```

---

## 5. Issue → branch → PR (automation)

**Goal:** Branch from latest `main`, commit with message you approve, open PR via `gh`.

!!! example "Prompt"
    ```text
    @issue-to-pr — #42, base main. Use conventional commits. Draft PR; I’ll approve commit and PR bodies before you push.
    ```

**Requires:** `gh` authenticated, `origin` writable, clean or agreed scope for staged files.

---

## Combining skills (cheat sheet)

| Intent | Skills |
|--------|--------|
| Narrow scope + test-first | `aligned-implementation` + `tdd` |
| Sharpen PRD before planning | `prd-critique` → `prd-to-plan` |
| GitHub issues instead of local plan | `prd-to-issues` |
| Repo map + next step | `inherited-codebase-onboarding` |
| Architecture RFC | `improve-codebase-architecture` or `request-refactor-plan` |
| Mid-flight scope change | `requirement-course-correction` |

See the [Skills catalog](../skills/index.md) and each skill’s page for combinations and quickstarts.
