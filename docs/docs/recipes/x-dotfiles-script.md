# Recipes: x-dotfiles-script

Copy-paste **user message** templates for Cursor. Replace placeholders in `ALL_CAPS`. Adjust `_dotfiles` path if your repo root is not `$HOME/_dotfiles`.

Conventions: [`SKILL.md`](https://github.com/maccalsa/skills/blob/main/x-dotfiles-script/SKILL.md). Procedures: [Cookbook](../cookbook/x-dotfiles-script.md).

| Section | Use when |
|---------|----------|
| [Greenfield new x tool](#greenfield-new-x-tool) | New script from a spec |
| [Migrate pasted script](#migrate-pasted-script) | Existing script → `x_` style |
| [Install-ready audit](#install-ready-audit) | Manifest + chmod + stow only |
| [Rename or replace](#rename-or-replace-an-existing-x-tool) | Rename `x_*` tool |
| [Bundled sidecar files](#bundled-sidecar-files) | CSS/data beside script |
| [Match style of an existing tool](#match-style-of-an-existing-tool) | Copy patterns from `x_*` |
| [Documentation only](#documentation-only-no-file-writes) | Summarize checklist, no writes |

---

## Greenfield new x tool

Use when you want a **new** bash utility from a short spec.

```text
@x-dotfiles-script Write x_TOOL_NAME: ONE_LINE_PURPOSE.

Requirements:
- Bash, x_ conventions (see skill): header, usage with real binary name x_TOOL_NAME, -h/--help.
- Flags/options: LIST_THEM
- Category for _x_manifest: PICK_OR_SAY_UNCERTAIN

Dotfiles root: $HOME/_dotfiles (or say if different).
```

**Minimal variant**

```text
@x-dotfiles-script New x_ script: PURPOSE_IN_ONE_SENTENCE. Bash only.
```

---

## Migrate pasted script

Use when you already have a script and want it **renamed and install-ready** in the stow package.

```text
@x-dotfiles-script Convert this to an x_ script for my dotfiles scripts package (stow/scripts/.local/bin), manifest + chmod.

Preferred name (optional): x_PREFERRED_NAME

<<< paste script below >>>
```

---

## Install-ready audit

Use when the script **already exists** in the repo and you only need manifest, permissions, and stow.

```text
@x-dotfiles-script x_TOOL_NAME is in my dotfiles repo. Verify _x_manifest entry, chmod +x, and give me the exact stow command. Stow into $HOME only if I confirm.
```

**If you want the agent to run stow**

```text
@x-dotfiles-script x_TOOL_NAME: manifest + permissions OK, then run stow scripts from $HOME/_dotfiles so I can run it from anywhere.
```

---

## Rename or replace an existing x tool

```text
@x-dotfiles-script Rename x_OLD_NAME to x_NEW_NAME in stow/scripts/.local/bin: update file, all usage strings, and _x_manifest; remove stale manifest line. chmod +x.
```

---

## Bundled sidecar files

```text
@x-dotfiles-script Add x_TOOL_NAME that reads FILE_TYPE from beside the script (stow-safe path resolution). Place assets under the scripts package tree. Manifest + chmod + stow notes.
```

---

## Match style of an existing tool

```text
@x-dotfiles-script New x_NEW_TOOL modeled after x_REFERENCE_TOOL in the same package: same shebang/strictness/help style. PURPOSE: ...
```

---

## Documentation only (no file writes)

```text
@x-dotfiles-script Read the skill and summarize the checklist for a new x_ script—no files changed.
```

---

## Placeholder reference

| Placeholder | Meaning |
|-------------|---------|
| `TOOL_NAME` / `x_TOOL_NAME` | Snake_case name after `x_` |
| `ONE_LINE_PURPOSE` | Single-line description for header/manifest |
| `LIST_THEM` | Flags, args, env vars |
| `PICK_OR_SAY_UNCERTAIN` | Manifest category or "pick best fit" |
