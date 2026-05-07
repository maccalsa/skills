# prd-critique

**Skill package:** `prd-critique/`

## What it does

Reviews `./prd.md` like a tough PM, then writes **`./plans/prd-final.md`** with Stripe-style structure plus embedded **PRD Review Notes** (critique).

## Input

`./prd.md` required; optional `spec.md`, `notes.md`, `research.md`, `context.md`.

## Output

Single markdown file: title, review notes (missing/ambiguous/over-specified/contradictions/questions), then **Final PRD** in fixed section order.

## What it won’t do

Replace a technical spec; succeed if `prd.md` is missing (fail clearly); invent business facts without context.

## How to use it

Put draft at `./prd.md`; optional supporting files; run skill; read `prd-final.md` for decisions and remaining open questions.

## Examples

1. Draft PRD → critique → sharper v1 scope.
2. Thin PRD → review notes call it out + best-effort final with assumptions.
3. Spec-heavy draft → extract product layer into PRD.

## Combinations

- **prd-to-plan** — turns final PRD into phases.
- **to-issues** — if work should live as tracker issues (plan, spec, or PRD).
- **grill-me** — live Q&A instead of file-based critique.

## Quickstart

```text
@prd-critique — ./prd.md is ready. Produce ./plans/prd-final.md with review notes + Stripe-style final PRD.
```
