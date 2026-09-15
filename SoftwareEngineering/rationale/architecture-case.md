# Actual repository case: AgentOrganon responsibilities

This account examines the AgentOrganon worktree read on 2026-09-12. Its fixed
philosophical baseline was Core 0.1.2; the software engineering priorities were
additional review premises. The proposed domain philosophy was not substituted
for that baseline. This is source-based structural reasoning, separate from the
[constructed executable cases](../docs/cases.md) and the repeated skill study. It reports
neither a completed restructuring nor measured maintenance gains.

## The decision and the observed boundaries

The question is whether fewer entrypoints or more shared machinery would help
continuing human and agent maintainers preserve, change and retire this system.
The relevant change directions include downstream philosophical revision,
different operation callers, and handoff between maintainers. A proposed new
host or format remains conditional; this case invents no demand for either.

Repository paths below are relative to the AgentOrganon checkout:

- `skills/organon-assess`, `skills/organon-principled-review` and
  `skills/organon-absorb` select
  the caller's philosophy through `scripts/resolve.js`, then pass its path and
  real reference directory into the relevant Core method. The shared resolver
  already exists in `scripts/lib/operations.js`; repeated instructions are not
  three implementations of the same algorithm.
- Core assess owns the current philosophical relationship judgment. Core
  principled-review returns structural findings under identified standards.
  Core absorb examines reasons for adoption and coordinates its authorized
  workflow. A structural preference does not itself establish philosophical
  conflict, and compatibility does not itself warrant adoption.
- `skills/organon-wording-review` delegates wording review without first
  selecting a philosophy. A shared preflight that always demanded one would
  lose this existing behavior.
- `skills/organon-philosophy` coordinates deterministic document management
  with philosophical review. `scripts/lib/sections.js` parses stable units;
  `scripts/lib/lock.js` defines and validates source checkpoints and declined-state
  records; `scripts/lib/operations.js` compares and binds inputs;
  `scripts/lib/io.js` handles protected paths and recoverable paired
  writes. These checks cannot certify the meaning or authorization of adoption.

These boundaries separate questions and failure conditions. They do not prove
that the present files or number of entrypoints are necessary. A format change
would still cross parsing, checkpoints, operations and their shared contract;
layering does not make that migration independent or free.

## Alternatives under the same objectives

| Alternative | Reason to consider it | Cost, condition and present judgment |
| --- | --- | --- |
| Retain the allocation | Current relationship, structural analysis, adoption and file operations can change under distinct responsibilities. | Repeated instructions and context handoffs remain maintenance costs. Retention is justified provisionally, without declaring the layout final. |
| Share routing material | A common account of the existing resolver could reduce inconsistent instructions when selection rules change. | Another resolver would duplicate existing machinery; a semantic router also needs task selection rules. Preserve wording-only behavior and explicit-path failure. Fewer paragraphs alone do not establish a benefit. |
| Partially combine assess and full review | A common working context could reduce rediscovery where a broad assessment needs structural analysis. | Preserve narrow assessment and the difference between a method finding and a philosophical conflict. Both distinctions could survive a single file; a file boundary is not their proof. No observed duplication rate establishes a gain here. |
| Pass workspace context directly to Core | A caller that already selects its philosophy can use Core's existing explicit-path contract. | Moving automatic workspace discovery into Core changes its defaults and dependencies. A textual host contract and an executable dependency have different costs; neither is required merely to remove a wrapper. |
| Make handoff material more explicit | A successor could more readily recover the baseline, object, grounds, candidate, authority and next responsible action. | Existing six-part records already cover much of this. Added material can become stale or repeat authoritative sources. Start from a demonstrated omission or a concrete prospective change with clear grounds, rather than requiring a new bundle for every task. |

The provisional recommendation is to retain the main responsibilities while
examining concrete handoff failures or prospective changes with clear grounds
before selecting a structural revision. For example, an actual lost baseline could support a narrower handoff
correction; a shorter transcript alone would not. Conversely, a combined method
that preserves the relevant distinctions with less successor effort would count
against retaining the current organization. Neither result is assumed here.

## What this case supports

Stable unit identities, source checkpoints, remembered declines and recovery
state create present complexity for concrete future operations: moving or
removing text, reconsidering an upstream proposal, and recovering from an interrupted
write. That is a reason to examine what a simplification preserves before
removing these mechanisms. It is not evidence that all existing complexity pays
for itself.

The source locations above and the checkout's `rtk proxy node --test` suite make
the mechanical claims inspectable. The tests cover their declared file behavior;
they do not compare successor effort, agent judgment or philosophical efficacy.
Independent assessment and the repeated skill study are recorded separately.
This source-based account does not establish their outcomes. New failures can
justify a revision, with its changed grounds identified.
