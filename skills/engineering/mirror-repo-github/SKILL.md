---
name: mirror-repo-github
description: Detaches a local git repository from its current remote, creates a new private GitHub repository with gh, attaches it as origin, sets upstream, and pushes the default branch. Use when mirroring or rehoming a repo to a new GitHub remote, copying a codebase to a fresh repo, or preparing a local clone for issue-to-PR and other gh-automation workflows that expect a writable origin.
---

# Mirror repo to a new GitHub remote (gh)

**Goal:** From an existing local repo, drop the old `origin`, create `owner/repo` on GitHub, wire `origin`, set upstream, and push—so downstream skills can use `gh` against the new home.

## When to apply

- User wants to **detach** from the current remote and **publish** to a **new** GitHub repo.
- User mentions **mirror**, **rehome**, **new origin**, **fork my copy to my org**, or **fresh repo for automation**.

## Inputs (ask if missing)

1. **Target repository** — `owner/name` (e.g. `acme/widget-api`). If the user only gives a **repo name**, assume their **logged-in `gh` user** as owner (`gh api user -q .login`).
2. **Branch to push** — default **current branch** if it is `main` or `master`; otherwise ask, or use `main` if that branch exists locally.

**Visibility:** Always **`--private`**. Do not pass `--public` or `--internal` in this workflow. If the user wants a public repo later, they can change visibility in GitHub settings or run a separate command outside this skill.

Do **not** guess `owner/repo` when ambiguous (multiple orgs, unclear name).

## Preconditions

1. `gh auth status` — if not logged in, stop with login steps (`gh auth login`).
2. Working directory must be **inside** the git repo (`git rev-parse --show-toplevel`).
3. If there are **uncommitted changes**, warn that push will only include **commits**; do not discard work. Offer stash if they need a clean push story (optional).

## Order of operations

### 1. Detach from existing remote

- List remotes: `git remote -v`.
- If **`origin`** exists: `git remote remove origin`.
- Other remotes (e.g. `upstream`): **leave unchanged** unless the user asked to remove them.

### 2. Create the GitHub repository

Use **`gh repo create`** with the resolved `owner/name` and **`--private`** only.

**Preferred (single shot from repo root):**

```bash
gh repo create "<owner>/<name>" --private --source=. --remote=origin --push
```

- `--private` is **required** for this skill.
- `--source=.` uses the current directory as the initial content.
- `--remote=origin` adds `origin`.
- `--push` pushes the current branch and sets upstream.

If **`gh repo create`** fails (name taken, permissions), report the error; do not force.

**Alternative (create empty, then wire manually):**

```bash
gh repo create "<owner>/<name>" --private --description "..." 
git remote add origin "https://github.com/<owner>/<name>.git"
# or: gh repo view <owner>/<name> --json url -q .url
```

Use the alternative when the user needs a description, org flags, or `--disable-issues` / template options—compose one coherent `gh repo create` invocation.

### 3. Attach as `origin` (if not already done)

- Skip if step 2 used `--remote=origin`.
- Otherwise: `git remote add origin <https or ssh URL from gh>`.

SSH vs HTTPS: match user preference if stated; else default to **`gh`'s default** (`gh config get git_protocol`).

### 4. Set upstream and push

If **`--push` was not used** in step 2:

1. Ensure the branch exists and is the one the user wants (usually `main` or `master`).
2. Push and set upstream in one step:

```bash
git push -u origin "<branch>"
```

If the remote uses **`main`** but the local branch is **`master`** (or the reverse), either rename locally to match the standard the user wants, or push with an explicit ref (`git push -u origin master:main`) **only** if the user confirmed that mapping.

### 5. Verify

- `git remote -v` shows `origin` → new URL.
- `git status` shows **up to date** with `origin/<branch>` (after push).
- Optional: `gh repo view --web` to confirm the repo page.

## Edge cases

| Situation | Action |
|-----------|--------|
| No commits yet | `gh repo create` may still work; if not, explain empty-repo limits. |
| **Large** history / first push slow | Run push with network; warn user about time. |
| **`origin` missing** before start | Skip remove; proceed to create/add. |
| **Multiple local branches** | Only push the agreed default branch unless user asks for all branches (`git push --all`, tags: `git push --tags`)—confirm first. |

## Safety

- **Do not** `git push --force` to the new repo unless the user explicitly requests rewriting remote history.
- **Do not** remove remotes other than `origin` without being asked.
- If the project is **not** a git repo, initialize only if the user asks (`git init` is a separate decision).

## Composes with

- **issue-to-pr**, **PR automation**, and other skills that assume **`origin`** on a **GitHub** repo the user controls.
