---
name: issue-to-pr
description: Creates an issue-named branch from a fresh base, builds commit and PR text from gh issue data plus git diffs, obtains approval via AskQuestion, then commits, pushes to origin, and opens a PR with gh. Use when the user gives an issue number, wants a PR into main or another branch, mentions issue-to-PR, gh PR workflow, push branch and open PR, or approve commit before pushing.
---

# Issue to PR (gh)

Assumes **direct push to `origin`** on the **same repo** `gh` is using—not fork workflows unless the user extends this.

## Inputs

- **Issue number** (required). Parse from phrases like `#42`, `issue 42`.
- **Base branch** to merge into (optional, default **`main`**).
- Optional: **draft PR** (`--draft`), **conventional commit** prefix (`fix:`, `feat:`).

If issue number or base is missing and not inferable, ask once.

## Preconditions (fail fast)

1. `gh auth status` — if not logged in, stop with fix steps.
2. `git remote -v` — require **`origin`** unless the user specifies otherwise.
3. Confirm there is something to commit after staging policy (below), or stop with a clear message.

## Order of operations

### 1. Fetch base and create branch

```bash
git fetch origin "<base>"
```

- If **`origin/<base>`** does not exist after fetch, stop and report (wrong base name or no remote branch).

**Branch name:** `issue-<N>-<short-slug>` where `<short-slug>` is a lowercase hyphenated slice of the issue title (ASCII; collapse spaces; max ~40 chars). Example: `issue-42-fix-login-redirect`.

**Before creating the branch**, check whether that name exists locally or on `origin`:

- If it exists, use **AskQuestion**: reuse branch, pick alternate name (suggest `issue-<N>-<slug>-2`), or cancel.

Create branch from the remote tip:

```bash
git checkout -b "<branch>" "origin/<base>"
```

If the user already has **uncommitted work** on another branch, do **not** discard it. Prefer: stash → checkout new branch from `origin/<base>` → stash pop; or ask the user. Do not silently lose changes.

If there are **local commits** on the current branch that are not on `origin/<base>`, **stop and ask**: cherry-pick them onto the new branch, only land uncommitted changes, or another approach—do not guess.

### 2. Stage changes

- Prefer **explicit** staging: `git add` for paths the user named, or `git add -p` when appropriate.
- If nothing is staged and the user expects a commit, say what is unstaged and either stage intentionally or stop—**do not** `git add -A` without user agreement.

### 3. Load issue and build messages

```bash
gh issue view "<N>" --json title,body,number,url
```

**Commit message (proposed):**

- **Subject:** concise; often derived from issue title (optional conventional prefix if requested).
- **Body:** 1–3 sentences from issue intent; reference issue with **`Refs #N`** or team convention; optional `git diff --cached --stat` one-liner.

**Diffs for wording (commit):** `git diff --cached` (and staged stat). Use this to describe what the commit actually does.

**PR title/body (proposed):**

- Title can mirror issue title or commit subject.
- Body: short summary, link **`Closes #N`** or **`Fixes #N`** if closing the issue is intended; include issue URL.
- Do **not** duplicate the entire issue body unless useful—summarize.

### 4. Approval gate (required)

Use **`AskQuestion`** with:

- **Prompt:** full exact text for **commit subject + body** and **PR title + body** (markdown allowed).
- **Options:** e.g. **Approve and continue** | **Revise in chat** | **Cancel**.

If **Revise in chat**: user edits in follow-up; update drafts and **AskQuestion** again until approve or cancel.

If **AskQuestion** is unavailable: paste the same proposal and wait for explicit approval (**yes**) before committing.

**Do not** `git commit` until approved.

### 5. Commit

```bash
git commit -m "<subject>" -m "<body>"
```

Or open editor flow only if the user prefers—default to `-m` with approved text.

### 6. Push

```bash
git push -u origin HEAD
```

### 7. PR: duplicate check

```bash
gh pr list --head "<branch>" --json number,url,state
```

- If an **open** PR exists for this head: **do not** create another; show URL and offer to update description only.
- Otherwise create:

```bash
gh pr create --base "<base>" --title "<title>" --body "<body>"
```

Add `--draft` if the user asked for a draft PR.

### 8. PR body enrichment (optional, after commit)

If useful, append a short **compare summary** to the PR body (or a follow-up comment):

```bash
git fetch origin "<base>"
git diff "origin/<base>...HEAD" --stat
```

Skip **merge-base / range** diff when there is no common ancestor with `origin/<base>` (e.g. **initial commit** / unrelated histories). Rely on issue text + `git diff --cached` for the commit message in those cases.

## Empty or first-commit repos

If **`git merge-base HEAD "origin/<base>"`** fails or history is empty: skip range-diff vs base; still build the commit from **issue JSON + staged diff**.

## Invocation examples

- `Run issue-to-PR for #42` (base `main`).
- `Issue #128, PR into develop`.
- `@issue-to-pr #91 base develop`
- `Issue #55, draft PR after I approve the message`.

## Tools

- **Git:** local branch, stage, commit, push.
- **`gh`:** `issue view`, `pr list`, `pr create` (and auth).
- **`AskQuestion`:** approval gate before commit.
