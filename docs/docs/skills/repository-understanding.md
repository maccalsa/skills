# repository-understanding

Deeply analyse a software repository and teach it until the reader holds a working mental model — architecture, domain, runtime paths, black boxes, and a learning roadmap.

## Quickstart

Install this skill with the repository installer:

```bash
npx skills@latest add maccalsa/skills --skill=repository-understanding
```

For a local checkout, run the maintainer linker from the repository root:

```bash
./scripts/link-skills.sh
```

## Source

- [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/skills/engineering/repository-understanding/SKILL.md)
- Bucket: `engineering`

## When to reach for it

Model-invoked: use when someone says “explain this repo”, “explain this codebase”, or “onboard me to this repository”, or otherwise needs a teaching-quality mental model of an unfamiliar system. Output lands in `.scratch/repository-understanding/`. Prefer `/improve-codebase-architecture` when you already understand the system and want deepening opportunities.
