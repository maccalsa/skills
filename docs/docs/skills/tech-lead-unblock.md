# tech-lead-unblock

**Skill package:** `tech-lead-unblock/`

## What it does

Helps you operate as a tech lead on a management team: clear blockers, align people and technical choices, and surface options—without assuming you will ship large code changes. Covers **technical unblocks**, **process/priority**, **interpersonal/team health**, and **ownership**, with a **social dynamics** check before corrective moves.

## Input

A situation (blocked work, conflict, unclear ownership, BA/dev tension, prioritization); optional repo or ticket context.

## Output

Short **decision records**, **message drafts** (1:1, Slack, email), **breakdowns of who does what**, and **one focused next step** (owner + timeframe + success signal)—not long essays.

## What it won’t do

Therapy, legal advice, or HR investigations; invent facts about colleagues; replace managers on people discipline.

## How to use it

Describe the situation plainly. Mention if attribution or power dynamics matter. Ask for a **default move** and **intervention ladder** when tension is involved.

## Examples

1. “We prioritized the Spring Boot upgrade; dev X is under pressure; Y is helping but exhausted—how do I unblock without making it worse?”
2. “BA keeps reopening tickets for perfect specs; devs are blocked—what’s a Definition of Ready we can agree on?”
3. “Two seniors disagree on API style—need options, criteria, and decision owner in one page.”

## Combinations

- **tech-lead-jira-tickets** — when follow-up work should become **engineering Jira** items (norms, spikes, tasks) with links to BA/Miro.
- **grill-me** — stress-test assumptions before you send a team-wide message or lock a plan.

## Case study (full walkthrough)

For a **realistic manager scenario**, contrast between generic “advice dump” output and this skill’s **process-first** output, see [Tech lead case study: PR discipline & peer tension](../cookbook/tech-lead-case-study.md).

## Quickstart

```text
@tech-lead-unblock

Context: [blocked work / tension / unclear owner]. Constraints: [time, morale, policy]. I need: a classified situation, lowest-visibility intervention first, one next step with owner and how we’ll know it worked. Draft optional 1:1 language if useful.
```
