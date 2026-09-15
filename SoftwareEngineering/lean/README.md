# Software Engineering Lean implementation and readers

The English [philosophy](../PHILOSOPHY.md) is authoritative. This delivery uses SoftwareEngineering **0.2.1**, which retains the adopted Core **0.1.2** text. The current OrganonCore checking runtime does not change that adoption.

| Reader | English | Chinese |
| --- | --- | --- |
| Claims, premises and limits | [Overview](philosophy/overview.md) | [速览](../zh/lean/philosophy/overview.md) |
| Complete code and every nonblank line | [Details](philosophy/details.md) | [逐行详解](../zh/lean/philosophy/details.md) |

The [frozen catalog](philosophy/targets.json) retains 40 targets and 175 prescribed semantic cases, covering all 47 substantive source paragraphs. Two empty headings remain structural entries. The 59 registered declarations include normative interfaces, conditional results and checked cases. Specifications express duties; checking their definitions does not establish fulfillment. The joint witness fulfills the complete represented inherited and domain interfaces in one concrete context. The strong countermodel fulfills the complete represented inherited interface while the additional domain priority genuinely applies but is not adopted; temporary lifecycle and cost exceptions do not discharge that target.

These are bounded mathematical results and reviewed source correspondences. They do not prove universal philosophical correctness, empirical engineering outcomes or the merits of every value choice. [Review records](philosophy/reviews/README.md) retain independent initial judgments, failures, corrections and later comparisons. [Validation](VALIDATION.md) identifies checks and their limits.

## Explicit runtime dependency

This directory owns its [Lean sources](philosophy/leanified/CoreReader.lean), manifests, readers and selected evidence. It contains no duplicate checker. Use an independently obtained OrganonCore checkout with its two Lean skills and runtime. No outer AgentOrganon checkout is needed for Lean checking or the local examples.

With Node >=22, RTK and installed Lean `v4.33.1`, supply the actual paths to both directories:

```sh
organon_core=/absolute/path/to/OrganonCore
software_engineering=/absolute/path/to/SoftwareEngineering
rtk proxy node "$organon_core/skills/organon-core-leanify-prove/scripts/check.js" "$software_engineering/lean/philosophy" --manuscript manuscript.json
```

Omit `--manuscript manuscript.json` to check the frozen source, build, declarations, full types and dependencies alone. Manuscript checking also binds the current source and adopted baseline, four views, exact excerpts and code, source review, target inventory and reported states. Its `semantic_status: not_evaluated` is intentional: the checker checks evidence consistency, not semantic correctness or reviewer independence. `proof_targets.complete` means the frozen target completion conditions were met for the reported reviewed objects; it does not mean complete formalization of every source sentence.

The code uses Lean's installed standard library, without Mathlib or automatic downloads. Dependencies such as `propext`, `Classical.choice` and `Quot.sound` are disclosed in the [actual audit](philosophy/evidence/lean-audit.log); there are no project-declared axioms or `sorry` proofs.

## Maintenance

The stable `philosophy/` location names the current object, not an immutable approval. Before replacement, preserve the full reference closure, including the Chinese readers outside the run directory, and replay the old object from a separate copy. Source hashes, code, complete declaration types, reviews and manuscripts must continue to identify the same objects. A source or interpretation change requires a newly reviewed object; unchanged version metadata is insufficient.

Retain failed, limited, incomplete, inapplicable and stale judgments with their reasons. Reuse exact unchanged material only after checking its identity and disclosing that reuse. Synchronize English and Chinese at both granularities after affected changes. Private iteration records and historical objects stay in the owning workspace's ignored `.local/`; public checking and ordinary copies do not depend on them.

New execution receipts under ignored `philosophy/evidence/checks/` record loaded tool bytes and observed runtime versions. They do not approve the tool or retroactively add execution identity to earlier records. [Source context](philosophy/SOURCE-CONTEXT.md) explains the frozen source's relative links.
