# Skills catalog

Active skills are grouped the same way they are stored in the repo. Deprecated and in-progress skills are kept in the source tree but intentionally excluded from this catalog.

## Engineering

- [ask-skills](ask-skills.md) - Ask which skill or flow fits your situation. A router over the skills in this repo.
- [branch-diff-code-review](branch-diff-code-review.md) - Reviews a branch or PR diff against its base and writes concise, attachable, human-sounding code review comments. Use when the user asks to review a branch, PR, current changes, or a diff against main/master/base, especially when they want markdown comments with file paths, line numbers, risks, bugs, missing tests, or reviewer-ready feedback.
- [code-review](code-review.md) - Review the changes since a fixed point (commit, branch, tag, or merge-base) along two axes — Standards (does the code follow this repo's documented coding standards?) and Spec (does the code match what the originating issue/PRD asked for?). Runs both reviews in parallel sub-agents and reports them side by side. Use when the user wants to review a branch, a PR, work-in-progress changes, or asks to "review since X".
- [codebase-design](codebase-design.md) - Shared vocabulary for designing deep modules. Use when the user wants to design or improve a module's interface, find deepening opportunities, decide where a seam goes, make code more testable or AI-navigable, or when another skill needs the deep-module vocabulary.
- [diagnosing-bugs](diagnosing-bugs.md) - Diagnosis loop for hard bugs and performance regressions. Use when the user says "diagnose"/"debug this", or reports something broken/throwing/failing/slow.
- [domain-modeling](domain-modeling.md) - Build and sharpen a project's domain model. Use when the user wants to pin down domain terminology or a ubiquitous language, record an architectural decision, or when another skill needs to maintain the domain model.
- [git-recent-commits-report](git-recent-commits-report.md) - Builds a Markdown report from the last N commits at HEAD — shortlog, a prose summary that infers intent and purpose, and an appended unified diff. Use when the user asks for a changelog-style write-up, recent-commit summary, narrative of last N commits, purpose of changes, or a combined diff report in .md format.
- [grill-with-docs](grill-with-docs.md) - A relentless interview to sharpen a plan or design, which also creates docs (ADR's and glossary) as we go.
- [implement](implement.md) - Implement a piece of work based on a spec or set of tickets.
- [improve-codebase-architecture](improve-codebase-architecture.md) - Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whichever one you pick.
- [karpathy-guidelines](karpathy-guidelines.md) - Behavioral guidelines to reduce common LLM coding mistakes. Use when writing, reviewing, or refactoring code to avoid overcomplication, make surgical changes, surface assumptions, and define verifiable success criteria.
- [mirror-repo-github](mirror-repo-github.md) - Detaches a local git repository from its current remote, creates a new private GitHub repository with gh, attaches it as origin, sets upstream, and pushes the default branch. Use when mirroring or rehoming a repo to a new GitHub remote, copying a codebase to a fresh repo, or preparing a local clone for issue-to-PR and other gh-automation workflows that expect a writable origin.
- [neon-postgres](neon-postgres.md) - Guides and best practices for working with Neon Serverless Postgres. Covers getting started, local development with Neon, choosing a connection method, Neon features, authentication (@neondatabase/auth), PostgREST-style data API (@neondatabase/neon-js), Neon CLI, and Neon's Platform API/SDKs. Use for any Neon-related questions.
- [neon-postgres-egress-optimizer](neon-postgres-egress-optimizer.md) - Diagnose and fix excessive Postgres egress (network data transfer) in a codebase. Use when a user mentions high database bills, unexpected data transfer costs, network transfer charges, egress spikes, "why is my Neon bill so high", "database costs jumped", SELECT * optimization, query overfetching, reduce Neon costs, optimize database usage, or wants to reduce data sent from their database to their application. Also use when reviewing query patterns for cost efficiency, even if the user doesn't explicitly mention egress or data transfer.
- [prototype](prototype.md) - Build a throwaway prototype to answer a design question. Use when the user wants to sanity-check whether a state model or logic feels right, or explore what a UI should look like.
- [repository-understanding](repository-understanding.md) - Deeply analyse a software repository and teach it until the reader holds a working mental model — architecture, domain, runtime paths, black boxes, and a learning roadmap.
- [research](research.md) - Investigate a question against high-trust primary sources and capture the findings as a Markdown file in the repo. Use when the user wants a topic researched, docs or API facts gathered, or reading legwork delegated to a background agent.
- [resolving-merge-conflicts](resolving-merge-conflicts.md) - Use when you need to resolve an in-progress git merge/rebase conflict.
- [setup-agent-skills](setup-agent-skills.md) - Configure a repository for these engineering skills by recording its issue tracker, triage label vocabulary, and domain documentation layout. Run once before first use of the issue and architecture workflows.
- [tdd](tdd.md) - Test-driven development. Use when the user wants to build features or fix bugs test-first, mentions "red-green-refactor", or wants integration tests.
- [to-tickets](to-tickets.md) - Break a plan, spec, or the current conversation into a set of tracer-bullet tickets, each declaring its blocking edges, published to the configured tracker.
- [to-spec](to-spec.md) - Turn the current conversation into a spec and publish it to the project issue tracker — no interview, just synthesis of what you've already discussed.
- [triage](triage.md) - Move issues and external PRs through a state machine of triage roles — categorise, verify, grill if needed, and write agent-ready briefs.
- [wayfinder](wayfinder.md) - Plan a huge chunk of work — more than one agent session can hold — as a shared map of decision tickets on your issue tracker, and resolve them one at a time until the way to the destination is clear.
- [x-dotfiles-script](x-dotfiles-script.md) - Authors or migrates bash tools for the personal dotfiles x_ toolset—naming, layout under stow/scripts, _x_manifest registration, chmod, and optional stow into ~/.local/bin. Human docs and copy-paste prompts live in the repo MkDocs site (docs/docs/skills, cookbook, recipes). Use when the user wants a new x_ script from a prompt, to convert an existing script to x_ style, or to make a script install-ready with stow; when mentioning x_ tools, dotfiles scripts package, or ~/.local/bin PATH.

## Productivity

- [caveman](caveman.md) - Ultra-compressed communication mode. Cuts token usage ~75% by dropping filler, articles, and pleasantries while keeping full technical accuracy. Use when user says "caveman mode", "talk like caveman", "use caveman", "less tokens", "be brief", or invokes /caveman.
- [fable-orchestration](fable-orchestration.md) - How to prompt Claude Fable 5 so it ORCHESTRATES a build correctly and cheaply — Fable as the architect/advisor that plans and delegates while ChatGPT does the token-heavy execution. Use whenever setting up or prompting a Fable-driven pipeline, or when someone says "prompt Fable," "Fable orchestration," "advisor mode," or "make Fable delegate."
- [frontend-design](frontend-design.md) - Guidance for distinctive, intentional visual design when building new UI or reshaping an existing one. Helps with aesthetic direction, typography, and making choices that don't read as templated defaults.
- [grill-me](grill-me.md) - A relentless interview to sharpen a plan or design.
- [grilling](grilling.md) - Grill the user relentlessly about a plan, decision, or idea. Use when the user wants to stress-test their thinking, or uses any 'grill' trigger phrases.
- [handoff](handoff.md) - Compact the current conversation into a handoff document for another agent to pick up.
- [teach](teach.md) - Teach the user a new skill or concept, within this workspace.
- [write-a-skill](write-a-skill.md) - Create new agent skills with proper structure, progressive disclosure, and bundled resources. Use when user wants to create, write, or build a new skill.
- [write-like-me](write-like-me.md) - Rewrites text to sound direct, practical, and human by removing AI polish, corporate phrasing, over-explaining, empty balance, and unnatural symmetry—without faking typos or inventing facts. Use when the user says sound less AI, un-AI this, write like me, more natural, sound human, less corporate, rewrite in my style, or like something I would send.
- [writing-great-skills](writing-great-skills.md) - Reference for writing and editing skills well — the vocabulary and principles that make a skill predictable.
- [zoom-out](zoom-out.md) - Tell the agent to zoom out and give broader context or a higher-level perspective. Use when you're unfamiliar with a section of code or need to understand how it fits into the bigger picture.

## Personal

- [edit-article](edit-article.md) - Edit and improve articles by restructuring sections, improving clarity, and tightening prose. Use when user wants to edit, revise, or improve an article draft.
