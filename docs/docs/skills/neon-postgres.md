# neon-postgres

**Skill package:** `neon-postgres/`

## What it does

Routes Neon Serverless Postgres questions to **current** docs and patterns: connect, branching, auth, Neon JS, CLI, APIs, pooling, etc.

## Input

Concrete question or task (drivers, serverless, auth, branching, cost, etc.).

## Output

Answers grounded in Neon docs (links to `neon.com` + `llms.txt` index); not a substitute for your connection string or org policy.

## What it won’t do

Invent API details—the skill says verify against docs; training data may be stale.

## How to use it

`@mention` for Neon-specific work; ask the agent to fetch doc pages (`.md` URLs or `Accept: text/markdown`) when precision matters.

## Examples

1. “Pooled vs direct host for serverless?”
2. “Branch for preview deploys?”
3. “Neon Auth vs Neon JS for my Next app?”

## Combinations

- **neon-postgres-egress-optimizer** — cost/transfer.
- MCP Neon tools in Cursor — live SQL/projects when configured.

## Quickstart

```text
@neon-postgres — Edge runtime: recommended connection method and pooling hostname pattern?
```
