# setup-agent-skills

Configure a repository for these engineering skills by recording its issue tracker, triage label vocabulary, and domain documentation layout. Run once before first use of the issue and architecture workflows.

## Quickstart

Install this skill with the repository installer:

```bash
npx skills@latest add maccalsa/skills --skill=setup-agent-skills
```

For a local checkout, run the maintainer linker from the repository root:

```bash
./scripts/link-skills.sh
```

## Source

- [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/skills/engineering/setup-agent-skills/SKILL.md)
- Bucket: `engineering`

## When to reach for it

Use this skill when the task matches the description above. User-invoked skills should be called directly by name; model-invoked skills can also be loaded automatically by agents that support skill descriptions.

## Attribution

This skill is adapted from [Matt Pocock's skills repository](https://github.com/mattpocock/skills), with local edits where needed.

