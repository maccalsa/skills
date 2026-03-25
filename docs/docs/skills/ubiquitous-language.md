# ubiquitous-language

**Skill package:** `ubiquitous-language/`

## What it does

Builds a **DDD-style glossary** from the conversation, writes **`UBIQUITOUS_LANGUAGE.md`** in the working directory, and summarizes.

## Input

Domain discussion (nouns, verbs, workflows); optional existing file on re-run.

## Output

Markdown: grouped tables (term, definition, aliases to avoid), relationships, example dialogue, flagged ambiguities; inline summary + commitment to use terms.

## What it won’t do

Include generic CS terms unless domain-specific; write long definitions.

## How to use it

Invoke after domain-heavy discussion; re-invoke to merge `(new)` / `(updated)` and refresh dialogue.

## Examples

1. E-commerce modeling session → glossary.
2. “account” means Customer vs User — flagged.
3. Share with team for PRD alignment.

## Combinations

- **write-a-prd** / **prd-critique** — consistent vocabulary.
- **grill-me** — clarify terms before building.

## Quickstart

```text
@ubiquitous-language — Extract glossary from our discussion of orders, fulfillments, shipments. Write UBIQUITOUS_LANGUAGE.md.
```
