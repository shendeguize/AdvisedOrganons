# Validation and limits

Use the explicit independent Core command in [README](README.md). It builds the actual Lean project, checks all 59 registered declarations, records complete types and axiom dependencies, and checks all four manuscript views against the unchanged 40-target catalog and exact source bytes.

| Evidence | Role |
| --- | --- |
| [Kernel](philosophy/evidence/kernel.json) | Build and registered declaration results |
| [Complete declaration types](philosophy/evidence/declaration-types.json) | Actual Lean `Expr` values and hashes |
| [Audit](philosophy/evidence/lean-audit.log) | Declarations and axiom dependencies |
| [Execution identity](philosophy/evidence/execution-identity.json) | Loaded tools, inputs and observed runtime |
| [Manuscript check](philosophy/evidence/manuscript-check.json) | Current-source/baseline, exact four-view content and reviewed target bindings |
| [Review history](philosophy/reviews/README.md) | Independent source-first and code-only initial work, later informed judgments and corrections |
| [175 semantic cases](philosophy/reviews/semantic-cases.json) | Reviewed links to actual declarations and bounded interpretations |

The independently audited source review covers all project declarations in addition to the required 59. Reader acceptance requires actual retrieval and explanation of complete conditions and proof steps; nonempty line markers alone do not establish translation accuracy.

The [executable examples](../docs/cases.md) have their own checks:

```sh
rtk proxy node examples/run.mjs
```

Run this from SoftwareEngineering with Node and a C++20 compiler. The runner includes positive executions and expected static-constraint rejections. These demonstrate the declared JavaScript/C++ behavior; the Lean models separately represent specified behavior, requirements, maintenance paths, costs, contracts and revision history. Neither substitutes for measurement in a production system.

A portable acceptance copy contains only SoftwareEngineering and the explicitly selected independent Core runtime, excluding outer management files, private records, previous build caches and compiled Lean objects. It reruns the build, manuscript check and executable examples. The outer managed document/lock check is a separate source-format check and does not become a dependency of that portable Lean delivery.

Selected public evidence remains attached to the current object; rerunning checks writes fresh records without silently replacing it. Historical failures and previous review judgments retain their original scope. Structural integrity, reported acceptance and philosophical correctness are distinct.
