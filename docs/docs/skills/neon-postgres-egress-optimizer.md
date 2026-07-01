# neon-postgres-egress-optimizer

Diagnose and fix excessive Postgres egress (network data transfer) in a codebase. Use when a user mentions high database bills, unexpected data transfer costs, network transfer charges, egress spikes, "why is my Neon bill so high", "database costs jumped", SELECT * optimization, query overfetching, reduce Neon costs, optimize database usage, or wants to reduce data sent from their database to their application. Also use when reviewing query patterns for cost efficiency, even if the user doesn't explicitly mention egress or data transfer.

## Quickstart

Install this skill with the repository installer:

```bash
npx skills@latest add maccalsa/skills --skill=neon-postgres-egress-optimizer
```

For a local checkout, run the maintainer linker from the repository root:

```bash
./scripts/link-skills.sh
```

## Source

- [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/skills/engineering/neon-postgres-egress-optimizer/SKILL.md)
- Bucket: `engineering`

## When to reach for it

Use this skill when the task matches the description above. User-invoked skills should be called directly by name; model-invoked skills can also be loaded automatically by agents that support skill descriptions.

