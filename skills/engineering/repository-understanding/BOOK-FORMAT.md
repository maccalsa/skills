# Book format

Emit a teaching book under `.scratch/repository-understanding/`. Prefer many focused chapter files over one giant doc.

## Chapter set

Number files so order is obvious. Skip a chapter only when the system truly lacks that concern — note the skip in `README.md`.

| File | Chapter |
|------|---------|
| `README.md` | Map + learning roadmap + deep-dive index |
| `00-executive-summary.md` | Executive summary |
| `01-system-overview.md` | System overview |
| `02-architecture.md` | Architecture |
| `03-repository-structure.md` | Repository structure |
| `04-domain-model.md` | Domain model |
| `05-runtime-behaviour.md` | Runtime behaviour |
| `06-request-lifecycle.md` | Request lifecycle |
| `07-data-flow.md` | Data flow |
| `08-persistence.md` | Persistence |
| `09-messaging.md` | Messaging (if any) |
| `10-security.md` | Security |
| `11-configuration.md` | Configuration |
| `12-build-system.md` | Build system |
| `13-deployment.md` | Deployment |
| `14-testing.md` | Testing |
| `15-external-dependencies.md` | External dependencies |
| `16-design-patterns.md` | Design patterns |
| `17-interesting-code.md` | Interesting code |
| `18-technical-debt.md` | Technical debt |
| `black-boxes.md` | Black boxes |
| `glossary.md` | Glossary |
| `known-unknowns.md` | Known unknowns |
| `appendix.md` | Appendix (tables, command cheatsheets) |

## Section template (reuse inside chapters)

For each major component or subsystem:

### \<Name\>

**What:** …

**Why:** …

**How:** … (teach order: concept before code; cite paths)

**When to care:** …

**Complexity:** Very Easy | Easy | Moderate | Advanced | Expert — one-line why.

**Evidence:** fact / inference / unknown — with paths or “insufficient evidence”.

**Possible deep dives:** …

## Black-box entry template

```markdown
## <Name>

- **Purpose:**
- **Responsibilities:**
- **Dependencies:**
- **Consumers:**
- **Complexity:**
- **Why black-boxed now:**
- **Suggested deep dive:**
```

## Evidence voice

- **Fact:** “`UserService` is registered in `AppConfig` (`src/…`).”
- **Inference:** “Likely a ports-and-adapters boundary because … (facts A, B).”
- **Unknown:** “Insufficient evidence was found in the repository.”

## Diagrams

Fenced Mermaid inside the chapter that needs them. Caption with what question the diagram answers.
