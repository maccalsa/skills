---
name: x-dotfiles-script
description: Authors or migrates bash tools for the personal dotfiles x_ toolset—naming, layout under stow/scripts, _x_manifest registration, chmod, and optional stow into ~/.local/bin. Human docs and copy-paste prompts live in the repo MkDocs site (docs/docs/skills, cookbook, recipes). Use when the user wants a new x_ script from a prompt, to convert an existing script to x_ style, or to make a script install-ready with stow; when mentioning x_ tools, dotfiles scripts package, or ~/.local/bin PATH.
---

# x_ dotfiles scripts

Personal bash utilities live in the **scripts** stow package: tools are executable files named `x_<something>` under `stow/scripts/.local/bin/`, indexed by [`_x_manifest`](examples.md#paths-convention), and discovered via the [`x_`](examples.md#paths-convention) launcher.

**Dotfiles root** is assumed to be `$HOME/_dotfiles` (adjust if the user’s repo path differs).

## Documentation map

| Doc | Use it for |
|-----|------------|
| **This file ([SKILL.md](SKILL.md))** | Authoritative rules: naming, bash conventions, workflows, install checklist, what not to do. |
| **[examples.md](examples.md)** | Worked examples, troubleshooting, `usage()` patterns, related tools (`x_`, `x_install`). |

**Quick start:** `@x-dotfiles-script` in chat, then either follow a [recipe](recipes.md) or describe the task in plain language (see cookbook [How to load the skill](cookbook.md#how-to-load-the-skill-in-cursor)).

## When this skill applies

1. **Greenfield**: User describes what a new tool should do → produce an `x_`-style script plus manifest line (and companion files if needed).
2. **Migration**: User pastes or points to an existing script → refactor to `x_` conventions, rename to `x_<name>`, fix usage strings and help.
3. **Install-ready**: Ensure manifest, permissions, and document stow; optionally run stow for the user if they want installation now.

---

## Naming and layout

| Item | Rule |
|------|------|
| Tool filename | `x_<snake_case>` (e.g. `x_md2pdf`, `x_docker_compose`) |
| Header comment | `# x_<name> - <one-line description>` |
| Usage / examples | Always use the **real** binary name (`x_foo`), never a generic name like `mytool` or `script.sh` |
| Package path | `$HOME/_dotfiles/stow/scripts/.local/bin/x_<name>` |
| Index | One line in `_x_manifest` in the appropriate `## Category` section |
| Symlink resolution | If the script loads files beside itself (CSS, data), use `resolve_script_dir`-style logic so stow symlinks resolve correctly |

**Categories in `_x_manifest`**: Core, Utilities, Docker, Git, SSH, Python, Node, Certs, Project bootstrap—pick the best fit; use **Utilities** when unsure.

**Format**: `x_toolname|Short description (flags or behavior)` — keep the pipe description concise (see existing lines).

**Do not** add unrelated helpers to `_x_manifest` (only user-facing `x_*` tools).

---

## Script conventions (bash)

**Shebang and strictness**

- Prefer `#!/usr/bin/env bash` with `set -euo pipefail` for non-trivial scripts (error-sensitive, many variables).
- Simpler tools may use `#!/bin/bash` without `set -u` if that matches neighboring scripts—stay consistent within the file.

**Help**

- Support `--help` and `-h` where practical.
- `usage()` should print `Usage: x_<name> ...` and examples using `x_<name>`.
- For tools with subcommands or long options, follow patterns like `x_mkdocs_init` / `x_publish_docs`.

**Errors**

- Send errors to stderr (`>&2`); use clear `Error: ...` messages.
- Prefer `command -v` checks with actionable messages; **do not** silently `npm install -g` or mutate system state unless the user explicitly asks for that behavior.

**Shared helpers**

- Optional shared bash: `_common.sh`, `_phoenix.sh`, etc.—source only when the tool genuinely shares logic with existing code.

---

## Workflow: new script from a prompt

1. Infer a short **snake_case** name (`x_<verb>_<noun>` or domain-specific).
2. Implement the script in `stow/scripts/.local/bin/x_<name>` with header, `usage`, and main logic.
3. Add **`_x_manifest`** line under the right category.
4. Set executable bit: `chmod +x stow/scripts/.local/bin/x_<name>`.
5. Remind: tools are invoked via **`PATH`** containing `$HOME/.local/bin`; stow creates symlinks—running from the repo dir requires `./x_<name>` unless PATH is set.
6. If the user asks to install now → **Stow** (below).

---

## Workflow: convert existing script

1. Rename to `x_<name>` if not already.
2. Replace all usage strings and comments so the **public name** is `x_<name>`.
3. Align shebang/strict mode with complexity; add `--help`/`-h` if missing.
4. Remove or relocate hard-coded paths that break under stow; use script-dir resolution for bundled assets.
5. Add or update **`_x_manifest`** entry; remove stale references if renaming.
6. `chmod +x` if needed.
7. Offer **stow** if they want it live in `~/.local/bin`.

---

## Installation checklist (ready for use)

- [ ] File exists at `stow/scripts/.local/bin/x_<name>`
- [ ] `chmod +x` on the script
- [ ] `_x_manifest` contains `x_<name>|...`
- [ ] Any sidecar files (e.g. `.css`) live under the same package tree so stow links them
- [ ] User runs stow from dotfiles root:

```bash
cd "$HOME/_dotfiles" && stow --dir=stow --target="$HOME" scripts
```

- [ ] `$HOME/.local/bin` on `PATH` (e.g. existing `x_install` in the same toolset)

**Optional “install now”**: After files are written and manifest updated, run the `stow` command above (requires write access to `$HOME`). Do not stow without user confirmation if they only asked for the file content.

---

## What not to do

- Do not place new tools under `~/.cursor/skills-cursor/` (reserved).
- Do not edit **STRUCTURE.md** or **README.md** unless the user asks (optional docs).
- Avoid drive-by refactors of unrelated `x_*` scripts.

---

## Additional examples

See [examples.md](examples.md) for prompts, before/after snippets, and stow/PATH notes. For procedures and copy-paste prompts, see the [MkDocs cookbook](../docs/docs/cookbook/x-dotfiles-script.md) and [recipes](../docs/docs/recipes/x-dotfiles-script.md).
