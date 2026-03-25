# neon-postgres-egress-optimizer

**Skill package:** `neon-postgres-egress-optimizer/`

## What it does

Diagnoses and fixes **application-side** patterns that inflate Postgres egress (bytes returned to the app).

## Input

Symptoms (high bill, spikes, `SELECT *`, N+1); optional `pg_stat_statements` access; or codebase-only review.

## Output

Ranked findings; fixes: column lists, pagination, caching hot static reads, SQL-side aggregation, splitting JOINs to avoid duplication; verification steps.

## What it won’t do

Replace Neon pricing support; fix non-egress issues (pure CPU) unless they correlate; guarantee stats if compute just restarted (stats may be empty).

## How to use it

Enable/reset `pg_stat_statements` if needed; run diagnostic queries; map top queries to code; apply fixes; reset stats and re-measure.

## Examples

1. “Top queries by `rows` — this endpoint selects all columns.”
2. “Split product+reviews JOIN into two queries.”
3. “Cache reference data queried 50k times/day.”

## Combinations

- **neon-postgres** — platform context.
- Neon billing docs for transfer semantics.

## Quickstart

```text
@neon-postgres-egress-optimizer — Bill spiked; we have pg_stat_statements. Find top row-returning queries and map to ORM calls.
```
