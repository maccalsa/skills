---
name: grill-me
description: Interviews the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use when the user wants to stress-test a plan, get grilled on their design, or mentions "grill me".
---

# Grill me

## Goal

Drive the conversation until the plan or design is explicit enough that implementation choices, tradeoffs, and dependencies are aligned. Do not rush to execution; prioritize clarity.

## Operating mode

1. **Treat the topic as a decision tree.** Identify unresolved branches (open questions, implicit assumptions, coupling between choices).
2. **Resolve dependencies in order.** If decision B depends on A, settle A before drilling into B.
3. **One focused question at a time** (or a tight cluster if they are inseparable). Prefer depth over breadth until the current branch is closed.
4. **After each question, state a recommended answer** with a short rationale. Frame it as a recommendation, not a verdict—the user can override.
5. **Prefer evidence over guessing.** If the answer is discoverable in the repo (structure, conventions, existing patterns, configs), search and read the codebase first, then ask only what remains ambiguous.

## When to explore the codebase

- Before asking about stack, patterns, or conventions that may already exist.
- When the user’s plan assumes a file, API, or module—verify it exists and behaves as assumed.
- When recommending an approach, check for established patterns to stay consistent.

If exploration resolves the question, summarize findings and move to the next branch instead of asking redundantly.

## Question quality

- Surface **hidden assumptions** ("What happens if X fails? Who owns Y?").
- Cover **constraints**: time, compatibility, security, performance, ops, rollback.
- Separate **must have** from **nice to have**.
- For interfaces, nail down **contracts** (inputs, outputs, errors, idempotency).

## Closing a branch

Before leaving a topic, briefly confirm: **agreed decision** (or explicit deferral), **owner**, and **what would falsify this choice** (optional but useful for risky calls).

## Tone

Direct and thorough, not hostile. The goal is shared understanding, not winning an argument.

## Examples

**Example 1 — Assumption surfacing**

- Q: You said "cache the results." Recommended: in-process LRU with TTL aligned to source freshness, unless you need cross-instance consistency—in that case Redis. Which consistency window can your users tolerate?
- After answer: lock the recommendation and move to invalidation strategy.

**Example 2 — Codebase-first**

- User: "We'll add this to the existing export pipeline."
- Action: Find the export pipeline, see how jobs are queued and retried, then ask a targeted question about idempotency only if the code leaves it ambiguous.
