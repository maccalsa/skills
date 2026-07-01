---
name: prd-critique
description: Use this skill to review a product requirements document at `prd.md`, identify what is missing or unclear, aggressively challenge weak product thinking, and produce a stronger final PRD
---

# Skill: PRD Critic → `./plans/prd-final.md`

## Purpose

Use this skill to review a product requirements document at `prd.md`, identify what is missing or unclear, aggressively challenge weak product thinking, and produce a stronger final PRD at:

`./plans/prd-final.md`

The output PRD must follow a **Stripe-style PRD shape**:

- concise
- product-first
- sharp scope
- explicit tradeoffs
- minimal fluff
- clear goals / non-goals
- readable by product, design, and engineering

This skill is not for writing implementation details or architecture. It is for improving the **product definition**.

---

## Inputs

Expected input file:

- `./prd.md`

Expected output file:

- `./plans/prd-final.md`

Optional supporting files, if present:

- `./spec.md`
- `./notes.md`
- `./research.md`
- `./context.md`

If supporting files exist, use them only to clarify the product. Do **not** let technical details pollute the PRD.

---

## Core Behavior

The AI must act like a tough, high-quality product reviewer.

It should:

1. read `./prd.md`
2. evaluate the PRD against a Stripe-style PRD template
3. identify weak, missing, vague, contradictory, or over-specified sections
4. **grill the author** on ambiguity and missing product thinking
5. resolve issues where possible from context
6. explicitly mark assumptions where resolution is not possible
7. rewrite the PRD into a polished final version
8. save the result to `./plans/prd-final.md`

The AI should not be passive. It should pressure-test the PRD.

---

## Reviewer Stance

Be skeptical and exacting.

The AI should challenge:

- unclear target users
- vague problem statements
- features without rationale
- scope without prioritization
- goals without success metrics
- non-goals that hide real risks
- solution details masquerading as product requirements
- technical implementation detail included too early
- missing tradeoffs
- ambiguous language such as:
  - "fast"
  - "easy"
  - "robust"
  - "intuitive"
  - "flexible"
  - "good UX"
  - "high quality"
  - "simple"
  - "reliable"

Whenever language is fuzzy, the AI must ask:

- what does this mean operationally?
- how would we know if we achieved it?
- is this a user need, business goal, or implementation preference?
- is this PRD-level or spec-level?

---

## Stripe-Style PRD Target Shape

The final PRD should use this structure.

# [Product Name] — Product Requirements Document (v1)

## 1. Summary

A short description of the product and what it enables.

## 2. Problem

What problem exists today, for whom, and why it matters.

## 3. Users

Primary and secondary users.

## 4. Jobs to Be Done

Concrete user jobs / use cases.

## 5. Goals

What v1 must achieve.

## 6. Non-Goals

What is explicitly out of scope for v1.

## 7. Product Principles

Decision-making principles for the product.

## 8. Core User Experience / Core Features

What the product does from the user perspective.

## 9. Success Metrics

How success will be measured.

## 10. Risks / Tradeoffs

Important risks, constraints, and decisions.

## 11. Open Questions

Only unresolved issues that truly remain open.

## 12. Future Work

Important deferred ideas, clearly outside v1.

---

## Evaluation Rubric

The AI must evaluate the PRD across these dimensions before rewriting it.

### 1. Problem clarity

Check:

- is the problem concrete?
- is the pain real and specific?
- does the PRD explain why the problem matters now?
- is the problem distinct from the proposed solution?

### 2. User clarity

Check:

- are the users clearly identified?
- are primary vs secondary users distinguished?
- is the document trying to serve too many audiences?
- does each major feature map to a user need?

### 3. Scope quality

Check:

- is v1 scope narrow and coherent?
- are non-goals explicit and believable?
- are any "nice to have" items sneaking into v1?
- does the scope imply hidden complexity?

### 4. Requirement quality

Check:

- are requirements stated at the product level?
- are they testable?
- are they overly technical for a PRD?
- do they describe outcomes or implementation?

### 5. Prioritization

Check:

- what is essential vs optional?
- is anything described as critical without justification?
- can the product succeed with a smaller v1?

### 6. Success metrics

Check:

- are there measurable outcomes?
- do metrics reflect user value, not just system activity?
- is there a definition of success for v1?

### 7. Tradeoffs and risks

Check:

- does the PRD acknowledge real risks?
- are key tradeoffs explicit?
- does it overpromise?

### 8. Writing quality

Check:

- is it concise?
- is it repetitive?
- is it bloated with implementation detail?
- does every section help a decision-maker?

---

## What the AI Must "Grill"

Before finalizing, the AI must identify and interrogate weak areas.

Use a section titled:

## PRD Review Notes

Inside it, include:

### Missing

List important missing areas.

### Ambiguous

List statements that are too vague at PRD level.

### Over-specified

List implementation details that belong in a technical spec, not the PRD.

### Contradictions

List scope or logic conflicts.

### Questions the PRD should answer

Write sharp questions such as:

- Who is the primary user for v1?
- What exact failure are we solving?
- Why is this a product requirement rather than an implementation preference?
- What would make us say v1 succeeded?
- Which use case matters most if we can only do one thing well?
- What are we deliberately refusing to do in v1?
- What part of this belongs in the spec instead?

The tone should be direct and demanding, not rude.

---

## Rewrite Rules

When producing `./plans/prd-final.md`, the AI must:

1. preserve the real intent of the source PRD
2. remove implementation details unless they are necessary product constraints
3. sharpen vague language into decision-useful language
4. convert implied assumptions into explicit statements
5. narrow scope where needed
6. keep the final PRD concise
7. prefer strong assertions over hedging
8. keep open questions to a minimum
9. avoid pretending unknowns are resolved
10. keep the output in clean Markdown

If source material is weak or incomplete, the AI should still produce the best possible final PRD and include a brief assumptions section where necessary.

---

## Output Format

The file `./plans/prd-final.md` must contain, in this order:

1. `# [Product Name] — Product Requirements Document (v1)`
2. `## PRD Review Notes`
3. the critique subsections:
   - `### Missing`
   - `### Ambiguous`
   - `### Over-specified`
   - `### Contradictions`
   - `### Questions the PRD should answer`
4. `## Final PRD`
5. the rewritten Stripe-style PRD using the required structure

This allows the file to serve as both:

- a review artifact
- the improved final PRD

---

## Style Rules

- Write in plain English.
- Be crisp, not academic.
- Do not use corporate filler.
- Do not pad sections.
- Do not include architecture diagrams, APIs, class design, or module layout.
- Do not write a technical spec.
- Do not preserve bad structure just because it appeared in the source.
- Do not invent business claims without evidence from context.
- If something is unknown, say it is an assumption.

---

## Heuristics for PRD vs Spec

Keep in the PRD:

- user problem
- user value
- scope
- product behavior
- constraints that materially shape the product
- success criteria
- tradeoffs

Move out of the PRD:

- internal module breakdown
- libraries/framework choices unless product-critical
- crawling/extraction pipeline details
- schema minutiae
- storage format internals
- algorithm details
- implementation sequence

Exception:
If an implementation decision is actually a product constraint, it may stay, but must be framed as a constraint rather than technical design.

Example:

- Bad PRD wording: "Use Playwright to render pages"
- Better PRD wording: "The product must support JS-heavy documentation sites that require runtime rendering"

---

## Failure Handling

If `./prd.md` is missing:

- fail clearly
- explain that the skill expects `./prd.md`

If the PRD is extremely thin:

- produce a review that calls that out directly
- create the best possible `./plans/prd-final.md`
- mark assumptions explicitly

If the PRD is mostly a spec:

- say so
- extract the product thinking
- rewrite into a real PRD

---

## Execution Checklist

1. Read `./prd.md`
2. Read optional supporting files if available
3. Evaluate against the rubric
4. Draft `PRD Review Notes`
5. Rewrite as Stripe-style PRD
6. Save to `./plans/prd-final.md`
7. Ensure the output is Markdown only

---

## Example Output Skeleton

```md
# Example Product — Product Requirements Document (v1)

## PRD Review Notes

### Missing

- Primary user is implied but not stated.
- No success metrics are defined.

### Ambiguous

- "Fast" is undefined.
- "Good output quality" is not measurable.

### Over-specified

- Browser automation framework choice belongs in the spec.
- Internal pipeline details are too low-level for a PRD.

### Contradictions

- The PRD says v1 is narrow, but scope includes multiple advanced workflows.

### Questions the PRD should answer

- Who is the primary user for v1?
- Which workflow matters most?
- What does success look like after launch?
```

```
## Final PRD

## 1. Summary
...

## 2. Problem
...

## 3. Users
...

## 4. Jobs to Be Done
...

## 5. Goals
...

## 6. Non-Goals
...

## 7. Product Principles
...

## 8. Core User Experience / Core Features
...

## 9. Success Metrics
...

## 10. Risks / Tradeoffs
...

## 11. Open Questions
...

## 12. Future Work

```

---

## Final Instruction

- Do not merely "clean up" the PRD.
- Interrogate it.
  -The job is to turn a rough PRD into a decision-grade, Stripe-style PRD that is sharp enough to guide product and engineering without collapsing into a technical spec.
