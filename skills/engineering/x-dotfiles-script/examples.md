# Examples: x-dotfiles-script skill

Worked examples and patterns. Paths assume `$HOME/_dotfiles` as the dotfiles repository root.

**Navigation:** [SKILL.md](SKILL.md) (agent rules) · [MkDocs skill page](../docs/docs/skills/x-dotfiles-script.md) · [Cookbook](../docs/docs/cookbook/x-dotfiles-script.md) · [Recipes](../docs/docs/recipes/x-dotfiles-script.md) · [Published site](https://maccalsa.github.io/skills/skills/x-dotfiles-script/)

## Paths (convention)

| Role | Path |
|------|------|
| Stow package root | `$HOME/_dotfiles/stow/scripts/` |
| Binaries and helpers | `$HOME/_dotfiles/stow/scripts/.local/bin/` |
| Tool index | `$HOME/_dotfiles/stow/scripts/.local/bin/_x_manifest` |
| Launcher | `$HOME/_dotfiles/stow/scripts/.local/bin/x_` |

After stow, symlinks appear as `$HOME/.local/bin/x_<name>` → repo file.

---

## How to use this skill in Cursor

**Option A — @ mention (recommended)**  
In Composer or chat, include the skill so the model loads it:

```text
@x-dotfiles-script Add a script that ...
```

**Option B — Describe the workflow**  
Phrases that should trigger the skill (if `@` is not used):

- “Add a new **x_** script that …”
- “Convert this script to **x_** style for my dotfiles.”
- “Make this **install-ready** under `stow/scripts` and **stow** it.”

---

## Example 1 — Greenfield prompt (new tool)

**User message:**

```text
@x-dotfiles-script Write x_clip_hist: read clipboard history from a file and print the last N entries.
Flags: --file ~/.cache/clip.txt, --count 10, --help. Bash only.
```

**Expected agent actions:**

1. Create `$HOME/_dotfiles/stow/scripts/.local/bin/x_clip_hist` with:
   - `#!/usr/bin/env bash`, `set -euo pipefail` (or justified simpler mode)
   - `# x_clip_hist - ...`
   - `usage()` showing `Usage: x_clip_hist ...` and examples using `x_clip_hist`
   - `-h` / `--help`
2. Add manifest line, e.g. under `## Utilities`:
   - `x_clip_hist|Clipboard log: last N lines (--file, --count)`
3. `chmod +x` the new file
4. Tell user to run stow (and offer to run it if they want install now)

---

## Example 2 — Convert existing script

**User message:**

```text
@x-dotfiles-script Convert this to an x_ script and put it in my dotfiles scripts package.

#!/bin/bash
# backup-notes
tar czf ~/notes-backup.tgz ~/Notes
```

**Expected agent actions:**

1. Choose name: e.g. `x_notes_backup` (verb_noun, `x_` prefix).
2. Rewrite header to `# x_notes_backup - Tar-gzip Notes dir to a backup file`
3. Expand `usage()` with `Usage: x_notes_backup ...`, optional `-o` for output path, `--help`
4. Save as `stow/scripts/.local/bin/x_notes_backup`
5. Add `_x_manifest` line (e.g. under `## Utilities` or `## Core`)
6. `chmod +x`

---

## Example 3 — Install-ready + stow

**User message:**

```text
x_md2pdf is in the repo; make sure manifest and permissions are good and stow scripts so I can run it from anywhere.
```

**Expected agent actions:**

1. Verify manifest entry and `chmod +x`
2. Run:
   ```bash
   cd "$HOME/_dotfiles" && stow --dir=stow --target="$HOME" scripts
   ```
3. Remind: `export PATH="$HOME/.local/bin:$PATH"` if needed (or `x_install`)

---

## Example 4 — What “x_ style” means (quick checklist)

| Check | OK |
|-------|-----|
| Filename is `x_<name>` | ✓ |
| Help says `x_<name>`, not `backup-notes` or `md2pdf` | ✓ |
| `--help` / `-h` where appropriate | ✓ |
| Line in `_x_manifest` | ✓ |
| Executable bit | ✓ |
| Stow command documented or executed | ✓ |

---

## Example 5 — Minimal usage block (pattern)

```bash
usage() {
    cat <<'EOF'
Usage: x_my_tool [OPTIONS] [ARGS]

  One-line description.

Examples:
  x_my_tool
  x_my_tool --verbose ./data
EOF
    exit 0
}

case "${1:-}" in
    -h|--help) usage ;;
    # ...
esac
```

Long-option style (larger tools):

```bash
usage() {
  cat <<'EOF'
Usage:
  x_my_tool --required PATH [--optional VAL]

Options:
  --required   ...
  --help, -h   Show this help.
EOF
}
```

---

## Troubleshooting

| Symptom | Cause | Fix |
|---------|--------|-----|
| `command not found: x_foo` from repo dir | Current directory not on `PATH` | Use `./x_foo` or stow + `$HOME/.local/bin` on `PATH` |
| `command not found` after stow | PATH | Add `export PATH="$HOME/.local/bin:$PATH"` to shell rc or run `x_install` |
| Script finds wrong file | Symlink + relative path | Use `resolve_script_dir` for files beside the script |

---

## Related tools in the same repo

- `x_` — lists all tools (`x_` with no args); `x_ x_md2pdf` runs help for one tool
- `x_install` — adds `~/.local/bin` to shell config PATH
