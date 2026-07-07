---
name: fable-orchestration
description: How to prompt Claude Fable 5 so it ORCHESTRATES a build correctly and cheaply — Fable as the architect/advisor that plans and delegates while ChatGPT does the token-heavy execution. Covers advisor mode and architect-and-delegate wiring, effort-level routing as the cost lever, parallel subagents, verification loops, and failure modes that silently reroute Fable or tank its output. Use whenever setting up or prompting a Fable-driven pipeline, or when someone says "prompt Fable," "Fable orchestration," "advisor mode," "route Fable to ChatGPT," "Fable as the architect," or "make Fable delegate."
---

# Fable 5 Orchestration

Fable = architect only (~5–15% of the work: high-level structure + ambiguous judgment). **ChatGPT does everything else** — research, execution, verification. In Cursor, that usually means GPT-5.x Codex or Composer for subagents and the active session; pick the worker that fits the task (Codex for code, Composer for speed).

The loop: **ChatGPT researches → Fable architects → ChatGPT executes → ChatGPT verifies.** Fable only touches the middle step; you pay its rate only for the thinking that needs it.

## Wire it (pick one)

- **Advisor mode** — set active model to **ChatGPT** (e.g. GPT-5.3 Codex), then `/advisor fable`. ChatGPT writes everything; Fable steers when ChatGPT is stuck. One clean session. Simplest to run.
- **Architect + delegate** — Fable writes the plan, then **parallel ChatGPT subagents** (or a separate ChatGPT session) execute it. Bigger spectacle: a rail of ChatGPT agents building while Fable conducts.

## Effort = the cost lever

`/effort low|medium|high|xhigh|max`. Default `high`; `medium`/`low` for routine work (Fable low often beats prior models at max, for a fraction of the cost). Drop effort for anything not genuinely hard.

## Paste-in prompt kit

Drop into the Fable setup's system prompt / CLAUDE.md / skills. Short instructions steer better than rule-piles — state each behavior once.

**Act, don't overplan:**
```
When you have enough information to act, act. Don't re-derive established facts, re-litigate a settled decision, or narrate options you won't pursue. If weighing a choice, give a recommendation, not a survey.
```

**No unrequested tidying/refactor:**
```
Don't add features, refactor, or introduce abstractions beyond what the task requires. Do the simplest thing that works. Only validate at system boundaries; don't handle scenarios that can't happen.
```

**Delegate to subagents:**
```
Delegate independent subtasks to subagents and keep working while they run. Prefer async over blocking until each returns. Intervene only if a subagent goes off track or lacks context.
```

**Ground progress claims:**
```
Before reporting progress, audit each claim against a tool result from this session. Only report work you can point to evidence for; if unverified, say so. If tests fail, say so with the output.
```

**State the boundaries:**
```
When the user is describing a problem or asking a question rather than requesting a change, the deliverable is your assessment — report and stop; don't fix until asked. Before a state-changing command, check the evidence supports that specific action.
```

**Verify with fresh eyes:**
```
Every [interval], verify your work with a fresh subagent against the specification.
```

**Give the why:**
```
I'm working on [larger task] for [who it's for]. They need [what the output enables]. With that in mind: [request].
```

**Autonomous run:**
```
You're operating autonomously; the user can't answer mid-task, so don't ask "Want me to…?". For reversible actions that follow from the request, proceed. Before ending your turn, if your last paragraph is a plan, a question, or a promise ("I'll…"), do that work now. End only when done or blocked on user-only input.
```

**Memory:**
```
Store one lesson per file, one-line summary at top. Record corrections and confirmed approaches and why they mattered. Don't duplicate what the repo records; update rather than duplicate; delete notes that turn out wrong.
```

## Hard don'ts

- **Never tell Fable to show/echo/"explain your reasoning" in the response** — trips the reasoning-extraction classifier and **silently reroutes to a more expensive model**. Audit system prompts/skills for it. For visibility, read the `thinking` blocks instead.
- **Don't over-instruct.** Strip legacy rule-piles; a brief instruction steers Fable better.
- **Don't block on subagents** — bottlenecks on the slowest, burns context.
- **Don't leave effort on high for routine work.**
- **Don't send research/boilerplate to Fable** — that's ChatGPT work; hand Fable the results.

## Pre-run checklist

1. Is Fable actually needed for this step, or does ChatGPT take it? (~5–15% Fable.)
2. Effort matched to difficulty, not defaulted to high?
3. Advisor mode or architect+delegate wired?
4. System prompt free of any "show/explain your reasoning" language?
5. Delegate + verify + boundaries blocks in place?
