---
name: ask-skills
description: Ask which skill or flow fits your situation. A router over the skills in this repo.
disable-model-invocation: true
---

# Ask Skills

Use this when you do not remember which skill fits. It routes the situation to a workflow rather than duplicating the workflow.

## Main flow: idea to ship

1. **`/grill-with-docs`** - sharpen the idea in a codebase, updating `CONTEXT.md` and ADRs when useful. Use **`/grill-me`** for non-code or stateless planning.
2. **Map decisions if needed** - use **`/decision-mapping`** when a loose idea has too many open questions for one session.
3. **Prototype if needed** - use **`/handoff`** to branch into **`/prototype`** when a question needs a runnable answer, then hand the result back.
4. **Split or implement** - for multi-session work, use **`/to-prd`** then **`/to-issues`**. For one focused slice, go straight to **`/implement`**.
5. **Build with feedback** - `/implement` drives **`/tdd`**, then closes with **`/code-review`**.

## On-ramps

- Incoming bugs or feature requests: **`/triage`**.
- Hard bug or regression: **`/diagnosing-bugs`**.
- Branch or PR review: **`/code-review`** or **`/branch-diff-code-review`** when you need attachable review comments.
- Postgres/Neon cost or egress concerns: **`/neon-postgres-egress-optimizer`**.
- Repo rehoming: **`/mirror-repo-github`**.
- Third-party setup or one-off manual workflows: **`/wizard`**.

## Codebase health

- Use **`/improve-codebase-architecture`** to find deepening opportunities.
- Use **`/codebase-design`** for the vocabulary of deep modules and interface shape.
- Use **`/domain-modeling`** to sharpen project language and record ADRs.

## Communication and continuity

- **`/handoff`** moves context between sessions.
- **`/teach`** creates a stateful learning workspace for multi-session learning.
- **`/writing-fragments`**, **`/writing-beats`**, and **`/writing-shape`** support explore-then-shape writing workflows.
- **`/write-like-me`** rewrites text in the user's direct style.
- **`/caveman`** compresses responses when token budget matters.
- **`/fable-orchestration`** wires Fable as architect with ChatGPT as the execution worker (advisor mode, delegate patterns, effort routing).
- **`/writing-great-skills`** reviews skill quality; **`/write-a-skill`** scaffolds new skills.

## Precondition

Run **`/setup-agent-skills`** once per repository before relying on issue-tracker, triage, or domain-doc workflows.

## Attribution

Adapted from Matt Pocock's `ask-skills` router for this repo's skill set.
