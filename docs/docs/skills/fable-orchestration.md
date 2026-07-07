# fable-orchestration

How to prompt Claude Fable 5 so it ORCHESTRATES a build correctly and cheaply — Fable as the architect/advisor that plans and delegates while ChatGPT does the token-heavy execution.

## Quickstart

Install this skill with the repository installer:

```bash
npx skills@latest add maccalsa/skills --skill=fable-orchestration
```

For a local checkout, run the maintainer linker from the repository root:

```bash
./scripts/link-skills.sh
```

## Source

- [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/skills/productivity/fable-orchestration/SKILL.md)
- Bucket: `productivity`

## When to reach for it

Use when setting up or prompting a Fable-driven pipeline — advisor mode, architect-and-delegate, effort routing, or paste-in prompt blocks for autonomous orchestration. User-invoked skills should be called directly by name; model-invoked skills can also be loaded automatically by agents that support skill descriptions.
