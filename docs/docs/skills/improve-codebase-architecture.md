# improve-codebase-architecture

**Skill package:** `improve-codebase-architecture/`

## What it does

Explores the codebase for friction, proposes **deep-module** opportunities, runs parallel interface designs for a chosen cluster, and files a **GitHub refactor RFC issue** (no prior approval step for creating the issue).

## Input

Repo access; your interest in architecture, testability, or AI-navigability. You pick one candidate from the numbered list.

## Output

Numbered candidate clusters (coupling, dependency category, test impact); user-facing problem framing; 3+ parallel interface designs; recommendation; `gh issue create` URL with RFC template.

## What it won’t do

Guarantee implementation; skip exploration—organic friction is the signal.

## How to use it

Let the agent explore with Explore sub-agents. Review candidates; pick one. Read the problem-space framing before design sub-agents return. Expect an issue URL at the end.

## Examples

1. “Find shallow modules in `billing/`.”
2. “Candidate 2 — deepen the invoice boundary; file RFC.”
3. Use the issue as a backlog item for a future PR.

## Combinations

- **inherited-codebase-onboarding** — orientation first.
- **design-an-interface** — similar parallel designs but this skill ties to clusters and RFC filing.

## Quickstart

```text
@improve-codebase-architecture — Bounded pass on `src/payments/`. Number candidates; I’ll pick one for deep-module RFC.
```
