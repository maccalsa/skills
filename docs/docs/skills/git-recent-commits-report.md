# git-recent-commits-report

Builds a Markdown report from the last N commits at HEAD — shortlog, a prose summary that infers intent and purpose, and an appended unified diff. Use when the user asks for a changelog-style write-up, recent-commit summary, narrative of last N commits, purpose of changes, or a combined diff report in .md format.

## Quickstart

Install this skill with the repository installer:

```bash
npx skills@latest add maccalsa/skills --skill=git-recent-commits-report
```

For a local checkout, run the maintainer linker from the repository root:

```bash
./scripts/link-skills.sh
```

## Source

- [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/skills/engineering/git-recent-commits-report/SKILL.md)
- Bucket: `engineering`

## When to reach for it

Use this skill when the task matches the description above. User-invoked skills should be called directly by name; model-invoked skills can also be loaded automatically by agents that support skill descriptions.

