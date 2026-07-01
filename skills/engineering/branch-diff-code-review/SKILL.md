---
name: branch-diff-code-review
description: Reviews a branch or PR diff against its base and writes concise, attachable, human-sounding code review comments. Use when the user asks to review a branch, PR, current changes, or a diff against main/master/base, especially when they want markdown comments with file paths, line numbers, risks, bugs, missing tests, or reviewer-ready feedback.
---

# Branch Diff Code Review

## Quick start

Review only the changed behaviour between a branch and its base, then write reviewer-ready markdown comments anchored to current-branch line numbers.

Default output:

- Up to **5 findings** unless the user requests a different limit.
- Findings first, ordered by severity.
- Each finding has a file path, line or range, short title, the concern, and a concrete question or suggested fix.
- If there are no material findings, say so plainly and mention residual risk or test gaps.

## Workflow

1. Establish the review scope.
   - Prefer a user-specified base (`main`, `master`, `origin/main`, PR base, or SHA).
   - If reviewing a GitHub PR/URL, use `gh` to identify the base and changed files.
   - Otherwise infer the base from the tracked branch, `origin/main`, then `origin/master`.
   - If the base is genuinely ambiguous, ask one short question before reviewing.

2. Gather evidence.
   - Check branch state: `git status --short --branch`.
   - Get commits: `git log --oneline --decorate <base>..HEAD`.
   - List files: `git diff --name-status <base>...HEAD`.
   - Inspect diff: `git diff --unified=80 <base>...HEAD`.
   - For large diffs, split by package or feature area; use targeted file reads for changed files.

3. Review changed behaviour, not the whole codebase.
   - Prioritise correctness bugs, behavioural regressions, broken contracts, data loss, security/privacy issues, concurrency hazards, observability gaps, and missing tests for new behaviour.
   - Comment on style/naming only when it blocks understanding or review.
   - Do not comment on untouched code unless the diff changes how that code behaves.
   - Avoid speculative “future improvement” comments. Make every finding actionable now.

4. Get attachable line references.
   - Read the changed files on the current branch with `ReadFile` so line numbers match the reviewer's view.
   - Anchor each comment to the smallest relevant line or range.
   - Prefer added/edited lines. If the problem spans files, anchor to the changed line that introduced the behaviour and mention related files in prose.
   - Use `path/to/File.kt:42` or `path/to/File.kt:42-48`.

5. Write the review.
   - Lead with findings. Keep summary secondary.
   - Use direct, practical wording; question-led phrasing is good when intent is unclear.
   - Explain the observed risk and the likely fix in 2-5 sentences per finding.
   - Save to the requested path if the user asks for a file; otherwise respond in chat.

## Comment Format

```md
## Review Comments

### 1. Short Finding Title

`path/to/File.kt:42`

Does this path need to handle `<condition>` as well?

Why I'm asking: this branch now sends `<new value>` into `<consumer>`, but `<consumer>` still treats it as `<old assumption>`. That looks like it could `<specific failure>`. Should this guard/map/test be updated here?
```

If no findings:

```md
## Review Comments
gonig ti pop 
No material findings from the diff against `<base>`.

Residual risk: `<brief test gap or area not run>`.
```

## Tone Rules

- Sound like a human teammate, not an audit report.
- Prefer “Does this mean…?”, “Do we need…?”, “Is this still true…?” when intent is uncertain.
- Be precise about evidence from the diff. Do not overstate impact.
- Avoid generic praise, “nit”, “LGTM except”, and AI-polished symmetry.
- If unsure about phrasing, use the `write-like-me` skill.

## Review Checklist

- [ ] Correct base branch or PR base used.
- [ ] Only changed behaviour or changed tests are reviewed.
- [ ] Findings are ordered by severity.
- [ ] Every finding has an attachable file path and line number/range.
- [ ] Each comment includes why it matters and what would resolve it.
- [ ] No more findings than requested.
- [ ] No speculative cleanup or broad architecture critique unless requested.

## File Output

When the user asks for a markdown file, create `branch-diff-review.md` in the repo root unless they provide a path. Include base/head refs, commit list, review comments, and commands/tests run.
