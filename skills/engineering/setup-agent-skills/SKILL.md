---
name: setup-agent-skills
description: Configure a repository for these engineering skills by recording its issue tracker, triage label vocabulary, and domain documentation layout. Run once before first use of the issue and architecture workflows.
disable-model-invocation: true
---

# Setup Agent Skills

Scaffold the per-repo configuration that the engineering skills assume:

- **Issue tracker** - where issues live (GitHub by default; GitLab, local markdown, and other trackers are also supported)
- **Triage labels** - the strings used for the five canonical triage roles
- **Domain docs** - where `CONTEXT.md` and ADRs live, and how skills should consume them

This is a prompt-driven skill, not a deterministic script. Explore the repository, present what you found, confirm with the user, then write.

## Process

### 1. Explore

Look at the current repo before asking the user to choose:

- `git remote -v` and `.git/config` - is this a GitHub, GitLab, or local-only repo?
- `AGENTS.md` and `CLAUDE.md` at the repo root - does either exist, and is there already an `## Agent skills` section?
- `CONTEXT.md`, `CONTEXT-MAP.md`, `docs/adr/`, and any package-level ADR directories
- `docs/agents/` - does prior setup output already exist?
- `.scratch/` - sign that local markdown issues are already in use

### 2. Ask for decisions one at a time

Summarise what exists and what is missing. Then ask for these decisions one by one, explaining the default before each question:

1. **Issue tracker** - GitHub, GitLab, local markdown, or another workflow the user describes.
2. **External PR triage** - for GitHub or GitLab only, ask whether external PRs should be treated as request surfaces.
3. **Triage label vocabulary** - map `needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, and `wontfix` to the repo's real labels.
4. **Domain docs layout** - single `CONTEXT.md` plus `docs/adr/`, or a `CONTEXT-MAP.md` that points to multiple contexts.

### 3. Confirm and edit

Show a draft of:

- The `## Agent skills` block for `CLAUDE.md` or `AGENTS.md`
- `docs/agents/issue-tracker.md`
- `docs/agents/triage-labels.md`
- `docs/agents/domain.md`

Let the user edit the draft before writing.

### 4. Write

Edit the existing agent guidance file if present:

- If `CLAUDE.md` exists, edit it.
- Else if `AGENTS.md` exists, edit it.
- If neither exists, ask the user which one to create.

Update an existing `## Agent skills` block in place rather than appending a duplicate.

Use the templates bundled with this skill as starting points:

- [issue-tracker-github.md](./issue-tracker-github.md)
- [issue-tracker-gitlab.md](./issue-tracker-gitlab.md)
- [issue-tracker-local.md](./issue-tracker-local.md)
- [triage-labels.md](./triage-labels.md)
- [domain.md](./domain.md)

### 5. Done

Tell the user which files were written and which engineering skills now read them. Mention that `docs/agents/*.md` can be edited directly later; re-run setup only when the repo's tracker or domain-doc layout changes.

## Attribution

Adapted from Matt Pocock's `setup-agent-skills` workflow for this repo's AI-agnostic setup flow.
