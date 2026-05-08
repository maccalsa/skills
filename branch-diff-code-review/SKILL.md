---
name: branch-diff-code-review
description: Reviews the current branch against its parent branch and writes attachable, human-sounding code review comments. Use when the user asks to review a branch, PR, or current changes against main/master/base, especially when they want concise markdown comments with file paths and line numbers.
---

# Branch Diff Code Review

## Quick start

Compare the current branch with its parent branch, review only what changed, then write a short markdown review with comments that can be attached to the changed lines.

Default style:

- Warm opening.
- Direct, practical, human wording.
- Question-led comments: "Does that mean...?", "Do we need...?", "Is this correct...?", "Are we missing...?"
- No AI polish, no generic praise, no long summaries.
- No more than 5 comments unless the user asks for a different limit.

## Workflow

1. Find the base branch.
   - Prefer the user-specified parent branch.
   - Otherwise use the merge base with `main`, `master`, or the branch's tracked PR base.
   - If the base is genuinely unclear, ask one short question.

2. Compare the branch.
   - Check branch state: `git status --short --branch`.
   - List changed files: `git diff --name-status <base>...HEAD`.
   - Inspect the diff: `git diff --unified=80 <base>...HEAD`.
   - For large diffs, split by area and use read-only subagents or targeted file reads.

3. Review for current issues only.
   - Focus on behaviour that changed from the parent branch.
   - Look for real bugs, broken tests, contract changes, missing coverage for new behaviour, security risks, and confusing implementation choices.
   - Do not leave speculative "maybe someday" comments.
   - Do not comment on untouched code unless the branch changed how that code behaves.

4. Get attachable line references.
   - Read the changed files on the current branch with `ReadFile` so line numbers match the reviewer's view.
   - Anchor each comment to the smallest relevant line or range.
   - Prefer lines added or edited in the branch. If the issue is caused by interaction across files, cite the most direct changed line first and mention the related file in the comment.
   - Use this format in markdown:

```md
### 1. Short comment title

`path/to/File.kt:42`

Does that mean ...?

Why I'm asking: ...
```

5. Write the review.
   - Start with a warm one- or two-sentence opener.
   - Keep each comment short: location, question, current issue, suggested clarification or fix.
   - Use the user's requested output location. If they only ask for "a markdown file", create a clearly named file in the repo root.
   - Respect the requested comment limit.

## Comment Shape

Use this pattern:

```md
## Review Comments

Nice work getting this through. I had a few questions where the branch seems to change behaviour from `<base>`.

### 1. Detail response on partial upstream success

`query/src/main/.../CaseQueryService.kt:90`

Does that mean `GET /cases/{crn}` should now return only `crn` when this upstream value is missing?

Why I'm asking: on `<base>`, the response still used the successful upstream calls to populate the rest of the DTO. This branch currently drops that data at this line. Is that intended, or should the new status only describe the missing part?
```

## Tone Rules

- Prefer questions over commands.
- Be clear about the current issue in the diff.
- Avoid grand claims like "this will break production" unless the evidence proves it.
- Avoid filler like "great work overall" or "just a small nit".
- If a comment is only style or naming, say so briefly.
- If there are no strong findings, say that plainly and list any remaining coverage gaps.
- if unsure refer to skill /write-like-me

## Output Checklist

- [ ] Uses the correct base branch.
- [ ] Only comments on changed behaviour or changed tests.
- [ ] Has no more comments than requested.
- [ ] Every comment has a file path and line number.
- [ ] Comments sound like a human reviewer, not an audit report.
- [ ] The opening is warm but not overdone.
