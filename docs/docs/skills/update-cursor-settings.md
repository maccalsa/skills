# update-cursor-settings

**Skill package:** `skills-cursor/update-cursor-settings/`

## What it does

Edits **Cursor** user `settings.json` (VS Code–compatible) with minimal diff.

## Input

Desired change (font, tab size, format on save, theme, autosave, etc.); path is OS-specific.

## Output

Updated JSON (with comments preserved when possible); note if reload needed.

## What it won’t do

By default, workspace `.vscode/settings.json`—skill focuses on **user** settings unless you ask otherwise.

## How to use it

Agent reads `~/.config/Cursor/User/settings.json` on Linux; merges only requested keys; validates JSON.

## Examples

1. “Font size 15.”
2. `editor.formatOnSave: true`.
3. “Default Dark Modern” theme.

## Combinations

- **create-rule** — project conventions vs editor prefs.

## Quickstart

```text
@update-cursor-settings — Set tab size 2, format on save true, word wrap on. Linux.
```
