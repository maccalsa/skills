# mirror-repo-github

**Skill package:** `mirror-repo-github/`

## What it does

Removes old `origin`, creates a **new private** GitHub repo with `gh`, wires `origin`, pushes—so automation (e.g. issue-to-pr) has a home.

## Input

Target `owner/repo` (or repo name + `gh` user as owner); branch to push (default rules around `main`/`master`); never public unless you change outside this skill.

## Output

`origin` → new URL; branch pushed; optional verification.

## What it won’t do

Create public repos in this workflow; force-push without explicit ask; remove other remotes unless you ask.

## How to use it

`gh auth login`; run from repo root. Prefer `gh repo create owner/name --private --source=. --remote=origin --push` when suitable.

## Examples

1. “Mirror this clone to `acme/widget-api` private.”
2. “Detach old origin; I need a fresh repo for gh workflows.”
3. Large history: expect push to take time.

## Combinations

- **issue-to-pr** — needs `origin` you control.

## Quickstart

```text
@mirror-repo-github — New private repo `myuser/experiment`. Push current branch.
```
