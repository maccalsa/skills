# design-an-interface

**Skill package:** `design-an-interface/`

## What it does

Produces several **radically different** interface designs for a module (via parallel sub-agents), then compares trade-offs in prose.

## Input

Module purpose, callers, key operations, constraints, what to hide vs expose. Optionally “design it twice” or parallel exploration.

## Output

Per design: signature, usage example, what it hides, trade-offs; then prose comparison (simplicity, flexibility, efficiency, depth, misuse risk). No implementation.

## What it won’t do

Ship code; substitute for your final product decision; guarantee “best” without your choice.

## How to use it

Ask for requirements first. Have the agent spawn 3+ Task sub-agents in **one** message with **different** constraints each (e.g. minimal API vs maximal flexibility vs common case). Read designs sequentially, then comparison.

## Examples

1. “Payment adapter: three designs — minimal methods, plugin-style, and optimized for card-only.”
2. “Job queue client: contrast callback vs polling vs stream.”
3. “After comparison, blend A’s surface with B’s error model.”

## Combinations

- **improve-codebase-architecture** — explores coupling first; this skill narrows API shape.
- **aligned-implementation** + **tdd** — implement after you pick a design.

## Quickstart

```text
@design-an-interface — Module: email outbox. Callers: order service + workers. Generate 3+ different shapes; compare depth and caller misuse risk. No code.
```
