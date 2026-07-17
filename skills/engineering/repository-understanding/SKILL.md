---
name: repository-understanding
description: Deeply analyse a software repository and teach it until the reader holds a working mental model — architecture, domain, runtime paths, black boxes, and a learning roadmap. Use when the user says "explain this repo", "explain this codebase", "onboard me to this repository", or wants a teaching-quality mental model of an unfamiliar system.
argument-hint: "Optional focus: module, flow, or question"
---

# Repository Understanding

Reverse-engineer an unfamiliar codebase and **teach** it to an experienced engineer who has never seen this repo. Optimise for understanding, not brevity. The deliverable is a **mental model**, captured as a teaching book under `.scratch/repository-understanding/`.

Assume the reader knows the language/framework and knows none of *this* system.

## Leading words

- **Mental model** — what a productive senior would carry after onboarding: purpose, shape, flows, danger zones, next learning steps.
- **Teach order** — always Intent → Concept → Architecture → Behaviour → Implementation → Code. Ideas before files.
- **Evidence ladder** — label every non-trivial claim as **fact** (cited in-repo), **inference** (reasoned from facts), or **unknown** (insufficient evidence). Never invent intent.
- **Black box** — a large, independent subsystem deferred with purpose, consumers, complexity, and a future deep-dive pointer — so first-pass understanding stays tractable.
- **Four questions** — every important concept answers What / Why / How / When (do I care).

## Workspace

Write the book into `.scratch/repository-understanding/` (create it). Persist progress so multi-session work can resume:

| Path | Role |
|------|------|
| `README.md` | Map of chapters + learning roadmap status |
| `00-executive-summary.md` | One-page senior-joiner brief |
| `NN-<slug>.md` | Chapters per [BOOK-FORMAT.md](BOOK-FORMAT.md) |
| `known-unknowns.md` | Living list of unknowns |
| `black-boxes.md` | Deferred subsystems |
| `glossary.md` | Domain + technical terms in plain language |
| `NOTES.md` | Working scratchpad (focus, open questions) |

If the user names a focus (module, flow, question), bias discovery toward it but still produce the executive summary and architecture spine first.

## Process

Complete phases in order. Completion criteria and checklists live in [PHASES.md](PHASES.md). Chapter templates live in [BOOK-FORMAT.md](BOOK-FORMAT.md).

1. **Discover** — purpose, type, languages, frameworks, build, modules, generated code, infra, tests, deploy. Write a short overview into `NOTES.md`.
2. **Executive summary** — one page a senior could read tomorrow morning (`00-executive-summary.md`).
3. **Architecture + layout** — style, trade-offs, drift; explain *why* major folders/modules exist (not a directory dump).
4. **Domain** — entities, rules, actors, external systems in business language. Use `/domain-modeling` when sharpening glossary terms or ADRs helps; otherwise keep teaching in `glossary.md`.
5. **Runtime + request paths** — startup lifecycle; walk representative paths (HTTP, jobs, events, CLI…) hop-by-hop with *why each hop exists*. Prefer Mermaid when it cuts load.
6. **Data, persistence, integrations** — movement, stores, migrations, external systems (direction, failure, retries).
7. **Build, config, security, tests** — teach the unfamiliar; highlight dangerous/sensitive spots.
8. **Patterns, interesting code, debt** — patterns with problem/trade-off; slow-walk framework magic; objective risk hotspots.
9. **Black boxes + roadmap** — defer overwhelm; recommend learn order; list deep-dive invitations.
10. **Definition of done** — quiz against the [core questions](#definition-of-done). Gaps → continue teaching or schedule a deep dive.

**Session hygiene.** This work often exceeds one smart context window. Finish a coherent chapter, update `README.md`, then `/handoff` rather than compacting mid-phase. Resume from the book + `NOTES.md`.

**Diagrams.** Mermaid only when it lowers cognitive load. Co-locate under the chapter that needs them.

**Examples.** Prefer real paths, configs, and snippets from *this* repo over generic prose.

## Collaborating skills

- `/research` — background dig into primary docs/frameworks when the repo alone is thin.
- `/domain-modeling` — sharpen overloaded domain language into `CONTEXT.md` / ADRs when the project already uses that layout.
- `/codebase-design` — deep-module vocabulary when explaining seams and interfaces.
- `/handoff` — carry the teaching book across sessions.

## Definition of done

Stop only when a senior engineer could become productive without a human walkthrough, and can answer:

1. What does this system do, and why does it exist?
2. How is it structured, and where do requests/data enter and flow?
3. Where live business rules, key abstractions, and safe-to-ignore areas?
4. What is dangerous to change, and how would I debug production?
5. Where would I add a feature or fix a bug, and what should I learn next?

Every major concept in the book answers the four questions. Unknowns are explicit. Independent bulk is black-boxed, not dumped.
