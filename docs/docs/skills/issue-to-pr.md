# issue-to-pr

**Skill package:** `issue-to-pr/`

## What it does

Creates branch `issue-<N>-<slug>` from `origin/<base>`, drafts commit/PR text from `gh issue view`, gets **approval** (AskQuestion), commits, pushes, opens PR with `gh`—same repo, direct push to `origin`.

## Input

Issue number (`#42` or `issue 42`); optional base branch (default `main`); optional `--draft` or conventional prefix.

## Output

Branch, commit, PR URL; duplicate PR detection if head already has open PR.

## What it won’t do

Fork workflows; commit without approval; `git add -A` without agreement; silently drop local work.

## How to use it

Ensure `gh auth` and `origin`. Name paths or use `git add -p` when staging. Approve exact commit + PR bodies when prompted.

## Examples

1. “Issue-to-PR for #42 into main.”
2. “#128, base develop, draft PR.”
3. Stash first if you have dirty tree on another branch.

## Combinations

- **mirror-repo-github** — ensures writable `origin` on GitHub.
- Works after any feature work following **aligned-implementation**.

## Quickstart

```text
@issue-to-pr — #42, base main. Conventional commits. Draft PR after I approve messages.
```
