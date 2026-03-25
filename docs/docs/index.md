# Cursor Agent Skills

This site is the **canonical documentation** for agent skills published from the `docs/` tree: catalog pages, per-skill reference, recipes, and a short cookbook.

In Cursor, `@mention` a skill so the agent loads the project’s **`SKILL.md`** implementation (often colocated with this repo under `skills/<name>/` or `skills-cursor/<name>/`).

## What you will find

| Section | Purpose |
|--------|---------|
| [Getting started](getting-started.md) | Invoke skills, `@mention` patterns, workflow diagram |
| [Skills → Catalog](skills/index.md) | Grouped index + links to **one page per skill** |
| [Recipe: calendar refresh](recipes/end-to-end-flow.md) | Long-form, copy-paste multi-thread flow |
| [Cookbook](cookbook/quick-examples.md) | Short prompts (API slice, triage, Neon, PR, etc.) |

## Deployed docs

Built with [MkDocs](https://www.mkdocs.org/) and [Material](https://squidfunk.github.io/mkdocs-material/). Pushes to `main` that touch `docs/` or `.github/workflows/docs.yml` deploy to **GitHub Pages**.

## Local preview

```bash
cd docs
python -m pip install -r requirements.txt
mkdocs serve
```

Open the URL shown in the terminal (often `http://127.0.0.1:8000`).
