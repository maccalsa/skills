---
name: tech-lead-jira-tickets
description: Structures engineering work in Jira for tech leads—epics, user stories, small tasks, spikes, tech debt, acceptance criteria, and Definition of Done—with links to BA-owned Jira issues and Miro UI design. Use when the user creates or refines Jira tickets, epics, technical stories, task templates, small chores, spikes, acceptance criteria, or Miro references; or mentions Jira, epic breakdown, or engineering backlog shaping.
---

# Tech lead: Jira tickets and epics

## Goal

Turn intent into **clear, link-friendly Jira work** (epics, stories, tasks, spikes) that **complements** BA/product requirements without duplicating them. Assume **BAs use Jira** for product/requirements issues and **UI designers use Miro**; engineering tickets **link** to both instead of copying full prose.

## Tool roles

| Tool | Typical owner | Tech lead role |
|------|-----------------|----------------|
| **Jira** | BAs/product for requirement epics/stories | Create or shape **engineering-facing** items (technical stories, spikes, sub-tasks). **Link** to BA tickets; paste or summarize only what devs need to execute. |
| **Miro** | UI/UX designers | Reference **board or frame URLs** in the Jira description (or your custom field). Do not assume the agent can open Miro unless the user pastes content. |

## Hierarchy (adapt to your project)

Default mental model: **Epic → Story/Task → sub-tasks**. Mirror the **team’s actual Jira issue types**; if the project differs, follow project conventions.

- **Epic:** outcome-sized body of work; child stories/tasks linked underneath.
- **Story:** user-facing or cross-team slice; often uses the user-story template. Deliverable-sized; **Definition of Ready** before pull into sprint (when applicable).
- **Task:** small, bounded item (docs, infra hygiene, config, runbook)—use [task-template.md](task-template.md) when a full story is unnecessary; same DoR discipline if your team pulls tasks into sprints.
- **Spike:** time-boxed learning; ends with a decision, prototype, or ADR—not endless exploration.
- **Tech debt / chore:** explicit tradeoff; avoid hiding debt inside feature stories without visibility.

## What to put in each ticket

- **Title:** outcome or technical action, not a novel.
- **Description:** problem, constraints, **links** to BA issue + Miro + ADRs. Avoid duplicating the BA epic’s full narrative.
- **Acceptance criteria:** testable, observable; include edge cases.
- **Open questions / assumptions:** visible so clarification is normal, not “scope creep by surprise.”
- **Out of scope:** one short list to prevent thrash.

## Progressive disclosure

- **Task (small work item):** [task-template.md](task-template.md)
- **User story shell:** [user-story-template.md](user-story-template.md)
- **Epic shell:** [epic-template.md](epic-template.md)

Read these when drafting or reviewing full ticket bodies.

## Operating mode

1. **Identify the work type:** epic vs story vs **task** vs spike vs debt/chore.
2. **Pull source links:** BA Jira key(s), Miro URL; ask the user if missing.
3. **Draft** using the template that fits; keep **engineering-specific** detail; **link** to product for the rest.
4. **Sanity-check:** ACs are testable; DoD matches team norms; no duplicate BA-only ownership.

## Relationship to other skills

- **Docs (this repo):** [Tech lead case study](../docs/docs/cookbook/tech-lead-case-study.md) (Jira follow-ups subsection); [skill catalog page](../docs/docs/skills/tech-lead-jira-tickets.md).
- **`tech-lead-unblock`**: facilitation, conflict, prioritization—use when people/process are the problem, not ticket wording.
- **`grill-me`**: stress-test scope, risks, or milestones before locking an epic or a contentious breakdown.
- **`aligned-implementation`**: when a ticket becomes a vertical slice with tests (e.g. your own small contained work).

## Tone

Neutral, precise, and **link-heavy**. Prefer **one source of truth** per fact (Jira, Miro, Confluence).
