# x-dotfiles-script

**Skill package:** `x-dotfiles-script/`

## What it does

Authors or migrates **bash** tools for a personal **x_** dotfiles toolset: naming (`x_<name>`), layout under `stow/scripts/.local/bin/`, `_x_manifest` registration, `chmod`, and optional **GNU stow** into `~/.local/bin`.

## Input

A prompt for a new tool, a pasted script to migrate, or a request to make an existing script install-ready.

## Output

Executable `x_*` scripts, manifest lines, stow/PATH instructions, and (when asked) the exact `stow` command—per rules in the repo’s [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/x-dotfiles-script/SKILL.md) (agent-focused).

## What it won’t do

Place tools under `~/.cursor/skills-cursor/`; drive-by refactors of unrelated scripts; stow into `$HOME` without confirmation when you only asked for file contents.

## How to use it

1. **`@x-dotfiles-script`** in Cursor so the agent loads `SKILL.md`.
2. For **procedures** (new tool, migrate, stow, sidecars), use the [Cookbook](../cookbook/x-dotfiles-script.md).
3. For **copy-paste prompts**, use [Recipes](../recipes/x-dotfiles-script.md).
4. For **worked examples** and troubleshooting, see [`examples.md`](https://github.com/maccalsa/skills/blob/main/x-dotfiles-script/examples.md) in the skill package (kept next to `SKILL.md` for the agent).

## Quickstart

```text
@x-dotfiles-script

New x_ script: [one-line purpose]. Bash. Dotfiles root: $HOME/_dotfiles (or specify).
```

## Combinations

- **create-skill** — if you are evolving this skill’s structure or packaging.

## Full documentation (this site)

| Page | Contents |
|------|----------|
| [Cookbook: x-dotfiles-script](../cookbook/x-dotfiles-script.md) | Step-by-step: new tool, migrate, install-ready, stow/PATH, sidecars, manifest |
| [Recipes: x-dotfiles-script](../recipes/x-dotfiles-script.md) | Copy-paste message templates |

**Agent rules (not duplicated on the site):** [`x-dotfiles-script/SKILL.md`](https://github.com/maccalsa/skills/blob/main/x-dotfiles-script/SKILL.md) in the repository.
