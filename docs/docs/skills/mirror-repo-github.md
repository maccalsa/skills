# mirror-repo-github

Detaches a local git repository from its current remote, creates a new private GitHub repository with gh, attaches it as origin, sets upstream, and pushes the default branch. Use when mirroring or rehoming a repo to a new GitHub remote, copying a codebase to a fresh repo, or preparing a local clone for issue-to-PR and other gh-automation workflows that expect a writable origin.

## Quickstart

Install this skill with the repository installer:

```bash
npx skills@latest add maccalsa/skills --skill=mirror-repo-github
```

For a local checkout, run the maintainer linker from the repository root:

```bash
./scripts/link-skills.sh
```

## Source

- [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/skills/engineering/mirror-repo-github/SKILL.md)
- Bucket: `engineering`

## When to reach for it

Use this skill when the task matches the description above. User-invoked skills should be called directly by name; model-invoked skills can also be loaded automatically by agents that support skill descriptions.

