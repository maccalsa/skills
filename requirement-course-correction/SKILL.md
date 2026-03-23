---
name: requirement-course-correction
description: Classifies a mid-flight requirement or spec change, updates plans and GitHub issues, then implements one vertical slice. Use when the user says missed requirement, changed requirement, spec drift, wrong assumption, or scope correction after work started; before large refactors use request-refactor-plan.
---

# Requirement course correction

## Purpose

Minimize thrash: classify the delta, update artefacts (plan + issues), get explicit user approval, then implement **one** vertical slice.

## Related skills

- [triage-issue](../triage-issue/SKILL.md) — bug path with root cause and TDD fix issue.
- [request-refactor-plan](../request-refactor-plan/SKILL.md) — architecture-sized change → RFC issue.
- [prd-to-plan](../prd-to-plan/SKILL.md) — replan phases after a true requirement change.
- [aligned-implementation](../aligned-implementation/SKILL.md) + [tdd](../tdd/SKILL.md) — implement the agreed slice.

## 1. Classify (pick one)

| Type | Signal | Lead skill |
| ---- | ------ | ---------- |
| **Bug** | Wrong behaviour vs agreed spec | `triage-issue` |
| **Spec correction** | Spec was ambiguous; code matches old spec | Update issue + plan; then small `aligned-implementation` |
| **True requirement change** | Business rule changed | Update PRD/issue; `prd-to-plan` diff on affected phases; new or reopened issues |
| **Architecture debt** | Fix needs structural change | `request-refactor-plan` |

## 2. Impact (checklist)

- [ ] Which `./plans/<slug>.md` phases still apply? Strike or add rows.
- [ ] Which GitHub issues are invalid, blocked, or need child issues?
- [ ] Which code areas touch the delta? (one short list)
- [ ] Rollback or feature flag needed? (yes/no + one line)

## 3. User gate

Stop for **Approved** with explicit: implement only [issue # or plan subsection].

## 4. Implement

Use **aligned-implementation** + **tdd** with anchor: updated issue + plan excerpt. One slice per thread.

## First message (example)

```text
@requirement-course-correction — Requirement change: [summary]. Plan: ./plans/<slug>.md. Parent issue #N. Classify, run impact checklist, propose issue/plan edits, stop for my Approved before code.
```
