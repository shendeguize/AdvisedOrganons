# Software Engineering Organon

This directory contains the adopted Software Engineering Organon, its rationale and cases. Its managed philosophy retains the reviewed Core 0.1.2 source. A successful format check does not itself authorize philosophical adoption.

[PHILOSOPHY.md](PHILOSOPHY.md) retains Core's commitments and adds a defeasible priority for credible software evolution. [Rationale](rationale/README.md) examines reasons, sources, alternatives and objections. [Constructed cases](docs/cases.md) provide executable examples; the [AgentOrganon architecture case](rationale/architecture-case.md) separately examines actual repository responsibilities. [Chinese text](zh/README.md) corresponds to the English authority.

The philosophy version is **0.2.0**: a new domain commitment is added while the existing Core commitments retain their meaning, force and applicability. `core_version` remains **0.1.2**, identifying the Core worktree text fully considered; `format_version` remains **0.1.0**. The version records the adopted whole; later changes to its meaning or applicability require a specific decision.

The domain priority is an additional value commitment, not a deduction from Self-Transcendence. Its subject is continuing human and agent maintenance, its scope follows credible lifecycle conditions, and it includes withdrawal and migration as well as extension. It gives no technical paradigm automatic priority.

## Read and use

Read the philosophy first for its commitments and limits, then the rationale for their grounds and the cases for bounded executable illustrations. The rationale and cases add no philosophical obligations. The 4.2 priority is conditional on relevant necessary requirements, credible change directions and actual lifecycle expectations; a pattern name does not settle a design choice.

For an operation that selects this Organon as its adopted baseline, explicitly supply this directory's English `PHILOSOPHY.md` and preserve its real directory when delegating. When reviewing a proposed replacement, retain the caller's selected adopted baseline and pass the proposal separately as the review object. The collection root is not a substitute for selecting a domain. A proposed replacement remains an object of review until specifically adopted. Use assess for the relationship to the selected philosophy, principled-review for structural analysis, absorb for proposed philosophical adoption, and wording-review for wording alone. Philosophy management handles document and lock operations.

With the AgentOrganon checkout as the current directory, the managed destination can be checked with:

```sh
rtk proxy node scripts/check.js AdvisedOrganons/SoftwareEngineering/PHILOSOPHY.md
```

That command checks the managed English philosophy and its lock. It does not establish philosophical correctness or authorize adoption. Source checking a separate candidate uses `scripts/check.js --source` with its actual path. The adjacent lock belongs to the managed English document; translated text follows the English metadata and IDs and has no independent adoption state.

Run the isolated examples from this directory:

```sh
rtk proxy node examples/run.mjs
```

This needs Node.js and a C++20 compiler as described in [Cases](docs/cases.md). The runner checks declared example behavior and expected counterexamples; it does not validate the philosophy or establish production maintenance gains. Generated files and execution evidence remain under ignored `examples/.local/`.

## Lean implementation and readers

[Lean delivery](lean/README.md) provides the maintained Lean project, frozen targets, source review, selected evidence, and English and Chinese overviews and line-by-line readers. It keeps this Organon’s adopted Core 0.1.2 baseline. Checking uses an explicitly selected independent OrganonCore runtime; the child contains no duplicate checker.
