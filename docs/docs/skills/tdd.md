# tdd

**Skill package:** `tdd/`

## What it does

Teaches **red-green-refactor** with **vertical slices** (tracer bullets), behavior through public interfaces, and anti-patterns.

## Input

Feature or bug fix with agreed interface and prioritized behaviors; your approval on plan before code.

## Output

One failing test → minimal pass → repeat; refactor only when green; pointers to bundled `tests.md`, `mocking.md`, etc.

## What it won’t do

Endorse “write all tests then all code” (horizontal slice); test everything exhaustively without prioritization.

## How to use it

Confirm public API and behaviors; one test at a time; refuse refactors while RED.

## Examples

1. First test: “valid cart checks out.”
2. Next: “empty cart rejected.”
3. Green: extract duplication.

## Combinations

- **aligned-implementation** — process gates.
- **triage-issue** — TDD fix plan in issue body.

## Quickstart

```text
@tdd @aligned-implementation — Public API: `checkout(cart)`. Behaviors: happy path, empty cart, expired offer. One test at a time.
```
</think>


<｜tool▁calls▁begin｜><｜tool▁call▁begin｜>
StrReplace