# Tech lead case study: PR discipline & peer tension

This page shows **why** the `tech-lead-unblock` skill exists for wide-ranging “people + delivery” questions, using a **redacted real scenario** (same situation as the repo’s illustrative `issue.md` scratch note, if present). It contrasts **generic assistant output** with the **process-first** output these skills encourage.

---

## Scenario (redacted)

- A **large Spring Boot upgrade** is underway; many breakages; it had been blocking other work.
- Leadership **reprioritized**: finish the upgrade first; other work slides—**priority is clear**.
- Developer **X** owns much of the work and has been under pressure.
- Developer **Y** (experienced with upgrades) has been **helping X**.
- **Friction:** X ships **large PRs** that try to fix several things at once. Y **rejects** them and explains **PR focus** repeatedly. Y is **fed up** and told the manager they do not think X “gets it.”
- **Manager goal:** X ships **reviewable PRs**, Y stays **engaged**, tension **defuses**, without humiliating X.

---

## What often goes wrong with generic “advice” answers

A typical unconstrained model reply **sounds** helpful but can:

| Failure mode | Why it hurts |
|--------------|----------------|
| **Long lists of problems** | Reinforces frustration without a **path**. |
| **Vague principles** (“communicate better,” “align expectations”) | No **owner**, **timebox**, or **success signal**. |
| **No classification** | Mixes **skill gap**, **process**, **stress**, and **interpersonal** into one blob. |
| **Ignoring attribution** | Suggests actions that **expose Y** or **shame X** in public. |
| **No intervention order** | Jumps to team-wide rules or “mediation” before **private, low-visibility** steps. |

Readers leave with **more words**, not **clear next moves**.

---

## What good output looks like (shape)

Using `@tech-lead-unblock`, you want **most** of the following—**briefly**:

1. **Classification** — e.g. priority already unblocked at leadership level; remaining issue is **delivery discipline + reviewer fatigue** under **Developer X frustrates Developer Y (no malice)** per the skill’s ladder.
2. **Facts vs interpretations** — observable: PR size, rejections, repeated coaching; avoid diagnosing intent.
3. **Social dynamics check** — protect **Y’s** confidentiality; avoid “trial by Slack”; prefer **private** 1:1s before public norms.
4. **System vs person** — **upgrade stress** and **unclear PR boundaries** are fixable with **norms and examples**, not only “try harder.”
5. **One focused move** — e.g. manager meets **X** and **Y** separately, then agrees a **joint working agreement** for this initiative: PR size ceiling, branch strategy, when to split commits, how Y gives feedback.
6. **Success signals** — e.g. next **N** PRs from X are under **M** lines / single concern; Y reports **sustainable** help (time-boxed office hours vs endless rescues).
7. **Optional drafts** — short **1:1** language for X (coaching) and Y (validation + boundaries).

That is **actionable facilitation**, not a morale essay.

---

## Example prompt (copy-paste)

```text
@tech-lead-unblock

Scenario: Spring Boot upgrade is the top priority; dev X is under pressure; dev Y (experienced) has been helping but keeps rejecting X’s oversized multi-topic PRs and is now fed up and says X doesn’t get it. Leadership already cleared priority. I’m the manager.

I need:
1. Classify this using your frameworks (which ladder applies).
2. Social dynamics check: how do I protect Y and avoid shaming X?
3. The smallest sequence of moves (private before public) with owners and timeboxes.
4. Draft optional 1:1 openers for X and for Y.
5. One paragraph “team norm” version only if we need something visible—still no blame-by-name.

Do not give a long list of generic management tips; give ordered steps and success signals.
```

---

## Optional: Jira follow-ups (`tech-lead-jira-tickets`)

After people agree on **how** work should be sliced, recording it reduces **re-litigation**. Examples (adapt keys and fields to your project):

| Type | Purpose |
|------|---------|
| **Spike** (time-boxed) | “Slice strategy for Spring Boot upgrade: PR boundaries, branch pattern, rollback—**decision + ADR**.” |
| **Task** | “Add **PR sizing checklist** to team wiki / onboarding; link from Definition of Ready.” |
| **Technical story** | “**Single-concern** upgrade PR #1: [specific dependency/module]—CI green, no unrelated refactors.” |

Tickets should **link** to the BA epic for the upgrade (if one exists) and any **Miro** architecture board—**link, don’t paste** the whole product doc.

---

## Do you need a separate “docs section” for tech-lead skills?

**Not necessarily a new top-level site section.** Recommended layout:

| Piece | Role |
|-------|------|
| [tech-lead-unblock](../skills/tech-lead-unblock.md) & [tech-lead-jira-tickets](../skills/tech-lead-jira-tickets.md) in the **Skills** catalog | Canonical **what / input / output / quickstart**. |
| **This cookbook page** | **Deep example** and **anti-pattern** contrast—teaches *when* and *how* to prompt. |
| [Quick examples](quick-examples.md) | Short cross-links for discoverability. |

If the library grows more case studies, you can add a **Cookbook → Case studies** subsection in `mkdocs.yml` without restructuring the whole site.

---

## Takeaway

**Wide-ranging** tech-lead questions need **classification, order, and drafts**—not **volume**. Use this case study as a **template** for prompts: demand **ordered steps**, **success signals**, and **explicit constraints** on visibility and attribution.
