# tech-lead-jira-tickets

**Skill package:** `tech-lead-jira-tickets/`

## What it does

Structures **engineering-facing Jira** work (epics, stories, tasks, spikes, tech debt) with **acceptance criteria** and **Definition of Done**, while **linking** to BA-owned requirements and **Miro** UI—without duplicating product prose in engineering tickets.

## Input

Intent to create or refine tickets; BA Jira key(s) and Miro URL when available; team issue types and conventions.

## Output

Titles, descriptions, ACs, open questions, out-of-scope lines—aligned to templates (`task-template.md`, `user-story-template.md`, `epic-template.md` in the skill package).

## What it won’t do

Replace product management ownership of requirements; open Miro boards without pasted context.

## How to use it

Say what type of work it is (epic vs story vs task vs spike). Pull source links first; keep **one source of truth** per fact.

## Examples

1. “Spike: 3 days to choose Spring Boot migration slice strategy—link BA epic PROJ-100, output ADR + recommended PR boundaries.”
2. “Task: add ‘PR sizing checklist’ to team wiki and link from DoR—engineering chore, no BA link.”
3. “Technical story: isolate dependency upgrade in build pipeline—ACs for CI green and rollback path.”

## Combinations

- **tech-lead-unblock** — when the problem is **people/process** first; use this skill once work should be **tracked as Jira**.
- **grill-me** — tighten scope and risks before locking an epic breakdown.

## Case study (where tickets help)

When a team agrees on **norms or spikes** after facilitation, those outcomes often deserve **visible, bounded** Jira items. See the optional “Jira follow-ups” subsection in [Tech lead case study: PR discipline & peer tension](../cookbook/tech-lead-case-study.md).

## Quickstart

```text
@tech-lead-jira-tickets

Work type: [task | story | spike | epic]. BA link: [KEY-123 or none]. Miro: [URL or none]. Goal: [one sentence]. ACs must be testable; include out of scope.
```
