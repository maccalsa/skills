# Maccalsa Skills

[![skills.sh](https://skills.sh/b/maccalsa/skills)](https://skills.sh/maccalsa/skills)

AI-agnostic agent skills for engineering workflows, codebase design, debugging, Neon Postgres, dotfiles tooling, and writing style, and frontend design.

This repo follows the small, composable structure of [Matt Pocock's skills](https://github.com/mattpocock/skills), with local skills retained where they cover personal infrastructure or domain-specific work. The MkDocs site remains the human-facing reference.

## Quickstart

```bash
npx skills@latest add maccalsa/skills
```

Pick the skills and target agents you want. Include `/setup-agent-skills` for repositories that will use issue, triage, PRD, or domain-documentation workflows.

Install one skill:

```bash
npx skills@latest add maccalsa/skills --skill=tdd
```

## Local development

```bash
./scripts/list-skills.sh
./scripts/link-skills.sh
```

`link-skills.sh` links active skills into `~/.claude/skills` and `~/.agents/skills` by default. Override destinations with `SKILLS_DESTS`:

```bash
SKILLS_DESTS="$HOME/.cursor/skills:$HOME/.agents/skills" ./scripts/link-skills.sh
```

## Layout

| Path | Purpose |
| --- | --- |
| `skills/engineering/` | Coding, issues, architecture, debugging, and repo operations |
| `skills/productivity/` | Conversation, writing, handoff, and skill-authoring workflows |
| `skills/personal/` | Author-specific skills |
| `skills/misc/` | Stable utilities outside the main flows |
| `skills/in-progress/` | Draft skills excluded from install metadata |
| `skills/deprecated/` | Retired or superseded skills retained for reference |
| `docs/` | MkDocs site source |
| `scripts/` | Maintainer helpers |

## Documentation

Live site: [https://maccalsa.github.io/skills/](https://maccalsa.github.io/skills/)

Preview locally:

```bash
cd docs
pip install -r requirements.txt
mkdocs serve
```

Build strictly:

```bash
cd docs
mkdocs build --strict
```

## Replacing an old Cursor checkout

If the old repo is checked out at `~/.cursor/skilss` or `~/.cursor/skills`, move it aside and install this repo:

```bash
mv ~/.cursor/skills ~/.cursor/skills.backup 2>/dev/null || true
npx skills@latest add maccalsa/skills
```

For a local checkout instead of installer-managed copies:

```bash
git clone https://github.com/maccalsa/skills ~/dev/skills
cd ~/dev/skills
SKILLS_DESTS="$HOME/.cursor/skills" ./scripts/link-skills.sh
```
