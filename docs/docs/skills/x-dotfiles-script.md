# x-dotfiles-script

Authors or migrates bash tools for the personal dotfiles x_ toolset—naming, layout under stow/scripts, _x_manifest registration, chmod, and optional stow into ~/.local/bin. Human docs and copy-paste prompts live in the repo MkDocs site (docs/docs/skills, cookbook, recipes). Use when the user wants a new x_ script from a prompt, to convert an existing script to x_ style, or to make a script install-ready with stow; when mentioning x_ tools, dotfiles scripts package, or ~/.local/bin PATH.

## Quickstart

Install this skill with the repository installer:

```bash
npx skills@latest add maccalsa/skills --skill=x-dotfiles-script
```

For a local checkout, run the maintainer linker from the repository root:

```bash
./scripts/link-skills.sh
```

## Source

- [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/skills/engineering/x-dotfiles-script/SKILL.md)
- Bucket: `engineering`

## When to reach for it

Use this skill when the task matches the description above. User-invoked skills should be called directly by name; model-invoked skills can also be loaded automatically by agents that support skill descriptions.

