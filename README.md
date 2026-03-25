# Cursor skills

This repository holds **Cursor agent skills**—reusable `SKILL.md` workflows for implementation, planning, triage, Neon Postgres, and more.

## Documentation

Published docs (MkDocs + Material) are built from the `docs/` directory by **GitHub Actions** (`.github/workflows/docs.yml`) and deployed to **GitHub Pages**.

**Live site:** [https://maccalsa.github.io/skills/](https://maccalsa.github.io/skills/)

**One-time setup (repo admin):** **Settings → Pages → Build and deployment → Source:** choose **GitHub Actions** (not “Deploy from a branch”). The workflow uploads the built `site/` artifact; you do not need a `gh-pages` branch.

To preview locally:

```bash
cd docs
pip install -r requirements.txt
mkdocs serve
```

## Layout

| Path | Purpose |
|------|---------|
| `docs/` | MkDocs site source (canonical documentation) |
| `*/SKILL.md` | Skill definitions used with `@mention` in Cursor |
| `.github/workflows/` | CI (e.g. docs deploy to `gh-pages`) |
