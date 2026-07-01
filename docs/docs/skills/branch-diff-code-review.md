# branch-diff-code-review

Reviews a branch or PR diff against its base and writes concise, attachable, human-sounding code review comments. Use when the user asks to review a branch, PR, current changes, or a diff against main/master/base, especially when they want markdown comments with file paths, line numbers, risks, bugs, missing tests, or reviewer-ready feedback.

## Quickstart

Install this skill with the repository installer:

```bash
npx skills@latest add maccalsa/skills --skill=branch-diff-code-review
```

For a local checkout, run the maintainer linker from the repository root:

```bash
./scripts/link-skills.sh
```

## Source

- [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/skills/engineering/branch-diff-code-review/SKILL.md)
- Bucket: `engineering`

## When to reach for it

Use this skill when the task matches the description above. User-invoked skills should be called directly by name; model-invoked skills can also be loaded automatically by agents that support skill descriptions.

