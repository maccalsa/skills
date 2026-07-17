# Analysis phases

Run in order. Each phase has a **completion criterion** — checkable, not vibes. Write into the book as you go; do not hoard findings until the end.

## Phase 1 — Repository discovery

Determine: purpose, repo/application type, languages, frameworks, build + package managers, modules (mono vs single), generated code, infra, docs, tests, deploy/CI, containers, cloud, external services.

**Done when:** `NOTES.md` has a concise overview covering each bullet above (or marks it unknown).

## Phase 2 — Executive summary

One-page brief for a senior joining tomorrow: purpose, stack, architecture, domain, major components, runtime, persistence, integrations.

**Done when:** `00-executive-summary.md` exists and a stranger could orient in five minutes.

## Phase 3 — Architecture

Name the style (layered, hexagonal, clean, DDD, CQRS, services, monolith, event-driven, plugin, pipeline, MVC, …). Explain fitness, trade-offs, and drift if the code no longer matches the intended style.

**Done when:** architecture chapter states style + rationale + trade-offs with evidence citations (paths, configs).

## Phase 4 — Repository layout

For each major module: purpose, responsibilities, dependencies, consumers, complexity, importance. Skip trivial folders.

**Done when:** every first-class module has that six-field treatment; no bare directory listings.

## Phase 5 — Domain discovery

Entities, aggregates/value concepts, business rules, users/actors, external systems — in business language, not only class names.

**Done when:** `glossary.md` covers the core nouns/verbs a non-engineer stakeholder would recognise, each mapped to code anchors.

## Phase 6 — Runtime behaviour

Startup, config load, DI/bootstrapping, DB init, cache, messaging, scheduling, authn/z, logging/metrics, errors, shutdown. Sequence diagrams where they clarify.

**Done when:** runtime chapter walks cold-start → ready → shutdown with evidence.

## Phase 7 — Request lifecycle

Pick representative paths (REST, GraphQL, CLI, Kafka/Rabbit, cron/job, WebSocket, batch…). For each: every important hop and why it exists.

**Done when:** ≥1 primary happy path is hop-complete; other entry types are listed or black-boxed with reason.

## Phase 8 — Data flow

Inputs → validation → transform → persistence → cache/events → outputs. Mermaid when it helps.

**Done when:** data-flow chapter covers the primary path end-to-end.

## Phase 9 — Persistence

Technology, ORM/repos, transactions, schema/relationships, migrations, caching, consistency model — and *why* this shape.

**Done when:** persistence chapter answers where state lives and how it evolves.

## Phase 10 — External systems

For each integration: purpose, direction, protocol, failure/retry/timeout/fallback.

**Done when:** every observed integration is listed; unknowns called out.

## Phase 11 — Build system

Tooling, tasks, plugins, codegen/annotation processing — taught, not assumed.

**Done when:** a newcomer could run build/test from the chapter alone.

## Phase 12 — Configuration

Sources, profiles, secrets, precedence, config-as-code entry points.

**Done when:** precedence order is explicit; secret-handling called out.

## Phase 13 — Security

Authn/z, identity, roles/permissions, sessions/tokens, CSRF/CORS, secrets, encryption. Flag sensitive code paths.

**Done when:** security chapter names the trust boundaries and enforcement points.

## Phase 14 — Testing

Layers (unit/integration/contract/acceptance), fixtures, philosophy, gaps.

**Done when:** testing chapter states what confidence each layer buys.

## Phase 15 — Design patterns

Name patterns with: problem solved, why chosen, trade-offs — tied to this repo.

**Done when:** major recurring patterns are covered (skip pattern-spotting theatre).

## Phase 16 — Interesting code

Slow-walk reflection, proxies, custom annotations, codegen, coroutines/reactive, DSLs, framework magic. Stranger ⇒ more explanation.

**Done when:** the sharpest “how does this even work?” spots have a patient walkthrough.

## Phase 17 — Dependency graph

Module dependencies; coupling, cycles, shared libs, boundaries. Diagram if it clarifies.

**Done when:** hot coupling and cycles (if any) are named with evidence.

## Phase 18 — Technical debt

Hotspots, god objects, duplication, hidden coupling, legacy fragility — risks, objective tone.

**Done when:** top risks are prioritised with *why it hurts*.

## Phase 19 — Black boxes

For each deferred subsystem: purpose, responsibilities, dependencies, consumers, complexity, reason deferred, suggested deep dive. See book format.

**Done when:** `black-boxes.md` lists every deliberately skipped bulk area.

## Phase 20 — Learning roadmap

Ordered path: summary → domain → architecture → runtime → primary request flow → persistence → … → black boxes.

**Done when:** `README.md` roadmap matches the book and points to deep-dive invitations.
