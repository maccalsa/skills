# Cookbook: x-dotfiles-script

Step-by-step guides for the [x-dotfiles-script](../skills/x-dotfiles-script.md) skill. Copy-paste prompts: [Recipes](../recipes/x-dotfiles-script.md). Agent rules (naming, bash conventions): [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/x-dotfiles-script/SKILL.md).

---

## Who this is for

| Reader | Use this cookbook to |
|--------|----------------------|
| **You (human)** | Invoke the skill correctly, know what files to expect, and run stow/PATH steps yourself. |
| **Agent** | Follow ordered workflows without skipping manifest, `chmod`, or stow confirmation rules in `SKILL.md`. |

---

## How to load the skill in Cursor

1. **@ mention (recommended):** `@x-dotfiles-script` in Composer or chat so the model loads the skill.
2. **Natural language:** Describe the task using phrases from [Recipes](../recipes/x-dotfiles-script.md) or the skill description (new `x_` script, migrate to dotfiles, stow install-ready).

If the model does not pick up the skill, paste one line from a recipe verbatim.

---

## New `x_` tool from a description

**Goal:** A new executable `x_<name>` in the scripts stow package, indexed in `_x_manifest`.

**Steps**

1. Choose `x_<snake_case>` name (verb_noun or domain-specific); avoid colliding with existing manifest names.
2. Create `stow/scripts/.local/bin/x_<name>` with header `# x_<name> - …`, `usage()` using the real binary name, and `-h` / `--help` where practical.
3. Append one line to `_x_manifest` under the best `## Category` (use **Utilities** if unsure): `x_<name>|Short description (key flags)`.
4. `chmod +x` the script file.
5. Stow from dotfiles root (see [Stow and PATH](#stow-and-path)) when the user wants it live; confirm before writing under `$HOME` if they did not ask.

**Success:** File exists, manifest line present, executable bit set, help text says `x_<name>`.

**Recipe:** [Greenfield template](../recipes/x-dotfiles-script.md#greenfield-new-x-tool)

---

## Migrate an existing script to `x_` style

**Goal:** Rename and normalize a script already living elsewhere or pasted into chat.

**Steps**

1. Rename to `x_<name>`; replace every usage string and comment so the public name is `x_<name>`.
2. Align shebang / `set -euo pipefail` with script complexity (see `SKILL.md`).
3. Fix paths that break under stow; use script-dir resolution for bundled files beside the script.
4. Add or update `_x_manifest`; remove stale names if replacing a tool.
5. `chmod +x`; offer stow if install-now.

**Success:** No leftover old script names in help; manifest matches filename.

**Recipe:** [Migrate pasted script](../recipes/x-dotfiles-script.md#migrate-pasted-script)

---

## Install-ready audit (no new code)

**Goal:** An existing `x_*` in the repo is runnable from anywhere after stow.

**Steps**

1. Confirm file path: `stow/scripts/.local/bin/x_<name>`.
2. Confirm `_x_manifest` contains `x_<name>|…`.
3. `chmod +x` if missing.
4. Run stow (user-approved):

```bash
cd "$HOME/_dotfiles" && stow --dir=stow --target="$HOME" scripts
```

5. Remind: `$HOME/.local/bin` on `PATH` (e.g. `x_install` in same toolset).

**Recipe:** [Install-ready audit](../recipes/x-dotfiles-script.md#install-ready-audit)

---

## Stow and PATH

| Step | Command / note |
|------|----------------|
| Stow scripts package | `cd "$HOME/_dotfiles" && stow --dir=stow --target="$HOME" scripts` |
| Verify symlink | `ls -l "$HOME/.local/bin/x_<name>"` → should point into repo |
| PATH | `export PATH="$HOME/.local/bin:$PATH"` in shell rc, or use `x_install` |

**Dotfiles root** may differ from `$HOME/_dotfiles`; substitute the user’s actual repo root.

---

## Sidecar files (CSS, data next to the script)

**Goal:** Bundled assets resolve correctly when the tool is a symlink.

**Steps**

1. Keep assets under the same stow package tree as the script (e.g. beside `x_foo` under `.local/bin/` or a sibling dir included in the package).
2. In bash, resolve the real directory of the script (`resolve_script_dir` pattern—match neighboring `x_*` tools).
3. Do not assume cwd is the script directory.

**Recipe:** [Bundled files](../recipes/x-dotfiles-script.md#bundled-sidecar-files)

---

## Categories in `_x_manifest`

Use existing sections: Core, Utilities, Docker, Git, SSH, Python, Node, Certs, Project bootstrap. **Utilities** is the default when no section fits.

**Format:** `x_toolname|Short description (flags or behavior)` — one tool per line, no unrelated helpers.

---

## What not to do (quick)

- Do not add tools under `~/.cursor/skills-cursor/`.
- Do not edit STRUCTURE.md / README.md in dotfiles unless the user asks.
- Do not stow into `$HOME` without confirmation when the user only wanted file contents.

Full list: [`SKILL.md` — What not to do](https://github.com/maccalsa/skills/blob/main/x-dotfiles-script/SKILL.md#what-not-to-do).

---

## See also

| Doc | Purpose |
|-----|---------|
| [Skill page](../skills/x-dotfiles-script.md) | Overview, quickstart, links |
| [Recipes](../recipes/x-dotfiles-script.md) | Copy-paste prompt templates |
| [`examples.md` (repo)](https://github.com/maccalsa/skills/blob/main/x-dotfiles-script/examples.md) | Worked examples, troubleshooting, `usage()` patterns |
