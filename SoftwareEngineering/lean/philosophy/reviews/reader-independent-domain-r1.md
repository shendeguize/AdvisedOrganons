# Independent Domain reader review, r1

Verdict: **reader wording revisions required**. Most substantive Domain explanations faithfully retain the checked finite-model meaning. Four findings below concern explanatory precision; no Lean or philosophical-source change is requested. This is an independent review of Domain and related T22–T36 target prose, not self-review of the four Root modules I authored.

The exact production Domain bytes have SHA-256 `ce5653a2950cc7443cefbfe8b9726bd4859228e831ddb7d42601e501ccbfd855`, identical to the previously checked R3 object. The input JSON hashes are EN `c9da0d3e5f67238aad594f687a7e34ac2b45240e9b78708117849c2c8d6c427e` and ZH `19d4683c925bfb4e9d9e679653e0dfcb67ef2eb23b20226d48e329391d727cbf`. Copies of these files, exact source and all four manuscripts were retained under `reader-independent-domain-r1-input/`; its hashes.json and this review JSON identify every byte object. The judgment precedes any reading of another source-reader review conclusion.

## Required corrections

### RD1 (P2): Do not turn failed priority applicability into rejection of the selected design

The positive statement about PriorityConditions is correct, but the contrast can imply that the represented overall selection is rejected. EvolutionPriority is an implication, and DomainSatisfied contains no separate unconditional Meets conjunct. For the actual evolvable profile with unsafeOperations := 1, PriorityConditions is false, EvolutionPriority is true, and DomainSatisfied is provable. The line explanations should expose that conditional limit, not imply an overall safety-rejection theorem.

Correction: Replace the contrast with an explicit statement that the theorem only blocks priority activation; it does not prove rejection by EvolutionPriority or DomainSatisfied. Add that conditional limit at the DomainSatisfied entry. No source or Lean change is requested.

Location: `{"json_files": ["domain-line-explanations-en.json", "domain-line-explanations-zh.json"], "source_lines": [353, 1034, 1035]}`.

### RD2 (P2): insertOrdered has no sorted-input premise

The actual full type is Nat → List Nat → List Nat. There is no sortedness argument, subtype or premise. sortValues recursively supplies its sorted tail to this helper, but that caller-specific role must not be stated as the helper domain.

Correction: Say it takes a natural number and an arbitrary natural-number list; when sortValues calls it with the recursively sorted tail, it performs ordered insertion. Do not imply that the declared type enforces sorted input.

Location: `{"json_files": ["domain-line-explanations-en.json", "domain-line-explanations-zh.json"], "source_lines": [424]}`.

### RD3 (P2): The revision example changes five grounds together, not one at a time

oldState and newState differ simultaneously in forecast, maintenance, maintainers, migrationCost and objectiveCapacity. revisionCases proves all five differences for that same pair. MaterialGroundsChanged is an OR over those fields, but there are no five one-field-at-a-time revision examples in these declarations. The independent Domain L951–957 explanations correctly describe the simultaneous five-field case.

Correction: State that the concrete revision contains all five material differences simultaneously. Separately explain that MaterialGroundsChanged accepts any one listed difference, and that this necessary account condition does not prove each isolated difference substantively justifies every changed choice.

Location: `{"manuscripts": ["lean/philosophy/overview.md:673", "lean/philosophy/details.md:1579", "zh/lean/philosophy/overview.md:673", "zh/lean/philosophy/details.md:1579"], "target": "T35", "source_lines": [889, 890, 891, 892, 894, 895, 951, 953, 954, 955, 956, 957]}`.

### RD4 (P3): Several per-line explanations repeat a block summary instead of the actual line role

The files cover every line, but line-local precision is uneven. L88 is the dispatch over every Change and is explained only as the addition/independent branch; L244 begins objective dispatch over every Burden and is explained only as understanding. L298–301 repeat the same whole departure summary for declaration, match, none and some branches. L710–713 repeat the same whole mutation summary rather than distinguish definition, record update, filter and exclusion predicate. These summaries are mostly true at block scope, but do not meet the requested per-nonempty-line role explanation.

Correction: Correct the two branch-dispatch descriptions and split grouped summaries at substantive lines into their actual local operations, at least the specified match/none/some and record/filter/predicate examples. Preserve concise shared context on the declaration line; do not require arbitrary word variation for comment continuation or other naturally inseparable syntax.

Location: `{"json_files": ["domain-line-explanations-en.json", "domain-line-explanations-zh.json"], "source_lines": [88, 244, 298, 299, 300, 301, 710, 711, 712, 713]}`.

## Meaning checks and actual evidence

- **Activity, participants, tools and knowledge** (Domain L7–166): Read both languages against all actual fields and path constructors. CanChange needs nonempty path, actual participant membership and all step knowledge/tools. ContinuingCapability quantifies over listed participants, so the empty-participant vacuity is real and correctly distinguished from ActivityScope. Probes verify empty participants can satisfy ContinuingCapability while no tools blocks the successor path.
- **Credibility, costs, priority and actual maximum** (Domain L168–418): Open Ground type, separate articulation/support and concrete plan/knowledge/history/other interpretations are disclosed. PriorityConditions retains both candidates Meets, actual continuing capability, 6<17 work and 1<3 complexity. JustifiedDeparture requires a selected burden and a concrete named objective with cost above baseline and capacity. Maximal genuinely supports ten registered directions versus evolvable nine; it exceeds the cost limit. Probe verifies (9,10,true threat). No universal maximum or universal monetary exchange is claimed.
- **State changes, evolution claims, finite and universal contracts** (Domain L420–608,822–864): Read actual transform fields, separate evolutionBehavior, order/retry contracts, independent fixed party dependencies, report comparisons and treatment labels. PreservesFinite has four list samples; retry has six indices. contractPreservation returns its supplied ∀ input scoped equality, while changedObservationNotPreserved applies it to the given witness. Independent proof shows retiredBehavior passes the finite suite but fails universal True-scope preservation at [99]. No universal notification or fixed procedure is asserted.
- **Structural account and actual boundary** (Domain L610–749): Read every evidence-field identity, work sum/count distinction and natural subtraction. Actual edge 2→1 belongs to actual design, both endpoints exist and differ, actual callee compiler/editor work must occur, and caller 2 must have publicContract contractRunner work plus actual finite output preservation. Removing caller check preserves crossing but fails obligation; callee 7 breaks path relation despite actual membership; changed sorted run breaks obligation with same edge/steps. Probe tuple (true,true,false,false,false) confirms these exact objects.
- **Metadata insufficiency and real boundary transformations** (Domain L751–817): Read DesignCanChange and actual EngineeringDesign paths. introduceBoundary adds component/edge and one check to existing paths (private work17→wrapped18). relocateVerification starts from that wrapper but overrides paths using original-step map; only contractRunner component identifiers change, so sameWork remains17 and lacks privateLayout for the successor. The explanations accurately retain actual edge 8→0, nine components, changed path, same observed output, work17=17 and absent capability. Generic new-id freshness is correctly limited to concrete range8 design.
- **Fixed history, changed grounds, retention and current context** (Domain L866–1047): Read independent HistoricalEvidence versus report fields, OR of five material-ground differences, accurate old/current records, predicted3/actual5, all considered-directions criticism coverage, stable choice, retention criteria and revisionFor exact context fields. Account demands material change when choice changes, not sufficiency of each difference. History-tampering and time/choice-only probes all false. failedHistoryNotRewritten is a projection plus simplification for arbitrary history, not log authentication.

Fresh stdin probes use the already built R3 copy whose Domain bytes equal the current production object. The final run exits 0. It checks the untyped sortedness assumption, unsafe-profile conditional-vacuity case, participant/tool conditions, work17/18/17, boundary mutation tuple, maximum9/10 plus cost threat, fixed-history tampering and finite-versus-universal preservation. The first failed attempt is preserved: `#eval decide DomainSatisfied` lacked an inferred Decidable instance. The successful final input instead supplies an explicit proof of that proposition. No proof failure is hidden, and no Lean input file was modified.

The key universal proof bodies were read individually: priorityWhenApplicable applies its adopted implication and projects the same context's complexity inequality; currentSimpleViolates eliminates distinct constructors; oneDimensionDoesNotEntailEveryDimension specializes a universal strict-improvement assumption to addition; contractPreservation is identity on the supplied universal scoped equality; changedObservationNotPreserved applies that equality to its actual witness; contractRevisionObligations eliminates the preservation disjunct under explicit failure; failedHistoryNotRewritten projects the success-equality field for the same independent history. Concrete conjunction proofs retain their finite scope and were not presented as universal empirical claims.

## Retrieval result

Both languages cover exactly the actual 902 nonblank source lines, with zero missing/extra entries, exact rendered JSON text, one anchor per line and an exact full-source fenced block. Each overview target T22–T36 links to the matching target in its own language's details. Each language's 25 Domain declaration links points to an existing line anchor whose actual source line is recorded in `reader-independent-domain-r1-retrieval.json`. These results establish navigation and object identity, not semantic correctness. T35's semantic mismatch persists despite these passing checks.

Source-map comments are traceability metadata. They neither become Lean assumptions nor prove source correspondence. The selected baseline remains SoftwareEngineering 0.2.0 / adopted Core 0.1.2. Previous exact-object R3 build and declaration/axiom audit are reused only for unchanged code; this report freshly reviews Domain reader meaning and does not approve later objects, authored Root prose, all philosophical interpretation, or rendered visual layout.
