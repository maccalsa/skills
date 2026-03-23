---
name: design-an-interface
description: Generates multiple radically different interface designs for a module using parallel Task sub-agents, then compares trade-offs in prose. Use when the user wants to design an API, explore interface options, compare module shapes, or mentions "design it twice" or parallel design exploration.
---

# Design an interface

Based on "Design It Twice" from *A Philosophy of Software Design*: the first idea is unlikely to be the best. Generate multiple radically different designs, then compare.

## Workflow

### 1. Gather requirements

Before designing, understand:

- [ ] What problem does this module solve?
- [ ] Who are the callers? (other modules, external users, tests)
- [ ] What are the key operations?
- [ ] Any constraints? (performance, compatibility, existing patterns)
- [ ] What should be hidden inside vs exposed?

Ask: "What does this module need to do? Who will use it?"

### 2. Generate designs (parallel sub-agents)

Spawn **3 or more** Task sub-agents **in one message** (same turn). Each must produce a **radically different** approach—not small tweaks.

Use the Task tool with `subagent_type` appropriate to the codebase (often `generalPurpose` or `explore`). Assign a **different** guiding constraint to each agent so outputs diverge.

**Prompt template for each sub-agent:**

```text
Design an interface for: [module description]

Requirements: [gathered requirements]

Constraints for this design: [pick one per agent]
- Agent 1: Minimize method count—aim for 1–3 methods max
- Agent 2: Maximize flexibility—support many use cases
- Agent 3: Optimize for the most common case
- Agent 4: Take inspiration from [specific paradigm/library]

Output format:
1. Interface signature (types/methods)
2. Usage example (how caller uses it)
3. What this design hides internally
4. Trade-offs of this approach
```

Do **not** implement code; interface shape and rationale only.

### 3. Present designs

Show each design with:

1. **Interface signature** — types, methods, parameters
2. **Usage examples** — how callers use it in practice
3. **What it hides** — complexity kept internal

Present designs **one after another** so the user can absorb each before comparison.

### 4. Compare designs

After all designs are shown, compare in **prose** (not tables) on:

- **Interface simplicity**: fewer methods, simpler parameters
- **General-purpose vs specialized**: flexibility vs focus
- **Implementation efficiency**: does the shape allow efficient internals?
- **Depth**: small interface hiding significant complexity (good) vs large interface with thin implementation (bad)
- **Ease of correct use** vs **ease of misuse**

Highlight where designs diverge most.

### 5. Synthesize

The best outcome often blends insights from several options. Ask:

- Which design best fits the primary use case?
- Any elements from other designs worth incorporating?

## Evaluation criteria

From *A Philosophy of Software Design*:

- **Interface simplicity**: Fewer methods and simpler parameters are easier to learn and use correctly.
- **General-purpose**: Can handle future use cases without changes—avoid over-generalization.
- **Implementation efficiency**: Does the interface allow an efficient implementation, or force awkward internals?
- **Depth**: Prefer a small interface that hides substantial complexity (deep module). Avoid a large interface over a thin implementation (shallow module).

## Anti-patterns

- Sub-agents producing **similar** designs—enforce radical difference via distinct constraints per agent.
- Skipping **comparison**—the value is in contrast.
- **Implementing**—this skill is interface shape and trade-offs only.
- Judging primarily by **implementation effort** rather than caller experience and module depth.
