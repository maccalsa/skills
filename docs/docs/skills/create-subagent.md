# create-subagent

**Skill package:** `skills-cursor/create-subagent/`

## What it does

Defines **custom subagents** as `.md` in `.cursor/agents/` or `~/.cursor/agents/` with YAML frontmatter + system prompt body.

## Input

Name, description (when to delegate), focused behavior; project vs user scope.

## Output

`name.md` with `name` + `description`; body = instructions for the subagent; the skill file itself may use `disable-model-invocation` separately from subagent files.

## What it won’t do

Replace Skills—subagents are delegated workers with isolated context.

## How to use it

Pick scope; write detailed description with trigger terms; test with “Use subagent X to …”.

## Examples

1. `code-reviewer.md` — post-change review.
2. `debugger.md` — RCA workflow.
3. Project agents in repo for team sharing.

## Combinations

- **design-an-interface** / **improve-codebase-architecture** — use Task/subagents for parallel designs; custom subagents for repeated roles.

## Quickstart

```text
@create-subagent — Project agent: API contract reviewer. Invoked after OpenAPI changes. Put in .cursor/agents/.
```
