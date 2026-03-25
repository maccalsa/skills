# Cursor skills

This repository holds **Cursor agent skills**—reusable `SKILL.md` workflows for implementation, planning, triage, Neon Postgres, and more.

## Documentation

Published docs (MkDocs + Material) are built from the `docs/` directory and deployed to **GitHub Pages** when changes land on `main`.

**Live site:** [https://maccalsa.github.io/skills/](https://maccalsa.github.io/skills/)

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
