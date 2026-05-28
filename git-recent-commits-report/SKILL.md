---
name: git-recent-commits-report
description: >-
  Builds a Markdown report from the last N commits at HEAD — shortlog, a
  prose summary that infers intent and purpose, and an appended unified diff.
  Use when the user asks for a changelog-style write-up, recent-commit
  summary, narrative of last N commits, purpose of changes, or a combined
  diff report in .md format.
disable-model-invocation: true
---

# Git recent commits → Markdown report

## Goal

Produce a single `.md` file that captures **what changed** in the last **N** commits, **why it likely happened** (inferred from messages + diff), and the **full diff** (`HEAD~N..HEAD`).

## Inputs

1. **`N`** (positive integer): number of commits to include. If the user omits it, ask once or default **5** and say so in the report header.

2. **Output path**: If omitted, write `<repo-root>/recent-commits-last-<N>.md` (hyphenated, no spaces).

3. **Repo**: Prefer the workspace git root (`git rev-parse --show-toplevel`).

## Constraints

- **Linear history assumption**: Use `git diff HEAD~N HEAD`. If history is shallow or merges make `HEAD~N` unreliable, warn in the Markdown and prefer `git log -N --reverse` plus `git diff <oldest_SHA>..HEAD` where `<oldest_SHA>` is the parent of the Nth commit from HEAD.
- **Large diffs**: If `git diff HEAD~N HEAD | wc -c` exceeds ~**200 KB**, keep the prose summary full but replace the inlined diff with:
  - `git diff --stat HEAD~N HEAD` only **in** the file, and
  - a note: full diff omitted due to size; run `git diff HEAD~N HEAD > changes.patch`.
- Do not paste secrets (.env tokens, keys). Redact obvious secrets if seen in diff.
- Mention **branch name** and **date generated** at the top.

## Steps (agent)

1. `cd` to repo root; `git status -sb`; `git log -N --oneline --decorate`; record branch tip SHA.
2. Compute diff range: **`HEAD~N..HEAD`** (equivalently diff from merge-base approach if non-linear — document which was used).
3. Collect **structured metadata** into the report:

   | Commit (short SHA) | Subject |
   | --- | --- |
   | … | … |

4. **`git diff --stat HEAD~N HEAD`** — include under `## Diff stat`.
5. **`git diff HEAD~N HEAD`** — include under `## Unified diff` in a fenced **`diff`** code block unless size threshold triggers truncation rule above.

6. **Narrative (required)** under `## Summary` — 3–10 short paragraphs or bullet clusters:
   - **Theme**: grouping by area (API, infra, tests, chore).
   - **User-visible / system behaviour**: what callers or operators would notice.
   - **Purpose (inferred)**: hypotheses framed as inference ("likely intended to …") when not explicit from messages.
   - **Risks / follow-ups**: breaking changes, config changes, obvious TODOs.

7. Save the Markdown file at the chosen path; tell the user the path.

## Report template skeleton

Use this shape (fill in):

```markdown
# Recent commits report (last N)

- **Generated:** <ISO-ish timestamp>
- **Branch:** `<name>`
- **Range:** `HEAD~N..HEAD` (<short-oldest>..<short-HEAD>)
- **Note:** …

## Commit list

…

## Summary

### Themes
…

### Inferred purpose
…

### Risks / follow-ups
…

## Diff stat

```
…
```

## Unified diff

```diff
…
```
```

## When not to use

- User only wants **`git format-patch`** or release notes tied to tags — redirect to tags/range they specify.
- User wants PR-level narrative only — fetch PR bounds instead of arbitrary N.
