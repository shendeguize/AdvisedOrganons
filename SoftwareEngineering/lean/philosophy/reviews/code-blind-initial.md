# Initial blind explanation of the supplied Lean project

Stage: **code only; source fidelity unevaluated**. This artifact was prepared before receiving any source prose, source inventory, author explanation, intended verdict, or previous review. The only inspected materials were this isolated project and the requested technical translation skill. Identifier names and embedded strings are treated as code, not as independent evidence that their labels describe reality. No proof inputs were changed.

The project contains 786 explicit substantive declarations, including 269 theorems. `CoreReader.lean` imports `Engineering.Integration`, whose transitive imports reach all twelve modules. The installed Lean reports 4.33.1. The project builds; every explicit declaration was checked with `#check @...` and audited with `#print axioms ...`. The exact elaborated types, with implicit arguments made explicit and full names enabled, are in `declaration-axiom-audit.log`; the corresponding locations are in `declarations.json`. Audited dependencies are either empty or subsets of `propext`, `Quot.sound`, and `Classical.choice`. No `sorryAx` or additional domain axiom appears. This establishes acceptance of these code statements under those foundations; it does not validate their interpretation or any external observations.

The main text explains declaration groups. The appended exact-source inventory gives every declaration its original line interval and exact code, including proofs. Read a group's explanations together with those excerpts and the full-type log. No source-claim IDs or philosophical baseline are invented.

## 1. Logical domains and foundational interfaces

`Claim W` is `W → Prop`; `Theory W` is `(W → Prop) → Prop`, a predicate determining which claims belong to the theory. `Models t w` universally quantifies over **all** claims selected by `t` and requires each to hold at that same `w`. `Entails t p` universally quantifies over worlds satisfying `t`; `Satisfiable t` supplies an actual witness world. These are semantic definitions, not a syntax of derivations or a list of measured facts. `W`, `Q`, and the other explicit generic domains in this project are Lean `Type` (universe zero), not implicit declarations that a concrete physical world exists. The full audit makes every generic binder visible; no unmentioned domain-specific typeclass premise is supplied to these interfaces.

`Context W Q` supplies another theory, a meaning for each question, and a scope predicate. `Admissible t c w` conjoins membership in the models of the held theory, membership in the models of the context assumptions, and scope, all for the same world. `Consequence` says every admissible world satisfies either the question's meaning or its negation according to a Boolean polarity. `Consistent` forbids having both polarities for any question. `consequenceConsistency` **assumes** an admissible witness and rules out a contradiction at that witness. It does not derive that witness from consistency. When `Q` is empty, consistency is vacuous even for an unsatisfiable theory; a checked supplemental probe demonstrates this. If admissible worlds are absent and there is a question, both consequences hold vacuously and this consistency predicate fails.

`singleton p` contains exactly the claim equal to `p`; `union` is disjunction of membership. `modelsSingleton` and `modelsUnion` unpack those definitions. The Boolean and Boolean-pair examples distinguish individually satisfiable premises from their inconsistent conjunction, opposite time slices from their inconsistent union, and changes of assumptions, question meaning, and scope. Empty Boolean theory has both worlds as models and entails neither `w = true` nor its negation. The two inequalities `4 ≤ n` and `n ≤ 6` overlap at 5 without being identical predicates. These are explicit countermodels and witnesses, not empirical discoveries.

`Snapshot` records held theory, context, and a natural-number revision identity. `SameContent` compares theory membership and all meanings/scopes extensionally. `TruthfulReport a b reported` is only the implication `(content differs OR revision number differs) → reported = true`. It does not require `reported = false` when unchanged, prove that reported content is true, or verify a textual account. `semanticChangeMustBeReported` is direct application of this assumed implication. The hidden-change examples refute a false flag for concrete differing snapshots. Reordering a two-member union preserves its membership predicate.

## 2. Evidence, articulation, values, and choice

A `Record W` is a Boolean function on candidate worlds paired with a stipulated observed Boolean. `Compatible records w` requires every listed test to equal its recorded result at `w`. `Supports records claim` requires the claim at **every compatible world**. Neither definition verifies how the records were acquired. With no records, compatibility is true for every world; with contradictory records, support is vacuous. `FacetDischarged` deliberately strengthens the raw support interface: an empirical facet needs a witness satisfying both compatibility and scope, support for `scope → conclusion`, and support for the uncertainty predicate. An inferential facet needs satisfiable assumptions and their semantic entailment of the conclusion. A value facet needs `ValueProcedure`. Empirical uncertainty is an arbitrary proposition on worlds; it is not a probability, error bar, confidence level, or statistical guarantee unless additional code gives that meaning.

An `Articulation` holds concept strings, a theory, reason predicates, and a limit predicate. `Articulated` checks only that the concept and reason lists are nonempty; it does not require nonempty individual strings or explanatory quality. `FacetArticulated` ties assumptions, reasons, and limits to the same facet by equality. Canonical articulations build those equalities by construction: empirical reasons are the single compatibility predicate, inference reasons are the single model predicate, and value reasons specialize all reasons to the adopted position. The canonical theorems establish these structural ties and nonemptiness, not independent evidential support.

`ValuePosition W` contains its own `Position` and `Outcome` types. The adopted position is fixed across worlds; `selected w` is the world-dependent position. `commitment w` is the equality `selected w = adopted`. Its `consequence w` is the stipulated objective on `outcome w adopted` together with the stipulated constraints on that same adopted position. `JointAdoption` supplies one world satisfying starting assumptions, limits, adoption, and **all** reasons jointly. `ValueProcedure` requires a nonempty reasons list, that witness, a universal conditional from starting assumptions, limits, and **all** reasons to the consequence, and a nonempty response string at each in-scope world where criticism is relevant. It does not say that all worlds adopt the position, that the adopted objective is obligatory, that every listed reason separately suffices, that criticism exists, that a response addresses it adequately, or that a different objective is illegitimate. The universal consequence condition does not even assume the commitment; it concerns the consequences of the fixed adopted option under its stated premises.

`Grounds` additionally requires a nonempty facet list, inclusion of every facet selected by the supplied `actualApplicable` predicate, and the same claim, articulation, and discharge conditions for every listed facet. The applicability predicate itself is supplied, not discovered. `AchievementAccountability`, `ProcessGrounds`, and `ApplicationDuties` are bundles of these requirements; projection theorems extract the already-assumed requirements.

The switch value example selects true, gets benefit 4 at cost 3, and uses the objective cost < benefit and budget 3. Its opposite adopted value produces (0,0), so it fails that **same** strict objective. Empty reasons, inconsistent starting assumptions, impossible joint adoption, and missing criticism responses are separately rejected. A nonempty announcement that says “activate” leaves a zero-budget world admissible and does not justify the cost. In `jointReasonPosition`, benefit 4 and cost ≤3 must hold jointly; the counterworlds (4,5) and (0,3) show why either reason alone is insufficient.

The `zeroRecord` examples have world type `Nat → Bool`, not a finite set of observations equated with all possible functions. The record observes only input 0. The always-true function and the function true only at 0 are compatible, but differ at 1. Consequently the observation supports the local conclusion and does not support `∀ n, f n = true`. The generated-revision structures bind producer, prior output, and revised output by construction, yet their ownership does not change this countermodel. Repeated copies of the first-coordinate record leave the second coordinate undetermined; repeated action records leave the budget undetermined. These are concrete demonstrations of insufficiency within the selected model class.

`Trial` verification is recorded outcome = actual outcome, reproduction is equality of settings only, and boundedness is actual outcome ≤2. The explicit examples separate these three predicates; reproduction does not mean reproducing the result. `randomTrial012` later assigns equal positive integer weights to two Boolean draws; no random sampler or probability measure is implemented.

`Process` has a total `Nat → Nat` output and an optional tiny program (`doubleInput` or a constant). `OutputContract` universally requires doubling every natural input. `ExplanationContract` requires a present program whose evaluation equals that output everywhere. The output-only process doubles but has no program; the explained process has `.doubleInput`. A process assessment's assumption theory is exactly `candidate = assessed`. `processContractDischarged assessed contract proof` substitutes that identity and returns the **supplied** proof of `contract assessed`. It verifies the same process and contract, not a newly established measurement or independent capability. The external certificate carries unequal natural-number IDs 42 and 7 plus a proof of the same doubling output; it does not model independence beyond unequal labels or establish that a real external review occurred.

`Choice.Implementation` carries output, cost, domain, explanation and trace functions plus status metadata. `Requirements` supplies input scope, expected output, budget, and which method reasons are valued. `Feasible` requires scoped output correctness and cost ≤ budget. `Relevant` rejects every status reason by definition; a method reason needs both its stipulated value and its actual associated content. `JustifiedChoice` requires feasibility and **at least one** relevant reason in the supplied list. It does not require all reasons to be relevant, compare all alternatives, optimize cost, or establish every explanation/procedure condition. A cheap but incorrect successor has a relevant simplicity reason but fails feasibility. Identity is feasible and can be justified even when conventional and established. The same output can coexist with a wrong explanation; the separate explanation reason then fails. Status facts, true for both candidate worlds, do not entail choosing identity. An accurate non-entailment report and an actual choice justified only by status are separate objects: the former can pass while the latter fails.

## 3. Agency and the earlier concrete integration

`Generative policy` requires valuation of the fixed expansion aim and revisability of every form the policy marks current. It does not use `permitsVersion`, demand a current form exists, or prove any improvement occurred. `Expanded before after` means a newly present understood or constructed operation, with no requirement to retain previous operations. Duplicating inventory/layers/vocabulary does not add one of those operations. The available operations here are just identity and successor. `assistedExecution` returns the sum of three optional natural numbers only when all are present. `collaborativeRevision` elsewhere checks only that the collaborator option is present, then chooses a hardcoded expanded state; that is not a general causal model of collaboration.

The announcement predicate ties before/after, a claimed new operation, and one input-output check. Its truth implies expansion because it explicitly contains a new constructed operation. The inflated announcement fails. The transition performance record distinguishes extension from inflation; the report record merely records that the announcement has the stipulated fields and is compatible with both. Thus an accurate report of an assertion need not support the asserted achievement.

The legacy `Reflexive` interface has an owner, a rule registry, and work records. A `ValidApplication` proves exact rule key, target, activity, inquiry, reasons, and limits identities; target registry resolution; inquiry target and current-method resolution; nonempty reasons with the same target; applicability; and satisfaction of the rule's supplied meaning relation. `Reflexive` requires registry coherence and, for each registered rule and every same-owner applicable subject, an existing valid record. The implication to `ReflexiveScope` and `noSelfExemption` merely project this. Empty registries and absent applicability can vacuously satisfy the interface.

The concrete finite legacy method has nine own subjects, two rules, generation omitted at application phase, and assessment at every listed subject. Inputs, requested scope, purpose/scope/observation/counterexample reason objects, and the local method are constructed together. The evaluator uses specific list membership and program execution: the only-at-zero program passes the [0] tests and fails the wider revision input 1, producing insufficiency. The generation result changes requested scope while retaining tested inputs; it is not a claim that the wider scope was verified. `completeOwnWork_reflexive` is proved by registry-key distinction, finite membership, same-object construction, and direct evaluation. An application-only rule can be reflexive without assessment of the system because the system is inapplicable; the dedicated counterexample makes this visible. The arithmetic self-test passes at 1 and fails at 0.

The earlier `CoreReader.Integration` world is the pair `(Choice.Candidate, Mode)` with two implementation candidates and apply/waive mode. The actual world is identity/apply. Observation of correct output at 0 identifies identity **within this two-candidate universe**, so universal identity output is supported there. A cost≤2 record admits the incorrect successor and does not support correct output. Charter conjunctions establish policy, consistency, finite reflection and current form labels, but cannot repair that unrelated record's missing support.

Its five value-position adapters select apply mode, use concrete test outcomes or proposition decisions as consequences, and use hardcoded objectives. Apply passes those constructed objectives and waive fails. `conflictDecision`, `groundsDecision`, `choiceDecision`, and the associated value positions are noncomputable classical proposition decisions, not executable testing tools. `groundsProvisionMeaning` identifies apply with the property that permitted grounds never evade `Grounds`; the waive counterexample refutes the universal property. The grounds-on-grounds result rewrites a commitment predicate by this equivalence and packages an existing value procedure. The proposal-review implementation similarly wraps two proposition decisions and verifies only requested inputs 0 and 1. `applicationRetainsDuties` extracts its premises; changing the output requirement to successor output invalidates the prior identity evidence. The joint witness supplies the concrete actual system/world, not all possible systems.

## 4. Adopted interfaces and complete group coverage

`AssessmentTask W` has empirical, inferential, and value variants. `taskOfFacet` copies a facet into the corresponding task. `NatureAppropriate task facet` requires exact equality of empirical records/scope/conclusion/uncertainty for an empirical-to-empirical pairing; exact equality of assumptions and conclusion for an inferential pairing; and equality of the full value position for a value pairing. It permits an empirical task to use an inferential facet only when the assumptions equal `singleton (fun w => Compatible records w ∧ scope w)`, the conclusion is the same claim, and the original uncertainty is supported by the records. All other pairings are false. Equality is Lean equality, including functional extensional equality when proved; it is not merely the same title or similar text.

`Grounds012 claim articulations facets task` requires a nonempty list and, for every member, equality of its claim to `claim`, articulated and facet-linked reasons, discharge, and nature-appropriateness to the supplied task. Unlike the earlier `Grounds`, this interface has no `actualApplicable` coverage quantifier. Its obligation is over the **supplied** facets for one supplied task. `grounds012Singleton` takes `FacetDischarged f` as a premise and supplies canonical structure and a task copied from that facet. It is a packaging theorem, not a way to prove an unsupported facet.

`generationSpecification`, `choiceSpecification`, and the empirical/inferential/value/capability specifications are aliases or canonical singleton wrappers around the meanings already expanded above. `consistencySpecification before after reported` asks for after-snapshot consistency and the one-way report implication. It does not require consistency of the before snapshot. `ReflexiveRule T I O` has a key, activity tag, applicability, input function and meaning relation. `reflexivitySpecification` asks for coherent keys and for every rule and every self/applicable target an outcome that is both performed at the exact `rule.input target` and satisfies its meaning at that exact input/outcome. The activity field is not independently used by this predicate. The performed and meaning relations are arbitrary inputs. `legacyReflexivity` derives this weaker adapter from the stricter legacy record interface and explicitly transports inquiry/reasons/limits identities.

`ScopeAccount W` supplies claim, conditions, observation scope, relevance, comparison pairs, used methods, roles and an explanation relation. `scopeSpecification` says each compared pair lies in the same supplied conditions and observation scope and is relevant, and each used method has a nonempty role and satisfies the supplied explanation relation for the same claim and conditions. It does not establish claim support itself, completeness of compared pairs, use of any method, or semantic adequacy of arbitrary `explains`. The concrete local account restricts comparisons to input zero and binds each method explanation to a proved local-support/repeated-support/non-universal-support statement. It is consequently more substantive than the bare interface.

The Adopted theorem groups have these specific contents and limitations; the inventory retains every member's exact statement:

| Declaration group | Code-derived result and proof scope |
| --- | --- |
| `collaborativeProgress`, `generationCases`, `generationLimits012`, `inventoryCases012`, `achievementSupported012` | Repackage the two-operation progression, optional-resource and performance-record examples; scope and new-operation witnesses are explicit, while inventory growth and assertion records fail. |
| `consistencyConsequences`, `sliceConsistency`, `explicitlyConsistentLimits`, `semanticOrder012`, `jointImplicationConflict012`, `tensionConsistent012`, `consistencyCases`, `consistencyLimits012` | Instantiate consistency with nonempty question domains; transport premises or construct Boolean/Nat witnesses and contradictions. They do not equate consistency with truth or sufficiency. |
| `localFacetChecked012`, `scopeStrength012`, `uncertainSupported012`, `inferenceChecked012`, `qualitativeUnmeasured012` | Prove local first-coordinate/input-zero results and arithmetic conditional inference, while rejecting stronger conclusions by explicit worlds. The uncertainty successfully supported is the exhaustive Boolean disjunction, not a prediction of the second coordinate. |
| `closedCriticism012`, `valueFulfilled012`, `valueNotFact012`, `clearFalseReason012`, `valueCases012`, `groundsLimits012` | Distinguish the value procedure from a fact of selection, empty-theory entailment, a constant record, or mere articulation. A no-response position fails at the explicit relevant criticism. |
| `qualitativeProportionality012`, `scopeFulfilled012`, `scopeCases012`, `scopeLimits012`, `randomOutcomes012` | Claim strength is logical implication (`stronger w → weaker w`); observations at 0 fail at 1; verification, setting equality, and bounded variation are separated. No numeric calibration of confidence/proportionality is proved. |
| `capabilityFulfilled012`, `OwnCapability012`, `ownCapability012`, `capabilityCases012`, `capabilityLimits012` | Double-output and optional explanation contracts remain distinct. Ownership adds only equality of two Nat IDs; process evidence is for the exact assessed process. |
| `CompleteCharter012`, `completeCharter012`, `charterWithoutGrounds012` | Construct one charter with unchanged snapshot and false report; its consistency/reflection do not establish output from the cost record. |
| `groundsPermission012` through `groundsOnGrounds012` | Boolean-enabled permission is equivalent to the universal grounds-preservation provision; a global all-true claim is rejected when enabled and accepted by vacuous permission when disabled. The value procedure adopts enabled and values rejection of that fixed unsupported inference; the final theorem rewrites commitment to the provision via extensionality. |
| `reflexiveTargets012`, `openSelfExempt012`, `reflexivityCases012`, `reflexivityLimits012` | Full finite applicable-target coverage and an application-only exception are both shown; a rule applicable to target 0 but performed only at 1 fails. Open revisability is insufficient. |
| `circularGlobalConditional012`, `circularSubstitutionRejected012` | Assuming all-true entails all-true and is satisfiable, so it is legitimate as that conditional task; it is not the original task based on observing input zero. Failure comes from the required equality of assumptions. |
| `observedInferenceChecked012`, `sameEmpiricalTaskTwoMethods012` | The empirical local facet and an inference from exactly compatibility-and-scope both discharge the same empirical task; the uncertainty obligation is retained. |
| `uncertaintyBypassChecked012`, `uncertaintySubstitutionRejected012` | The first-coordinate inference is checked, but the empirical task also requires second-coordinate true; compatible (true,false) defeats appropriateness and therefore grounds. |
| `valueFactSubstitutionRejected012`, `inferentialContextSubstitutionRejected012`, `groundsCases012`, `empiricalCases012`, `inferentialCases012` | A factual selection observation cannot replace a value task, and a stronger premise cannot replace the stipulated empty assumption theory. Aggregates only conjoin existing results. |
| `wrongExplanation012`, `internalReasonDistinguishes012`, `ownPhilosophyStatus012`, `allStatusOnly012`, `choiceCases012`, `choiceLimits012` | Same outputs/feasibility do not ensure explanation reasons; all status-only selections fail by definition; the current review implementation passes by output reasons. Aggregates do not add a theorem that the chosen method is optimal. |

## 5. Engineering domain: what the model actually computes

The engineering domain has three maintainers, four tools, four knowledge labels, three candidates, seven burdens, nine named change constructors plus `other String`. Lists `maintainers`, `changes`, and `burdens` enumerate the finite named cases; `registeredDirections` adds one other case, “csv export”. The arbitrary strings admitted by `Change.other` are **not** all enumerated or supported. `MaximumRegisteredCapability` quantifies over the ten registered directions only.

An activity is a record of participant names, a software string, tools, a function assigning knowledge lists, release/maintenance counts, optional bounded runs, and a label. `ActivityScope` checks nonempty participants/software/tools and a nonempty knowledge list for each participant. `Continuing` is both scheduled counts >0; `BoundedLifecycle` is a present bounded-run option and both counts zero. The continuing example is intentionally labeled “temporary” while still continuing by its counts. The temporary/prototype/retiring examples have positive optional bounds and zero counts. These predicates classify the supplied fields, not actual lifecycle behavior; they are not an exhaustive dichotomy of all records.

`changePath` prescribes edit steps with component number, knowledge label, tool and natural units. The simple candidate needs private layout; the other two normally need a public change guide. Addition/independent has 2 units; simple design revision/withdrawal/redrawing has 17, versus 6 for evolvable/maximal; migration has 10. Coordinated paths touch a further component and cost more than independent paths. The maximal CSV path is available publicly and totals 4, while the other CSV paths need private layout and add 20. Unknown other strings produce the empty path. `changeWork` sums the stipulated units. No timing measurement or actual edit execution is involved.

`CanChange` requires a nonempty path, membership of the particular maintainer in the activity, and possession of all listed knowledge/tool labels. `ContinuingCapability` checks the path for **every listed participant**, without requiring that participant list be nonempty. `ActivityScope` closes that empty-list loophole in `PriorityConditions`, but the standalone capability predicate does not. The examples prove that successors/agents have the evolvable revision path but not the private simple one. An artifact merely returns its input and emits an execute action; maintainers are defined to emit propose actions. The absence of a proposal from that artifact is true by its definition, not a theorem about all software agency.

`CredibleDirection {Ground : Type}` is existence, via `List.any`, of one ground accepted by the supplied Boolean articulation and support functions. The concrete adapter checks nonempty strings/lists and specific values: positive release number plus list membership; queue/tenant-config-reload strings; queue history with at least two equal recorded directions; or the exact reviewed-migration-requirement string. Thus “credible” is a defined classification of supplied records, not verification of an actual plan, service mechanism or history. `WarrantedAccommodation` additionally requires positive gain and investment ≤ gain, but those numbers are arguments, not derived predictions. The examples include one implemented variant, revised forecast deletion, unsupported quantum/CSV direction, and the distinction between nine supported directions and ten.

The candidates' complexity values are 1,3,30. Their seven costs are 1 each for simple, respectively 3/4/2/4/2/2/8 for evolvable, and 40 each for maximal. `CostVector` is only a mapping; `CostLimits` supplies capacities and objective strings. Normal capacities are all 12. `ConcreteThreat ctx c burden` means cost exceeds the simple baseline, exceeds the context capacity, and the objective string is nonempty. `HasThreat` scans the seven burdens. `JustifiedDeparture` requires an explicitly selected burden and that predicate at that burden. A string's nonemptiness does not independently justify its objective, and no validation binds these cost constants to real expense.

Engineering requirements demand an order output **at one sample input**, an unsafe-operation count, a latency number, and a retention number. Each default profile uses the same deduplication behavior on [2,1,2] and the constants 0,5,30. `Meets` checks [2,1] if order is required, and three numeric inequalities. It does not prove general order preservation, real safety, measured latency, or actual retention; context profiles can be arbitrarily supplied.

`PriorityConditions` conjoins continuing/scope conditions, both simple/evolvable profiles meeting requirements, credibility of design revision, evolvable continuing capability for that direction, lower revision work, and larger simple-to-evolvable complexity. `EvolutionPriority ctx chosen` is the conditional: **if all those conditions, chosen equals evolvable or there is justified departure for evolvable**. It is a stipulated normative rule. `priorityWhenApplicable` takes that rule, applicability, and absence of departure as premises; it eliminates the departure disjunct, then substitutes the chosen candidate into the complexity comparison already in applicability. It does not derive the rule from those conditions.

The current concrete context satisfies the applicability conditions and has no threat/departure. Therefore choosing simple violates this stipulated rule. Lowering a selected burden's capacity to 1 establishes departure and allows simple. Altering any of four evolvable profile requirements blocks applicability. When applicability is false, the conditional rule is vacuously true for every choice. `oneDimensionDoesNotEntailEveryDimension` uses equal addition work as a counterexample to a universal strict improvement over all `Change` values. All these are finite computations or elementary implication/disjunction proofs, not evidence that the cost assignments or priority are uniquely warranted.

## 6. Engineering evolution, contracts, structure and historical records

`orderedUnique` uses list deduplication; `orderedRefactor` appends the empty list; `sortedUnique` first runs the supplied insertion sort then deduplicates. `transform` changes selected software-state fields for named changes, and leaves unknown other changes untouched. `evolutionBehavior` selects sorted output only for redrawing/design revision. There is no execution semantics connecting a transformed software state's fields to this separately assigned function.

`PreservesOn {Input Output : Type} scope old new` universally requires equal outputs for all in-scope inputs. `contractPreservation` returns the premise `observations` unchanged: that premise is **already the complete universal preservation statement**, not a finite experiment. `changedObservationNotPreserved` refutes it at one specified in-scope counterexample. `PreservesFinite` instead tests exactly four list inputs. Observable contracts add a retry limit; retry is `attempts < maxAttempts`, tested at six attempts 0…5. Finite preservation of order and retry together is `PreservesContractFinite`.

`affectedParties` uses the two fixed dependency records (consumer observes order, operator observes retry) and changes detected on those finite input lists. `RevisionDuties old new r` requires a deliberate flag, the new result at [2,1,2], inclusion of every computed affected party, and four fields equal to old/new retry limits. The arbitrary `procedure` string is not checked. It does not establish notification/consent, complete party enumeration, all-input behavior, or an independently approved procedure. `ContractChangeAccount` is finite preservation OR these revision duties. `contractRevisionObligations` assumes that account and failure of the first branch and projects the second branch.

`EvolutionClaim` ties the same direction and maintainer to a path, contract account, presence of a contract-runner step, and treatment compatible with whether one output sample changes. It uses the fixed original contract and normal revision, not arbitrary user contracts. The redrawing example changes both sample order and retry count; missing the operator or recording the old limit incorrectly fails. `retiredBehavior` agrees on every finite contract input but differs at [99], explicitly refuting the inference from finite tests to universal preservation. Merely changing the procedure label still passes.

`StructuralEvidence` binds direction, participants, touched component IDs, four test inputs and their before/after results, summed work, count of contract-runner steps, and natural-number subtraction for gain. `StructuralAccount` checks those exact equalities. In the constructed evidence these are definitionally or computationally true; it is not independently collected telemetry. `propagation` erases duplicate component IDs. A static batch function hardcodes size 10; the live function uses its size argument, so 21 items produce 3 versus 5 at size 5. Natural division and subtraction are total, with no positivity precondition on the batch size; claims should not silently extend this to a physically meaningful size-zero procedure.

Engineering designs have separate metadata, behavior, path functions, components, boundaries and batch assumptions. Same metadata and signature coexist with different output or change capability. All eight module assumptions can need revision for a new size. `introduceBoundary` appends a real component, a boundary record, and a public-contract step to each nonempty path while preserving behavior by `xs ++ []`; the example grows revision work from 17 to 18. These countermodels show that those structural counts/labels alone do not entail improvement in the defined capability/cost functions; they do not claim every boundary is harmful.

`HistoricalEvidence` and `RevisionAccountAgainst history record` bind the record to the same software string, old state, prior prediction and observed result; require increasing time, exact current-state recording, some enumerated material change when choice changes, a report Boolean equal to predicted = actual, and criticism-list coverage of the supplied considered changes. The fixed history records old state and 3 versus 5. Tampering either old state, prediction, observation or software string is rejected **relative to this fixed history**. A generic caller supplies `history`; the interface does not prove that an external archive is authentic. It does not require considered changes to be nonempty, actual substantive criticism, or a particular new choice. A stable choice can pass even when other facts change. `failedHistoryNotRewritten` simply extracts the equality constraint and uses the supplied failure premise.

`RetentionJustified` says every supplied alternative lacks the adapter's support OR a departure is justified; an empty alternatives list vacuously satisfies its first branch. The examples retain against an unsupported quantum option or a threatening migration. Three listed revisions and three agreeing reviewers do not fix the batch counterexample; prior observations at size 10 do not cover size 5.

`revisionFor ctx chosen` links software, forecast from that context's ground lists, maintenance, participants, chosen migration cost, capacity and choice into the current revision state, while keeping the fixed old history. The identity theorem checks those ties for the concrete context. `DomainSatisfied` bundles scope, the conditional priority rule, credible design revision, validity of a selected departure, successor design-revision capability, structural account, contract account, and revision account. It **does not separately require `Meets` or `PriorityConditions`**. A checked supplemental probe supplies an unsafe evolvable profile that fails `Meets` yet still satisfies `DomainSatisfied`; the requirements occur in the conditional priority antecedent. This does not invalidate the final concrete witness, which separately includes the original context and `PriorityConditions`.

## 7. Engineering value and self-application adapters

`CoreCommitment` enumerates five labels. `coreAdopted` returns true for each by definition. `reasonFor` attaches one concrete reason object per label; `ReasonRelevant` checks specific plan membership, unequal list outputs, batch equalities/counterexamples or complexity-budget inequalities. These are more than matching labels, but the finite example and chosen objective still determine their significance.

`governancePosition principle` has Boolean positions/outcomes, adopted true, and selection constantly true for every candidate. It starts and limits to complexity ≤3; uses a singleton relevant reason; values a true result of `safeguardExperiment`; and supplies a fixed nonempty criticism string. Enabling that experiment permits the planned direction, refuses incompatible order demands, includes the known failing self-test point, restricts licensed sizes to 10, or selects within budget, depending on the principle. Disabling is **defined** to drop directions, permit conflicting demands, omit the counterexample, license size 5, or select maximal. The enabled and disabled theorems evaluate these chosen branches. They do not compare every possible way of adopting or declining a principle. The governance commitment is true even at simple; procedure support under this construction does not impose evolution priority.

`selectionPosition adopted` uses candidate-valued positions with `selected = id`; its commitment at a world candidate is exactly candidate = adopted. Its outcome ignores the world and returns adopted candidate complexity and design-revision work. Starting assumptions already fix candidate = adopted. The simple position's objective is complexity ≤1; the evolvable position's objective is revision work ≤6. The reason lists supply the matching numerical pairs (1,17) or (3,6), and constraints require complexity ≤12. `selectionValueProcedure` assumes adopted is simple OR evolvable, then checks each objective under that case's **different** preference. `selectionGrounded` wraps this procedure. These theorems establish neither a preference-independent winner nor a proof that the differing objectives are morally or philosophically valid.

`Reflection.Model W Object` is an abstract adapter supplying objects, contracts, requested cases, reasons, a basis proposition, applicability predicates, and a recorded outcome function. A target carries owner/object/phase. Input is constructed for the exact target object and phase; self means equal owner and object membership. Two generated rules have distinct local keys 0/1. `performed` requires exact self/input equality and an activity whose key and recorded outcome match. `follows` universally requires the interpretation for each activity/object/phase that is a member and applicable. `recordedReflexivity` **assumes `m.follows`**; it packages this assumption using key distinction and owner substitution. It is not an independent procedure for establishing a model's truthfulness.

`Reflection.evaluate` first checks every tested case, then every requested case, using one supplied Boolean test. If all tested pass and all requested pass, it returns supportedWithinScope; if tested pass but a requested one fails, counterexample; otherwise noSupportingSample. It does not read `Contract.claimed`, reasons, basis or target. Empty tested/requested lists yield supportedWithinScope even for the always-false test. `interpret` separately requires nonempty reasons and `basis`; generation's result must be exactly requested tests/requested scope, while assessment must equal evaluation. This separation matters: a passing raw evaluation alone is not a proof of follows or complete reflection. Reasons are still strings with no semantic relation beyond the separately supplied basis.

The concrete `selfModel chosen` uses world/test points `Candidate × Nat` and review objects activity, five commitments, priority (only when chosen is evolvable), and evolutionMethod. Tested cases use `(chosen,10)`. Formation/application request that case; revision also requests `(chosen,5)`. Basis propositions check actual activity requirements, specific relevant reasons, applicability/no-threat for priority, or the known batch equality/difference. Generation applies at formation/revision; assessment applies at all phases. `statedReview` has a counterexample precisely for evolutionMethod/revision and support elsewhere. `currentSelfRecords` assumes chosen is simple or evolvable and checks all finite objects/phases/activities against definitions. `currentSelfApplication` then applies the generic adapter. For the simple witness, the priority object is omitted, so this does not establish that simple passed the priority rule. `actualSelfCriticism` computes 3 versus 5 and confirms the recorded counterexample while generation still emits the wider proposed cases; generation does not certify them.

## 8. Engineering integration, same objects, and the final contrast

`sharedContext` is exactly the concrete continuing context. `maintainedOutput chosen n` runs the chosen deduplication behavior on singleton [n] and returns its head; it is identically n for **every** candidate. `chosenImplementation` packages that, complexity as cost, and identity explanation/trace. `chosenRequirements` only asks identity for all naturals and budget 12. `implementationReasoned` takes complexity≤budget and proves feasibility plus the output reason. It does not establish arbitrary-list order preservation or priority; those are different contracts elsewhere.

`capabilityOutput` maps input 0 to original maintainer, 1 to successor, and every other natural to agent; it returns the predefined revision path cost when that maintainer has the knowledge/tools, otherwise zero. Thus simple returns 17/0/0 and evolvable 6/6/6. `engineeringProcess chosen` contains exactly that output and no explanation. `engineeringCapability chosen process` requires that process output equal **the very same `capabilityOutput chosen`** for every input. `engineeringCapabilityGrounded` holds for all candidates by reflexivity and the process singleton wrapper, including maximal. It is source-faithful to this code to call it an exact output-function contract, but not an independent certificate of engineering success or any positive capability threshold. The contrast theorem separately computes useful differences.

The budget record is a test of the very predicate complexity≤3 with observed true. `budgetObservationMeaning` proves compatibility iff that same predicate. Its empirical facet establishes exactly that threshold, with true scope/uncertainty and an evolvable witness. The inferential facet assumes the threshold and derives complexity≤12 via transitivity, with another concrete witness. The scope account relates candidate pairs by equality of their deduplication result at [2,1,2], which holds because all default behaviors are equal. The limit theorem refutes the stronger threshold≤1 using evolvable. None of these is an externally measured future-performance forecast.

`engineeringPolicy` values expansion, marks every version-1 form current, and supplies a higher version with generation adopted. The proof chooses version+1. `OwnFact` ranges over selected candidate, requirements, capacity, output-function capability, the fixed batch contrast, revision account, generativity, reflection and the five adoption facts. `ownFactClaim chosen` gives each its actual predicate. `actualOwnFact` proves each fact for simple/evolvable by definition or earlier checks. `ownFactPremises chosen` is exactly candidate = chosen. `actualOwnFactGrounded` substitutes this identity and invokes those actual proofs, not merely the fact's name.

`ownTheory chosen` contains exactly predicates equal to some own fact. It includes selected and grounds-adoption predicates; the review list includes actual activity and grounds commitment. `comparisonContext chosen` uses the same identity premises, same fact interpretation and complexity≤3 scope. `currentAdmissible` explicitly supplies chosen as model of every held fact, assumptions and scope. `currentConsistency` obtains consistency from this witness and reports true for a move from revision 0 to 1; true satisfies the one-way reporting predicate. The before candidate is evolvable, but the after may be either ordinary candidate. This is a concrete consistent model with a genuine same-candidate link throughout, not arbitrary independent Boolean assignments for all requirements.

`Inherited ctx chosen` is a **record of proof obligations**, including `ctx = sharedContext`, generation, the snapshot contract, reflection, value grounds for all five commitments, choice-value grounds, empirical/inferential/scope/capability evidence, implementation choice, grounds for every own fact, compatibility at the chosen candidate, actual selection commitment, and current theory satisfaction. `inheritedCurrent` supplies this record for simple/evolvable using the proofs above. In the generic record all substantive fields mention shared or fixed objects; the equality field is therefore material. The theorem `inheritedMutualApplication` simply projects six record fields. It does not prove them from fewer principles or show the encoded principles mutually entail one another.

`priorityRemainsReflexive` additionally assumes domain satisfaction, applicability, and no departure; derives chosen=evolvable by the stipulated priority rule; then supplies priority-object membership and reuses inherited reflection/value fields. It does not prove the priority rule from inheritance. The finite cases show the priority object gets supportedWithinScope for evolvable while the separate evolution method still gets a revision counterexample.

The final `Engineering.jointWitness` existentially selects exactly sharedContext and evolvable, with inheritance, domain satisfaction, applicability, absence of threat, strictly larger complexity than simple, successor/agent path availability, nonempty own theory/review evidence, and admissibility all tied to that context/candidate. The final `inheritedDoesNotEntailPriority` selects exactly sharedContext and simple. It proves inheritance, applicability, continuing/non-bounded lifecycle, no threat/departure, both candidates meeting requirements, credible revision, evolvable successor/agent capability, lower evolvable revision work, lower simple complexity, simple's own value procedure/commitment, and failure of EvolutionPriority for simple. This is a valid explicit counterexample **for these defined predicates and the differing selection objectives**. It does not prove that some unspecified external inheritance package permits the same counterexample, nor does it show priority false for evolvable. The intended external conclusion remains unevaluated until a separately preserved comparison stage.

## 9. Verification record and boundaries

- `code-hashes.json` binds all thirteen source/import files plus lakefile and toolchain before explanation. The code is the comment-stripped supplied input, not a claim about any unseen original file hash.
- `build.log`, `toolchain.log`, `DeclarationAudit.lean`, `declaration-axiom-audit.log`, `axiom-summary.json` record actual checks. All 786 named declarations and 269 theorem statements resolved. The first audit attempt used an unsupported printing option; its failed log is retained separately, and the corrected complete audit passed. No proof input changed.
- `SemanticProbes.lean` and `semantic-probes.log` check the empty-registry case, empty-question consistency, contradictory-record vacuity, empty-test evaluation, all-candidate tautological capability contract, and the standalone domain/failed-requirement case. A first probe syntax error was corrected only in the temporary audit file; its failed log is preserved.
- `concerns.json` lists code-derived limitations and their mitigations, without assigning source-fidelity verdicts. Concrete examples were verified, while interpretation of hardcoded costs, scope, strings and objectives remains outside the kernel result.

The exact source inventory below is intentionally exhaustive. It makes every input declaration and its line interval available without treating a repeated aggregate or packaging proof as new evidence.

## Appendix: exact code and declaration locations

Each excerpt is copied verbatim from the hashed supplied file. The line interval identifies the declaration plus following structural whitespace up to the next explicit declaration; source comments were already absent in the supplied input. Full elaborated types and transitive axioms are in the audit log.

### CoreReader/Adopted.lean

#### `CoreReader.Adopted.AssessmentTask`

`CoreReader/Adopted.lean:11–15`; inductive.

```lean
inductive AssessmentTask (W : Type) where
  | empirical (records : List (Record W)) (scope claim uncertainty : Claim W)
  | inferential (assumptions : Theory W) (claim : Claim W)
  | value (position : ValuePosition W)

```

#### `CoreReader.Adopted.taskOfFacet`

`CoreReader/Adopted.lean:16–26`; def.

```lean
def taskOfFacet {W : Type} : Facet W → AssessmentTask W
  | .empirical records scope claim uncertainty => .empirical records scope claim uncertainty
  | .inferential assumptions claim => .inferential assumptions claim
  | .value position => .value position

                                                                          
                                                                               
                                                                               
                                                                           
                                                                          
                                                                                 
```

#### `CoreReader.Adopted.NatureAppropriate`

`CoreReader/Adopted.lean:27–37`; def.

```lean
def NatureAppropriate {W : Type} : AssessmentTask W → Facet W → Prop
  | .empirical records scope claim uncertainty, .empirical actualRecords actualScope conclusion actualUncertainty =>
      actualRecords = records ∧ actualScope = scope ∧ conclusion = claim ∧ actualUncertainty = uncertainty
  | .empirical records scope claim uncertainty, .inferential assumptions conclusion =>
      assumptions = singleton (fun w => Compatible records w ∧ scope w) ∧
      conclusion = claim ∧ Supports records uncertainty
  | .inferential assumptions claim, .inferential actualAssumptions conclusion =>
      actualAssumptions = assumptions ∧ conclusion = claim
  | .value position, .value actualPosition => actualPosition = position
  | _, _ => False

```

#### `CoreReader.Adopted.taskOfFacetAppropriate`

`CoreReader/Adopted.lean:38–47`; theorem.

```lean
theorem taskOfFacetAppropriate {W : Type} (f : Facet W) : NatureAppropriate (taskOfFacet f) f := by
  cases f with
  | empirical _ _ _ _ => exact ⟨rfl, rfl, rfl, rfl⟩
  | inferential _ _ => exact ⟨rfl, rfl⟩
  | value _ => rfl

                                                                                  
                                                                               
                                                                                
                                                                                  
```

#### `CoreReader.Adopted.Grounds012`

`CoreReader/Adopted.lean:48–57`; def.

```lean
def Grounds012 {W : Type} (claim : Claim W)
    (articulations : Facet W → Articulation W) (facets : List (Facet W))
    (task : AssessmentTask W) : Prop :=
  facets ≠ [] ∧ ∀ facet ∈ facets,
    facet.claim = claim ∧ Articulated (articulations facet) ∧
    FacetArticulated (articulations facet) facet ∧ FacetDischarged facet ∧
    NatureAppropriate task facet

                                                                           
                                                                                
```

#### `CoreReader.Adopted.grounds012Singleton`

`CoreReader/Adopted.lean:58–64`; theorem.

```lean
theorem grounds012Singleton {W : Type} (f : Facet W) (h : FacetDischarged f) :
    Grounds012 f.claim canonicalArticulation [f] (taskOfFacet f) := by
  refine ⟨by simp, ?_⟩
  intro facet hf
  cases List.mem_singleton.mp hf
  exact ⟨rfl, canonicalArticulated f h, canonicalFacetArticulated f, h, taskOfFacetAppropriate f⟩

```

#### `CoreReader.Adopted.generationSpecification`

`CoreReader/Adopted.lean:65–68`; def.

```lean
def generationSpecification (policy : Policy) : Prop := Generative policy

                                                                             
                                                                                  
```

#### `CoreReader.Adopted.consistencySpecification`

`CoreReader/Adopted.lean:69–75`; def.

```lean
def consistencySpecification {W Q : Type} (before after : Snapshot W Q)
    (reported : Bool) : Prop :=
  Consistent after.held after.context ∧ TruthfulReport before after reported

                                                                               
                                                                               
                                                        
```

#### `CoreReader.Adopted.ReflexiveRule`

`CoreReader/Adopted.lean:76–82`; structure.

```lean
structure ReflexiveRule (T I O : Type) where
  key : PrincipleKey
  activity : Activity
  applicable : T → Prop
  input : T → I
  meaning : I → O → Prop

```

#### `CoreReader.Adopted.reflexivitySpecification`

`CoreReader/Adopted.lean:83–89`; def.

```lean
def reflexivitySpecification {T I O : Type} (rules : List (ReflexiveRule T I O))
    (isSelf : T → Prop) (performed : PrincipleKey → T → I → O → Prop) : Prop :=
  (∀ p ∈ rules, ∀ q ∈ rules, p.key = q.key → p = q) ∧
  ∀ rule ∈ rules, ∀ target, isSelf target → rule.applicable target →
    ∃ outcome, performed rule.key target (rule.input target) outcome ∧
      rule.meaning (rule.input target) outcome

```

#### `CoreReader.Adopted.legacyRule`

`CoreReader/Adopted.lean:90–93`; def.

```lean
def legacyRule (p : Principle) : ReflexiveRule Subject Inquiry WorkOutcome :=
  ⟨p.key, p.activity, p.applicable, p.inquiry,
    fun inquiry outcome => p.meaning inquiry (p.reasons inquiry.target) (p.limits inquiry.target) outcome⟩

```

#### `CoreReader.Adopted.legacyPerformed`

`CoreReader/Adopted.lean:94–99`; def.

```lean
def legacyPerformed (rules : List Principle) (records : List WorkRecord)
    (key : PrincipleKey) (target : Subject) (input : Inquiry) (outcome : WorkOutcome) : Prop :=
  ∃ p ∈ rules, ∃ record ∈ records,
    p.key = key ∧ ValidApplication rules p target record ∧
    record.inquiry = input ∧ record.outcome = outcome

```

#### `CoreReader.Adopted.legacyReflexivity`

`CoreReader/Adopted.lean:100–121`; theorem.

```lean
theorem legacyReflexivity (owner : Nat) (rules : List Principle) (records : List WorkRecord)
    (h : Reflexive owner rules records) :
    reflexivitySpecification (rules.map legacyRule) (fun s => s.owner = owner)
      (legacyPerformed rules records) := by
  constructor
  · intro p hp q hq he
    obtain ⟨a, ha, rfl⟩ := List.mem_map.mp hp
    obtain ⟨b, hb, rfl⟩ := List.mem_map.mp hq
    exact congrArg legacyRule (h.1 a ha b hb he)
  · intro rule hr target ht happ
    obtain ⟨p, hp, rfl⟩ := List.mem_map.mp hr
    obtain ⟨record, hm, hv⟩ := h.2 p hp target ht happ
    refine ⟨record.outcome, ⟨p, hp, record, hm, rfl, hv, hv.inquiryIdentity, rfl⟩, ?_⟩
    change p.meaning (p.inquiry target) (p.reasons (p.inquiry target).target)
      (p.limits (p.inquiry target).target) record.outcome
    have ti : (p.inquiry target).target = target := hv.inquiryIdentity ▸ hv.inquiryTarget
    rw [ti]
    rw [← hv.inquiryIdentity, ← hv.reasonsIdentity, ← hv.limitsIdentity]
    exact hv.followsMeaning

                                                                            
                                                                                  
```

#### `CoreReader.Adopted.empiricalSpecification`

`CoreReader/Adopted.lean:122–126`; def.

```lean
def empiricalSpecification {W : Type} (records : List (Record W))
    (scope claim uncertainty : Claim W) : Prop :=
  Grounds012 claim canonicalArticulation [.empirical records scope claim uncertainty]
    (.empirical records scope claim uncertainty)

```

#### `CoreReader.Adopted.inferentialSpecification`

`CoreReader/Adopted.lean:127–129`; def.

```lean
def inferentialSpecification {W : Type} (assumptions : Theory W) (claim : Claim W) : Prop :=
  Grounds012 claim canonicalArticulation [.inferential assumptions claim] (.inferential assumptions claim)

```

#### `CoreReader.Adopted.valueSpecification`

`CoreReader/Adopted.lean:130–135`; def.

```lean
def valueSpecification {W : Type} (position : ValuePosition W) : Prop :=
  Grounds012 position.commitment canonicalArticulation [.value position] (.value position)

                                                                             
                                                                            
                                                                              
```

#### `CoreReader.Adopted.AssessmentMethod`

`CoreReader/Adopted.lean:136–137`; inductive.

```lean
inductive AssessmentMethod | measurement | repetition | framework
  deriving DecidableEq
```

#### `CoreReader.Adopted.ScopeAccount`

`CoreReader/Adopted.lean:138–147`; structure.

```lean
structure ScopeAccount (W : Type) where
  claim : Claim W
  conditions : Claim W
  observationScope : Claim W
  relevant : W → W → Prop
  compared : W → W → Prop
  used : AssessmentMethod → Prop
  role : AssessmentMethod → String
  explains : AssessmentMethod → String → Claim W → Claim W → Prop

```

#### `CoreReader.Adopted.scopeSpecification`

`CoreReader/Adopted.lean:148–155`; def.

```lean
def scopeSpecification {W : Type} (account : ScopeAccount W) : Prop :=
  (∀ a b, account.compared a b → account.conditions a ∧ account.conditions b ∧
    account.observationScope a ∧ account.observationScope b ∧ account.relevant a b) ∧
  ∀ method, account.used method → account.role method ≠ "" ∧
    account.explains method (account.role method) account.claim account.conditions

                                                                        
                                                                             
```

#### `CoreReader.Adopted.capabilitySpecification`

`CoreReader/Adopted.lean:156–159`; def.

```lean
def capabilitySpecification (assessed : Process) (contract : Claim Process) : Prop :=
  Grounds012 contract canonicalArticulation [processContractFacet assessed contract]
    (.inferential (processScope assessed) contract)

```

#### `CoreReader.Adopted.choiceSpecification`

`CoreReader/Adopted.lean:160–164`; def.

```lean
def choiceSpecification (requirements : Requirements) (implementation : Implementation)
    (reasons : List Reason) : Prop := JustifiedChoice requirements implementation reasons

                                                                          
                                                                                  
```

#### `CoreReader.Adopted.collaborativeRevision`

`CoreReader/Adopted.lean:165–167`; def.

```lean
def collaborativeRevision (resources : ExternalResources) : State :=
  if resources.collaborator.isSome then extendedState else baseState

```

#### `CoreReader.Adopted.collaborativeProgress`

`CoreReader/Adopted.lean:168–179`; theorem.

```lean
theorem collaborativeProgress :
    generationSpecification openPolicy ∧
    Expanded baseState (collaborativeRevision availableResources) ∧
    ¬ Expanded baseState (collaborativeRevision { availableResources with collaborator := none }) ∧
    assistedExecution ⟨none, none, none⟩ = none := by
  refine ⟨⟨Or.inl rfl, fun _ _ => trivial⟩, ?_, ?_, rfl⟩
  · exact Or.inr ⟨.successor, by simp [collaborativeRevision, availableResources, extendedState],
      by simp [baseState]⟩
  · simp [collaborativeRevision, Expanded, baseState]

                                                                           
                                                                         
```

#### `CoreReader.Adopted.consistencyConsequences`

`CoreReader/Adopted.lean:180–183`; theorem.

```lean
theorem consistencyConsequences {W Q : Type} (t : Theory W) (c : Context W Q) (q : Q)
    (positive : Consequence t c q true) (negative : Consequence t c q false) :
    ¬ Consistent t c := conflictRequiresChange t c q positive negative

```

#### `CoreReader.Adopted.broadBoolContext`

`CoreReader/Adopted.lean:184–185`; def.

```lean
def broadBoolContext : Context Bool Unit := ⟨emptyTheory, onQuestion, fun _ => True⟩

```

#### `CoreReader.Adopted.sliceConsistency`

`CoreReader/Adopted.lean:186–200`; theorem.

```lean
theorem sliceConsistency :
    (∀ time, Consistent (revisionSlice time) broadBoolContext) ∧
    ¬ Consistent (union (revisionSlice 0) (revisionSlice 1)) broadBoolContext := by
  constructor
  · intro time
    apply consequenceConsistency
    exact ⟨time == 0, (modelsSingleton _ _).2 rfl, (by intro p hp; cases hp), trivial⟩
  · apply conflictRequiresChange _ _ ()
    · intro w h
      change w = true
      exact (modelsSingleton (fun w : Bool => w = true) w).1 ((modelsUnion _ _ _).1 h.1).1
    · intro w h ht
      have hn := (modelsSingleton _ _).1 ((modelsUnion _ _ _).1 h.1).2
      cases ht.symm.trans hn

```

#### `CoreReader.Adopted.explicitlyConsistentLimits`

`CoreReader/Adopted.lean:201–213`; theorem.

```lean
theorem explicitlyConsistentLimits :
    Consistent (singleton (fun w : Bool => w = true)) broadBoolContext ∧
    ¬ Models (singleton (fun w : Bool => w = true)) false ∧
    Consistent (emptyTheory : Theory Bool) broadBoolContext ∧
    ¬ Entails emptyTheory (fun w : Bool => w = true) := by
  refine ⟨?_, consistentFalse.2, ?_, consistentIncomplete.2.1⟩
  · exact consequenceConsistency _ _ ⟨true, (modelsSingleton _ _).2 rfl,
      (by intro p hp; cases hp), trivial⟩
  · exact consequenceConsistency _ _ ⟨true, (by intro p hp; cases hp),
      (by intro p hp; cases hp), trivial⟩

                                                                            
                                                                                 
```

#### `CoreReader.Adopted.localFacet012`

`CoreReader/Adopted.lean:214–215`; def.

```lean
def localFacet012 : Facet (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) (fun f => f 0 = true) (fun _ => True)
```

#### `CoreReader.Adopted.globalFacet012`

`CoreReader/Adopted.lean:216–217`; def.

```lean
def globalFacet012 : Facet (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) allTrue (fun _ => True)
```

#### `CoreReader.Adopted.strongFacet012`

`CoreReader/Adopted.lean:218–220`; def.

```lean
def strongFacet012 : Facet (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) (fun f => f 0 = true ∧ f 1 = true) (fun _ => True)

```

#### `CoreReader.Adopted.localFacetChecked012`

`CoreReader/Adopted.lean:221–224`; theorem.

```lean
theorem localFacetChecked012 : FacetDischarged localFacet012 :=
  ⟨⟨localGenerator 0, (zeroCompatible _).2 rfl, trivial⟩,
    (fun f hf _ => (zeroCompatible f).1 hf), fun _ _ => trivial⟩

```

#### `CoreReader.Adopted.scopeStrength012`

`CoreReader/Adopted.lean:225–242`; theorem.

```lean
theorem scopeStrength012 :
    Grounds012 localFacet012.claim canonicalArticulation [localFacet012] (taskOfFacet localFacet012) ∧
    Articulated (canonicalArticulation globalFacet012) ∧
    ¬ Grounds012 globalFacet012.claim canonicalArticulation [globalFacet012] (taskOfFacet globalFacet012) ∧
    ¬ Grounds012 strongFacet012.claim canonicalArticulation [strongFacet012] (taskOfFacet strongFacet012) := by
  refine ⟨grounds012Singleton _ localFacetChecked012, ⟨by simp [canonicalArticulation, globalFacet012],
    by simp [canonicalArticulation, globalFacet012]⟩, ?_, ?_⟩
  · intro h
    have checked := (h.2 globalFacet012 (by simp)).2.2.2.1
    have bad := checked.2.1 (localGenerator 0) ((zeroCompatible _).2 rfl) trivial 1
    cases bad
  · intro h
    have checked := (h.2 strongFacet012 (by simp)).2.2.2.1
    have bad := (checked.2.1 (localGenerator 0) ((zeroCompatible _).2 rfl) trivial).2
    cases bad

                                                                             
                                                                                  
```

#### `CoreReader.Adopted.uncertainFacet012`

`CoreReader/Adopted.lean:243–246`; def.

```lean
def uncertainFacet012 : Facet (Bool × Bool) :=
  .empirical [temperatureRecord, temperatureRecord] (fun _ => True)
    (fun w => w.1 = true) (fun w => w.2 = true ∨ w.2 = false)

```

#### `CoreReader.Adopted.uncertainSupported012`

`CoreReader/Adopted.lean:247–258`; theorem.

```lean
theorem uncertainSupported012 :
    empiricalSpecification [temperatureRecord, temperatureRecord] (fun _ => True)
      (fun w => w.1 = true) (fun w => w.2 = true ∨ w.2 = false) ∧
    Compatible [temperatureRecord, temperatureRecord] (true,true) ∧
    Compatible [temperatureRecord, temperatureRecord] (true,false) := by
  refine ⟨grounds012Singleton uncertainFacet012 ?_, temperatureCompatible true, temperatureCompatible false⟩
  refine ⟨⟨(true,false), temperatureCompatible false, trivial⟩, ?_, ?_⟩
  · intro w hw _; exact hw temperatureRecord (by simp)
  · intro w _; cases w.2 <;> simp

                                                                        
                                                                
```

#### `CoreReader.Adopted.InferenceExamined`

`CoreReader/Adopted.lean:259–261`; def.

```lean
def InferenceExamined {W : Type} (premises : Theory W) (conclusion : Claim W)
    (accepted : Bool) : Prop := accepted = true ↔ Entails premises conclusion

```

#### `CoreReader.Adopted.inferenceChecked012`

`CoreReader/Adopted.lean:262–272`; theorem.

```lean
theorem inferenceChecked012 :
    inferentialSpecification (singleton (fun n : Nat => n = 2)) (fun n => n + 1 = 3) ∧
    InferenceExamined (emptyTheory : Theory Bool) (fun w => w = true) false ∧
    Models (emptyTheory : Theory Bool) false ∧ ¬ ((fun w : Bool => w = true) false) := by
  refine ⟨grounds012Singleton arithmeticFacet noUniversalChain.1, ?_, (by intro p hp; cases hp), by decide⟩
  constructor
  · intro h; cases h
  · intro h; exact False.elim (consistentIncomplete.2.1 h)

                                                                       
                                                                                   
```

#### `CoreReader.Adopted.closedPosition012`

`CoreReader/Adopted.lean:273–274`; def.

```lean
def closedPosition012 : ValuePosition Bool := { switchPosition with response := fun _ => none }

```

#### `CoreReader.Adopted.closedCriticism012`

`CoreReader/Adopted.lean:275–279`; theorem.

```lean
theorem closedCriticism012 : ¬ ValueProcedure closedPosition012 := by
  intro h
  obtain ⟨answer, ha, _⟩ := h.2.2.2 false trivial rfl
  cases ha

```

#### `CoreReader.Adopted.valueFulfilled012`

`CoreReader/Adopted.lean:280–284`; theorem.

```lean
theorem valueFulfilled012 : valueSpecification switchPosition :=
  grounds012Singleton _ switchValueProcedure

                                                                             
                                                                     
```

#### `CoreReader.Adopted.ClaimNoStronger`

`CoreReader/Adopted.lean:285–286`; def.

```lean
def ClaimNoStronger {W : Type} (weaker stronger : Claim W) : Prop := ∀ w, stronger w → weaker w

```

#### `CoreReader.Adopted.qualitativeProportionality012`

`CoreReader/Adopted.lean:287–295`; theorem.

```lean
theorem qualitativeProportionality012 :
    ClaimNoStronger (fun f : Nat → Bool => f 0 = true) allTrue ∧
    ¬ ClaimNoStronger allTrue (fun f : Nat → Bool => f 0 = true) ∧
    valueSpecification switchPosition := by
  refine ⟨fun _ h => h 0, ?_, valueFulfilled012⟩
  intro h
  have bad := h (localGenerator 0) rfl 1
  cases bad

```

#### `CoreReader.Adopted.scopeRole012`

`CoreReader/Adopted.lean:296–300`; def.

```lean
def scopeRole012 : AssessmentMethod → String
  | .measurement => "identify the output at the observed input zero"
  | .repetition => "check the same local conclusion against repeated input-zero observations"
  | .framework => "compare only the declared input; keep broader claims separate"

```

#### `CoreReader.Adopted.scopeRoleContent012`

`CoreReader/Adopted.lean:301–305`; def.

```lean
def scopeRoleContent012 : AssessmentMethod → Prop
  | .measurement => Supports [zeroRecord] (fun f => f 0 = true)
  | .repetition => Supports [zeroRecord, zeroRecord] (fun f => f 0 = true)
  | .framework => ¬ Supports [zeroRecord] allTrue

```

#### `CoreReader.Adopted.localScopeAccount012`

`CoreReader/Adopted.lean:306–317`; def.

```lean
def localScopeAccount012 : ScopeAccount Nat where
  claim n := (localGenerator 0) n = true
  conditions _ := True
  observationScope n := n = 0
  relevant a b := a = b
  compared a b := a = 0 ∧ b = 0
  used _ := True
  role := scopeRole012
  explains method text claim conditions :=
    text = scopeRole012 method ∧ claim = (fun n => localGenerator 0 n = true) ∧
    conditions = (fun _ => True) ∧ scopeRoleContent012 method

```

#### `CoreReader.Adopted.scopeFulfilled012`

`CoreReader/Adopted.lean:318–329`; theorem.

```lean
theorem scopeFulfilled012 : scopeSpecification localScopeAccount012 := by
  constructor
  · intro a b h
    exact ⟨trivial, trivial, h.1, h.2, h.1.trans h.2.symm⟩
  · intro method _
    refine ⟨?_, rfl, rfl, rfl, ?_⟩
    · cases method <;> decide
    · cases method with
      | measurement => exact singleObservation.2.2.1
      | repetition => intro f hf; exact hf zeroRecord (by simp)
      | framework => exact singleObservation.2.2.2

```

#### `CoreReader.Adopted.capabilityFulfilled012`

`CoreReader/Adopted.lean:330–343`; theorem.

```lean
theorem capabilityFulfilled012 :
    capabilitySpecification outputOnlyProcess OutputContract ∧
    capabilitySpecification explainedProcess FullProcessContract ∧
    (∃ certificate : ExternalCertificate outputOnlyProcess,
      certificate.assessorId ≠ certificate.assessedId ∧ OutputContract outputOnlyProcess) ∧
    ¬ ExplanationContract outputOnlyProcess := by
  refine ⟨grounds012Singleton _ (processContractDischarged _ _ outputCorrectByEvaluation),
    grounds012Singleton _ (processContractDischarged _ _ ?_),
    ⟨externalOutputCertificate, externalOutputCertificate.distinctParticipants,
      externalOutputCertificate.outputCorrect⟩, outputOnlyNoExplanation⟩
  exact ⟨fun _ => rfl, .doubleInput, rfl, fun _ => rfl⟩

                                                                              
                                                                                  
```

#### `CoreReader.Adopted.OwnCapability012`

`CoreReader/Adopted.lean:344–346`; def.

```lean
def OwnCapability012 (owner claimant : Nat) (process : Process) (contract : Claim Process) : Prop :=
  owner = claimant ∧ capabilitySpecification process contract

```

#### `CoreReader.Adopted.ownCapability012`

`CoreReader/Adopted.lean:347–352`; theorem.

```lean
theorem ownCapability012 : OwnCapability012 7 7 outputOnlyProcess OutputContract :=
  ⟨rfl, capabilityFulfilled012.1⟩

                                                                             
                                                                           
                                                              
```

#### `CoreReader.Adopted.CompleteCharter012`

`CoreReader/Adopted.lean:353–363`; def.

```lean
def CompleteCharter012 (system : CoreReader.Integration.System)
    (world : CoreReader.Integration.World) : Prop :=
  generationSpecification (system.policy world) ∧
  consistencySpecification
    ⟨CoreReader.Integration.systemHeld system, CoreReader.Integration.systemContext system, 0⟩
    ⟨CoreReader.Integration.systemHeld system, CoreReader.Integration.systemContext system, 0⟩ false ∧
  reflexivitySpecification ((system.rules world).map legacyRule) (fun s => s.owner = system.owner)
    (legacyPerformed (system.rules world) (system.work world)) ∧
  (system.policy world).current system.method.form ∧
  (system.policy world).current system.principleForm

```

#### `CoreReader.Adopted.completeCharter012`

`CoreReader/Adopted.lean:364–371`; theorem.

```lean
theorem completeCharter012 : CompleteCharter012 CoreReader.Integration.actualSystem CoreReader.Integration.actual := by
  refine ⟨CoreReader.Integration.charterChecked.1,
    ⟨CoreReader.Integration.jointConsistent, ?_⟩,
    legacyReflexivity 0 _ _ (completeOwnWork_reflexive 0), rfl, rfl⟩
  rintro (h | h)
  · exact False.elim (h ⟨fun _ => Iff.rfl, fun _ => Iff.rfl, fun _ _ => Iff.rfl, fun _ => Iff.rfl⟩)
  · exact False.elim (h rfl)

```

#### `CoreReader.Adopted.charterWithoutGrounds012`

`CoreReader/Adopted.lean:372–391`; theorem.

```lean
theorem charterWithoutGrounds012 :
    CompleteCharter012 CoreReader.Integration.actualSystem CoreReader.Integration.actual ∧
    Admissible CoreReader.Integration.held CoreReader.Integration.context CoreReader.Integration.actual ∧
    Compatible [CoreReader.Integration.costAllowanceRecord] CoreReader.Integration.actual ∧
    Articulated (canonicalArticulation CoreReader.Integration.unsupportedCapabilityFacet) ∧
    ¬ Supports [CoreReader.Integration.costAllowanceRecord] CoreReader.Integration.capability ∧
    ¬ Grounds012 CoreReader.Integration.capability canonicalArticulation
      [CoreReader.Integration.unsupportedCapabilityFacet]
      (taskOfFacet CoreReader.Integration.unsupportedCapabilityFacet) := by
  refine ⟨completeCharter012, CoreReader.Integration.actualAdmissible,
    (by intro r hr; cases List.mem_singleton.mp hr; rfl),
    ⟨by simp [canonicalArticulation, CoreReader.Integration.unsupportedCapabilityFacet],
      by simp [canonicalArticulation, CoreReader.Integration.unsupportedCapabilityFacet]⟩,
    CoreReader.Integration.costDoesNotSupportOutput, ?_⟩
  intro h
  have checked := (h.2 CoreReader.Integration.unsupportedCapabilityFacet (by simp)).2.2.2.1
  exact CoreReader.Integration.costDoesNotSupportOutput (fun w hw => checked.2.1 w hw trivial)

                                                                                
                                                                        
```

#### `CoreReader.Adopted.groundsPermission012`

`CoreReader/Adopted.lean:392–395`; def.

```lean
def groundsPermission012 {W : Type} (enabled : Bool) (claim : Claim W)
    (a : Facet W → Articulation W) (facets : List (Facet W)) (task : AssessmentTask W) : Prop :=
  if enabled then Grounds012 claim a facets task else True

```

#### `CoreReader.Adopted.GroundsProvision012`

`CoreReader/Adopted.lean:396–399`; def.

```lean
def GroundsProvision012 (enabled : Bool) : Prop :=
  ∀ (claim : Claim (Nat → Bool)) a facets task,
    groundsPermission012 enabled claim a facets task → Grounds012 claim a facets task

```

#### `CoreReader.Adopted.groundsProvision012Meaning`

`CoreReader/Adopted.lean:400–411`; theorem.

```lean
theorem groundsProvision012Meaning (enabled : Bool) : GroundsProvision012 enabled ↔ enabled = true := by
  cases enabled with
  | true => exact ⟨fun _ => rfl, fun _ _ _ _ _ h => h⟩
  | false =>
    constructor
    · intro h
      exact False.elim (scopeStrength012.2.2.1 (h globalFacet012.claim canonicalArticulation [globalFacet012] (taskOfFacet globalFacet012) trivial))
    · intro h; cases h

                                                                        
                                                                           
                                            
```

#### `CoreReader.Adopted.groundsExperimentTask012`

`CoreReader/Adopted.lean:412–414`; def.

```lean
def groundsExperimentTask012 : AssessmentTask (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) allTrue (fun _ => True)

```

#### `CoreReader.Adopted.groundsExperiment012`

`CoreReader/Adopted.lean:415–418`; def.

```lean
noncomputable def groundsExperiment012 (enabled : Bool) : Bool :=
  @decide (groundsPermission012 enabled allTrue canonicalArticulation [globalFacet012]
    groundsExperimentTask012) (Classical.propDecidable _)

```

#### `CoreReader.Adopted.groundsPosition012`

`CoreReader/Adopted.lean:419–432`; def.

```lean
noncomputable def groundsPosition012 : ValuePosition Bool where
  Position := Bool
  Outcome := Bool
  adopted := true
  selected := id
  outcome _ enabled := groundsExperiment012 enabled
  objective accepted := accepted = false
  constraints _ enabled := GroundsProvision012 enabled
  starting := singleton (fun enabled => enabled = true)
  reasons := [fun _ _ => Compatible [zeroRecord] (localGenerator 0) ∧ ¬ allTrue (localGenerator 0)]
  limits _ := True
  relevantCriticism _ := ¬ Supports [zeroRecord] allTrue
  response _ := some "retain local support and reject the unsupported universal conclusion"

```

#### `CoreReader.Adopted.groundsPosition012Checked`

`CoreReader/Adopted.lean:433–451`; theorem.

```lean
theorem groundsPosition012Checked : ValueProcedure groundsPosition012 := by
  refine ⟨by simp [groundsPosition012], ?_, ?_, ?_⟩
  · refine ⟨true, (modelsSingleton _ _).2 rfl, trivial, rfl, ?_⟩
    intro reason hr
    cases List.mem_singleton.mp hr
    refine ⟨(zeroCompatible _).2 rfl, ?_⟩
    intro h; have bad := h 1; cases bad
  · intro w _ _ reasons
    have counterworld := reasons _ (List.mem_singleton.mpr rfl)
    change Compatible [zeroRecord] (localGenerator 0) ∧ ¬ allTrue (localGenerator 0) at counterworld
    have unsupported : ¬ Grounds012 allTrue canonicalArticulation [globalFacet012] groundsExperimentTask012 := by
      intro h
      have discharged := (h.2 globalFacet012 (by simp)).2.2.2.1
      exact counterworld.2 (discharged.2.1 (localGenerator 0) counterworld.1 trivial)
    refine ⟨?_, (groundsProvision012Meaning true).2 rfl⟩
    exact @decide_eq_false (groundsPermission012 true allTrue canonicalArticulation [globalFacet012]
      groundsExperimentTask012) (Classical.propDecidable _) unsupported
  · intro w _ _; exact ⟨_, rfl, by decide⟩

```

#### `CoreReader.Adopted.groundsRationaleExperiment012`

`CoreReader/Adopted.lean:452–467`; theorem.

```lean
theorem groundsRationaleExperiment012 :
    Compatible [zeroRecord] (localGenerator 0) ∧ ¬ allTrue (localGenerator 0) ∧
    groundsExperiment012 true = false ∧ groundsExperiment012 false = true ∧
    groundsPosition012.outcome true true = groundsExperiment012 true ∧
    groundsPosition012.outcome true false = groundsExperiment012 false := by
  refine ⟨(zeroCompatible _).2 rfl, ?_, ?_, ?_, rfl, rfl⟩
  · intro h; have bad := h 1; cases bad
  · have actualReasons : ∀ reason ∈ groundsPosition012.reasons, reason true groundsPosition012.adopted := by
      intro reason member
      cases List.mem_singleton.mp member
      refine ⟨(zeroCompatible _).2 rfl, ?_⟩
      intro h; have bad := h 1; cases bad
    exact (groundsPosition012Checked.2.2.1 true ((modelsSingleton _ _).2 rfl) trivial actualReasons).1
  · exact @decide_eq_true (groundsPermission012 false allTrue canonicalArticulation [globalFacet012]
      groundsExperimentTask012) (Classical.propDecidable _) trivial

```

#### `CoreReader.Adopted.groundsOnGrounds012`

`CoreReader/Adopted.lean:468–477`; theorem.

```lean
theorem groundsOnGrounds012 :
    Grounds012 (fun enabled => GroundsProvision012 enabled) canonicalArticulation [.value groundsPosition012] (.value groundsPosition012) ∧
    groundsPosition012.limits true ∧ groundsPosition012.relevantCriticism true := by
  have same : (Facet.value groundsPosition012).claim = (fun enabled => GroundsProvision012 enabled) := by
    funext enabled
    exact propext (groundsProvision012Meaning enabled).symm
  refine ⟨?_, trivial, singleObservation.2.2.2⟩
  rw [← same]
  exact grounds012Singleton _ groundsPosition012Checked

```

#### `CoreReader.Adopted.reflexiveTargets012`

`CoreReader/Adopted.lean:478–492`; theorem.

```lean
theorem reflexiveTargets012 :
    reflexivitySpecification ((ownRules 0).map legacyRule) (fun s => s.owner = 0)
      (legacyPerformed (ownRules 0) (completeOwnWork 0)) ∧
    (∀ phase, Performed (completeOwnWork 0) (.process 0 0 phase) .assessment) ∧
    Performed (completeOwnWork 0) (.system 0) .assessment ∧
    reflexivitySpecification ([applicationRule].map legacyRule) (fun s => s.owner = 0)
      (legacyPerformed [applicationRule] applicationWork) ∧
    ¬ Performed applicationWork (.system 0) .assessment := by
  refine ⟨legacyReflexivity 0 _ _ (completeOwnWork_reflexive 0), ?_,
    ownAssessmentPerformed 0 (.system 0) (by simp [ownSubjects]),
    legacyReflexivity 0 _ _ applicationWork_reflexive, (applicabilityRetained 0 [] []).2.2.2⟩
  intro phase
  apply ownAssessmentPerformed
  cases phase <;> simp [ownSubjects]

```

#### `CoreReader.Adopted.achievementSupported012`

`CoreReader/Adopted.lean:493–502`; theorem.

```lean
theorem achievementSupported012 :
    Grounds012 transitionAchievement canonicalArticulation [transitionFacet] (taskOfFacet transitionFacet) ∧
    Compatible [transitionPerformanceRecord] .extend ∧
    transitionAchievement .extend ∧ ¬ transitionAchievement .inflate ∧
    ¬ Supports [transitionReportRecord] transitionAchievement := by
  refine ⟨grounds012Singleton _ transitionFacetDischarged, ?_, ?_, ?_, transitionReportDoesNotSupport.2.2⟩
  · exact (transitionPerformanceCompatible .extend).mpr rfl
  · simp [transitionAchievement, transitionBefore, transitionAfter, Expanded, baseState, extendedState]
  · simp [transitionAchievement, transitionBefore, transitionAfter, Expanded, baseState, inflatedState]

```

#### `CoreReader.Adopted.semanticOrder012`

`CoreReader/Adopted.lean:503–506`; theorem.

```lean
theorem semanticOrder012 : ∀ p q : Claim Bool,
    ∀ r, union (singleton p) (singleton q) r ↔ union (singleton q) (singleton p) r :=
  representationOrderIrrelevant

```

#### `CoreReader.Adopted.clearFalseArgument012`

`CoreReader/Adopted.lean:507–509`; def.

```lean
def clearFalseArgument012 : Articulation Bool :=
  ⟨["the actual switch is on"], singleton (fun w => w = true), [fun w => w = true], fun _ => True⟩

```

#### `CoreReader.Adopted.clearFalseReason012`

`CoreReader/Adopted.lean:510–513`; theorem.

```lean
theorem clearFalseReason012 :
    Articulated clearFalseArgument012 ∧ ¬ Models clearFalseArgument012.assumptions false :=
  ⟨⟨by simp [clearFalseArgument012], by simp [clearFalseArgument012]⟩, consistentFalse.2⟩

```

#### `CoreReader.Adopted.valueNeutralRecord012`

`CoreReader/Adopted.lean:514–515`; def.

```lean
def valueNeutralRecord012 : Record Bool := ⟨fun _ => true, true⟩

```

#### `CoreReader.Adopted.valueNotFact012`

`CoreReader/Adopted.lean:516–527`; theorem.

```lean
theorem valueNotFact012 :
    valueSpecification switchPosition ∧
    Compatible [valueNeutralRecord012] false ∧
    ¬ Supports [valueNeutralRecord012] switchPosition.commitment ∧
    ¬ Entails (emptyTheory : Theory Bool) switchPosition.commitment := by
  have compatible : Compatible [valueNeutralRecord012] false := by
    intro r hr; cases List.mem_singleton.mp hr; rfl
  refine ⟨valueFulfilled012, compatible, ?_, valueWithoutSelfProof.2.2.1⟩
  intro h
  have bad := h false compatible
  cases bad

```

#### `CoreReader.Adopted.wrongExplanation012`

`CoreReader/Adopted.lean:528–529`; def.

```lean
def wrongExplanation012 : Implementation := { identityImpl with explanation := fun n => n + 1 }

```

#### `CoreReader.Adopted.internalReasonDistinguishes012`

`CoreReader/Adopted.lean:530–539`; theorem.

```lean
theorem internalReasonDistinguishes012 :
    (∀ n, identityImpl.run n = wrongExplanation012.run n) ∧
    Feasible identityRequirements identityImpl ∧ Feasible identityRequirements wrongExplanation012 ∧
    Relevant identityRequirements identityImpl (.method .explanation) ∧
    ¬ Relevant identityRequirements wrongExplanation012 (.method .explanation) := by
  refine ⟨fun _ => rfl, identityFeasible, identityFeasible, internalReasons.1, ?_⟩
  intro h
  have bad := h.2 0 trivial
  cases bad

```

#### `CoreReader.Adopted.inventoryCases012`

`CoreReader/Adopted.lean:540–546`; theorem.

```lean
theorem inventoryCases012 : ∀ kind : InventoryKind,
    Available [⟨kind, .copy⟩, ⟨kind, .copy⟩] .copy ∧
    ¬ Available [⟨kind, .copy⟩, ⟨kind, .copy⟩] .successor := by
  intro kind
  simp [Available]


```

#### `CoreReader.Adopted.selfExemptRule012`

`CoreReader/Adopted.lean:547–549`; def.

```lean
def selfExemptRule012 : ReflexiveRule Nat Nat Bool :=
  ⟨⟨0,1⟩, .assessment, fun _ => True, id,
    fun input output => output = ownArithmeticPrinciple input⟩
```

#### `CoreReader.Adopted.selfExemptPerformed012`

`CoreReader/Adopted.lean:550–552`; def.

```lean
def selfExemptPerformed012 (key : PrincipleKey) (target input : Nat) (output : Bool) : Prop :=
  key = ⟨0,1⟩ ∧ target = 1 ∧ input = target ∧ output = ownArithmeticPrinciple input

```

#### `CoreReader.Adopted.openSelfExempt012`

`CoreReader/Adopted.lean:553–562`; theorem.

```lean
theorem openSelfExempt012 :
    generationSpecification openPolicy ∧ openPolicy.revisable ⟨.principle,0⟩ ∧
    selfExemptPerformed012 ⟨0,1⟩ 1 1 true ∧
    selfExemptRule012.applicable 0 ∧
    ¬ reflexivitySpecification [selfExemptRule012] (fun target => target = 0) selfExemptPerformed012 := by
  refine ⟨⟨Or.inl rfl, fun _ _ => trivial⟩, trivial, ⟨rfl,rfl,rfl,by decide⟩, trivial, ?_⟩
  intro h
  obtain ⟨outcome, performed, _⟩ := h.2 selfExemptRule012 (by simp) 0 rfl trivial
  cases performed.2.1

```

#### `CoreReader.Adopted.ownPhilosophyStatus012`

`CoreReader/Adopted.lean:563–572`; theorem.

```lean
theorem ownPhilosophyStatus012 :
    ¬ choiceSpecification CoreReader.Integration.proposalRequirements
      (CoreReader.Integration.currentPhilosophy CoreReader.Integration.actualSystem CoreReader.Integration.actual).implementation
      [.status .standing] ∧
    choiceSpecification CoreReader.Integration.proposalRequirements
      (CoreReader.Integration.currentPhilosophy CoreReader.Integration.actualSystem CoreReader.Integration.actual).implementation
      [.method .output] :=
  ⟨CoreReader.Integration.existingPhilosophyNotPrivileged.2.2.1,
    CoreReader.Integration.existingPhilosophyNotPrivileged.2.2.2.1⟩

```

#### `CoreReader.Adopted.jointContext012`

`CoreReader/Adopted.lean:573–575`; def.

```lean
def jointContext012 : Context (Bool × Bool) Unit :=
  ⟨emptyTheory, fun _ w => w.2 = true, fun _ => True⟩

```

#### `CoreReader.Adopted.jointImplicationConflict012`

`CoreReader/Adopted.lean:576–587`; theorem.

```lean
theorem jointImplicationConflict012 :
    Consequence jointTheory jointContext012 () true ∧
    Consequence jointTheory jointContext012 () false ∧
    ¬ Consistent jointTheory jointContext012 := by
  have positive : Consequence jointTheory jointContext012 () true := by
    intro w hw
    exact (hw.1 premiseRule (Or.inr (Or.inl rfl))) (hw.1 premiseP (Or.inl rfl))
  have negative : Consequence jointTheory jointContext012 () false := by
    intro w hw
    exact hw.1 premiseNotQ (Or.inr (Or.inr rfl))
  exact ⟨positive, negative, conflictRequiresChange _ _ () positive negative⟩

```

#### `CoreReader.Adopted.tensionContext012`

`CoreReader/Adopted.lean:588–590`; def.

```lean
def tensionContext012 : Context Nat Unit :=
  ⟨emptyTheory, fun _ n => n ≤ 6, fun _ => True⟩

```

#### `CoreReader.Adopted.tensionConsistent012`

`CoreReader/Adopted.lean:591–596`; theorem.

```lean
theorem tensionConsistent012 :
    Consistent (union (singleton (fun n : Nat => 4 ≤ n)) (singleton (fun n => n ≤ 6))) tensionContext012 := by
  apply consequenceConsistency
  exact ⟨5, (modelsUnion _ _ _).2 ⟨(modelsSingleton _ _).2 (by decide),
    (modelsSingleton _ _).2 (by decide)⟩, (by intro p hp; cases hp), trivial⟩

```

#### `CoreReader.Adopted.qualitativeUnmeasured012`

`CoreReader/Adopted.lean:597–605`; theorem.

```lean
theorem qualitativeUnmeasured012 :
    inferentialSpecification (singleton (fun on : Bool => on = true)) (fun on => on ≠ false) ∧
    usesObservation (Facet.inferential (singleton (fun on : Bool => on = true)) (fun on => on ≠ false)) = false := by
  refine ⟨grounds012Singleton _ ⟨⟨true, (modelsSingleton _ _).2 rfl⟩, ?_⟩, rfl⟩
  intro on hon hf
  have ht := (modelsSingleton (fun on : Bool => on = true) on).1 hon
  cases ht.symm.trans hf


```

#### `CoreReader.Adopted.allStatusOnly012`

`CoreReader/Adopted.lean:606–612`; theorem.

```lean
theorem allStatusOnly012 : ∀ kind : StatusKind,
    ¬ choiceSpecification identityRequirements identityImpl [.status kind] :=
  statusOnlyFails identityRequirements identityImpl

                                                                               
                                                                             
                                           
```

#### `CoreReader.Adopted.drawWeight012`

`CoreReader/Adopted.lean:613–613`; def.

```lean
def drawWeight012 (_draw : Bool) : Nat := 1
```

#### `CoreReader.Adopted.randomTrial012`

`CoreReader/Adopted.lean:614–616`; def.

```lean
def randomTrial012 (draw : Bool) : Trial :=
  ⟨0, if draw then 1 else 2, if draw then 1 else 2⟩

```

#### `CoreReader.Adopted.randomOutcomes012`

`CoreReader/Adopted.lean:617–628`; theorem.

```lean
theorem randomOutcomes012 :
    drawWeight012 true > 0 ∧ drawWeight012 false > 0 ∧
    drawWeight012 true = drawWeight012 false ∧
    Reproduced (randomTrial012 true) (randomTrial012 false) ∧
    (randomTrial012 true).actualOutcome ≠ (randomTrial012 false).actualOutcome ∧
    (∀ draw, Verified (randomTrial012 draw) ∧ Bounded (randomTrial012 draw)) := by
  refine ⟨by decide, by decide, rfl, rfl, by decide, ?_⟩
  intro draw
  cases draw <;> simp [Verified, Bounded, randomTrial012]


                                                                                  
```

#### `CoreReader.Adopted.originalGlobalTask012`

`CoreReader/Adopted.lean:629–630`; def.

```lean
def originalGlobalTask012 : AssessmentTask (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) allTrue (fun _ => True)
```

#### `CoreReader.Adopted.originalLocalTask012`

`CoreReader/Adopted.lean:631–633`; def.

```lean
def originalLocalTask012 : AssessmentTask (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) (fun f => f 0 = true) (fun _ => True)

```

#### `CoreReader.Adopted.circularGlobalFacet012`

`CoreReader/Adopted.lean:634–635`; def.

```lean
def circularGlobalFacet012 : Facet (Nat → Bool) := .inferential (singleton allTrue) allTrue

```

#### `CoreReader.Adopted.circularGlobalConditional012`

`CoreReader/Adopted.lean:636–640`; theorem.

```lean
theorem circularGlobalConditional012 : FacetDischarged circularGlobalFacet012 := by
  refine ⟨⟨fun _ => true, (modelsSingleton _ _).2 (fun _ => rfl)⟩, ?_⟩
  intro f hf
  exact (modelsSingleton _ _).1 hf

```

#### `CoreReader.Adopted.circularSubstitutionRejected012`

`CoreReader/Adopted.lean:641–656`; theorem.

```lean
theorem circularSubstitutionRejected012 :
    Grounds012 allTrue canonicalArticulation [circularGlobalFacet012] (taskOfFacet circularGlobalFacet012) ∧
    ¬ NatureAppropriate originalGlobalTask012 circularGlobalFacet012 ∧
    ¬ Grounds012 allTrue canonicalArticulation [circularGlobalFacet012] originalGlobalTask012 := by
  have inappropriate : ¬ NatureAppropriate originalGlobalTask012 circularGlobalFacet012 := by
    intro h
    have equalPremises := h.1
    have originalMember : singleton (fun f => Compatible [zeroRecord] f ∧ True) allTrue := equalPremises ▸ (show singleton allTrue allTrue from rfl)
    have equalClaims : allTrue = (fun f => Compatible [zeroRecord] f ∧ True) := originalMember
    have claimedAll := (congrFun equalClaims (localGenerator 0)).mpr ⟨(zeroCompatible _).2 rfl, trivial⟩
    have bad := claimedAll 1
    cases bad
  refine ⟨grounds012Singleton _ circularGlobalConditional012, inappropriate, ?_⟩
  intro h
  exact inappropriate (h.2 circularGlobalFacet012 (by simp)).2.2.2.2

```

#### `CoreReader.Adopted.observedPremises012`

`CoreReader/Adopted.lean:657–657`; def.

```lean
def observedPremises012 : Theory (Nat → Bool) := singleton (fun f => Compatible [zeroRecord] f ∧ True)
```

#### `CoreReader.Adopted.observedInferenceFacet012`

`CoreReader/Adopted.lean:658–660`; def.

```lean
def observedInferenceFacet012 : Facet (Nat → Bool) :=
  .inferential observedPremises012 (fun f => f 0 = true)

```

#### `CoreReader.Adopted.observedInferenceChecked012`

`CoreReader/Adopted.lean:661–665`; theorem.

```lean
theorem observedInferenceChecked012 : FacetDischarged observedInferenceFacet012 := by
  refine ⟨⟨localGenerator 0, (modelsSingleton _ _).2 ⟨(zeroCompatible _).2 rfl, trivial⟩⟩, ?_⟩
  intro f hf
  exact (zeroCompatible _).1 ((modelsSingleton _ _).1 hf).1

```

#### `CoreReader.Adopted.sameEmpiricalTaskTwoMethods012`

`CoreReader/Adopted.lean:666–677`; theorem.

```lean
theorem sameEmpiricalTaskTwoMethods012 :
    Grounds012 (fun f => f 0 = true) canonicalArticulation [localFacet012] originalLocalTask012 ∧
    Grounds012 (fun f => f 0 = true) canonicalArticulation [observedInferenceFacet012] originalLocalTask012 := by
  refine ⟨grounds012Singleton _ localFacetChecked012, ?_⟩
  refine ⟨by simp, ?_⟩
  intro f hf
  cases List.mem_singleton.mp hf
  exact ⟨rfl, canonicalArticulated _ observedInferenceChecked012,
    canonicalFacetArticulated _, observedInferenceChecked012, rfl, rfl, fun _ _ => trivial⟩

                                                                             
                                                                           
```

#### `CoreReader.Adopted.originalUncertaintyTask012`

`CoreReader/Adopted.lean:678–680`; def.

```lean
def originalUncertaintyTask012 : AssessmentTask (Bool × Bool) :=
  .empirical [temperatureRecord, temperatureRecord] (fun _ => True)
    (fun w => w.1 = true) (fun w => w.2 = true)
```

#### `CoreReader.Adopted.uncertaintyBypassFacet012`

`CoreReader/Adopted.lean:681–684`; def.

```lean
def uncertaintyBypassFacet012 : Facet (Bool × Bool) :=
  .inferential (singleton (fun w => Compatible [temperatureRecord, temperatureRecord] w ∧ True))
    (fun w => w.1 = true)

```

#### `CoreReader.Adopted.uncertaintyBypassChecked012`

`CoreReader/Adopted.lean:685–689`; theorem.

```lean
theorem uncertaintyBypassChecked012 : FacetDischarged uncertaintyBypassFacet012 := by
  refine ⟨⟨(true,false), (modelsSingleton _ _).2 ⟨temperatureCompatible false, trivial⟩⟩, ?_⟩
  intro w hw
  exact ((modelsSingleton _ _).1 hw).1 temperatureRecord (by simp)

```

#### `CoreReader.Adopted.uncertaintySubstitutionRejected012`

`CoreReader/Adopted.lean:690–701`; theorem.

```lean
theorem uncertaintySubstitutionRejected012 :
    FacetDischarged uncertaintyBypassFacet012 ∧
    ¬ NatureAppropriate originalUncertaintyTask012 uncertaintyBypassFacet012 ∧
    ¬ Grounds012 (fun w : Bool × Bool => w.1 = true) canonicalArticulation
      [uncertaintyBypassFacet012] originalUncertaintyTask012 := by
  have inappropriate : ¬ NatureAppropriate originalUncertaintyTask012 uncertaintyBypassFacet012 := by
    intro h
    have bad := h.2.2 (true,false) (temperatureCompatible false)
    cases bad
  exact ⟨uncertaintyBypassChecked012, inappropriate,
    fun h => inappropriate (h.2 uncertaintyBypassFacet012 (by simp)).2.2.2.2⟩

```

#### `CoreReader.Adopted.selectedFactFacet012`

`CoreReader/Adopted.lean:702–704`; def.

```lean
def selectedFactFacet012 : Facet Bool :=
  .empirical [switchRecord] (fun _ => True) switchPosition.commitment (fun _ => True)

```

#### `CoreReader.Adopted.valueFactSubstitutionRejected012`

`CoreReader/Adopted.lean:705–711`; theorem.

```lean
theorem valueFactSubstitutionRejected012 :
    FacetDischarged selectedFactFacet012 ∧ valueSpecification switchPosition ∧
    ¬ Grounds012 switchPosition.commitment canonicalArticulation [selectedFactFacet012] (.value switchPosition) := by
  refine ⟨switchEmpiricalDischarged, valueFulfilled012, ?_⟩
  intro h
  exact (h.2 selectedFactFacet012 (by simp)).2.2.2.2

```

#### `CoreReader.Adopted.inferentialContextSubstitutionRejected012`

`CoreReader/Adopted.lean:712–725`; theorem.

```lean
theorem inferentialContextSubstitutionRejected012 :
    FacetDischarged (Facet.inferential (singleton (fun w : Bool => w = true)) (fun w => w = true)) ∧
    ¬ Grounds012 (fun w : Bool => w = true) canonicalArticulation
      [.inferential (singleton (fun w => w = true)) (fun w => w = true)]
      (.inferential emptyTheory (fun w => w = true)) := by
  refine ⟨⟨⟨true, (modelsSingleton _ _).2 rfl⟩, fun w hw => (modelsSingleton (fun w : Bool => w = true) w).1 hw⟩, ?_⟩
  intro h
  have appropriate := (h.2 (.inferential (singleton (fun w : Bool => w = true)) (fun w => w = true)) (by simp)).2.2.2.2
  have same : singleton (fun w : Bool => w = true) = emptyTheory := appropriate.1
  have bad : emptyTheory (fun w : Bool => w = true) := same ▸ (show singleton (fun w : Bool => w = true) (fun w => w = true) from rfl)
  exact bad


                                                                                      
```

#### `CoreReader.Adopted.generationCases`

`CoreReader/Adopted.lean:726–760`; theorem.

```lean
theorem generationCases :
    (Generative openPolicy ∧
    (∀ k : FormKind, openPolicy.revisable ⟨k, 0⟩) ∧
    (∀ t, ¬ Expanded (stableTrace t) (stableTrace (t + 1)))) ∧
    (neutralPolicy.permitsVersion 0 1 ∧ (0 : Nat) ≠ 1 ∧ ¬ Generative neutralPolicy) ∧
    (Generative generatingSystem.policy ∧
    generatingSystem.policy.permitsVersion 0 0 ∧
    ¬ Expanded generatingSystem.current inflatedState ∧
    generatingSystem.current.inventory.length < inflatedState.inventory.length ∧
    generatingSystem.current.abstractionLayers.length < inflatedState.abstractionLayers.length ∧
    generatingSystem.current.vocabulary.length < inflatedState.vocabulary.length ∧
    generatingSystem.execute availableResources = some 6 ∧
    generatingSystem.execute { availableResources with experience := none } = none ∧
    generatingSystem.execute { availableResources with knowledge := none } = none ∧
    generatingSystem.execute { availableResources with collaborator := none } = none ∧
    generatingSystem.execute ⟨none, none, none⟩ = none ∧
    ¬ Expanded generatingSystem.current generatingSystem.stableAction ∧
    generatingSystem.stableAction = generatingSystem.current ∧
    generatingSystem.requirementsMet generatingSystem.stableAction ∧
    generatingSystem.withinBudget generatingSystem.stableAction ∧
    ¬ generatingSystem.withinBudget inflatedState ∧
    StableReason generatingSystem.current inflatedState ∧
    (inflatedAnnouncement = generatingSystem.report inflatedState .successor 0 1 ∧
      inflatedAnnouncement.owner = generatingSystem.owner ∧
      inflatedAnnouncement.before = generatingSystem.current ∧ inflatedAnnouncement.after = inflatedState ∧
      inflatedAnnouncement.reportedNewOperation = .successor ∧
      inflatedAnnouncement.input = 0 ∧ inflatedAnnouncement.expectedOutput = 1 ∧
      ¬ inflatedAnnouncement.claim ∧ ¬ Expanded inflatedAnnouncement.before inflatedAnnouncement.after)) ∧
    (generationSpecification openPolicy ∧
    Expanded baseState (collaborativeRevision availableResources) ∧
    ¬ Expanded baseState (collaborativeRevision { availableResources with collaborator := none }) ∧
    assistedExecution ⟨none, none, none⟩ = none) :=
  ⟨revisionWithoutProgress, permissionNotValuation, generationLimits, collaborativeProgress⟩

                                                                                      
```

#### `CoreReader.Adopted.generationLimits012`

`CoreReader/Adopted.lean:761–802`; theorem.

```lean
theorem generationLimits012 :
    (neutralPolicy.permitsVersion 0 1 ∧ (0 : Nat) ≠ 1 ∧ ¬ Generative neutralPolicy) ∧
    (Generative openPolicy ∧
    (∀ k : FormKind, openPolicy.revisable ⟨k, 0⟩) ∧
    (∀ t, ¬ Expanded (stableTrace t) (stableTrace (t + 1)))) ∧
    (Generative generatingSystem.policy ∧
    generatingSystem.policy.permitsVersion 0 0 ∧
    ¬ Expanded generatingSystem.current inflatedState ∧
    generatingSystem.current.inventory.length < inflatedState.inventory.length ∧
    generatingSystem.current.abstractionLayers.length < inflatedState.abstractionLayers.length ∧
    generatingSystem.current.vocabulary.length < inflatedState.vocabulary.length ∧
    generatingSystem.execute availableResources = some 6 ∧
    generatingSystem.execute { availableResources with experience := none } = none ∧
    generatingSystem.execute { availableResources with knowledge := none } = none ∧
    generatingSystem.execute { availableResources with collaborator := none } = none ∧
    generatingSystem.execute ⟨none, none, none⟩ = none ∧
    ¬ Expanded generatingSystem.current generatingSystem.stableAction ∧
    generatingSystem.stableAction = generatingSystem.current ∧
    generatingSystem.requirementsMet generatingSystem.stableAction ∧
    generatingSystem.withinBudget generatingSystem.stableAction ∧
    ¬ generatingSystem.withinBudget inflatedState ∧
    StableReason generatingSystem.current inflatedState ∧
    (inflatedAnnouncement = generatingSystem.report inflatedState .successor 0 1 ∧
      inflatedAnnouncement.owner = generatingSystem.owner ∧
      inflatedAnnouncement.before = generatingSystem.current ∧ inflatedAnnouncement.after = inflatedState ∧
      inflatedAnnouncement.reportedNewOperation = .successor ∧
      inflatedAnnouncement.input = 0 ∧ inflatedAnnouncement.expectedOutput = 1 ∧
      ¬ inflatedAnnouncement.claim ∧ ¬ Expanded inflatedAnnouncement.before inflatedAnnouncement.after)) ∧
    (generationSpecification openPolicy ∧
    Expanded baseState (collaborativeRevision availableResources) ∧
    ¬ Expanded baseState (collaborativeRevision { availableResources with collaborator := none }) ∧
    assistedExecution ⟨none, none, none⟩ = none) ∧
    (Grounds012 transitionAchievement canonicalArticulation [transitionFacet] (taskOfFacet transitionFacet) ∧
    Compatible [transitionPerformanceRecord] .extend ∧
    transitionAchievement .extend ∧ ¬ transitionAchievement .inflate ∧
    ¬ Supports [transitionReportRecord] transitionAchievement) ∧
    (∀ kind : InventoryKind,
    Available [⟨kind, .copy⟩, ⟨kind, .copy⟩] .copy ∧
    ¬ Available [⟨kind, .copy⟩, ⟨kind, .copy⟩] .successor) :=
  ⟨permissionNotValuation, revisionWithoutProgress, generationLimits, collaborativeProgress, achievementSupported012, inventoryCases012⟩

                                                                                      
```

#### `CoreReader.Adopted.consistencyCases`

`CoreReader/Adopted.lean:803–832`; theorem.

```lean
theorem consistencyCases :
    (Satisfiable (singleton premiseP) ∧ Satisfiable (singleton premiseRule) ∧
    Satisfiable (singleton premiseNotQ) ∧ ¬ Satisfiable jointTheory) ∧
    ((Consequence emptyTheory (assumptionContext true) () true ∧
      Consequence emptyTheory (assumptionContext false) () false) ∧
    (Consequence emptyTheory (meaningContext true) () true ∧
      Consequence emptyTheory (meaningContext false) () false) ∧
    (Consequence emptyTheory (scopeContext true) () true ∧
      Consequence emptyTheory (scopeContext false) () false) ∧
    (∀ b, ∃ w, Admissible emptyTheory (assumptionContext b) w) ∧
    (∀ b, ∃ w, Admissible emptyTheory (meaningContext b) w) ∧
    (∀ b, ∃ w, Admissible emptyTheory (scopeContext b) w)) ∧
    (¬ TruthfulReport (contextSnapshot (assumptionContext true)) (contextSnapshot (assumptionContext false)) false ∧
    ¬ TruthfulReport (contextSnapshot (meaningContext true)) (contextSnapshot (meaningContext false)) false ∧
    ¬ TruthfulReport (contextSnapshot (scopeContext true)) (contextSnapshot (scopeContext false)) false ∧
    ¬ TruthfulReport (contextSnapshot (scopeContext true) 0) (contextSnapshot (scopeContext true) 1) false ∧
    (TruthfulReport (contextSnapshot (assumptionContext true)) (contextSnapshot (assumptionContext false)) true ∧
      ¬ Models (assumptionContext false).assumptions true)) ∧
    (Satisfiable (revisionSlice 0) ∧ Satisfiable (revisionSlice 1) ∧
    ¬ Satisfiable (union (revisionSlice 0) (revisionSlice 1))) ∧
    ((∀ time, Consistent (revisionSlice time) broadBoolContext) ∧
    ¬ Consistent (union (revisionSlice 0) (revisionSlice 1)) broadBoolContext) ∧
    (∀ p q : Claim Bool,
    ∀ r, union (singleton p) (singleton q) r ↔ union (singleton q) (singleton p) r) ∧
    (Consequence jointTheory jointContext012 () true ∧
    Consequence jointTheory jointContext012 () false ∧
    ¬ Consistent jointTheory jointContext012) :=
  ⟨jointConflict, contextDifferences, hiddenContextChangeRejected, revisionCanReverse, sliceConsistency, semanticOrder012, jointImplicationConflict012⟩

                                                                                      
```

#### `CoreReader.Adopted.consistencyLimits012`

`CoreReader/Adopted.lean:833–854`; theorem.

```lean
theorem consistencyLimits012 :
    ((Consequence emptyTheory (assumptionContext true) () true ∧
      Consequence emptyTheory (assumptionContext false) () false) ∧
    (Consequence emptyTheory (meaningContext true) () true ∧
      Consequence emptyTheory (meaningContext false) () false) ∧
    (Consequence emptyTheory (scopeContext true) () true ∧
      Consequence emptyTheory (scopeContext false) () false) ∧
    (∀ b, ∃ w, Admissible emptyTheory (assumptionContext b) w) ∧
    (∀ b, ∃ w, Admissible emptyTheory (meaningContext b) w) ∧
    (∀ b, ∃ w, Admissible emptyTheory (scopeContext b) w)) ∧
    ((∃ budget : Nat, 4 ≤ budget ∧ budget ≤ 6) ∧
    ¬ ((fun n : Nat => 4 ≤ n) = (fun n : Nat => n ≤ 6))) ∧
    (Consistent (singleton (fun w : Bool => w = true)) broadBoolContext ∧
    ¬ Models (singleton (fun w : Bool => w = true)) false ∧
    Consistent (emptyTheory : Theory Bool) broadBoolContext ∧
    ¬ Entails emptyTheory (fun w : Bool => w = true)) ∧
    (Satisfiable (union emptyTheory (singleton (fun w : Bool => w = true))) ∧
    ¬ Entails emptyTheory (fun w : Bool => w = true)) ∧
    (Consistent (union (singleton (fun n : Nat => 4 ≤ n)) (singleton (fun n => n ≤ 6))) tensionContext012) :=
  ⟨contextDifferences, tensionWithoutContradiction, explicitlyConsistentLimits, compatibilityNotEntailment, tensionConsistent012⟩

                                                                                      
```

#### `CoreReader.Adopted.reflexivityCases012`

`CoreReader/Adopted.lean:855–871`; theorem.

```lean
theorem reflexivityCases012 :
    (reflexivitySpecification ((ownRules 0).map legacyRule) (fun s => s.owner = 0)
      (legacyPerformed (ownRules 0) (completeOwnWork 0)) ∧
    (∀ phase, Performed (completeOwnWork 0) (.process 0 0 phase) .assessment) ∧
    Performed (completeOwnWork 0) (.system 0) .assessment ∧
    reflexivitySpecification ([applicationRule].map legacyRule) (fun s => s.owner = 0)
      (legacyPerformed [applicationRule] applicationWork) ∧
    ¬ Performed applicationWork (.system 0) .assessment) ∧
    (Grounds012 (fun enabled => GroundsProvision012 enabled) canonicalArticulation [.value groundsPosition012] (.value groundsPosition012) ∧
    groundsPosition012.limits true ∧ groundsPosition012.relevantCriticism true) ∧
    (Compatible [zeroRecord] (localGenerator 0) ∧ ¬ allTrue (localGenerator 0) ∧
    groundsExperiment012 true = false ∧ groundsExperiment012 false = true ∧
    groundsPosition012.outcome true true = groundsExperiment012 true ∧
    groundsPosition012.outcome true false = groundsExperiment012 false) :=
  ⟨reflexiveTargets012, groundsOnGrounds012, groundsRationaleExperiment012⟩

                                                                                      
```

#### `CoreReader.Adopted.reflexivityLimits012`

`CoreReader/Adopted.lean:872–893`; theorem.

```lean
theorem reflexivityLimits012 :
    (selfTest [1] = true ∧ ownArithmeticPrinciple 0 = false ∧
      ¬ (∀ n, ownArithmeticPrinciple n = true)) ∧
    (localGenerator 0 0 = true ∧ localGenerator 0 1 = false ∧
    Compatible [zeroRecord] (localGenerator 0) ∧
    ¬ Supports [zeroRecord] allTrue ∧ OwnedRevisionExample) ∧
    (Generative openPolicy ∧ ¬ Reflexive 0 (ownRules 0) []) ∧
    (CompleteCharter012 CoreReader.Integration.actualSystem CoreReader.Integration.actual ∧
    Admissible CoreReader.Integration.held CoreReader.Integration.context CoreReader.Integration.actual ∧
    Compatible [CoreReader.Integration.costAllowanceRecord] CoreReader.Integration.actual ∧
    Articulated (canonicalArticulation CoreReader.Integration.unsupportedCapabilityFacet) ∧
    ¬ Supports [CoreReader.Integration.costAllowanceRecord] CoreReader.Integration.capability ∧
    ¬ Grounds012 CoreReader.Integration.capability canonicalArticulation
      [CoreReader.Integration.unsupportedCapabilityFacet]
      (taskOfFacet CoreReader.Integration.unsupportedCapabilityFacet)) ∧
    (generationSpecification openPolicy ∧ openPolicy.revisable ⟨.principle,0⟩ ∧
    selfExemptPerformed012 ⟨0,1⟩ 1 1 true ∧
    selfExemptRule012.applicable 0 ∧
    ¬ reflexivitySpecification [selfExemptRule012] (fun target => target = 0) selfExemptPerformed012) :=
  ⟨selfTestDoesNotProve, selfOriginDoesNotSupport, generationNotReflexivity, charterWithoutGrounds012, openSelfExempt012⟩

                                                                                      
```

#### `CoreReader.Adopted.groundsCases012`

`CoreReader/Adopted.lean:894–906`; theorem.

```lean
theorem groundsCases012 :
    (Grounds012 localFacet012.claim canonicalArticulation [localFacet012] (taskOfFacet localFacet012) ∧
    Articulated (canonicalArticulation globalFacet012) ∧
    ¬ Grounds012 globalFacet012.claim canonicalArticulation [globalFacet012] (taskOfFacet globalFacet012) ∧
    ¬ Grounds012 strongFacet012.claim canonicalArticulation [strongFacet012] (taskOfFacet strongFacet012)) ∧
    (Articulated uninformativeArgument ∧
    ¬ Entails uninformativeArgument.assumptions (fun w : Bool => w = true)) ∧
    (Grounds012 allTrue canonicalArticulation [circularGlobalFacet012] (taskOfFacet circularGlobalFacet012) ∧
    ¬ NatureAppropriate originalGlobalTask012 circularGlobalFacet012 ∧
    ¬ Grounds012 allTrue canonicalArticulation [circularGlobalFacet012] originalGlobalTask012) :=
  ⟨scopeStrength012, articulationNotSupport, circularSubstitutionRejected012⟩

                                                                                      
```

#### `CoreReader.Adopted.empiricalCases012`

`CoreReader/Adopted.lean:907–934`; theorem.

```lean
theorem empiricalCases012 :
    (Grounds012 localFacet012.claim canonicalArticulation [localFacet012] (taskOfFacet localFacet012) ∧
    Articulated (canonicalArticulation globalFacet012) ∧
    ¬ Grounds012 globalFacet012.claim canonicalArticulation [globalFacet012] (taskOfFacet globalFacet012) ∧
    ¬ Grounds012 strongFacet012.claim canonicalArticulation [strongFacet012] (taskOfFacet strongFacet012)) ∧
    (temperatureRecord.test (true,false) = true ∧
    Compatible [temperatureRecord,temperatureRecord] (true,false) ∧
    Compatible [temperatureRecord,temperatureRecord] (true,true) ∧
    ¬ Supports [temperatureRecord] (fun w : Bool × Bool => w.2 = true) ∧
    ¬ Supports [temperatureRecord,temperatureRecord] (fun w : Bool × Bool => w.2 = true) ∧
    Compatible [actionRecord,actionRecord] (true,0) ∧
    Compatible [actionRecord,actionRecord] (true,3) ∧
    ¬ Supports [actionRecord] announcementPosition.consequence ∧
    ¬ Supports [actionRecord,actionRecord] announcementPosition.consequence ∧
    ¬ ValueProcedure announcementPosition) ∧
    (empiricalSpecification [temperatureRecord, temperatureRecord] (fun _ => True)
      (fun w => w.1 = true) (fun w => w.2 = true ∨ w.2 = false) ∧
    Compatible [temperatureRecord, temperatureRecord] (true,true) ∧
    Compatible [temperatureRecord, temperatureRecord] (true,false)) ∧
    (Grounds012 (fun f => f 0 = true) canonicalArticulation [localFacet012] originalLocalTask012 ∧
    Grounds012 (fun f => f 0 = true) canonicalArticulation [observedInferenceFacet012] originalLocalTask012) ∧
    (FacetDischarged uncertaintyBypassFacet012 ∧
    ¬ NatureAppropriate originalUncertaintyTask012 uncertaintyBypassFacet012 ∧
    ¬ Grounds012 (fun w : Bool × Bool => w.1 = true) canonicalArticulation
      [uncertaintyBypassFacet012] originalUncertaintyTask012) :=
  ⟨scopeStrength012, measurementRepeatNotSupport, uncertainSupported012, sameEmpiricalTaskTwoMethods012, uncertaintySubstitutionRejected012⟩

                                                                                      
```

#### `CoreReader.Adopted.inferentialCases012`

`CoreReader/Adopted.lean:935–947`; theorem.

```lean
theorem inferentialCases012 :
    (inferentialSpecification (singleton (fun n : Nat => n = 2)) (fun n => n + 1 = 3) ∧
    InferenceExamined (emptyTheory : Theory Bool) (fun w => w = true) false ∧
    Models (emptyTheory : Theory Bool) false ∧ ¬ ((fun w : Bool => w = true) false)) ∧
    (Satisfiable (union emptyTheory (singleton (fun w : Bool => w = true))) ∧
    ¬ Entails emptyTheory (fun w : Bool => w = true)) ∧
    (FacetDischarged (Facet.inferential (singleton (fun w : Bool => w = true)) (fun w => w = true)) ∧
    ¬ Grounds012 (fun w : Bool => w = true) canonicalArticulation
      [.inferential (singleton (fun w => w = true)) (fun w => w = true)]
      (.inferential emptyTheory (fun w => w = true))) :=
  ⟨inferenceChecked012, compatibilityNotEntailment, inferentialContextSubstitutionRejected012⟩

                                                                                      
```

#### `CoreReader.Adopted.valueCases012`

`CoreReader/Adopted.lean:948–963`; theorem.

```lean
theorem valueCases012 :
    (valueSpecification switchPosition) ∧
    (announcementPosition.reasons ≠ [] ∧ announcementPosition.commitment (true,0) ∧
    (∀ reason, reason ∈ announcementPosition.reasons → reason (true,0) announcementPosition.adopted) ∧
    ¬ announcementPosition.consequence (true,0) ∧ ¬ ValueProcedure announcementPosition) ∧
    (¬ ValueProcedure closedPosition012) ∧
    (ValueProcedure switchPosition ∧
    Satisfiable switchPosition.starting ∧
    ¬ Entails (emptyTheory : Theory Bool) switchPosition.commitment ∧
    (JointAdoption oppositePosition ∧ ¬ ValueProcedure oppositePosition) ∧
    (¬ ValueProcedure contradictoryStartingPosition ∧ ¬ ValueProcedure impossibleAdoptionPosition)) ∧
    (FacetDischarged selectedFactFacet012 ∧ valueSpecification switchPosition ∧
    ¬ Grounds012 switchPosition.commitment canonicalArticulation [selectedFactFacet012] (.value switchPosition)) :=
  ⟨valueFulfilled012, announcementNotBudgetReason, closedCriticism012, valueWithoutSelfProof, valueFactSubstitutionRejected012⟩

                                                                                      
```

#### `CoreReader.Adopted.groundsLimits012`

`CoreReader/Adopted.lean:964–990`; theorem.

```lean
theorem groundsLimits012 :
    (Articulated clearFalseArgument012 ∧ ¬ Models clearFalseArgument012.assumptions false) ∧
    (temperatureRecord.test (true,false) = true ∧
    Compatible [temperatureRecord,temperatureRecord] (true,false) ∧
    Compatible [temperatureRecord,temperatureRecord] (true,true) ∧
    ¬ Supports [temperatureRecord] (fun w : Bool × Bool => w.2 = true) ∧
    ¬ Supports [temperatureRecord,temperatureRecord] (fun w : Bool × Bool => w.2 = true) ∧
    Compatible [actionRecord,actionRecord] (true,0) ∧
    Compatible [actionRecord,actionRecord] (true,3) ∧
    ¬ Supports [actionRecord] announcementPosition.consequence ∧
    ¬ Supports [actionRecord,actionRecord] announcementPosition.consequence ∧
    ¬ ValueProcedure announcementPosition) ∧
    (valueSpecification switchPosition ∧
    Compatible [valueNeutralRecord012] false ∧
    ¬ Supports [valueNeutralRecord012] switchPosition.commitment ∧
    ¬ Entails (emptyTheory : Theory Bool) switchPosition.commitment) ∧
    (ValueProcedure switchPosition ∧
    Satisfiable switchPosition.starting ∧
    ¬ Entails (emptyTheory : Theory Bool) switchPosition.commitment ∧
    (JointAdoption oppositePosition ∧ ¬ ValueProcedure oppositePosition) ∧
    (¬ ValueProcedure contradictoryStartingPosition ∧ ¬ ValueProcedure impossibleAdoptionPosition)) ∧
    (ClaimNoStronger (fun f : Nat → Bool => f 0 = true) allTrue ∧
    ¬ ClaimNoStronger allTrue (fun f : Nat → Bool => f 0 = true) ∧
    valueSpecification switchPosition) :=
  ⟨clearFalseReason012, measurementRepeatNotSupport, valueNotFact012, valueWithoutSelfProof, qualitativeProportionality012⟩

                                                                                      
```

#### `CoreReader.Adopted.scopeCases012`

`CoreReader/Adopted.lean:991–997`; theorem.

```lean
theorem scopeCases012 :
    (scopeSpecification localScopeAccount012) ∧
    ((∀ n : Nat, n = 0 → (fun _ : Nat => true) n = localGenerator 0 n) ∧
    (fun _ : Nat => true) 1 ≠ localGenerator 0 1) :=
  ⟨scopeFulfilled012, hiddenDifference⟩

                                                                                      
```

#### `CoreReader.Adopted.scopeLimits012`

`CoreReader/Adopted.lean:998–1026`; theorem.

```lean
theorem scopeLimits012 :
    ((∃ outside : Nat, outside ≠ 0) ∧
    Compatible [zeroRecord] (fun _ => true) ∧
    Compatible [zeroRecord] (localGenerator 0) ∧
    allTrue (fun _ => true) ∧ ¬ allTrue (localGenerator 0) ∧
    ¬ Supports [zeroRecord] allTrue) ∧
    ((∀ n : Nat, n = 0 → (fun _ : Nat => true) n = localGenerator 0 n) ∧
    (fun _ : Nat => true) 1 ≠ localGenerator 0 1) ∧
    ([zeroRecord].length = 1 ∧
    (∃ f, Compatible [zeroRecord] f) ∧
    Supports [zeroRecord] (fun f => f 0 = true) ∧
    ¬ Supports [zeroRecord] allTrue) ∧
    (let a : Trial := ⟨0,1,1⟩
    let b : Trial := ⟨0,2,2⟩
    Reproduced a b ∧ a.actualOutcome ≠ b.actualOutcome ∧ Bounded a ∧ Bounded b) ∧
    ((Verified ⟨0,1,1⟩ ∧ Verified ⟨1,1,1⟩ ∧ ¬ Reproduced ⟨0,1,1⟩ ⟨1,1,1⟩) ∧
    (Reproduced ⟨0,1,1⟩ ⟨0,3,2⟩ ∧ ¬ Verified ⟨0,3,2⟩ ∧ ¬ Bounded ⟨0,3,2⟩) ∧
    (Bounded ⟨0,1,1⟩ ∧ Bounded ⟨0,2,0⟩ ∧ ¬ Verified ⟨0,2,0⟩)) ∧
    (FacetDischarged arithmeticFacet ∧ usesObservation arithmeticFacet = false) ∧
    (inferentialSpecification (singleton (fun on : Bool => on = true)) (fun on => on ≠ false) ∧
    usesObservation (Facet.inferential (singleton (fun on : Bool => on = true)) (fun on => on ≠ false)) = false) ∧
    (drawWeight012 true > 0 ∧ drawWeight012 false > 0 ∧
    drawWeight012 true = drawWeight012 false ∧
    Reproduced (randomTrial012 true) (randomTrial012 false) ∧
    (randomTrial012 true).actualOutcome ≠ (randomTrial012 false).actualOutcome ∧
    (∀ draw, Verified (randomTrial012 draw) ∧ Bounded (randomTrial012 draw))) :=
  ⟨localNotUniversal, hiddenDifference, singleObservation, variableOutcomesStableBound, verificationReproductionStability, noUniversalChain, qualitativeUnmeasured012, randomOutcomes012⟩

                                                                                      
```

#### `CoreReader.Adopted.capabilityCases012`

`CoreReader/Adopted.lean:1027–1036`; theorem.

```lean
theorem capabilityCases012 :
    (capabilitySpecification outputOnlyProcess OutputContract ∧
    capabilitySpecification explainedProcess FullProcessContract ∧
    (∃ certificate : ExternalCertificate outputOnlyProcess,
      certificate.assessorId ≠ certificate.assessedId ∧ OutputContract outputOnlyProcess) ∧
    ¬ ExplanationContract outputOnlyProcess) ∧
    (OwnCapability012 7 7 outputOnlyProcess OutputContract) :=
  ⟨capabilityFulfilled012, ownCapability012⟩

                                                                                      
```

#### `CoreReader.Adopted.capabilityLimits012`

`CoreReader/Adopted.lean:1037–1071`; theorem.

```lean
theorem capabilityLimits012 :
    (capabilitySpecification outputOnlyProcess OutputContract ∧
    capabilitySpecification explainedProcess FullProcessContract ∧
    (∃ certificate : ExternalCertificate outputOnlyProcess,
      certificate.assessorId ≠ certificate.assessedId ∧ OutputContract outputOnlyProcess) ∧
    ¬ ExplanationContract outputOnlyProcess) ∧
    (∀ kind : InventoryKind,
    Available [⟨kind, .copy⟩, ⟨kind, .copy⟩] .copy ∧
    ¬ Available [⟨kind, .copy⟩, ⟨kind, .copy⟩] .successor) ∧
    (Generative generatingSystem.policy ∧
    generatingSystem.policy.permitsVersion 0 0 ∧
    ¬ Expanded generatingSystem.current inflatedState ∧
    generatingSystem.current.inventory.length < inflatedState.inventory.length ∧
    generatingSystem.current.abstractionLayers.length < inflatedState.abstractionLayers.length ∧
    generatingSystem.current.vocabulary.length < inflatedState.vocabulary.length ∧
    generatingSystem.execute availableResources = some 6 ∧
    generatingSystem.execute { availableResources with experience := none } = none ∧
    generatingSystem.execute { availableResources with knowledge := none } = none ∧
    generatingSystem.execute { availableResources with collaborator := none } = none ∧
    generatingSystem.execute ⟨none, none, none⟩ = none ∧
    ¬ Expanded generatingSystem.current generatingSystem.stableAction ∧
    generatingSystem.stableAction = generatingSystem.current ∧
    generatingSystem.requirementsMet generatingSystem.stableAction ∧
    generatingSystem.withinBudget generatingSystem.stableAction ∧
    ¬ generatingSystem.withinBudget inflatedState ∧
    StableReason generatingSystem.current inflatedState ∧
    (inflatedAnnouncement = generatingSystem.report inflatedState .successor 0 1 ∧
      inflatedAnnouncement.owner = generatingSystem.owner ∧
      inflatedAnnouncement.before = generatingSystem.current ∧ inflatedAnnouncement.after = inflatedState ∧
      inflatedAnnouncement.reportedNewOperation = .successor ∧
      inflatedAnnouncement.input = 0 ∧ inflatedAnnouncement.expectedOutput = 1 ∧
      ¬ inflatedAnnouncement.claim ∧ ¬ Expanded inflatedAnnouncement.before inflatedAnnouncement.after)) :=
  ⟨capabilityFulfilled012, inventoryCases012, generationLimits⟩

                                                                                      
```

#### `CoreReader.Adopted.choiceCases012`

`CoreReader/Adopted.lean:1072–1100`; theorem.

```lean
theorem choiceCases012 :
    (identityImpl.conventional = true ∧ identityImpl.established = true ∧
    JustifiedChoice identityRequirements identityImpl [.status .convention, .method .output]) ∧
    (Relevant identityRequirements identityImpl (.method .explanation) ∧
    Relevant identityRequirements identityImpl (.method .applicability) ∧
    Relevant identityRequirements identityImpl (.method .simplicity) ∧
    Relevant identityRequirements identityImpl (.method .procedure) ∧
    (Relevant identityRequirements cheapSuccessor (.method .simplicity) ∧
      ¬ JustifiedChoice identityRequirements cheapSuccessor [.method .simplicity])) ∧
    (Articulated priorityArticulation ∧ AssessmentAccurate false ∧
    (∀ selected, Models statusFacts selected) ∧
    priorityClaim .identity ∧ ¬ priorityClaim .successor ∧
    ¬ Entails statusFacts priorityClaim ∧
    ¬ JustifiedChoice identityRequirements identityImpl [.status .standing]) ∧
    ((∀ n, identityImpl.run n = wrongExplanation012.run n) ∧
    Feasible identityRequirements identityImpl ∧ Feasible identityRequirements wrongExplanation012 ∧
    Relevant identityRequirements identityImpl (.method .explanation) ∧
    ¬ Relevant identityRequirements wrongExplanation012 (.method .explanation)) ∧
    (¬ choiceSpecification CoreReader.Integration.proposalRequirements
      (CoreReader.Integration.currentPhilosophy CoreReader.Integration.actualSystem CoreReader.Integration.actual).implementation
      [.status .standing] ∧
    choiceSpecification CoreReader.Integration.proposalRequirements
      (CoreReader.Integration.currentPhilosophy CoreReader.Integration.actualSystem CoreReader.Integration.actual).implementation
      [.method .output]) ∧
    (∀ kind : StatusKind,
    ¬ choiceSpecification identityRequirements identityImpl [.status kind]) :=
  ⟨conventionWithReason, internalReasons, statusAssessmentNonEntailment, internalReasonDistinguishes012, ownPhilosophyStatus012, allStatusOnly012⟩

                                                                                      
```

#### `CoreReader.Adopted.choiceLimits012`

`CoreReader/Adopted.lean:1101–1122`; theorem.

```lean
theorem choiceLimits012 :
    ((∀ candidate, Feasible identityRequirements (implementation candidate) ↔ candidate = .identity) ∧
    JustifiedChoice identityRequirements identityImpl objectiveReason) ∧
    (identityImpl.conventional = true ∧ identityImpl.established = true ∧
    JustifiedChoice identityRequirements identityImpl [.status .convention, .method .output]) ∧
    ((∀ n, identityImpl.run n = wrongExplanation012.run n) ∧
    Feasible identityRequirements identityImpl ∧ Feasible identityRequirements wrongExplanation012 ∧
    Relevant identityRequirements identityImpl (.method .explanation) ∧
    ¬ Relevant identityRequirements wrongExplanation012 (.method .explanation)) ∧
    (JustifiedChoice identityRequirements identityImpl objectiveReason ∧
    identityImpl.run 0 ≠ successorImpl.run 0) ∧
    ((∀ x, x = 0 → identityImpl.run x = changedOutsideZero.run x) ∧
    identityImpl.run 1 ≠ changedOutsideZero.run 1) ∧
    ((Articulated priorityArticulation ∧ AssessmentAccurate false ∧
      (∀ selected, Models statusFacts selected) ∧
      priorityClaim .identity ∧ ¬ priorityClaim .successor ∧
      ¬ Entails statusFacts priorityClaim ∧
      ¬ JustifiedChoice identityRequirements identityImpl [.status .standing]) ∧
    PolicyIndependenceExample) :=
  ⟨singleFeasible, conventionWithReason, internalReasonDistinguishes012, openNotEquivalent, localNotGlobal, generalGroundsNotChoice⟩

end CoreReader.Adopted
```

### CoreReader/Agency.lean

#### `CoreReader.Agency.FormKind`

`CoreReader/Agency.lean:5–7`; inductive.

```lean
inductive FormKind | organization | method | principle | appearance | artifact
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.Form`

`CoreReader/Agency.lean:8–12`; structure.

```lean
structure Form where
  kind : FormKind
  version : Nat
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.Aim`

`CoreReader/Agency.lean:13–16`; inductive.

```lean
inductive Aim | expandUnderstandingAndConstruction | preserveSafeOperation
  deriving DecidableEq, Repr

                                                                                                                                    
```

#### `CoreReader.Agency.Policy`

`CoreReader/Agency.lean:17–23`; structure.

```lean
structure Policy where
  worthPursuing : Aim → Prop
  current : Form → Prop
  revisable : Form → Prop
  permitsVersion : Nat → Nat → Prop

                                                                                                      
```

#### `CoreReader.Agency.Generative`

`CoreReader/Agency.lean:24–27`; def.

```lean
def Generative (p : Policy) : Prop :=
  p.worthPursuing .expandUnderstandingAndConstruction ∧
    ∀ f, p.current f → p.revisable f

```

#### `CoreReader.Agency.openPolicy`

`CoreReader/Agency.lean:28–33`; def.

```lean
def openPolicy : Policy where
  worthPursuing a := a = .expandUnderstandingAndConstruction ∨ a = .preserveSafeOperation
  current f := f.version = 0
  revisable _ := True
  permitsVersion _ _ := True

```

#### `CoreReader.Agency.neutralPolicy`

`CoreReader/Agency.lean:34–36`; def.

```lean
def neutralPolicy : Policy := { openPolicy with worthPursuing := fun _ => False }

                                                                                 
```

#### `CoreReader.Agency.permissionNotValuation`

`CoreReader/Agency.lean:37–41`; theorem.

```lean
theorem permissionNotValuation :
    neutralPolicy.permitsVersion 0 1 ∧ (0 : Nat) ≠ 1 ∧ ¬ Generative neutralPolicy := by
  simp [neutralPolicy, openPolicy, Generative]

                                                                                                    
```

#### `CoreReader.Agency.revisabilityCovers`

`CoreReader/Agency.lean:42–44`; theorem.

```lean
theorem revisabilityCovers (p : Policy) (h : Generative p) (k : FormKind) (v : Nat)
    (hc : p.current ⟨k, v⟩) : p.revisable ⟨k, v⟩ := h.2 _ hc

```

#### `CoreReader.Agency.Operation`

`CoreReader/Agency.lean:45–47`; inductive.

```lean
inductive Operation | copy | successor
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.Operation.run`

`CoreReader/Agency.lean:48–51`; def.

```lean
def Operation.run : Operation → Nat → Nat
  | .copy, n => n
  | .successor, n => n + 1

```

#### `CoreReader.Agency.InventoryKind`

`CoreReader/Agency.lean:52–54`; inductive.

```lean
inductive InventoryKind | document | term | tool | artifact
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.Item`

`CoreReader/Agency.lean:55–60`; structure.

```lean
structure Item where
  kind : InventoryKind
  content : Operation
  deriving DecidableEq, Repr

                                                                                                 
```

#### `CoreReader.Agency.Available`

`CoreReader/Agency.lean:61–64`; def.

```lean
def Available (xs : List Item) (op : Operation) : Prop :=
  ∃ item ∈ xs, item.content = op

                                                                                             
```

#### `CoreReader.Agency.inventoryNotCapability`

`CoreReader/Agency.lean:65–73`; theorem.

```lean
theorem inventoryNotCapability (kind : InventoryKind) (ops : List Operation) (op : Operation) :
    Available ((ops.map fun x => Item.mk kind x) ++ (ops.map fun x => Item.mk kind x)) op ↔
      Available (ops.map fun x => Item.mk kind x) op := by
  simp only [Available, List.mem_append]
  constructor
  · rintro ⟨x, hx | hx, hop⟩ <;> exact ⟨x, hx, hop⟩
  · rintro ⟨x, hx, hop⟩
    exact ⟨x, Or.inl hx, hop⟩

```

#### `CoreReader.Agency.State`

`CoreReader/Agency.lean:74–82`; structure.

```lean
structure State where
  understood : List Operation
  constructed : List Operation
  inventory : List Item
  abstractionLayers : List Operation
  vocabulary : List Operation
  deriving DecidableEq, Repr

                                                                                                                              
```

#### `CoreReader.Agency.Expanded`

`CoreReader/Agency.lean:83–86`; def.

```lean
def Expanded (before after : State) : Prop :=
  (∃ op, op ∈ after.understood ∧ op ∉ before.understood) ∨
  (∃ op, op ∈ after.constructed ∧ op ∉ before.constructed)

```

#### `CoreReader.Agency.baseState`

`CoreReader/Agency.lean:87–89`; def.

```lean
def baseState : State :=
  ⟨[.copy], [.copy], [⟨.artifact, .copy⟩], [.copy], [.copy]⟩

```

#### `CoreReader.Agency.inflatedState`

`CoreReader/Agency.lean:90–95`; def.

```lean
def inflatedState : State :=
  { baseState with
    inventory := baseState.inventory ++ baseState.inventory
    abstractionLayers := [.copy, .copy]
    vocabulary := [.copy, .copy] }

```

#### `CoreReader.Agency.stableTrace`

`CoreReader/Agency.lean:96–98`; def.

```lean
def stableTrace (_time : Nat) : State := baseState

                                                                                                 
```

#### `CoreReader.Agency.revisionWithoutProgress`

`CoreReader/Agency.lean:99–104`; theorem.

```lean
theorem revisionWithoutProgress :
    Generative openPolicy ∧
    (∀ k : FormKind, openPolicy.revisable ⟨k, 0⟩) ∧
    (∀ t, ¬ Expanded (stableTrace t) (stableTrace (t + 1))) := by
  simp [Generative, openPolicy, stableTrace, Expanded]

```

#### `CoreReader.Agency.ExternalResources`

`CoreReader/Agency.lean:105–111`; structure.

```lean
structure ExternalResources where
  experience : Option Nat
  knowledge : Option Nat
  collaborator : Option Nat
  deriving DecidableEq, Repr

                                                                                              
```

#### `CoreReader.Agency.assistedExecution`

`CoreReader/Agency.lean:112–117`; def.

```lean
def assistedExecution (r : ExternalResources) : Option Nat := do
  let e ← r.experience
  let k ← r.knowledge
  let c ← r.collaborator
  pure (Operation.copy.run (e + k + c))

```

#### `CoreReader.Agency.availableResources`

`CoreReader/Agency.lean:118–120`; def.

```lean
def availableResources : ExternalResources := ⟨some 1, some 2, some 3⟩

                                                                                                                               
```

#### `CoreReader.Agency.StableReason`

`CoreReader/Agency.lean:121–125`; def.

```lean
def StableReason (before proposed : State) : Prop :=
  before.constructed = proposed.constructed ∧
  before.inventory.length ≤ 1 ∧ ¬ proposed.inventory.length ≤ 1

                                                                                                                     
```

#### `CoreReader.Agency.GeneratingSystem`

`CoreReader/Agency.lean:126–133`; structure.

```lean
structure GeneratingSystem where
  owner : Nat
  policy : Policy
  current : State
  execute : ExternalResources → Option Nat
  applicationBudget : Nat
  requiredOperations : List Operation
                                                                                                                
```

#### `CoreReader.Agency.generatingSystem`

`CoreReader/Agency.lean:134–141`; def.

```lean
def generatingSystem : GeneratingSystem where
  owner := 0
  policy := openPolicy
  current := baseState
  execute := assistedExecution
  applicationBudget := 1
  requiredOperations := [.copy]
                                                              
```

#### `CoreReader.Agency.GeneratingSystem.stableAction`

`CoreReader/Agency.lean:142–142`; def.

```lean
def GeneratingSystem.stableAction (system : GeneratingSystem) : State := system.current
```

#### `CoreReader.Agency.GeneratingSystem.requirementsMet`

`CoreReader/Agency.lean:143–144`; def.

```lean
def GeneratingSystem.requirementsMet (system : GeneratingSystem) (state : State) : Prop :=
  ∀ operation, operation ∈ system.requiredOperations → operation ∈ state.constructed
```

#### `CoreReader.Agency.GeneratingSystem.withinBudget`

`CoreReader/Agency.lean:145–147`; def.

```lean
def GeneratingSystem.withinBudget (system : GeneratingSystem) (state : State) : Prop :=
  state.inventory.length ≤ system.applicationBudget
                                                                                                                       
```

#### `CoreReader.Agency.Announcement`

`CoreReader/Agency.lean:148–156`; structure.

```lean
structure Announcement where
  owner : Nat
  before : State
  after : State
  reportedNewOperation : Operation
  input : Nat
  expectedOutput : Nat
  deriving DecidableEq, Repr
                                                                                                   
```

#### `CoreReader.Agency.GeneratingSystem.report`

`CoreReader/Agency.lean:157–160`; def.

```lean
def GeneratingSystem.report (system : GeneratingSystem) (after : State)
    (operation : Operation) (input expectedOutput : Nat) : Announcement :=
  ⟨system.owner, system.current, after, operation, input, expectedOutput⟩
                                                                                                        
```

#### `CoreReader.Agency.Announcement.claim`

`CoreReader/Agency.lean:161–165`; def.

```lean
def Announcement.claim (report : Announcement) : Prop :=
  report.reportedNewOperation ∈ report.after.constructed ∧
  report.reportedNewOperation ∉ report.before.constructed ∧
  report.reportedNewOperation.run report.input = report.expectedOutput
                                                                              
```

#### `CoreReader.Agency.announcementClaimImpliesExpansion`

`CoreReader/Agency.lean:166–168`; theorem.

```lean
theorem announcementClaimImpliesExpansion (report : Announcement) (h : report.claim) :
    Expanded report.before report.after := Or.inr ⟨report.reportedNewOperation, h.1, h.2.1⟩
                                                                                                      
```

#### `CoreReader.Agency.inflatedAnnouncement`

`CoreReader/Agency.lean:169–170`; def.

```lean
def inflatedAnnouncement : Announcement := generatingSystem.report inflatedState .successor 0 1
                                                                                                            
```

#### `CoreReader.Agency.inflatedAnnouncementRefuted`

`CoreReader/Agency.lean:171–178`; theorem.

```lean
theorem inflatedAnnouncementRefuted :
    inflatedAnnouncement.before = baseState ∧ inflatedAnnouncement.after = inflatedState ∧
    inflatedAnnouncement.reportedNewOperation = .successor ∧
    inflatedAnnouncement.input = 0 ∧ inflatedAnnouncement.expectedOutput = 1 ∧
    ¬ inflatedAnnouncement.claim ∧ ¬ Expanded inflatedAnnouncement.before inflatedAnnouncement.after := by
  simp [inflatedAnnouncement, GeneratingSystem.report, generatingSystem, Announcement.claim, Expanded, baseState, inflatedState]

                                                                                             
```

#### `CoreReader.Agency.TransitionCase`

`CoreReader/Agency.lean:179–181`; inductive.

```lean
inductive TransitionCase | inflate | extend
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.extendedState`

`CoreReader/Agency.lean:182–183`; def.

```lean
def extendedState : State :=
  { baseState with understood := [.copy, .successor], constructed := [.copy, .successor] }
```

#### `CoreReader.Agency.transitionBefore`

`CoreReader/Agency.lean:184–184`; def.

```lean
def transitionBefore (_transition : TransitionCase) : State := baseState
```

#### `CoreReader.Agency.transitionAfter`

`CoreReader/Agency.lean:185–188`; def.

```lean
def transitionAfter : TransitionCase → State
  | .inflate => inflatedState
  | .extend => extendedState
                                                                             
```

#### `CoreReader.Agency.transitionInput`

`CoreReader/Agency.lean:189–189`; def.

```lean
def transitionInput (_transition : TransitionCase) : Nat := 0
```

#### `CoreReader.Agency.transitionAnnouncement`

`CoreReader/Agency.lean:190–193`; def.

```lean
def transitionAnnouncement (transition : TransitionCase) : Announcement :=
  generatingSystem.report (transitionAfter transition) .successor (transitionInput transition) 1

                                                                                                                                                     
```

#### `CoreReader.Agency.generationLimits`

`CoreReader/Agency.lean:194–223`; theorem.

```lean
theorem generationLimits :
    Generative generatingSystem.policy ∧
    generatingSystem.policy.permitsVersion 0 0 ∧
    ¬ Expanded generatingSystem.current inflatedState ∧
    generatingSystem.current.inventory.length < inflatedState.inventory.length ∧
    generatingSystem.current.abstractionLayers.length < inflatedState.abstractionLayers.length ∧
    generatingSystem.current.vocabulary.length < inflatedState.vocabulary.length ∧
    generatingSystem.execute availableResources = some 6 ∧
    generatingSystem.execute { availableResources with experience := none } = none ∧
    generatingSystem.execute { availableResources with knowledge := none } = none ∧
    generatingSystem.execute { availableResources with collaborator := none } = none ∧
    generatingSystem.execute ⟨none, none, none⟩ = none ∧
    ¬ Expanded generatingSystem.current generatingSystem.stableAction ∧
    generatingSystem.stableAction = generatingSystem.current ∧
    generatingSystem.requirementsMet generatingSystem.stableAction ∧
    generatingSystem.withinBudget generatingSystem.stableAction ∧
    ¬ generatingSystem.withinBudget inflatedState ∧
    StableReason generatingSystem.current inflatedState ∧
    (inflatedAnnouncement = generatingSystem.report inflatedState .successor 0 1 ∧
      inflatedAnnouncement.owner = generatingSystem.owner ∧
      inflatedAnnouncement.before = generatingSystem.current ∧ inflatedAnnouncement.after = inflatedState ∧
      inflatedAnnouncement.reportedNewOperation = .successor ∧
      inflatedAnnouncement.input = 0 ∧ inflatedAnnouncement.expectedOutput = 1 ∧
      ¬ inflatedAnnouncement.claim ∧ ¬ Expanded inflatedAnnouncement.before inflatedAnnouncement.after) := by
  simp [generatingSystem, GeneratingSystem.stableAction, GeneratingSystem.requirementsMet,
    GeneratingSystem.withinBudget, GeneratingSystem.report, Generative, openPolicy, Expanded,
    baseState, inflatedState, assistedExecution, availableResources, Operation.run,
    StableReason, inflatedAnnouncement, Announcement.claim]

                                                                                                          
```

#### `CoreReader.Agency.generationNotReflexivity`

`CoreReader/Agency.lean:224–233`; theorem.

```lean
theorem generationNotReflexivity :
    Generative openPolicy ∧ ¬ Reflexive 0 (ownRules 0) [] := by
  constructor
  · simp [Generative, openPolicy]
  · intro h
    have bad := noSelfExemption 0 (ownRules 0) [] h (assessingRule 0) (by simp [ownRules])
      (.system 0) rfl (by simp [assessingRule, ownSubjects])
    simp [Performed] at bad

                                                                                                             
```

#### `CoreReader.Agency.ownArithmeticPrinciple`

`CoreReader/Agency.lean:234–235`; def.

```lean
def ownArithmeticPrinciple (n : Nat) : Bool := decide (n + 1 = 2 * n)

```

#### `CoreReader.Agency.selfTest`

`CoreReader/Agency.lean:236–238`; def.

```lean
def selfTest (samples : List Nat) : Bool := samples.all ownArithmeticPrinciple

                                                                                                   
```

#### `CoreReader.Agency.selfTestDoesNotProve`

`CoreReader/Agency.lean:239–250`; theorem.

```lean
theorem selfTestDoesNotProve :
    selfTest [1] = true ∧ ownArithmeticPrinciple 0 = false ∧
      ¬ (∀ n, ownArithmeticPrinciple n = true) := by
  constructor
  · decide
  constructor
  · decide
  · intro h
    have bad := h 0
    contradiction

end CoreReader.Agency
```

### CoreReader/Choice.lean

#### `CoreReader.Choice.StatusKind`

`CoreReader/Choice.lean:6–8`; inductive.

```lean
inductive StatusKind | name | convention | standing
  deriving DecidableEq, Repr

```

#### `CoreReader.Choice.MethodReason`

`CoreReader/Choice.lean:9–11`; inductive.

```lean
inductive MethodReason | output | explanation | applicability | simplicity | procedure
  deriving DecidableEq, Repr

```

#### `CoreReader.Choice.Reason`

`CoreReader/Choice.lean:12–15`; inductive.

```lean
inductive Reason | status (kind : StatusKind) | method (kind : MethodReason)
  deriving DecidableEq, Repr

                                                                                                                
```

#### `CoreReader.Choice.Implementation`

`CoreReader/Choice.lean:16–26`; structure.

```lean
structure Implementation where
  name : String
  conventional : Bool
  established : Bool
  run : Nat → Nat
  cost : Nat
  domain : Nat → Prop
  explanation : Nat → Nat
  trace : Nat → List Nat

                                                                                                              
```

#### `CoreReader.Choice.Requirements`

`CoreReader/Choice.lean:27–33`; structure.

```lean
structure Requirements where
  inputs : Nat → Prop
  expected : Nat → Nat
  budget : Nat
  values : MethodReason → Prop

                                                                                                       
```

#### `CoreReader.Choice.MethodContent`

`CoreReader/Choice.lean:34–41`; def.

```lean
def MethodContent (req : Requirements) (i : Implementation) : MethodReason → Prop
  | .output => ∀ x, req.inputs x → i.run x = req.expected x
  | .explanation => ∀ x, req.inputs x → i.explanation x = i.run x
  | .applicability => ∀ x, req.inputs x → i.domain x
  | .simplicity => i.cost ≤ req.budget
  | .procedure => ∀ x, req.inputs x → (i.trace x).getLast? = some (i.run x)

                                                                                                                           
```

#### `CoreReader.Choice.Relevant`

`CoreReader/Choice.lean:42–45`; def.

```lean
def Relevant (req : Requirements) (i : Implementation) : Reason → Prop
  | .status _ => False
  | .method kind => req.values kind ∧ MethodContent req i kind

```

#### `CoreReader.Choice.Feasible`

`CoreReader/Choice.lean:46–49`; def.

```lean
def Feasible (req : Requirements) (i : Implementation) : Prop :=
  (∀ x, req.inputs x → i.run x = req.expected x) ∧ i.cost ≤ req.budget

                                                                                                                   
```

#### `CoreReader.Choice.JustifiedChoice`

`CoreReader/Choice.lean:50–53`; def.

```lean
def JustifiedChoice (req : Requirements) (i : Implementation) (reasons : List Reason) : Prop :=
  Feasible req i ∧ ∃ reason ∈ reasons, Relevant req i reason

                                                                                                                 
```

#### `CoreReader.Choice.statusOnlyFails`

`CoreReader/Choice.lean:54–60`; theorem.

```lean
theorem statusOnlyFails (req : Requirements) (i : Implementation) (k : StatusKind) :
    ¬ JustifiedChoice req i [.status k] := by
  rintro ⟨_, reason, hr, hv⟩
  simp only [List.mem_singleton] at hr
  subst reason
  exact hv

```

#### `CoreReader.Choice.identityImpl`

`CoreReader/Choice.lean:61–70`; def.

```lean
def identityImpl : Implementation where
  name := "Existing identity implementation"
  conventional := true
  established := true
  run n := n
  cost := 1
  domain _ := True
  explanation n := n
  trace n := [n]

```

#### `CoreReader.Choice.successorImpl`

`CoreReader/Choice.lean:71–80`; def.

```lean
def successorImpl : Implementation where
  name := "Successor implementation"
  conventional := false
  established := false
  run n := n + 1
  cost := 2
  domain _ := True
  explanation n := n + 1
  trace n := [n, n + 1]

```

#### `CoreReader.Choice.changedOutsideZero`

`CoreReader/Choice.lean:81–89`; def.

```lean
def changedOutsideZero : Implementation :=
  { identityImpl with
    name := "Changed outside zero"
    conventional := false
    established := false
    run := fun n => if n = 0 then 0 else n + 1
    explanation := fun n => if n = 0 then 0 else n + 1
    trace := fun n => [if n = 0 then 0 else n + 1] }

```

#### `CoreReader.Choice.identityRequirements`

`CoreReader/Choice.lean:90–95`; def.

```lean
def identityRequirements : Requirements where
  inputs _ := True
  expected n := n
  budget := 1
  values _ := True

```

#### `CoreReader.Choice.objectiveReason`

`CoreReader/Choice.lean:96–97`; def.

```lean
def objectiveReason : List Reason := [.method .output]

```

#### `CoreReader.Choice.identityOutputReason`

`CoreReader/Choice.lean:98–100`; theorem.

```lean
theorem identityOutputReason : Relevant identityRequirements identityImpl (.method .output) := by
  exact ⟨trivial, fun _ _ => rfl⟩

```

#### `CoreReader.Choice.identityFeasible`

`CoreReader/Choice.lean:101–103`; theorem.

```lean
theorem identityFeasible : Feasible identityRequirements identityImpl :=
  ⟨fun _ _ => rfl, by decide⟩

```

#### `CoreReader.Choice.identityJustified`

`CoreReader/Choice.lean:104–107`; theorem.

```lean
theorem identityJustified : JustifiedChoice identityRequirements identityImpl objectiveReason :=
  ⟨identityFeasible, .method .output, by simp [objectiveReason], identityOutputReason⟩

                                                                                                             
```

#### `CoreReader.Choice.conventionWithReason`

`CoreReader/Choice.lean:108–112`; theorem.

```lean
theorem conventionWithReason :
    identityImpl.conventional = true ∧ identityImpl.established = true ∧
    JustifiedChoice identityRequirements identityImpl [.status .convention, .method .output] := by
  exact ⟨rfl, rfl, identityFeasible, .method .output, by simp, identityOutputReason⟩

```

#### `CoreReader.Choice.Candidate`

`CoreReader/Choice.lean:113–115`; inductive.

```lean
inductive Candidate | identity | successor
  deriving DecidableEq, Repr

```

#### `CoreReader.Choice.implementation`

`CoreReader/Choice.lean:116–120`; def.

```lean
def implementation : Candidate → Implementation
  | .identity => identityImpl
  | .successor => successorImpl

                                                                                                       
```

#### `CoreReader.Choice.singleFeasible`

`CoreReader/Choice.lean:121–131`; theorem.

```lean
theorem singleFeasible :
    (∀ candidate, Feasible identityRequirements (implementation candidate) ↔ candidate = .identity) ∧
    JustifiedChoice identityRequirements identityImpl objectiveReason := by
  constructor
  · intro candidate
    cases candidate
    · simp [Feasible, identityRequirements, implementation, identityImpl]
    · simp [Feasible, identityRequirements, implementation, successorImpl]
  · exact identityJustified

                                                                                 
```

#### `CoreReader.Choice.localNotGlobal`

`CoreReader/Choice.lean:132–139`; theorem.

```lean
theorem localNotGlobal :
    (∀ x, x = 0 → identityImpl.run x = changedOutsideZero.run x) ∧
    identityImpl.run 1 ≠ changedOutsideZero.run 1 := by
  constructor
  · intro x hx; subst x; rfl
  · decide

                                                                             
```

#### `CoreReader.Choice.cheapSuccessor`

`CoreReader/Choice.lean:140–141`; def.

```lean
def cheapSuccessor : Implementation := { successorImpl with cost := 1 }

```

#### `CoreReader.Choice.eligibleInternalReasonNotSufficient`

`CoreReader/Choice.lean:142–150`; theorem.

```lean
theorem eligibleInternalReasonNotSufficient :
    Relevant identityRequirements cheapSuccessor (.method .simplicity) ∧
    ¬ JustifiedChoice identityRequirements cheapSuccessor [.method .simplicity] := by
  refine ⟨⟨trivial, by change 1 ≤ 1; decide⟩, ?_⟩
  intro h
  have bad := h.1.1 0 trivial
  cases bad

                                                                                                                  
```

#### `CoreReader.Choice.internalReasons`

`CoreReader/Choice.lean:151–161`; theorem.

```lean
theorem internalReasons :
    Relevant identityRequirements identityImpl (.method .explanation) ∧
    Relevant identityRequirements identityImpl (.method .applicability) ∧
    Relevant identityRequirements identityImpl (.method .simplicity) ∧
    Relevant identityRequirements identityImpl (.method .procedure) ∧
    (Relevant identityRequirements cheapSuccessor (.method .simplicity) ∧
      ¬ JustifiedChoice identityRequirements cheapSuccessor [.method .simplicity]) := by
  exact ⟨⟨trivial, fun _ _ => rfl⟩, ⟨trivial, fun _ _ => trivial⟩,
    ⟨trivial, by change 1 ≤ 1; decide⟩, ⟨trivial, fun _ _ => rfl⟩, eligibleInternalReasonNotSufficient⟩

                                                                                                                
```

#### `CoreReader.Choice.openNotEquivalent`

`CoreReader/Choice.lean:162–167`; theorem.

```lean
theorem openNotEquivalent :
    JustifiedChoice identityRequirements identityImpl objectiveReason ∧
    identityImpl.run 0 ≠ successorImpl.run 0 := by
  exact ⟨identityJustified, by decide⟩

                                                                                   
```

#### `CoreReader.Choice.priorityClaim`

`CoreReader/Choice.lean:168–169`; def.

```lean
def priorityClaim : Claim Candidate := fun selected => selected = .identity

```

#### `CoreReader.Choice.statusFacts`

`CoreReader/Choice.lean:170–174`; def.

```lean
def statusFacts : Theory Candidate := union
  (singleton (fun _ => identityImpl.conventional = true))
  (singleton (fun _ => identityImpl.established = true))

                                                                                                
```

#### `CoreReader.Choice.statusFactsModel`

`CoreReader/Choice.lean:175–177`; theorem.

```lean
theorem statusFactsModel (selected : Candidate) : Models statusFacts selected := by
  exact (modelsUnion _ _ _).2 ⟨(modelsSingleton _ _).2 rfl, (modelsSingleton _ _).2 rfl⟩

```

#### `CoreReader.Choice.priorityArticulation`

`CoreReader/Choice.lean:178–183`; def.

```lean
def priorityArticulation : Articulation Candidate :=
  ⟨["priority", "conventional use", "established status"], statusFacts,
    [fun _ => identityImpl.conventional = true, fun _ => identityImpl.established = true],
    fun _ => True⟩

                                                                                                                                    
```

#### `CoreReader.Choice.AssessmentAccurate`

`CoreReader/Choice.lean:184–186`; def.

```lean
def AssessmentAccurate (report : Bool) : Prop :=
  report = true ↔ Entails statusFacts priorityClaim

```

#### `CoreReader.Choice.statusDoesNotEntailPriority`

`CoreReader/Choice.lean:187–191`; theorem.

```lean
theorem statusDoesNotEntailPriority : ¬ Entails statusFacts priorityClaim := by
  intro h
  have bad := h .successor (statusFactsModel .successor)
  cases bad

```

#### `CoreReader.Choice.statusAssessmentNonEntailment`

`CoreReader/Choice.lean:192–203`; theorem.

```lean
theorem statusAssessmentNonEntailment :
    Articulated priorityArticulation ∧ AssessmentAccurate false ∧
    (∀ selected, Models statusFacts selected) ∧
    priorityClaim .identity ∧ ¬ priorityClaim .successor ∧
    ¬ Entails statusFacts priorityClaim ∧
    ¬ JustifiedChoice identityRequirements identityImpl [.status .standing] := by
  refine ⟨⟨by simp [priorityArticulation], by simp [priorityArticulation]⟩,
    ⟨(by intro h; cases h), (fun h => False.elim (statusDoesNotEntailPriority h))⟩,
    statusFactsModel, rfl, (by intro h; cases h), statusDoesNotEntailPriority,
    statusOnlyFails _ _ _⟩

                                                                                                    
```

#### `CoreReader.Choice.PriorityAssessment`

`CoreReader/Choice.lean:204–208`; structure.

```lean
structure PriorityAssessment where
  premises : Theory Candidate
  question : Claim Candidate
  report : Bool
                                                                                                        
```

#### `CoreReader.Choice.PriorityAssessment.accurate`

`CoreReader/Choice.lean:209–211`; def.

```lean
def PriorityAssessment.accurate (assessment : PriorityAssessment) : Prop :=
  assessment.report = true ↔ Entails assessment.premises assessment.question
                                                                                    
```

#### `CoreReader.Choice.statusPriorityAudit`

`CoreReader/Choice.lean:212–213`; def.

```lean
def statusPriorityAudit : PriorityAssessment := ⟨statusFacts, priorityClaim, false⟩
                                                                                                 
```

#### `CoreReader.Choice.ChoicePolicy`

`CoreReader/Choice.lean:214–218`; structure.

```lean
structure ChoicePolicy where
  selected : Candidate
  priorityReasons : List Reason
  assessment : PriorityAssessment
                                                                                                                    
```

#### `CoreReader.Choice.GeneralAssessmentFulfilled`

`CoreReader/Choice.lean:219–221`; def.

```lean
def GeneralAssessmentFulfilled (policy : ChoicePolicy) : Prop :=
  Articulated priorityArticulation ∧ policy.assessment = statusPriorityAudit ∧ policy.assessment.accurate
                                                                                                                      
```

#### `CoreReader.Choice.AdditionalChoiceNorm`

`CoreReader/Choice.lean:222–224`; def.

```lean
def AdditionalChoiceNorm (policy : ChoicePolicy) : Prop :=
  JustifiedChoice identityRequirements (implementation policy.selected) policy.priorityReasons
                                                                                                                    
```

#### `CoreReader.Choice.statusPriorityPolicy`

`CoreReader/Choice.lean:225–226`; def.

```lean
def statusPriorityPolicy : ChoicePolicy := ⟨.identity, [.status .standing], statusPriorityAudit⟩
                                                                                                               
```

#### `CoreReader.Choice.outputPriorityPolicy`

`CoreReader/Choice.lean:227–228`; def.

```lean
def outputPriorityPolicy : ChoicePolicy := ⟨.identity, objectiveReason, statusPriorityAudit⟩
                                                                                                        
```

#### `CoreReader.Choice.statusPriorityAuditAccurate`

`CoreReader/Choice.lean:229–233`; theorem.

```lean
theorem statusPriorityAuditAccurate : statusPriorityAudit.accurate := by
  constructor
  · intro h; cases h
  · intro h; exact False.elim (statusDoesNotEntailPriority h)
                                                                                                                                          
```

#### `CoreReader.Choice.PolicyIndependenceExample`

`CoreReader/Choice.lean:234–244`; def.

```lean
def PolicyIndependenceExample : Prop :=
  statusPriorityPolicy.selected = outputPriorityPolicy.selected ∧
  statusPriorityPolicy.assessment = outputPriorityPolicy.assessment ∧
  statusPriorityPolicy.assessment.premises = statusFacts ∧
  statusPriorityPolicy.assessment.question = priorityClaim ∧
  statusPriorityPolicy.assessment.report = false ∧
  (∀ selected, Models statusPriorityPolicy.assessment.premises selected) ∧
  statusPriorityPolicy.priorityReasons ≠ outputPriorityPolicy.priorityReasons ∧
  GeneralAssessmentFulfilled statusPriorityPolicy ∧ GeneralAssessmentFulfilled outputPriorityPolicy ∧
  ¬ AdditionalChoiceNorm statusPriorityPolicy ∧ AdditionalChoiceNorm outputPriorityPolicy
                                                                                                                
```

#### `CoreReader.Choice.policyIndependenceExample`

`CoreReader/Choice.lean:245–256`; theorem.

```lean
theorem policyIndependenceExample : PolicyIndependenceExample := by
  have articulated : Articulated priorityArticulation :=
    ⟨by simp [priorityArticulation], by simp [priorityArticulation]⟩
  refine ⟨rfl,rfl,rfl,rfl,rfl,statusFactsModel,?_,
    ⟨articulated,rfl,statusPriorityAuditAccurate⟩,
    ⟨articulated,rfl,statusPriorityAuditAccurate⟩,?_,?_⟩
  · decide
  · exact statusOnlyFails identityRequirements identityImpl .standing
  · exact identityJustified

                                                                                                         
                                                                                                                                                      
```

#### `CoreReader.Choice.generalGroundsNotChoice`

`CoreReader/Choice.lean:257–266`; theorem.

```lean
theorem generalGroundsNotChoice :
    (Articulated priorityArticulation ∧ AssessmentAccurate false ∧
      (∀ selected, Models statusFacts selected) ∧
      priorityClaim .identity ∧ ¬ priorityClaim .successor ∧
      ¬ Entails statusFacts priorityClaim ∧
      ¬ JustifiedChoice identityRequirements identityImpl [.status .standing]) ∧
    PolicyIndependenceExample :=
  ⟨statusAssessmentNonEntailment, policyIndependenceExample⟩

end CoreReader.Choice
```

### CoreReader/Engineering/Domain.lean

#### `CoreReader.Engineering.Maintainer`

`CoreReader/Engineering/Domain.lean:7–9`; inductive.

```lean
inductive Maintainer where
  | original | successor | agent
  deriving DecidableEq, Repr
```

#### `CoreReader.Engineering.Tool`

`CoreReader/Engineering/Domain.lean:10–12`; inductive.

```lean
inductive Tool where
  | editor | compiler | contractRunner | migrationRunner
  deriving DecidableEq, Repr
```

#### `CoreReader.Engineering.Knowledge`

`CoreReader/Engineering/Domain.lean:13–15`; inductive.

```lean
inductive Knowledge where
  | privateLayout | publicContract | changeGuide | migrationGuide
  deriving DecidableEq, Repr
```

#### `CoreReader.Engineering.Change`

`CoreReader/Engineering/Domain.lean:16–19`; inductive.

```lean
inductive Change where
  | addition | replacement | deletion | withdrawal | redrawing | migration
  | independent | coordinated | designRevision | other (name : String)
  deriving DecidableEq, Repr
```

#### `CoreReader.Engineering.Candidate`

`CoreReader/Engineering/Domain.lean:20–22`; inductive.

```lean
inductive Candidate where
  | presentSimple | evolvable | maximal
  deriving DecidableEq, Repr
```

#### `CoreReader.Engineering.Burden`

`CoreReader/Engineering/Domain.lean:23–27`; inductive.

```lean
inductive Burden where
  | understanding | construction | diagnosis | verification | coordination
  | operation | migration
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.maintainers`

`CoreReader/Engineering/Domain.lean:28–28`; def.

```lean
def maintainers : List Maintainer := [.original, .successor, .agent]
```

#### `CoreReader.Engineering.changes`

`CoreReader/Engineering/Domain.lean:29–30`; def.

```lean
def changes : List Change := [.addition, .replacement, .deletion, .withdrawal,
  .redrawing, .migration, .independent, .coordinated, .designRevision]
```

#### `CoreReader.Engineering.burdens`

`CoreReader/Engineering/Domain.lean:31–33`; def.

```lean
def burdens : List Burden := [.understanding, .construction, .diagnosis,
  .verification, .coordination, .operation, .migration]

```

#### `CoreReader.Engineering.Activity`

`CoreReader/Engineering/Domain.lean:34–43`; structure.

```lean
structure Activity where
  participants : List Maintainer
  software : String
  tools : List Tool
  available : Maintainer → List Knowledge
  scheduledReleases : Nat
  scheduledMaintenance : Nat
  boundedRuns : Option Nat
  label : String

```

#### `CoreReader.Engineering.ActivityScope`

`CoreReader/Engineering/Domain.lean:44–47`; abbrev.

```lean
abbrev ActivityScope (a : Activity) : Prop :=
  a.participants ≠ [] ∧ a.software ≠ "" ∧ a.tools ≠ [] ∧
  a.participants.all (fun m => !(a.available m).isEmpty) = true

```

#### `CoreReader.Engineering.Continuing`

`CoreReader/Engineering/Domain.lean:48–50`; abbrev.

```lean
abbrev Continuing (a : Activity) : Prop :=
  0 < a.scheduledReleases ∧ 0 < a.scheduledMaintenance

```

#### `CoreReader.Engineering.BoundedLifecycle`

`CoreReader/Engineering/Domain.lean:51–54`; abbrev.

```lean
abbrev BoundedLifecycle (a : Activity) : Prop :=
  a.boundedRuns.isSome = true ∧ a.scheduledReleases = 0 ∧
  a.scheduledMaintenance = 0

```

#### `CoreReader.Engineering.continuingActivity`

`CoreReader/Engineering/Domain.lean:55–63`; def.

```lean
def continuingActivity : Activity := {
  participants := maintainers, software := "order-preserving queue",
  tools := [.editor, .compiler, .contractRunner, .migrationRunner],
  available := fun m => match m with
    | .original => [.privateLayout, .publicContract, .changeGuide, .migrationGuide]
    | _ => [.publicContract, .changeGuide, .migrationGuide],
  scheduledReleases := 3, scheduledMaintenance := 6,
  boundedRuns := none, label := "temporary" }

```

#### `CoreReader.Engineering.temporaryActivity`

`CoreReader/Engineering/Domain.lean:64–66`; def.

```lean
def temporaryActivity : Activity := { continuingActivity with
  scheduledReleases := 0, scheduledMaintenance := 0, boundedRuns := some 1,
  label := "one-shot import" }
```

#### `CoreReader.Engineering.prototypeActivity`

`CoreReader/Engineering/Domain.lean:67–68`; def.

```lean
def prototypeActivity : Activity := { temporaryActivity with
  boundedRuns := some 4, label := "bounded prototype" }
```

#### `CoreReader.Engineering.retiringActivity`

`CoreReader/Engineering/Domain.lean:69–71`; def.

```lean
def retiringActivity : Activity := { temporaryActivity with
  boundedRuns := some 2, label := "retiring service" }

```

#### `CoreReader.Engineering.EditStep`

`CoreReader/Engineering/Domain.lean:72–78`; structure.

```lean
structure EditStep where
  component : Nat
  requires : Knowledge
  tool : Tool
  units : Nat
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.changePath`

`CoreReader/Engineering/Domain.lean:79–98`; def.

```lean
def changePath (c : Candidate) (d : Change) : List EditStep :=
  let guide := if c = .presentSimple then Knowledge.privateLayout else .changeGuide
  let base : List EditStep := [⟨0, guide, .editor, 1⟩,
    ⟨0, .publicContract, .contractRunner, 1⟩]
  match d with
  | .addition | .independent => base
  | .replacement | .deletion => base ++ [⟨1, guide, .compiler, 1⟩]
  | .coordinated => base ++ [⟨1, guide, .compiler, 3⟩, ⟨2, .publicContract, .contractRunner, 3⟩]
  | .migration => base ++ [⟨1, .migrationGuide, .migrationRunner, 8⟩]
  | .withdrawal | .redrawing | .designRevision =>
    if c = .presentSimple then base ++
      [⟨1, guide, .editor, 5⟩, ⟨2, guide, .compiler, 5⟩,
       ⟨2, .publicContract, .contractRunner, 5⟩]
    else base ++ [⟨1, guide, .editor, 2⟩, ⟨1, .publicContract, .contractRunner, 2⟩]
  | .other name =>
    if name = "csv export" then
      if c = .maximal then base ++ [⟨3, .migrationGuide, .compiler, 2⟩]
      else base ++ [⟨3, .privateLayout, .compiler, 20⟩]
    else []

```

#### `CoreReader.Engineering.changeWork`

`CoreReader/Engineering/Domain.lean:99–101`; def.

```lean
def changeWork (c : Candidate) (d : Change) : Nat :=
  ((changePath c d).map EditStep.units).sum

```

#### `CoreReader.Engineering.CanChange`

`CoreReader/Engineering/Domain.lean:102–105`; abbrev.

```lean
abbrev CanChange (a : Activity) (c : Candidate) (m : Maintainer) (d : Change) : Prop :=
  (changePath c d) ≠ [] ∧ m ∈ a.participants ∧ (changePath c d).all
    (fun step => (a.available m).contains step.requires && a.tools.contains step.tool) = true

```

#### `CoreReader.Engineering.ContinuingCapability`

`CoreReader/Engineering/Domain.lean:106–112`; abbrev.

```lean
abbrev ContinuingCapability (a : Activity) (c : Candidate) (d : Change) : Prop :=
  (changePath c d) ≠ [] ∧ a.participants.all (fun m => (changePath c d).all
    (fun step => (a.available m).contains step.requires && a.tools.contains step.tool)) = true

                                                                        
                                                                             
                                                                                 
```

#### `CoreReader.Engineering.registeredDirections`

`CoreReader/Engineering/Domain.lean:113–113`; def.

```lean
def registeredDirections : List Change := changes ++ [.other "csv export"]
```

#### `CoreReader.Engineering.supportedDirections`

`CoreReader/Engineering/Domain.lean:114–115`; def.

```lean
def supportedDirections (a : Activity) (c : Candidate) : List Change :=
  registeredDirections.filter (fun d => decide (ContinuingCapability a c d))
```

#### `CoreReader.Engineering.MaximumRegisteredCapability`

`CoreReader/Engineering/Domain.lean:116–120`; abbrev.

```lean
abbrev MaximumRegisteredCapability (a : Activity) (c : Candidate) : Prop :=
  registeredDirections.all (fun d => decide (ContinuingCapability a c d)) = true

                                                                             
                                                                  
```

#### `CoreReader.Engineering.passiveArtifact`

`CoreReader/Engineering/Domain.lean:121–122`; def.

```lean
def passiveArtifact (xs : List Nat) : List Nat := xs

```

#### `CoreReader.Engineering.orientation`

`CoreReader/Engineering/Domain.lean:123–124`; def.

```lean
def orientation : Maintainer → List Change := fun _ => [.designRevision, .migration]

```

#### `CoreReader.Engineering.EngineeringAction`

`CoreReader/Engineering/Domain.lean:125–129`; inductive.

```lean
inductive EngineeringAction where
  | propose (direction : Change)
  | execute (result : List Nat)
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.maintainerActions`

`CoreReader/Engineering/Domain.lean:130–132`; def.

```lean
def maintainerActions (m : Maintainer) : List EngineeringAction :=
  (orientation m).map EngineeringAction.propose

```

#### `CoreReader.Engineering.artifactActions`

`CoreReader/Engineering/Domain.lean:133–135`; def.

```lean
def artifactActions (input : List Nat) : List EngineeringAction :=
  [.execute (passiveArtifact input)]

```

#### `CoreReader.Engineering.subjectLifecycleCases`

`CoreReader/Engineering/Domain.lean:136–143`; theorem.

```lean
theorem subjectLifecycleCases :
    ActivityScope continuingActivity ∧
    CanChange continuingActivity .evolvable .successor .designRevision ∧
    CanChange continuingActivity .evolvable .agent .designRevision ∧
    continuingActivity.label = "temporary" ∧ Continuing continuingActivity ∧
    ¬ BoundedLifecycle continuingActivity ∧ BoundedLifecycle temporaryActivity ∧
    BoundedLifecycle prototypeActivity ∧ BoundedLifecycle retiringActivity := by decide

```

#### `CoreReader.Engineering.subjectLimits`

`CoreReader/Engineering/Domain.lean:144–154`; theorem.

```lean
theorem subjectLimits :
    CanChange continuingActivity .presentSimple .original .designRevision ∧
    ¬ CanChange continuingActivity .presentSimple .successor .designRevision ∧
    ¬ ContinuingCapability continuingActivity .presentSimple .designRevision ∧
    continuingActivity.label = "temporary" ∧ ¬ BoundedLifecycle continuingActivity ∧
    orientation .agent ≠ [] ∧ passiveArtifact [2, 1] = [2, 1] ∧
    EngineeringAction.propose .designRevision ∈ maintainerActions .agent ∧
    EngineeringAction.propose .designRevision ∉ artifactActions [2, 1] := by decide

                                                                           
                                                                               
```

#### `CoreReader.Engineering.CredibleDirection`

`CoreReader/Engineering/Domain.lean:155–159`; abbrev.

```lean
abbrev CredibleDirection {Ground : Type} (grounds : List Ground)
    (articulated : Ground → Bool) (supports : Ground → Change → Bool)
    (d : Change) : Prop :=
  grounds.any (fun g => articulated g && supports g d) = true

```

#### `CoreReader.Engineering.DirectionGround`

`CoreReader/Engineering/Domain.lean:160–166`; inductive.

```lean
inductive DirectionGround where
  | plan (release : Nat) (committed : List Change)
  | knowledge (service : String) (affected : List Change) (mechanism : String)
  | history (service : String) (observed : List Change)
  | other (account : String) (supported : List Change)
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.articulateGround`

`CoreReader/Engineering/Domain.lean:167–172`; def.

```lean
def articulateGround : DirectionGround → Bool
  | .plan release ds => release > 0 && !ds.isEmpty
  | .knowledge service ds mechanism => service != "" && !ds.isEmpty && mechanism != ""
  | .history service ds => service != "" && !ds.isEmpty
  | .other account ds => account != "" && !ds.isEmpty

```

#### `CoreReader.Engineering.supportGround`

`CoreReader/Engineering/Domain.lean:173–179`; def.

```lean
def supportGround : DirectionGround → Change → Bool
  | .plan release ds, d => release > 0 && ds.contains d
  | .knowledge service ds mechanism, d =>
    service == "queue" && mechanism == "tenant-config-reload" && ds.contains d
  | .history service ds, d => service == "queue" && (ds.filter (· == d)).length >= 2
  | .other account ds, d => account == "reviewed customer migration requirement" && ds.contains d

```

#### `CoreReader.Engineering.initialGrounds`

`CoreReader/Engineering/Domain.lean:180–180`; abbrev.

```lean
abbrev initialGrounds : List DirectionGround := [.plan 2 [.designRevision, .migration]]
```

#### `CoreReader.Engineering.forecastGrounds`

`CoreReader/Engineering/Domain.lean:181–181`; def.

```lean
def forecastGrounds : List DirectionGround := [.plan 3 [.deletion]]
```

#### `CoreReader.Engineering.credible`

`CoreReader/Engineering/Domain.lean:182–184`; abbrev.

```lean
abbrev credible (gs : List DirectionGround) (d : Change) : Prop :=
  CredibleDirection gs articulateGround supportGround d

```

#### `CoreReader.Engineering.WarrantedAccommodation`

`CoreReader/Engineering/Domain.lean:185–188`; abbrev.

```lean
abbrev WarrantedAccommodation (gs : List DirectionGround) (d : Change)
    (objectiveGain investment : Nat) : Prop :=
  credible gs d ∧ 0 < objectiveGain ∧ investment ≤ objectiveGain

```

#### `CoreReader.Engineering.credibilityCases`

`CoreReader/Engineering/Domain.lean:189–195`; theorem.

```lean
theorem credibilityCases :
    credible initialGrounds .designRevision ∧
    credible [.knowledge "queue" [.designRevision] "tenant-config-reload"] .designRevision ∧
    credible [.history "queue" [.migration, .migration]] .migration ∧
    ¬ credible [] (.other "quantum backend") ∧
    credible forecastGrounds .deletion ∧ ¬ credible forecastGrounds .designRevision := by decide

```

#### `CoreReader.Engineering.abstractionComplexity`

`CoreReader/Engineering/Domain.lean:196–198`; def.

```lean
def abstractionComplexity : Candidate → Nat
  | .presentSimple => 1 | .evolvable => 3 | .maximal => 30

```

#### `CoreReader.Engineering.implementedVariants`

`CoreReader/Engineering/Domain.lean:199–201`; def.

```lean
def implementedVariants : List Candidate := [.presentSimple]

                                                                                 
```

#### `CoreReader.Engineering.CostVector`

`CoreReader/Engineering/Domain.lean:202–203`; structure.

```lean
structure CostVector where
  amount : Burden → Nat
```

#### `CoreReader.Engineering.CostLimits`

`CoreReader/Engineering/Domain.lean:204–207`; structure.

```lean
structure CostLimits where
  capacity : Burden → Nat
  objective : Burden → String

```

#### `CoreReader.Engineering.cost`

`CoreReader/Engineering/Domain.lean:208–218`; def.

```lean
def cost : Candidate → Burden → Nat
  | .presentSimple, _ => 1
  | .evolvable, .understanding => 3
  | .evolvable, .construction => 4
  | .evolvable, .diagnosis => 2
  | .evolvable, .verification => 4
  | .evolvable, .coordination => 2
  | .evolvable, .operation => 2
  | .evolvable, .migration => 8
  | .maximal, _ => 40

```

#### `CoreReader.Engineering.normalLimits`

`CoreReader/Engineering/Domain.lean:219–229`; def.

```lean
def normalLimits : CostLimits := {
  capacity := fun _ => 12,
  objective := fun b => match b with
    | .understanding => "successor onboarding capacity"
    | .construction => "release construction capacity"
    | .diagnosis => "incident diagnosis window"
    | .verification => "release verification capacity"
    | .coordination => "available team coordination"
    | .operation => "runtime resource budget"
    | .migration => "retirement migration capacity" }

```

#### `CoreReader.Engineering.Requirements`

`CoreReader/Engineering/Domain.lean:230–235`; structure.

```lean
structure Requirements where
  orderRequired : Bool
  maxUnsafeOperations : Nat
  maxLatency : Nat
  minRetention : Nat

```

#### `CoreReader.Engineering.normalRequirements`

`CoreReader/Engineering/Domain.lean:236–236`; def.

```lean
def normalRequirements : Requirements := ⟨true, 0, 10, 30⟩
```

#### `CoreReader.Engineering.behavior`

`CoreReader/Engineering/Domain.lean:237–240`; def.

```lean
def behavior : Candidate → List Nat → List Nat := fun _ xs => xs.eraseDups

                                                                         
                                                                        
```

#### `CoreReader.Engineering.CandidateProfile`

`CoreReader/Engineering/Domain.lean:241–246`; structure.

```lean
structure CandidateProfile where
  orderOutput : List Nat
  unsafeOperations : Nat
  latency : Nat
  retention : Nat

```

#### `CoreReader.Engineering.profile`

`CoreReader/Engineering/Domain.lean:247–247`; def.

```lean
def profile (c : Candidate) : CandidateProfile := ⟨behavior c [2, 1, 2], 0, 5, 30⟩
```

#### `CoreReader.Engineering.Meets`

`CoreReader/Engineering/Domain.lean:248–252`; abbrev.

```lean
abbrev Meets (r : Requirements) (p : CandidateProfile) : Prop :=
  (r.orderRequired = true → p.orderOutput = [2, 1]) ∧
  p.unsafeOperations ≤ r.maxUnsafeOperations ∧ p.latency ≤ r.maxLatency ∧
  r.minRetention ≤ p.retention

```

#### `CoreReader.Engineering.Context`

`CoreReader/Engineering/Domain.lean:253–260`; structure.

```lean
structure Context where
  activity : Activity
  required : Requirements
  evidence : List DirectionGround
  limits : CostLimits
  departure : Option Burden
  profiles : Candidate → CandidateProfile := profile

```

#### `CoreReader.Engineering.currentContinuing`

`CoreReader/Engineering/Domain.lean:261–264`; def.

```lean
def currentContinuing : Context := {
  activity := continuingActivity, required := normalRequirements,
  evidence := initialGrounds, limits := normalLimits, departure := none }

```

#### `CoreReader.Engineering.ConcreteThreat`

`CoreReader/Engineering/Domain.lean:265–268`; abbrev.

```lean
abbrev ConcreteThreat (ctx : Context) (c : Candidate) (b : Burden) : Prop :=
  cost .presentSimple b < cost c b ∧ ctx.limits.capacity b < cost c b ∧
  ctx.limits.objective b ≠ ""

```

#### `CoreReader.Engineering.HasThreat`

`CoreReader/Engineering/Domain.lean:269–271`; abbrev.

```lean
abbrev HasThreat (ctx : Context) (c : Candidate) : Prop :=
  burdens.any (fun b => decide (ConcreteThreat ctx c b)) = true

```

#### `CoreReader.Engineering.JustifiedDeparture`

`CoreReader/Engineering/Domain.lean:272–280`; abbrev.

```lean
abbrev JustifiedDeparture (ctx : Context) (c : Candidate) : Prop :=
  match ctx.departure with
  | none => False
  | some b => ConcreteThreat ctx c b

instance (ctx : Context) (c : Candidate) : Decidable (JustifiedDeparture ctx c) := by
  unfold JustifiedDeparture
  split <;> infer_instance

```

#### `CoreReader.Engineering.PriorityConditions`

`CoreReader/Engineering/Domain.lean:281–288`; abbrev.

```lean
abbrev PriorityConditions (ctx : Context) : Prop :=
  Continuing ctx.activity ∧ ActivityScope ctx.activity ∧
  Meets ctx.required (ctx.profiles .presentSimple) ∧ Meets ctx.required (ctx.profiles .evolvable) ∧
  credible ctx.evidence .designRevision ∧
  ContinuingCapability ctx.activity .evolvable .designRevision ∧
  changeWork .evolvable .designRevision < changeWork .presentSimple .designRevision ∧
  abstractionComplexity .presentSimple < abstractionComplexity .evolvable

```

#### `CoreReader.Engineering.EvolutionPriority`

`CoreReader/Engineering/Domain.lean:289–291`; abbrev.

```lean
abbrev EvolutionPriority (ctx : Context) (chosen : Candidate) : Prop :=
  PriorityConditions ctx → chosen = .evolvable ∨ JustifiedDeparture ctx .evolvable

```

#### `CoreReader.Engineering.currentPriorityConditions`

`CoreReader/Engineering/Domain.lean:292–292`; theorem.

```lean
theorem currentPriorityConditions : PriorityConditions currentContinuing := by decide
```

#### `CoreReader.Engineering.currentNoThreat`

`CoreReader/Engineering/Domain.lean:293–295`; theorem.

```lean
theorem currentNoThreat : ¬ HasThreat currentContinuing .evolvable ∧
    ¬ JustifiedDeparture currentContinuing .evolvable := by decide

```

#### `CoreReader.Engineering.threatened`

`CoreReader/Engineering/Domain.lean:296–299`; def.

```lean
def threatened (b : Burden) : Context := { currentContinuing with
  limits := { normalLimits with capacity := fun x => if x = b then 1 else 12 },
  departure := some b }

```

#### `CoreReader.Engineering.priorityWhenApplicable`

`CoreReader/Engineering/Domain.lean:300–307`; theorem.

```lean
theorem priorityWhenApplicable (ctx : Context) (chosen : Candidate)
    (rule : EvolutionPriority ctx chosen) (applicable : PriorityConditions ctx)
    (noDeparture : ¬ JustifiedDeparture ctx .evolvable) :
    chosen = .evolvable ∧
      abstractionComplexity .presentSimple < abstractionComplexity chosen := by
  have hc := (rule applicable).resolve_right noDeparture
  exact ⟨hc, hc ▸ applicable.2.2.2.2.2.2.2⟩

```

#### `CoreReader.Engineering.currentSimpleViolates`

`CoreReader/Engineering/Domain.lean:308–312`; theorem.

```lean
theorem currentSimpleViolates : ¬ EvolutionPriority currentContinuing .presentSimple := by
  intro h
  have bad := (h currentPriorityConditions).resolve_right currentNoThreat.2
  cases bad

```

#### `CoreReader.Engineering.withEvolvableProfile`

`CoreReader/Engineering/Domain.lean:313–315`; def.

```lean
def withEvolvableProfile (p : CandidateProfile) : Context := { currentContinuing with
  profiles := fun c => if c = .evolvable then p else profile c }

```

#### `CoreReader.Engineering.unmetRequirementsBlockPriority`

`CoreReader/Engineering/Domain.lean:316–323`; theorem.

```lean
theorem unmetRequirementsBlockPriority :
    ¬ PriorityConditions (withEvolvableProfile { profile .evolvable with orderOutput := [1, 2] }) ∧
    ¬ PriorityConditions (withEvolvableProfile { profile .evolvable with unsafeOperations := 1 }) ∧
    ¬ PriorityConditions (withEvolvableProfile { profile .evolvable with latency := 11 }) ∧
    ¬ PriorityConditions (withEvolvableProfile { profile .evolvable with retention := 29 }) := by
  simp [PriorityConditions, withEvolvableProfile, currentContinuing, Meets,
    normalRequirements]

```

#### `CoreReader.Engineering.priorityConditionsCases`

`CoreReader/Engineering/Domain.lean:324–335`; theorem.

```lean
theorem priorityConditionsCases :
    EvolutionPriority currentContinuing .evolvable ∧
    ¬ Meets normalRequirements { profile .evolvable with orderOutput := [1, 2] } ∧
    ¬ Meets normalRequirements { profile .evolvable with unsafeOperations := 1 } ∧
    ¬ Meets normalRequirements { profile .evolvable with latency := 11 } ∧
    ¬ Meets normalRequirements { profile .evolvable with retention := 29 } ∧
    EvolutionPriority (threatened .verification) .presentSimple ∧
    ¬ JustifiedDeparture { threatened .verification with departure := none } .evolvable ∧
    abstractionComplexity .evolvable < abstractionComplexity .maximal := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_, by decide⟩
  simp [JustifiedDeparture]

```

#### `CoreReader.Engineering.priorityChoices`

`CoreReader/Engineering/Domain.lean:336–341`; theorem.

```lean
theorem priorityChoices :
    EvolutionPriority currentContinuing .evolvable ∧
    ¬ EvolutionPriority currentContinuing .presentSimple ∧
    EvolutionPriority (threatened .verification) .presentSimple := by
  exact ⟨by decide, currentSimpleViolates, by decide⟩

```

#### `CoreReader.Engineering.credibilityLimits`

`CoreReader/Engineering/Domain.lean:342–354`; theorem.

```lean
theorem credibilityLimits :
    credible initialGrounds .designRevision ∧ implementedVariants.length = 1 ∧
    ¬ WarrantedAccommodation [] (.other "quantum backend") 0 5 ∧
    ¬ credible initialGrounds (.other "quantum backend") ∧
    EvolutionPriority currentContinuing .evolvable ∧
    abstractionComplexity .evolvable < abstractionComplexity .maximal ∧
    cost .evolvable .construction < cost .evolvable .migration ∧
    ¬ MaximumRegisteredCapability continuingActivity .evolvable ∧
    MaximumRegisteredCapability continuingActivity .maximal ∧
    (supportedDirections continuingActivity .evolvable).length = 9 ∧
    (supportedDirections continuingActivity .maximal).length = 10 ∧
    ¬ credible initialGrounds (.other "csv export") := by decide

```

#### `CoreReader.Engineering.costCases`

`CoreReader/Engineering/Domain.lean:355–366`; theorem.

```lean
theorem costCases :
    JustifiedDeparture (threatened .understanding) .evolvable ∧
    JustifiedDeparture (threatened .construction) .evolvable ∧
    JustifiedDeparture (threatened .diagnosis) .evolvable ∧
    JustifiedDeparture (threatened .verification) .evolvable ∧
    JustifiedDeparture (threatened .coordination) .evolvable ∧
    JustifiedDeparture (threatened .operation) .evolvable ∧
    JustifiedDeparture (threatened .migration) .evolvable ∧
    ¬ JustifiedDeparture { currentContinuing with departure := some .migration } .evolvable := by decide

                                                                           
                                                                            
```

#### `CoreReader.Engineering.orderedUnique`

`CoreReader/Engineering/Domain.lean:367–367`; def.

```lean
def orderedUnique (xs : List Nat) : List Nat := xs.eraseDups
```

#### `CoreReader.Engineering.orderedRefactor`

`CoreReader/Engineering/Domain.lean:368–368`; def.

```lean
def orderedRefactor (xs : List Nat) : List Nat := xs.eraseDups ++ []
```

#### `CoreReader.Engineering.insertOrdered`

`CoreReader/Engineering/Domain.lean:369–372`; def.

```lean
def insertOrdered (n : Nat) : List Nat → List Nat
  | [] => [n]
  | x :: xs => if n ≤ x then n :: x :: xs else x :: insertOrdered n xs

```

#### `CoreReader.Engineering.sortValues`

`CoreReader/Engineering/Domain.lean:373–376`; def.

```lean
def sortValues : List Nat → List Nat
  | [] => []
  | x :: xs => insertOrdered x (sortValues xs)

```

#### `CoreReader.Engineering.sortedUnique`

`CoreReader/Engineering/Domain.lean:377–378`; def.

```lean
def sortedUnique (xs : List Nat) : List Nat := (sortValues xs).eraseDups

```

#### `CoreReader.Engineering.SoftwareState`

`CoreReader/Engineering/Domain.lean:379–388`; structure.

```lean
structure SoftwareState where
  capabilities : List String
  implementation : Nat
  mechanisms : List String
  abstractions : List String
  boundary : Nat
  technology : String
  batchSize : Nat
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.originalSoftware`

`CoreReader/Engineering/Domain.lean:389–391`; def.

```lean
def originalSoftware : SoftwareState :=
  ⟨["deduplicate"], 0, ["queue", "legacy cache"], ["fixed batch"], 0, "legacy store", 10⟩

```

#### `CoreReader.Engineering.transform`

`CoreReader/Engineering/Domain.lean:392–405`; def.

```lean
def transform (d : Change) (s : SoftwareState) : SoftwareState := match d with
  | .addition => { s with capabilities := s.capabilities ++ ["tenant batching"] }
  | .replacement => { s with implementation := s.implementation + 1 }
  | .deletion => { s with mechanisms := s.mechanisms.filter (· != "legacy cache") }
  | .withdrawal => { s with abstractions := s.abstractions.filter (· != "fixed batch") }
  | .redrawing => { s with boundary := s.boundary + 1 }
  | .migration => { s with technology := "portable store" }
  | .independent => { s with batchSize := 5 }
  | .coordinated => { s with batchSize := 5, boundary := s.boundary + 1 }
  | .designRevision => { s with batchSize := 5, abstractions := ["live configuration"], boundary := s.boundary + 1 }
  | .other name =>
    if name = "csv export" then { s with capabilities := s.capabilities ++ ["csv export"] }
    else s

```

#### `CoreReader.Engineering.evolutionBehavior`

`CoreReader/Engineering/Domain.lean:406–410`; def.

```lean
def evolutionBehavior (d : Change) : List Nat → List Nat :=
  if d = .redrawing ∨ d = .designRevision then sortedUnique else orderedUnique

                                                                            
                                                                             
```

#### `CoreReader.Engineering.ObligationTreatment`

`CoreReader/Engineering/Domain.lean:411–413`; inductive.

```lean
inductive ObligationTreatment where
  | preserve | revise
  deriving DecidableEq, Repr
```

#### `CoreReader.Engineering.ChangeClaim`

`CoreReader/Engineering/Domain.lean:414–418`; structure.

```lean
structure ChangeClaim where
  direction : Change
  byMaintainer : Maintainer
  treatment : ObligationTreatment

```

#### `CoreReader.Engineering.contractInputs`

`CoreReader/Engineering/Domain.lean:419–419`; abbrev.

```lean
abbrev contractInputs : List (List Nat) := [[], [2, 1, 2], [1, 3, 1], [4, 4]]
```

#### `CoreReader.Engineering.PreservesOn`

`CoreReader/Engineering/Domain.lean:420–422`; def.

```lean
def PreservesOn {Input Output : Type} (scope : Input → Prop)
    (old new : Input → Output) : Prop := ∀ x, scope x → new x = old x

```

#### `CoreReader.Engineering.PreservesFinite`

`CoreReader/Engineering/Domain.lean:423–428`; abbrev.

```lean
abbrev PreservesFinite (old new : List Nat → List Nat) : Prop :=
  contractInputs.all (fun xs => new xs == old xs) = true

                                                                           
                                                                           
                                                              
```

#### `CoreReader.Engineering.ObservableContract`

`CoreReader/Engineering/Domain.lean:429–432`; structure.

```lean
structure ObservableContract where
  order : List Nat → List Nat
  maxAttempts : Nat

```

#### `CoreReader.Engineering.retry`

`CoreReader/Engineering/Domain.lean:433–435`; def.

```lean
def retry (contract : ObservableContract) (attempts : Nat) : Bool :=
  attempts < contract.maxAttempts

```

#### `CoreReader.Engineering.orderContract`

`CoreReader/Engineering/Domain.lean:436–436`; def.

```lean
def orderContract (order : List Nat → List Nat) : ObservableContract := ⟨order, 3⟩
```

#### `CoreReader.Engineering.originalContract`

`CoreReader/Engineering/Domain.lean:437–437`; def.

```lean
def originalContract : ObservableContract := orderContract orderedUnique
```

#### `CoreReader.Engineering.refactoredContract`

`CoreReader/Engineering/Domain.lean:438–438`; def.

```lean
def refactoredContract : ObservableContract := orderContract orderedRefactor
```

#### `CoreReader.Engineering.revisedContract`

`CoreReader/Engineering/Domain.lean:439–439`; def.

```lean
def revisedContract : ObservableContract := ⟨sortedUnique, 5⟩
```

#### `CoreReader.Engineering.evolutionContract`

`CoreReader/Engineering/Domain.lean:440–442`; def.

```lean
def evolutionContract (d : Change) : ObservableContract :=
  ⟨evolutionBehavior d, if d = .redrawing ∨ d = .designRevision then 5 else 3⟩

```

#### `CoreReader.Engineering.failureInputs`

`CoreReader/Engineering/Domain.lean:443–443`; def.

```lean
def failureInputs : List Nat := [0, 1, 2, 3, 4, 5]
```

#### `CoreReader.Engineering.PreservesContractFinite`

`CoreReader/Engineering/Domain.lean:444–447`; abbrev.

```lean
abbrev PreservesContractFinite (old new : ObservableContract) : Prop :=
  PreservesFinite old.order new.order ∧
  failureInputs.all (fun attempts => retry new attempts == retry old attempts) = true

```

#### `CoreReader.Engineering.ContractAspect`

`CoreReader/Engineering/Domain.lean:448–450`; inductive.

```lean
inductive ContractAspect where
  | order | retry
  deriving DecidableEq, Repr
```

#### `CoreReader.Engineering.PartyDependency`

`CoreReader/Engineering/Domain.lean:451–455`; structure.

```lean
structure PartyDependency where
  party : String
  observes : ContractAspect
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.partyDependencies`

`CoreReader/Engineering/Domain.lean:456–458`; def.

```lean
def partyDependencies : List PartyDependency :=
  [⟨"queue consumer", .order⟩, ⟨"queue operator", .retry⟩]

```

#### `CoreReader.Engineering.aspectChanged`

`CoreReader/Engineering/Domain.lean:459–462`; def.

```lean
def aspectChanged (old new : ObservableContract) : ContractAspect → Bool
  | .order => contractInputs.any (fun xs => new.order xs != old.order xs)
  | .retry => failureInputs.any (fun attempts => retry new attempts != retry old attempts)

```

#### `CoreReader.Engineering.affectedParties`

`CoreReader/Engineering/Domain.lean:463–466`; def.

```lean
def affectedParties (old new : ObservableContract) : List String :=
  (partyDependencies.filter (fun dependency => aspectChanged old new dependency.observes)).map
    PartyDependency.party

```

#### `CoreReader.Engineering.ContractRevision`

`CoreReader/Engineering/Domain.lean:467–476`; structure.

```lean
structure ContractRevision where
  deliberate : Bool
  revisedOrder : List Nat
  affected : List String
  oldFailureLimit : Nat
  newFailureLimit : Nat
  recordedOldFailureLimit : Nat
  recordedNewFailureLimit : Nat
  procedure : String

```

#### `CoreReader.Engineering.normalRevision`

`CoreReader/Engineering/Domain.lean:477–483`; def.

```lean
def normalRevision : ContractRevision := {
  deliberate := true, revisedOrder := [1, 2],
  affected := ["queue consumer", "queue operator"],
  oldFailureLimit := 3, newFailureLimit := 5,
  recordedOldFailureLimit := 3, recordedNewFailureLimit := 5,
  procedure := "contract review" }

```

#### `CoreReader.Engineering.RevisionDuties`

`CoreReader/Engineering/Domain.lean:484–490`; abbrev.

```lean
abbrev RevisionDuties (old new : ObservableContract) (r : ContractRevision) : Prop :=
  r.deliberate = true ∧ r.revisedOrder = new.order [2, 1, 2] ∧
  (affectedParties old new).all (fun p => r.affected.contains p) = true ∧
  r.oldFailureLimit = old.maxAttempts ∧ r.newFailureLimit = new.maxAttempts ∧
  r.recordedOldFailureLimit = old.maxAttempts ∧
  r.recordedNewFailureLimit = new.maxAttempts

```

#### `CoreReader.Engineering.ContractChangeAccount`

`CoreReader/Engineering/Domain.lean:491–493`; abbrev.

```lean
abbrev ContractChangeAccount (old new : ObservableContract) (r : ContractRevision) : Prop :=
  PreservesContractFinite old new ∨ RevisionDuties old new r

```

#### `CoreReader.Engineering.EvolutionClaim`

`CoreReader/Engineering/Domain.lean:494–502`; abbrev.

```lean
abbrev EvolutionClaim (a : Activity) (c : Candidate) (claim : ChangeClaim) : Prop :=
  CanChange a c claim.byMaintainer claim.direction ∧
  ContractChangeAccount originalContract (evolutionContract claim.direction) normalRevision ∧
  (changePath c claim.direction).any (fun step => step.tool == .contractRunner) = true ∧
  ((claim.treatment = .preserve ∧
      evolutionBehavior claim.direction [2, 1, 2] = orderedUnique [2, 1, 2]) ∨
    (claim.treatment = .revise ∧
      evolutionBehavior claim.direction [2, 1, 2] ≠ orderedUnique [2, 1, 2]))

```

#### `CoreReader.Engineering.evolutionKindsCases`

`CoreReader/Engineering/Domain.lean:503–514`; theorem.

```lean
theorem evolutionKindsCases :
    (transform .addition originalSoftware).capabilities = ["deduplicate", "tenant batching"] ∧
    (transform .replacement originalSoftware).implementation = 1 ∧
    (transform .deletion originalSoftware).mechanisms = ["queue"] ∧
    (transform .withdrawal originalSoftware).abstractions = [] ∧
    (transform .redrawing originalSoftware).boundary = 1 ∧
    (transform .migration originalSoftware).technology = "portable store" ∧
    changes.all (fun d => decide (CanChange continuingActivity .evolvable .successor d)) = true ∧
    EvolutionClaim continuingActivity .evolvable ⟨.replacement, .successor, .preserve⟩ ∧
    EvolutionClaim continuingActivity .evolvable ⟨.redrawing, .agent, .revise⟩ ∧
    changeWork .evolvable .independent < changeWork .evolvable .coordinated := by decide

```

#### `CoreReader.Engineering.evolutionDimensionsLimits`

`CoreReader/Engineering/Domain.lean:515–531`; theorem.

```lean
theorem evolutionDimensionsLimits :
    changeWork .presentSimple .addition = 2 ∧
    changeWork .presentSimple .withdrawal = 17 ∧
    changeWork .evolvable .independent < changeWork .evolvable .coordinated ∧
    EvolutionPriority currentContinuing .evolvable ∧
    9 < changeWork .evolvable .migration ∧
    CanChange continuingActivity .presentSimple .original .addition ∧
    CanChange continuingActivity .evolvable .original .addition ∧
    CanChange continuingActivity .presentSimple .original .designRevision ∧
    CanChange continuingActivity .evolvable .original .designRevision ∧
    changeWork .evolvable .designRevision < changeWork .presentSimple .designRevision ∧
    changeWork .evolvable .addition = changeWork .presentSimple .addition ∧
    (transform (.other "csv export") originalSoftware).capabilities = ["deduplicate", "csv export"] ∧
    CanChange continuingActivity .maximal .successor (.other "csv export") ∧
    ¬ CanChange continuingActivity .evolvable .successor (.other "csv export") := by
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide, by decide⟩

```

#### `CoreReader.Engineering.oneDimensionDoesNotEntailEveryDimension`

`CoreReader/Engineering/Domain.lean:532–539`; theorem.

```lean
theorem oneDimensionDoesNotEntailEveryDimension :
    changeWork .evolvable .designRevision < changeWork .presentSimple .designRevision ∧
    ¬ (∀ d : Change, changeWork .evolvable d < changeWork .presentSimple d) := by
  refine ⟨by decide, ?_⟩
  intro allDirections
  exact (by decide : ¬ changeWork .evolvable .addition < changeWork .presentSimple .addition)
    (allDirections .addition)

```

#### `CoreReader.Engineering.propagation`

`CoreReader/Engineering/Domain.lean:540–542`; def.

```lean
def propagation (c : Candidate) (d : Change) : List Nat :=
  ((changePath c d).map EditStep.component).eraseDups

```

#### `CoreReader.Engineering.batchCount`

`CoreReader/Engineering/Domain.lean:543–543`; def.

```lean
def batchCount (items size : Nat) : Nat := (items + size - 1) / size
```

#### `CoreReader.Engineering.staticBatch`

`CoreReader/Engineering/Domain.lean:544–544`; def.

```lean
def staticBatch (items _runtimeSize : Nat) : Nat := batchCount items 10
```

#### `CoreReader.Engineering.liveBatch`

`CoreReader/Engineering/Domain.lean:545–546`; def.

```lean
def liveBatch (items runtimeSize : Nat) : Nat := batchCount items runtimeSize

```

#### `CoreReader.Engineering.StructuralEvidence`

`CoreReader/Engineering/Domain.lean:547–557`; structure.

```lean
structure StructuralEvidence where
  intended : Change
  participants : List Maintainer
  touched : List Nat
  contractObservations : List (List Nat)
  observedBefore : List (List Nat)
  observedAfter : List (List Nat)
  understandingWork : Nat
  verificationWork : Nat
  boundaryGain : Nat

```

#### `CoreReader.Engineering.structuralEvidence`

`CoreReader/Engineering/Domain.lean:558–566`; def.

```lean
def structuralEvidence (c : Candidate) (d : Change) : StructuralEvidence := {
  intended := d, participants := maintainers, touched := propagation c d,
  contractObservations := contractInputs,
  observedBefore := contractInputs.map orderedUnique,
  observedAfter := contractInputs.map (evolutionBehavior d),
  understandingWork := changeWork c d,
  verificationWork := ((changePath c d).filter (fun step => step.tool == .contractRunner)).length,
  boundaryGain := changeWork .presentSimple d - changeWork c d }

```

#### `CoreReader.Engineering.StructuralAccount`

`CoreReader/Engineering/Domain.lean:567–576`; abbrev.

```lean
abbrev StructuralAccount (a : Activity) (c : Candidate) (e : StructuralEvidence) : Prop :=
  e.participants = a.participants ∧ e.touched = propagation c e.intended ∧
  e.contractObservations = contractInputs ∧
  e.observedBefore = contractInputs.map orderedUnique ∧
  e.observedAfter = contractInputs.map (evolutionBehavior e.intended) ∧
  e.understandingWork = changeWork c e.intended ∧
  e.verificationWork = ((changePath c e.intended).filter
    (fun step => step.tool == .contractRunner)).length ∧
  e.boundaryGain = changeWork .presentSimple e.intended - changeWork c e.intended

```

#### `CoreReader.Engineering.structuralCases`

`CoreReader/Engineering/Domain.lean:577–587`; theorem.

```lean
theorem structuralCases :
    StructuralAccount continuingActivity .evolvable (structuralEvidence .evolvable .designRevision) ∧
    (propagation .presentSimple .designRevision).length = 3 ∧
    (propagation .evolvable .designRevision).length = 2 ∧
    (changePath .evolvable .coordinated).any (fun s => s.component == 2 && s.requires == .publicContract) = true ∧
    PreservesFinite orderedUnique orderedRefactor ∧
    (structuralEvidence .evolvable .designRevision).observedBefore ≠
      (structuralEvidence .evolvable .designRevision).observedAfter ∧
    staticBatch 21 10 = liveBatch 21 10 ∧ staticBatch 21 5 ≠ liveBatch 21 5 ∧
    changeWork .presentSimple .withdrawal = 17 := by decide

```

#### `CoreReader.Engineering.InterfaceView`

`CoreReader/Engineering/Domain.lean:588–594`; structure.

```lean
structure InterfaceView where
  signature : String
  modules : Nat
  extensionPoints : Nat
  principle : String
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.sameShape`

`CoreReader/Engineering/Domain.lean:595–595`; def.

```lean
def sameShape : InterfaceView := ⟨"List Nat → List Nat", 8, 12, "dependency inversion"⟩
```

#### `CoreReader.Engineering.moduleAssumptions`

`CoreReader/Engineering/Domain.lean:596–598`; def.

```lean
def moduleAssumptions : List (Nat × Nat) :=
  (List.range 8).map (fun component => (component, 10))

```

#### `CoreReader.Engineering.modulesNeedingRevision`

`CoreReader/Engineering/Domain.lean:599–601`; def.

```lean
def modulesNeedingRevision (newSize : Nat) : List Nat :=
  (moduleAssumptions.filter (fun p => p.2 != newSize)).map Prod.fst

```

#### `CoreReader.Engineering.Boundary`

`CoreReader/Engineering/Domain.lean:602–607`; structure.

```lean
structure Boundary where
  caller : Nat
  callee : Nat
  contract : String
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.EngineeringDesign`

`CoreReader/Engineering/Domain.lean:608–615`; structure.

```lean
structure EngineeringDesign where
  metadata : InterfaceView
  run : List Nat → List Nat
  paths : Change → List EditStep
  components : List Nat
  boundaries : List Boundary
  batchAssumptions : List (Nat × Nat)

```

#### `CoreReader.Engineering.privateDesign`

`CoreReader/Engineering/Domain.lean:616–619`; def.

```lean
def privateDesign : EngineeringDesign := {
  metadata := sameShape, run := orderedUnique, paths := changePath .presentSimple,
  components := List.range 8, boundaries := [], batchAssumptions := moduleAssumptions }

```

#### `CoreReader.Engineering.documentedDesign`

`CoreReader/Engineering/Domain.lean:620–622`; def.

```lean
def documentedDesign : EngineeringDesign := {
  privateDesign with paths := changePath .evolvable }

```

#### `CoreReader.Engineering.sortedDesign`

`CoreReader/Engineering/Domain.lean:623–624`; def.

```lean
def sortedDesign : EngineeringDesign := { documentedDesign with run := sortedUnique }

```

#### `CoreReader.Engineering.DesignCanChange`

`CoreReader/Engineering/Domain.lean:625–630`; abbrev.

```lean
abbrev DesignCanChange (a : Activity) (design : EngineeringDesign)
    (m : Maintainer) (d : Change) : Prop :=
  design.paths d ≠ [] ∧ m ∈ a.participants ∧
  (design.paths d).all (fun step =>
    (a.available m).contains step.requires && a.tools.contains step.tool) = true

```

#### `CoreReader.Engineering.designWork`

`CoreReader/Engineering/Domain.lean:631–633`; def.

```lean
def designWork (design : EngineeringDesign) (d : Change) : Nat :=
  ((design.paths d).map EditStep.units).sum

```

#### `CoreReader.Engineering.designModulesNeedingRevision`

`CoreReader/Engineering/Domain.lean:634–639`; def.

```lean
def designModulesNeedingRevision (design : EngineeringDesign) (newSize : Nat) : List Nat :=
  (design.batchAssumptions.filter (fun p => p.2 != newSize)).map Prod.fst

                                                                           
                                                                          
                                                                                    
```

#### `CoreReader.Engineering.introduceBoundary`

`CoreReader/Engineering/Domain.lean:640–649`; def.

```lean
def introduceBoundary (design : EngineeringDesign) : EngineeringDesign := {
  metadata := { design.metadata with modules := design.metadata.modules + 1, extensionPoints := design.metadata.extensionPoints + 1 },
  run := fun xs => design.run (xs ++ []),
  paths := fun d => if (design.paths d).isEmpty then [] else
    design.paths d ++ [⟨design.components.length, .publicContract, .contractRunner, 1⟩],
  components := design.components ++ [design.components.length],
  boundaries := design.boundaries ++
    [⟨design.components.length, 0, design.metadata.signature⟩],
  batchAssumptions := design.batchAssumptions }

```

#### `CoreReader.Engineering.wrappedDesign`

`CoreReader/Engineering/Domain.lean:650–651`; def.

```lean
def wrappedDesign : EngineeringDesign := introduceBoundary privateDesign

```

#### `CoreReader.Engineering.structureNotCapability`

`CoreReader/Engineering/Domain.lean:652–670`; theorem.

```lean
theorem structureNotCapability :
    (privateDesign.metadata.signature = sortedDesign.metadata.signature ∧
      privateDesign.run [2, 1, 2] = [2, 1] ∧ sortedDesign.run [2, 1, 2] ≠ [2, 1]) ∧
    (privateDesign.metadata.modules = privateDesign.components.length ∧
      privateDesign.batchAssumptions.length = 8 ∧
      (designModulesNeedingRevision privateDesign 5).length = 8) ∧
    (privateDesign.metadata.principle = "dependency inversion" ∧
      privateDesign.metadata = documentedDesign.metadata ∧
      ¬ DesignCanChange continuingActivity privateDesign .successor .designRevision ∧
      DesignCanChange continuingActivity documentedDesign .successor .designRevision) ∧
    (privateDesign.boundaries.length = 0 ∧ wrappedDesign.boundaries.length = 1 ∧
      wrappedDesign.components.length = 9 ∧
      wrappedDesign.boundaries = [⟨8, 0, "List Nat → List Nat"⟩] ∧
      wrappedDesign.run [2, 1, 2] = privateDesign.run [2, 1, 2] ∧
      designWork privateDesign .designRevision = 17 ∧
      designWork wrappedDesign .designRevision = 18 ∧
      ¬ designWork wrappedDesign .designRevision < designWork privateDesign .designRevision) := by
  exact ⟨by decide, by decide, by decide, by decide⟩

```

#### `CoreReader.Engineering.contractPreservation`

`CoreReader/Engineering/Domain.lean:671–674`; theorem.

```lean
theorem contractPreservation {Input Output : Type} (scope : Input → Prop)
    (old new : Input → Output) (observations : ∀ x, scope x → new x = old x) :
    PreservesOn scope old new := observations

```

#### `CoreReader.Engineering.changedObservationNotPreserved`

`CoreReader/Engineering/Domain.lean:675–680`; theorem.

```lean
theorem changedObservationNotPreserved {Input Output : Type} (scope : Input → Prop)
    (old new : Input → Output) (x : Input) (inside : scope x)
    (different : new x ≠ old x) : ¬ PreservesOn scope old new := by
  intro h
  exact different (h x inside)

```

#### `CoreReader.Engineering.contractRevisionObligations`

`CoreReader/Engineering/Domain.lean:681–685`; theorem.

```lean
theorem contractRevisionObligations (old new : ObservableContract)
    (r : ContractRevision) (account : ContractChangeAccount old new r)
    (changed : ¬ PreservesContractFinite old new) :
    RevisionDuties old new r := account.resolve_left changed

```

#### `CoreReader.Engineering.retiredBehavior`

`CoreReader/Engineering/Domain.lean:686–688`; def.

```lean
def retiredBehavior (xs : List Nat) : List Nat :=
  if xs = [99] then [] else orderedUnique xs

```

#### `CoreReader.Engineering.contractCases`

`CoreReader/Engineering/Domain.lean:689–695`; theorem.

```lean
theorem contractCases :
    ContractChangeAccount originalContract refactoredContract normalRevision ∧
    ContractChangeAccount originalContract revisedContract normalRevision ∧
    ¬ ContractChangeAccount originalContract revisedContract { normalRevision with affected := [] } ∧
    PreservesFinite orderedUnique retiredBehavior ∧ retiredBehavior [99] ≠ orderedUnique [99] ∧
    ContractChangeAccount originalContract revisedContract { normalRevision with procedure := "paired audit" } := by decide

```

#### `CoreReader.Engineering.contractDistinctions`

`CoreReader/Engineering/Domain.lean:696–710`; theorem.

```lean
theorem contractDistinctions :
    PreservesFinite orderedUnique orderedRefactor ∧
    ¬ PreservesFinite orderedUnique sortedUnique ∧
    retry originalContract 3 = false ∧ retry revisedContract 3 = true ∧
    ¬ PreservesContractFinite originalContract revisedContract ∧
    affectedParties originalContract revisedContract = ["queue consumer", "queue operator"] ∧
    ¬ ContractChangeAccount originalContract revisedContract
      { normalRevision with affected := ["queue consumer"] } ∧
    ¬ ContractChangeAccount originalContract revisedContract
      { normalRevision with oldFailureLimit := 5, recordedOldFailureLimit := 5 } ∧
    ContractChangeAccount originalContract revisedContract normalRevision ∧
    PreservesFinite orderedUnique retiredBehavior ∧ retiredBehavior [99] ≠ orderedUnique [99] := by decide

                                                                            
                                                                                 
```

#### `CoreReader.Engineering.RevisionState`

`CoreReader/Engineering/Domain.lean:711–719`; structure.

```lean
structure RevisionState where
  time : Nat
  forecast : List Change
  maintenance : Nat
  maintainers : List Maintainer
  migrationCost : Nat
  objectiveCapacity : Nat
  choice : Candidate
  deriving DecidableEq, Repr
```

#### `CoreReader.Engineering.RevisionRecord`

`CoreReader/Engineering/Domain.lean:720–731`; structure.

```lean
structure RevisionRecord where
  software : String
  old : RevisionState
  current : RevisionState
  recordedOld : RevisionState
  recordedCurrent : RevisionState
  predictedBatchCount : Nat
  actualBatchCount : Nat
  reportedPredictionSucceeded : Bool
  consideredChanges : List Change
  criticizedDirections : List Change

```

#### `CoreReader.Engineering.MaterialGroundsChanged`

`CoreReader/Engineering/Domain.lean:732–736`; abbrev.

```lean
abbrev MaterialGroundsChanged (old current : RevisionState) : Prop :=
  old.forecast ≠ current.forecast ∨ old.maintenance ≠ current.maintenance ∨
  old.maintainers ≠ current.maintainers ∨
  old.migrationCost ≠ current.migrationCost ∨ old.objectiveCapacity ≠ current.objectiveCapacity

```

#### `CoreReader.Engineering.oldState`

`CoreReader/Engineering/Domain.lean:737–737`; def.

```lean
def oldState : RevisionState := ⟨0, [.designRevision], 6, [.original], 8, 12, .evolvable⟩
```

#### `CoreReader.Engineering.newState`

`CoreReader/Engineering/Domain.lean:738–739`; def.

```lean
def newState : RevisionState := ⟨1, [.deletion], 2, [.successor, .agent], 14, 10, .presentSimple⟩

```

#### `CoreReader.Engineering.HistoricalEvidence`

`CoreReader/Engineering/Domain.lean:740–747`; structure.

```lean
structure HistoricalEvidence where
  software : String
  state : RevisionState
  predictedBatchCount : Nat
  actualBatchCount : Nat

                                                                            
                                                                             
```

#### `CoreReader.Engineering.observedHistory`

`CoreReader/Engineering/Domain.lean:748–750`; def.

```lean
def observedHistory : HistoricalEvidence :=
  ⟨"order-preserving queue", oldState, staticBatch 21 5, liveBatch 21 5⟩

```

#### `CoreReader.Engineering.RevisionAccountAgainst`

`CoreReader/Engineering/Domain.lean:751–760`; abbrev.

```lean
abbrev RevisionAccountAgainst (history : HistoricalEvidence) (r : RevisionRecord) : Prop :=
  r.software = history.software ∧
  r.old = history.state ∧ r.recordedOld = history.state ∧
  r.predictedBatchCount = history.predictedBatchCount ∧
  r.actualBatchCount = history.actualBatchCount ∧
  r.old.time < r.current.time ∧ r.recordedCurrent = r.current ∧
  (r.old.choice ≠ r.current.choice → MaterialGroundsChanged r.old r.current) ∧
  r.reportedPredictionSucceeded = decide (history.predictedBatchCount = history.actualBatchCount) ∧
  r.consideredChanges.all (fun d => r.criticizedDirections.contains d) = true

```

#### `CoreReader.Engineering.RevisionAccount`

`CoreReader/Engineering/Domain.lean:761–762`; abbrev.

```lean
abbrev RevisionAccount (r : RevisionRecord) : Prop := RevisionAccountAgainst observedHistory r

```

#### `CoreReader.Engineering.failedHistoryNotRewritten`

`CoreReader/Engineering/Domain.lean:763–768`; theorem.

```lean
theorem failedHistoryNotRewritten (history : HistoricalEvidence) (r : RevisionRecord)
    (account : RevisionAccountAgainst history r)
    (failed : history.predictedBatchCount ≠ history.actualBatchCount) :
    r.reportedPredictionSucceeded = false := by
  simpa [failed] using account.2.2.2.2.2.2.2.2.1

```

#### `CoreReader.Engineering.revisionRecord`

`CoreReader/Engineering/Domain.lean:769–775`; def.

```lean
def revisionRecord : RevisionRecord := {
  software := "order-preserving queue",
  old := oldState, current := newState, recordedOld := oldState, recordedCurrent := newState,
  predictedBatchCount := staticBatch 21 5, actualBatchCount := liveBatch 21 5,
  reportedPredictionSucceeded := false,
  consideredChanges := changes, criticizedDirections := changes }

```

#### `CoreReader.Engineering.SupportedAlternative`

`CoreReader/Engineering/Domain.lean:776–777`; abbrev.

```lean
abbrev SupportedAlternative (gs : List DirectionGround) (d : Change) : Prop := credible gs d

```

#### `CoreReader.Engineering.RetentionJustified`

`CoreReader/Engineering/Domain.lean:778–781`; abbrev.

```lean
abbrev RetentionJustified (ctx : Context) (alternatives : List Change) : Prop :=
  alternatives.all (fun d => !decide (SupportedAlternative ctx.evidence d)) = true ∨
  JustifiedDeparture ctx .evolvable

```

#### `CoreReader.Engineering.stableRecord`

`CoreReader/Engineering/Domain.lean:782–785`; def.

```lean
def stableRecord : RevisionRecord := { revisionRecord with
  current := { newState with choice := .evolvable },
  recordedCurrent := { newState with choice := .evolvable } }

```

#### `CoreReader.Engineering.revisionCases`

`CoreReader/Engineering/Domain.lean:786–796`; theorem.

```lean
theorem revisionCases :
    RevisionAccount revisionRecord ∧
    revisionRecord.old.forecast ≠ revisionRecord.current.forecast ∧
    revisionRecord.old.maintenance ≠ revisionRecord.current.maintenance ∧
    revisionRecord.old.maintainers ≠ revisionRecord.current.maintainers ∧
    revisionRecord.old.migrationCost ≠ revisionRecord.current.migrationCost ∧
    revisionRecord.old.objectiveCapacity ≠ revisionRecord.current.objectiveCapacity ∧
    revisionRecord.predictedBatchCount ≠ revisionRecord.actualBatchCount ∧
    RetentionJustified currentContinuing [.other "quantum backend"] ∧
    RetentionJustified (threatened .migration) [.migration] := by decide

```

#### `CoreReader.Engineering.observations`

`CoreReader/Engineering/Domain.lean:797–797`; def.

```lean
def observations : List (Nat × Nat) := [(21, 10), (30, 10), (40, 10)]
```

#### `CoreReader.Engineering.revisionsMade`

`CoreReader/Engineering/Domain.lean:798–798`; def.

```lean
def revisionsMade : List Nat := [1, 2, 3]
```

#### `CoreReader.Engineering.agreedBatch`

`CoreReader/Engineering/Domain.lean:799–801`; def.

```lean
def agreedBatch (reviewers : List Maintainer) (items size : Nat) : List Nat :=
  reviewers.map (fun _ => staticBatch items size)

```

#### `CoreReader.Engineering.rewrittenOldRecord`

`CoreReader/Engineering/Domain.lean:802–805`; def.

```lean
def rewrittenOldRecord : RevisionRecord := { revisionRecord with
  old := { oldState with forecast := [.deletion] },
  recordedOld := { oldState with forecast := [.deletion] } }

```

#### `CoreReader.Engineering.rewrittenPredictionRecord`

`CoreReader/Engineering/Domain.lean:806–808`; def.

```lean
def rewrittenPredictionRecord : RevisionRecord := { revisionRecord with
  predictedBatchCount := 5, reportedPredictionSucceeded := true }

```

#### `CoreReader.Engineering.rewrittenObservationRecord`

`CoreReader/Engineering/Domain.lean:809–811`; def.

```lean
def rewrittenObservationRecord : RevisionRecord := { revisionRecord with
  actualBatchCount := 3, reportedPredictionSucceeded := true }

```

#### `CoreReader.Engineering.unrelatedSoftwareRecord`

`CoreReader/Engineering/Domain.lean:812–814`; def.

```lean
def unrelatedSoftwareRecord : RevisionRecord := {
  revisionRecord with software := "unrelated batch processor" }

```

#### `CoreReader.Engineering.historicalTamperingRejected`

`CoreReader/Engineering/Domain.lean:815–823`; theorem.

```lean
theorem historicalTamperingRejected :
    RevisionAccount revisionRecord ∧
    ¬ RevisionAccount rewrittenOldRecord ∧
    ¬ RevisionAccount rewrittenPredictionRecord ∧
    ¬ RevisionAccount rewrittenObservationRecord ∧
    observedHistory.predictedBatchCount = 3 ∧ observedHistory.actualBatchCount = 5 ∧
    ¬ RevisionAccount unrelatedSoftwareRecord := by
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide⟩

```

#### `CoreReader.Engineering.revisionLimits`

`CoreReader/Engineering/Domain.lean:824–837`; theorem.

```lean
theorem revisionLimits :
    RevisionAccount revisionRecord ∧
    ¬ RevisionAccount { revisionRecord with reportedPredictionSucceeded := true } ∧
    revisionsMade.length = 3 ∧
    agreedBatch maintainers 21 5 = [3, 3, 3] ∧ liveBatch 21 5 = 5 ∧
    observations.all (fun p => staticBatch p.1 p.2 == liveBatch p.1 p.2) = true ∧
    staticBatch 21 5 ≠ liveBatch 21 5 ∧
    RevisionAccount stableRecord ∧ stableRecord.current.choice = stableRecord.old.choice ∧
    RetentionJustified currentContinuing [.other "quantum backend"] := by
  refine ⟨by decide, ?_, by decide, by decide, by decide, by decide,
    by decide, by decide, by decide, by decide⟩
  dsimp [RevisionAccount, RevisionAccountAgainst, observedHistory, MaterialGroundsChanged, revisionRecord, oldState, newState]
  decide

```

#### `CoreReader.Engineering.groundedChanges`

`CoreReader/Engineering/Domain.lean:838–840`; def.

```lean
def groundedChanges : DirectionGround → List Change
  | .plan _ ds | .knowledge _ ds _ | .history _ ds | .other _ ds => ds

```

#### `CoreReader.Engineering.currentRevisionState`

`CoreReader/Engineering/Domain.lean:841–847`; def.

```lean
def currentRevisionState (ctx : Context) (chosen : Candidate) : RevisionState := {
  time := 1, forecast := ctx.evidence.flatMap groundedChanges,
  maintenance := ctx.activity.scheduledMaintenance, maintainers := ctx.activity.participants,
  migrationCost := cost chosen .migration,
  objectiveCapacity := ctx.limits.capacity .migration,
  choice := chosen }

```

#### `CoreReader.Engineering.revisionFor`

`CoreReader/Engineering/Domain.lean:848–850`; def.

```lean
def revisionFor (ctx : Context) (chosen : Candidate) : RevisionRecord := {
  stableRecord with software := ctx.activity.software, current := currentRevisionState ctx chosen, recordedCurrent := currentRevisionState ctx chosen }

```

#### `CoreReader.Engineering.revisionContextIdentity`

`CoreReader/Engineering/Domain.lean:851–864`; theorem.

```lean
theorem revisionContextIdentity :
    (revisionFor currentContinuing .evolvable).software = currentContinuing.activity.software ∧
    (revisionFor currentContinuing .evolvable).software = observedHistory.software ∧    (revisionFor currentContinuing .evolvable).current.maintenance =
      currentContinuing.activity.scheduledMaintenance ∧
    (revisionFor currentContinuing .evolvable).current.maintainers = currentContinuing.activity.participants ∧
    (revisionFor currentContinuing .evolvable).current.migrationCost = cost .evolvable .migration ∧
    (revisionFor currentContinuing .evolvable).current.objectiveCapacity =
      currentContinuing.limits.capacity .migration ∧
    (revisionFor currentContinuing .evolvable).current.choice = .evolvable ∧
    RevisionAccount (revisionFor currentContinuing .evolvable) := by decide

                                                                           
                                                                              
                                                                              
```

#### `CoreReader.Engineering.DomainSatisfied`

`CoreReader/Engineering/Domain.lean:865–873`; abbrev.

```lean
abbrev DomainSatisfied (ctx : Context) (chosen : Candidate) : Prop :=
  ActivityScope ctx.activity ∧ EvolutionPriority ctx chosen ∧
  credible ctx.evidence .designRevision ∧
  (ctx.departure ≠ none → JustifiedDeparture ctx .evolvable) ∧
  EvolutionClaim ctx.activity chosen ⟨.designRevision, .successor, .revise⟩ ∧
  StructuralAccount ctx.activity chosen (structuralEvidence chosen .designRevision) ∧
  ContractChangeAccount (orderContract (behavior chosen)) (evolutionContract .designRevision) normalRevision ∧
  RevisionAccount (revisionFor ctx chosen)

```

#### `CoreReader.Engineering.currentDomainSatisfied`

`CoreReader/Engineering/Domain.lean:874–878`; theorem.

```lean
theorem currentDomainSatisfied : DomainSatisfied currentContinuing .evolvable := by
  refine ⟨by decide, by decide, by decide, ?_, by decide, by decide, by decide, by decide⟩
  simp [currentContinuing]

end CoreReader.Engineering
```

### CoreReader/Engineering/Integration.lean

#### `CoreReader.Engineering.sharedContext`

`CoreReader/Engineering/Integration.lean:11–12`; abbrev.

```lean
abbrev sharedContext : Context := currentContinuing

```

#### `CoreReader.Engineering.maintainedOutput`

`CoreReader/Engineering/Integration.lean:13–15`; def.

```lean
def maintainedOutput (chosen : Candidate) (n : Nat) : Nat :=
  (behavior chosen [n]).headD 0

```

#### `CoreReader.Engineering.chosenImplementation`

`CoreReader/Engineering/Integration.lean:16–27`; def.

```lean
def chosenImplementation (chosen : Candidate) : CoreReader.Choice.Implementation where
  name := "order-preserving queue"
  conventional := chosen == .presentSimple
  established := chosen == .presentSimple
  run := maintainedOutput chosen
  cost := abstractionComplexity chosen
  domain _ := True
  explanation := maintainedOutput chosen
  trace n := [maintainedOutput chosen n]

                                                                              
                                                                                   
```

#### `CoreReader.Engineering.chosenRequirements`

`CoreReader/Engineering/Integration.lean:28–33`; def.

```lean
def chosenRequirements : CoreReader.Choice.Requirements where
  inputs _ := True
  expected n := n
  budget := sharedContext.limits.capacity .understanding
  values _ := True

```

#### `CoreReader.Engineering.chosenReasons`

`CoreReader/Engineering/Integration.lean:34–36`; def.

```lean
def chosenReasons : List CoreReader.Choice.Reason :=
  [.method .output, .method .simplicity]

```

#### `CoreReader.Engineering.maintainedOutputCorrect`

`CoreReader/Engineering/Integration.lean:37–40`; theorem.

```lean
theorem maintainedOutputCorrect (chosen : Candidate) (n : Nat) :
    maintainedOutput chosen n = n := by
  rfl

```

#### `CoreReader.Engineering.implementationReasoned`

`CoreReader/Engineering/Integration.lean:41–50`; theorem.

```lean
theorem implementationReasoned (chosen : Candidate)
    (budget : abstractionComplexity chosen ≤ chosenRequirements.budget) :
    choiceSpecification chosenRequirements (chosenImplementation chosen) chosenReasons := by
  refine ⟨⟨fun n _ => maintainedOutputCorrect chosen n, budget⟩,
    .method .output, ?_, ?_⟩
  · simp [chosenReasons]
  · exact ⟨trivial, fun n _ => maintainedOutputCorrect chosen n⟩

                                                                           
                                                                                  
```

#### `CoreReader.Engineering.capabilityOutput`

`CoreReader/Engineering/Integration.lean:51–56`; def.

```lean
def capabilityOutput (chosen : Candidate) (input : Nat) : Nat :=
  let maintainer := if input = 0 then Maintainer.original
    else if input = 1 then Maintainer.successor else Maintainer.agent
  if decide (CanChange sharedContext.activity chosen maintainer .designRevision)
  then changeWork chosen .designRevision else 0

```

#### `CoreReader.Engineering.engineeringProcess`

`CoreReader/Engineering/Integration.lean:57–59`; def.

```lean
def engineeringProcess (chosen : Candidate) : Process :=
  ⟨capabilityOutput chosen, none⟩

```

#### `CoreReader.Engineering.engineeringCapability`

`CoreReader/Engineering/Integration.lean:60–62`; def.

```lean
def engineeringCapability (chosen : Candidate) : Claim Process :=
  fun process => ∀ input, process.output input = capabilityOutput chosen input

```

#### `CoreReader.Engineering.engineeringCapabilityGrounded`

`CoreReader/Engineering/Integration.lean:63–66`; theorem.

```lean
theorem engineeringCapabilityGrounded (chosen : Candidate) :
    capabilitySpecification (engineeringProcess chosen) (engineeringCapability chosen) := by
  exact grounds012Singleton _ (processContractDischarged _ _ (fun _ => rfl))

```

#### `CoreReader.Engineering.actualCapabilityContrast`

`CoreReader/Engineering/Integration.lean:67–76`; theorem.

```lean
theorem actualCapabilityContrast :
    (engineeringProcess .presentSimple).output 0 = 17 ∧
    (engineeringProcess .presentSimple).output 1 = 0 ∧
    (engineeringProcess .presentSimple).output 2 = 0 ∧
    (engineeringProcess .evolvable).output 0 = 6 ∧
    (engineeringProcess .evolvable).output 1 = 6 ∧
    (engineeringProcess .evolvable).output 2 = 6 := by decide

                                                                            
                                                                                 
```

#### `CoreReader.Engineering.presentBudgetRecord`

`CoreReader/Engineering/Integration.lean:77–79`; def.

```lean
def presentBudgetRecord : Record Candidate :=
  ⟨fun candidate => decide (abstractionComplexity candidate ≤ 3), true⟩

```

#### `CoreReader.Engineering.presentBudgetClaim`

`CoreReader/Engineering/Integration.lean:80–81`; abbrev.

```lean
abbrev presentBudgetClaim : Claim Candidate := fun candidate => abstractionComplexity candidate ≤ 3

```

#### `CoreReader.Engineering.budgetObservationMeaning`

`CoreReader/Engineering/Integration.lean:82–91`; theorem.

```lean
theorem budgetObservationMeaning (candidate : Candidate) :
    Compatible [presentBudgetRecord] candidate ↔ presentBudgetClaim candidate := by
  constructor
  · intro observed
    have result := observed presentBudgetRecord (List.mem_singleton.mpr rfl)
    exact of_decide_eq_true result
  · intro enough record member
    cases List.mem_singleton.mp member
    exact decide_eq_true enough

```

#### `CoreReader.Engineering.budgetEmpiricalFacet`

`CoreReader/Engineering/Integration.lean:92–94`; def.

```lean
def budgetEmpiricalFacet : Facet Candidate :=
  .empirical [presentBudgetRecord] (fun _ => True) presentBudgetClaim (fun _ => True)

```

#### `CoreReader.Engineering.budgetEmpiricalDischarged`

`CoreReader/Engineering/Integration.lean:95–100`; theorem.

```lean
theorem budgetEmpiricalDischarged : FacetDischarged budgetEmpiricalFacet := by
  refine ⟨⟨.evolvable, (budgetObservationMeaning _).2 (by decide), trivial⟩, ?_, ?_⟩
  · intro candidate observed _
    exact (budgetObservationMeaning candidate).1 observed
  · intro _ _; trivial

```

#### `CoreReader.Engineering.capacityClaim`

`CoreReader/Engineering/Integration.lean:101–103`; def.

```lean
def capacityClaim : Claim Candidate :=
  fun candidate => abstractionComplexity candidate ≤ sharedContext.limits.capacity .understanding

```

#### `CoreReader.Engineering.capacityAssumptions`

`CoreReader/Engineering/Integration.lean:104–105`; def.

```lean
def capacityAssumptions : Theory Candidate := singleton presentBudgetClaim

```

#### `CoreReader.Engineering.budgetInferentialFacet`

`CoreReader/Engineering/Integration.lean:106–107`; def.

```lean
def budgetInferentialFacet : Facet Candidate := .inferential capacityAssumptions capacityClaim

```

#### `CoreReader.Engineering.budgetInferentialDischarged`

`CoreReader/Engineering/Integration.lean:108–113`; theorem.

```lean
theorem budgetInferentialDischarged : FacetDischarged budgetInferentialFacet := by
  refine ⟨⟨.evolvable, (modelsSingleton _ _).2 (by decide)⟩, ?_⟩
  intro candidate premises
  have small := (modelsSingleton _ _).1 premises
  exact Nat.le_trans small (by decide)

```

#### `CoreReader.Engineering.budgetScopeAccount`

`CoreReader/Engineering/Integration.lean:114–125`; def.

```lean
def budgetScopeAccount : ScopeAccount Candidate where
  claim := presentBudgetClaim
  conditions := fun _ => True
  observationScope := fun _ => True
  relevant := fun a b => behavior a [2, 1, 2] = behavior b [2, 1, 2]
  compared := fun a b => presentBudgetClaim a ∧ presentBudgetClaim b
  used method := method = .measurement
  role _ := "threshold observation of present complexity; no future-performance conclusion"
  explains method text claim conditions := method = .measurement ∧
    text = "threshold observation of present complexity; no future-performance conclusion" ∧
    claim = presentBudgetClaim ∧ conditions = (fun _ => True)

```

#### `CoreReader.Engineering.budgetScopeExplained`

`CoreReader/Engineering/Integration.lean:126–133`; theorem.

```lean
theorem budgetScopeExplained : scopeSpecification budgetScopeAccount := by
  constructor
  · intro a b _; exact ⟨trivial, trivial, trivial, trivial, rfl⟩
  · intro method hm
    exact ⟨by change "threshold observation of present complexity; no future-performance conclusion" ≠ ""; decide,
      hm, rfl, rfl, rfl⟩

                                                                           
```

#### `CoreReader.Engineering.budgetObservationLimit`

`CoreReader/Engineering/Integration.lean:134–143`; theorem.

```lean
theorem budgetObservationLimit :
    Compatible [presentBudgetRecord] .evolvable ∧
    ¬ Supports [presentBudgetRecord] (fun candidate => abstractionComplexity candidate ≤ 1) := by
  refine ⟨(budgetObservationMeaning _).2 (by decide), ?_⟩
  intro support
  have impossible := support .evolvable ((budgetObservationMeaning _).2 (by decide))
  exact (by decide : ¬ (3 ≤ 1)) impossible

                                                                            
                                                                                  
```

#### `CoreReader.Engineering.engineeringPolicy`

`CoreReader/Engineering/Integration.lean:144–151`; def.

```lean
def engineeringPolicy : CoreReader.Agency.Policy where
  worthPursuing aim :=
    (aim = .expandUnderstandingAndConstruction ∧ coreAdopted .generation = true) ∨
      aim = .preserveSafeOperation
  current form := form.version = 1
  revisable form := ∃ next, form.version < next ∧ coreAdopted .generation = true
  permitsVersion old next := old ≤ next

```

#### `CoreReader.Engineering.engineeringGenerative`

`CoreReader/Engineering/Integration.lean:152–156`; theorem.

```lean
theorem engineeringGenerative : generationSpecification engineeringPolicy := by
  exact ⟨Or.inl ⟨rfl, rfl⟩, fun form _ => ⟨form.version + 1, Nat.lt_succ_self _, rfl⟩⟩

                                                                              
                                                                                
```

#### `CoreReader.Engineering.OwnFact`

`CoreReader/Engineering/Integration.lean:157–161`; inductive.

```lean
inductive OwnFact
  | selected | requirements | capacity | capability | forecast | revision
  | generativePolicy | reflection | coreAdoption (principle : CoreCommitment)
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.ownFactClaim`

`CoreReader/Engineering/Integration.lean:162–173`; abbrev.

```lean
abbrev ownFactClaim (adopted : Candidate) : OwnFact → Claim Candidate
  | .selected => fun candidate => candidate = adopted
  | .requirements => fun candidate => Meets sharedContext.required (sharedContext.profiles candidate)
  | .capacity => capacityClaim
  | .capability => fun candidate => engineeringCapability candidate (engineeringProcess candidate)
  | .forecast => fun _ => staticBatch 21 10 = liveBatch 21 10 ∧ staticBatch 21 5 ≠ liveBatch 21 5
  | .revision => fun candidate => RevisionAccount (revisionFor sharedContext candidate)
  | .generativePolicy => fun _ => generationSpecification engineeringPolicy
  | .reflection => fun candidate => reflexivitySpecification
      (selfModel candidate).rules (selfModel candidate).self (selfModel candidate).performed
  | .coreAdoption principle => (governancePosition principle).commitment

```

#### `CoreReader.Engineering.actualOwnFact`

`CoreReader/Engineering/Integration.lean:174–187`; theorem.

```lean
theorem actualOwnFact (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) (fact : OwnFact) :
    ownFactClaim chosen fact chosen := by
  cases fact with
  | selected => rfl
  | requirements => cases chosen <;> decide
  | capacity => rcases ordinary with rfl | rfl <;> change _ ≤ 12 <;> decide
  | capability => intro _; rfl
  | forecast => exact ⟨rfl, by decide⟩
  | revision => rcases ordinary with rfl | rfl <;> decide
  | generativePolicy => exact engineeringGenerative
  | reflection => exact currentSelfApplication chosen ordinary
  | coreAdoption _ => rfl

```

#### `CoreReader.Engineering.ownFactPremises`

`CoreReader/Engineering/Integration.lean:188–190`; def.

```lean
def ownFactPremises (chosen : Candidate) : Theory Candidate :=
  singleton (fun candidate => candidate = chosen)

```

#### `CoreReader.Engineering.actualOwnFactGrounded`

`CoreReader/Engineering/Integration.lean:191–202`; theorem.

```lean
theorem actualOwnFactGrounded (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) (fact : OwnFact) :
    inferentialSpecification (ownFactPremises chosen) (ownFactClaim chosen fact) := by
  apply grounds012Singleton
  refine ⟨⟨chosen, (modelsSingleton _ _).2 rfl⟩, ?_⟩
  intro candidate same
  have identity := (modelsSingleton _ _).1 same
  subst candidate
  exact actualOwnFact chosen ordinary fact

                                                                             
                                                                                    
```

#### `CoreReader.Engineering.ownTheory`

`CoreReader/Engineering/Integration.lean:203–205`; def.

```lean
def ownTheory (chosen : Candidate) : Theory Candidate :=
  fun claim => ∃ fact : OwnFact, claim = ownFactClaim chosen fact

```

#### `CoreReader.Engineering.nonemptyOwnObjects`

`CoreReader/Engineering/Integration.lean:206–213`; theorem.

```lean
theorem nonemptyOwnObjects (chosen : Candidate) :
    ownTheory chosen (ownFactClaim chosen .selected) ∧
    ownTheory chosen (ownFactClaim chosen (.coreAdoption .grounds)) ∧
    (.activity : ReviewObject) ∈ (selfModel chosen).objects ∧
    (.commitment .grounds : ReviewObject) ∈ (selfModel chosen).objects := by
  refine ⟨⟨.selected, rfl⟩, ⟨.coreAdoption .grounds, rfl⟩, ?_, ?_⟩ <;>
    simp [selfModel, reviewObjects, coreCommitments]

```

#### `CoreReader.Engineering.comparisonContext`

`CoreReader/Engineering/Integration.lean:214–218`; def.

```lean
def comparisonContext (chosen : Candidate) : CoreReader.Logic.Context Candidate OwnFact where
  assumptions := ownFactPremises chosen
  meaning := ownFactClaim chosen
  scope := valueScope

```

#### `CoreReader.Engineering.engineeringSnapshot`

`CoreReader/Engineering/Integration.lean:219–221`; def.

```lean
def engineeringSnapshot (chosen : Candidate) (revision : Nat) : Snapshot Candidate OwnFact :=
  ⟨ownTheory chosen, comparisonContext chosen, revision⟩

```

#### `CoreReader.Engineering.currentAdmissible`

`CoreReader/Engineering/Integration.lean:222–230`; theorem.

```lean
theorem currentAdmissible (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) :
    Admissible (ownTheory chosen) (comparisonContext chosen) chosen := by
  refine ⟨?_, (modelsSingleton _ _).2 rfl, ?_⟩
  · intro claim held
    obtain ⟨fact, rfl⟩ := held
    exact actualOwnFact chosen ordinary fact
  · rcases ordinary with rfl | rfl <;> change _ ≤ 3 <;> decide

```

#### `CoreReader.Engineering.currentConsistency`

`CoreReader/Engineering/Integration.lean:231–239`; theorem.

```lean
theorem currentConsistency (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) :
    consistencySpecification (engineeringSnapshot .evolvable 0)
      (engineeringSnapshot chosen 1) true := by
  exact ⟨consequenceConsistency _ _ ⟨chosen, currentAdmissible chosen ordinary⟩, fun _ => rfl⟩

                                                                             
                                                                           
                                                                                 
```

#### `CoreReader.Engineering.Inherited`

`CoreReader/Engineering/Integration.lean:240–259`; structure.

```lean
structure Inherited (ctx : Context) (chosen : Candidate) : Prop where
  sameContext : ctx = sharedContext
  generation : generationSpecification engineeringPolicy
  consistency : consistencySpecification (engineeringSnapshot .evolvable 0)
    (engineeringSnapshot chosen 1) true
  reflection : reflexivitySpecification (selfModel chosen).rules (selfModel chosen).self
    (selfModel chosen).performed
  ownPrincipleGrounds : ∀ principle, valueSpecification (governancePosition principle)
  choiceValueGrounds : valueSpecification (selectionPosition chosen)
  empiricalGrounds : empiricalSpecification [presentBudgetRecord] (fun _ => True)
    presentBudgetClaim (fun _ => True)
  inferentialGrounds : inferentialSpecification capacityAssumptions capacityClaim
  scopeAccount : scopeSpecification budgetScopeAccount
  capabilityGrounds : capabilitySpecification (engineeringProcess chosen) (engineeringCapability chosen)
  implementationChoice : choiceSpecification chosenRequirements (chosenImplementation chosen) chosenReasons
  ownClaimGrounds : ∀ fact, inferentialSpecification (ownFactPremises chosen) (ownFactClaim chosen fact)
  observedHere : Compatible [presentBudgetRecord] chosen
  selectionActuallyAdopted : (selectionPosition chosen).commitment chosen
  currentOwnClaims : Models (ownTheory chosen) chosen

```

#### `CoreReader.Engineering.inheritedCurrent`

`CoreReader/Engineering/Integration.lean:260–275`; theorem.

```lean
theorem inheritedCurrent (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) :
    Inherited sharedContext chosen := by
  refine ⟨rfl, engineeringGenerative, currentConsistency chosen ordinary,
    currentSelfApplication chosen ordinary, governanceGrounded,
    selectionGrounded chosen ordinary, grounds012Singleton _ budgetEmpiricalDischarged,
    grounds012Singleton _ budgetInferentialDischarged, budgetScopeExplained,
    engineeringCapabilityGrounded chosen, ?_, actualOwnFactGrounded chosen ordinary,
    ?_, rfl, (currentAdmissible chosen ordinary).1⟩
  · apply implementationReasoned
    rcases ordinary with rfl | rfl <;> change _ ≤ 12 <;> decide
  · apply (budgetObservationMeaning _).2
    rcases ordinary with rfl | rfl <;> change _ ≤ 3 <;> decide

                                                                             
                                                                           
```

#### `CoreReader.Engineering.inheritedMutualApplication`

`CoreReader/Engineering/Integration.lean:276–287`; theorem.

```lean
theorem inheritedMutualApplication (ctx : Context) (chosen : Candidate)
    (inherited : Inherited ctx chosen) :
    generationSpecification engineeringPolicy ∧
    reflexivitySpecification (selfModel chosen).rules (selfModel chosen).self
      (selfModel chosen).performed ∧
    (∀ principle, valueSpecification (governancePosition principle)) ∧
    capabilitySpecification (engineeringProcess chosen) (engineeringCapability chosen) ∧
    choiceSpecification chosenRequirements (chosenImplementation chosen) chosenReasons ∧
    (∀ fact, inferentialSpecification (ownFactPremises chosen) (ownFactClaim chosen fact)) :=
  ⟨inherited.generation, inherited.reflection, inherited.ownPrincipleGrounds,
    inherited.capabilityGrounds, inherited.implementationChoice, inherited.ownClaimGrounds⟩

```

#### `CoreReader.Engineering.inheritedMutualCases`

`CoreReader/Engineering/Integration.lean:288–300`; theorem.

```lean
theorem inheritedMutualCases :
    Inherited sharedContext .evolvable ∧
    valueSpecification (governancePosition .grounds) ∧
    capabilitySpecification (engineeringProcess .evolvable) (engineeringCapability .evolvable) ∧
    choiceSpecification chosenRequirements (chosenImplementation .evolvable) chosenReasons ∧
    Reflection.evaluate ((selfModel .evolvable).input ⟨0, .evolutionMethod, .revision⟩) = .counterexample :=
  ⟨inheritedCurrent .evolvable (Or.inr rfl), governanceGrounded .grounds,
    engineeringCapabilityGrounded .evolvable,
    (inheritedCurrent .evolvable (Or.inr rfl)).implementationChoice,
    (actualSelfCriticism .evolvable).2.2.1⟩

                                                                        
                                                                               
```

#### `CoreReader.Engineering.priorityRemainsReflexive`

`CoreReader/Engineering/Integration.lean:301–313`; theorem.

```lean
theorem priorityRemainsReflexive (ctx : Context) (chosen : Candidate)
    (inherited : Inherited ctx chosen) (domain : DomainSatisfied ctx chosen)
    (applicable : PriorityConditions ctx) (noDeparture : ¬ JustifiedDeparture ctx .evolvable) :
    chosen = .evolvable ∧
    (.priority : ReviewObject) ∈ (selfModel chosen).objects ∧
    reflexivitySpecification (selfModel chosen).rules (selfModel chosen).self
      (selfModel chosen).performed ∧
    (∀ principle, valueSpecification (governancePosition principle)) := by
  have selected := (priorityWhenApplicable ctx chosen domain.2.1 applicable noDeparture).1
  refine ⟨selected, ?_, inherited.reflection, inherited.ownPrincipleGrounds⟩
  subst chosen
  decide

```

#### `CoreReader.Engineering.priorityReflexiveCases`

`CoreReader/Engineering/Integration.lean:314–328`; theorem.

```lean
theorem priorityReflexiveCases :
    (.priority : ReviewObject) ∈ (selfModel .evolvable).objects ∧
    objectTest .priority (.evolvable, 10) = true ∧
    (selfModel .evolvable).performed ⟨0, 1⟩ ⟨0, .priority, .revision⟩
      ((selfModel .evolvable).input ⟨0, .priority, .revision⟩)
      (.assessed .supportedWithinScope) ∧
    Reflection.evaluate ((selfModel .evolvable).input ⟨0, .evolutionMethod, .revision⟩) = .counterexample ∧
    objectTest .evolutionMethod (.evolvable, 10) = true ∧
    objectTest .evolutionMethod (.evolvable, 5) = false := by
  refine ⟨by decide, by decide, ?_, (actualSelfCriticism .evolvable).2.2.1,
    (actualSelfCriticism .evolvable).1, (actualSelfCriticism .evolvable).2.1⟩
  exact ⟨⟨rfl, by decide⟩, rfl, .assessment, rfl, rfl⟩

                                                                             
                                                                             
```

#### `CoreReader.Engineering.jointWitness`

`CoreReader/Engineering/Integration.lean:329–348`; theorem.

```lean
theorem jointWitness :
    ∃ ctx : Context, ∃ chosen : Candidate,
      ctx = sharedContext ∧ chosen = .evolvable ∧
      Inherited ctx chosen ∧ DomainSatisfied ctx chosen ∧
      PriorityConditions ctx ∧ ¬ HasThreat ctx .evolvable ∧
      abstractionComplexity .presentSimple < abstractionComplexity chosen ∧
      CanChange ctx.activity chosen .successor .designRevision ∧
      CanChange ctx.activity chosen .agent .designRevision ∧
      ownTheory chosen (ownFactClaim chosen .selected) ∧
      (.commitment .grounds : ReviewObject) ∈ (selfModel chosen).objects ∧
      Admissible (ownTheory chosen) (comparisonContext chosen) chosen := by
  exact ⟨sharedContext, .evolvable, rfl, rfl,
    inheritedCurrent .evolvable (Or.inr rfl), currentDomainSatisfied,
    currentPriorityConditions, currentNoThreat.1, by decide, by decide, by decide,
    (nonemptyOwnObjects .evolvable).1, (nonemptyOwnObjects .evolvable).2.2.2,
    currentAdmissible .evolvable (Or.inr rfl)⟩

                                                                            
                                                                            
                                                                         
```

#### `CoreReader.Engineering.inheritedDoesNotEntailPriority`

`CoreReader/Engineering/Integration.lean:349–371`; theorem.

```lean
theorem inheritedDoesNotEntailPriority :
    ∃ ctx : Context, ∃ chosen : Candidate,
      ctx = sharedContext ∧ chosen = .presentSimple ∧
      Inherited ctx chosen ∧ PriorityConditions ctx ∧
      Continuing ctx.activity ∧ ¬ BoundedLifecycle ctx.activity ∧
      ¬ HasThreat ctx .evolvable ∧ ¬ JustifiedDeparture ctx .evolvable ∧
      Meets ctx.required (ctx.profiles .presentSimple) ∧
      Meets ctx.required (ctx.profiles .evolvable) ∧
      credible ctx.evidence .designRevision ∧
      CanChange ctx.activity .evolvable .successor .designRevision ∧
      CanChange ctx.activity .evolvable .agent .designRevision ∧
      changeWork .evolvable .designRevision < changeWork chosen .designRevision ∧
      abstractionComplexity chosen < abstractionComplexity .evolvable ∧
      valueSpecification (selectionPosition chosen) ∧
      (selectionPosition chosen).commitment chosen ∧
      ¬ EvolutionPriority ctx chosen := by
  exact ⟨sharedContext, .presentSimple, rfl, rfl,
    inheritedCurrent .presentSimple (Or.inl rfl), currentPriorityConditions,
    by decide, by decide, currentNoThreat.1, currentNoThreat.2,
    by decide, by decide, by decide, by decide, by decide, by decide, by decide,
    selectionGrounded .presentSimple (Or.inl rfl), rfl, currentSimpleViolates⟩

end CoreReader.Engineering
```

### CoreReader/Engineering/Reflection.lean

#### `CoreReader.Engineering.Reflection.Target`

`CoreReader/Engineering/Reflection.lean:8–14`; structure.

```lean
structure Target (Object : Type) where
  owner : Nat
  object : Object
  phase : Phase

                                                                                
                                                                               
```

#### `CoreReader.Engineering.Reflection.Contract`

`CoreReader/Engineering/Reflection.lean:15–21`; structure.

```lean
structure Contract (W : Type) where
  test : W → Bool
  tested : List W
  claimed : List W

                                                                               
                                                               
```

#### `CoreReader.Engineering.Reflection.Input`

`CoreReader/Engineering/Reflection.lean:22–28`; structure.

```lean
structure Input (W Object : Type) where
  target : Target Object
  contract : Contract W
  requested : List W
  reasons : List String
  basis : Prop

```

#### `CoreReader.Engineering.Reflection.Verdict`

`CoreReader/Engineering/Reflection.lean:29–31`; inductive.

```lean
inductive Verdict | supportedWithinScope | counterexample | noSupportingSample
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.Reflection.Outcome`

`CoreReader/Engineering/Reflection.lean:32–37`; inductive.

```lean
inductive Outcome (W : Type)
  | generated (tests scope : List W)
  | assessed (verdict : Verdict)

                                                                          
                                                           
```

#### `CoreReader.Engineering.Reflection.evaluate`

`CoreReader/Engineering/Reflection.lean:38–45`; def.

```lean
def evaluate {W Object : Type} (input : Input W Object) : Verdict :=
  if input.contract.tested.all input.contract.test then
    if input.requested.all input.contract.test then .supportedWithinScope
    else .counterexample
  else .noSupportingSample

                                                                               
                                                                       
```

#### `CoreReader.Engineering.Reflection.interpret`

`CoreReader/Engineering/Reflection.lean:46–51`; def.

```lean
def interpret {W Object : Type} (activity : Activity) (input : Input W Object)
    (outcome : Outcome W) : Prop :=
  input.reasons ≠ [] ∧ input.basis ∧ match activity with
  | .generation => outcome = .generated input.requested input.requested
  | .assessment => outcome = .assessed (evaluate input)

```

#### `CoreReader.Engineering.Reflection.Model`

`CoreReader/Engineering/Reflection.lean:52–62`; structure.

```lean
structure Model (W Object : Type) where
  owner : Nat
  objects : List Object
  contracts : Object → Contract W
  requested : Object → Phase → List W
  reasons : Object → Phase → List String
  basis : Object → Phase → Prop
  generationApplies : Object → Phase → Prop
  assessmentApplies : Object → Phase → Prop
  recorded : Activity → Object → Phase → Outcome W

```

#### `CoreReader.Engineering.Reflection.Model.input`

`CoreReader/Engineering/Reflection.lean:63–66`; def.

```lean
def Model.input {W Object : Type} (m : Model W Object) (t : Target Object) : Input W Object :=
  ⟨t, m.contracts t.object, m.requested t.object t.phase, m.reasons t.object t.phase,
    m.basis t.object t.phase⟩

```

#### `CoreReader.Engineering.Reflection.Model.self`

`CoreReader/Engineering/Reflection.lean:67–69`; def.

```lean
def Model.self {W Object : Type} (m : Model W Object) (t : Target Object) : Prop :=
  t.owner = m.owner ∧ t.object ∈ m.objects

```

#### `CoreReader.Engineering.Reflection.Model.rule`

`CoreReader/Engineering/Reflection.lean:70–79`; def.

```lean
def Model.rule {W Object : Type} (m : Model W Object) (activity : Activity) :
    ReflexiveRule (Target Object) (Input W Object) (Outcome W) where
  key := ⟨m.owner, match activity with | .generation => 0 | .assessment => 1⟩
  activity := activity
  applicable t := m.self t ∧ match activity with
    | .generation => m.generationApplies t.object t.phase
    | .assessment => m.assessmentApplies t.object t.phase
  input := m.input
  meaning := interpret activity

```

#### `CoreReader.Engineering.Reflection.Model.rules`

`CoreReader/Engineering/Reflection.lean:80–84`; def.

```lean
def Model.rules {W Object : Type} (m : Model W Object) :=
  [m.rule .generation, m.rule .assessment]

                                                                               
                                                                                        
```

#### `CoreReader.Engineering.Reflection.Model.performed`

`CoreReader/Engineering/Reflection.lean:85–90`; def.

```lean
def Model.performed {W Object : Type} (m : Model W Object)
    (key : PrincipleKey) (t : Target Object) (input : Input W Object) (outcome : Outcome W) : Prop :=
  m.self t ∧ input = m.input t ∧
    ∃ activity, key = (m.rule activity).key ∧
      outcome = m.recorded activity t.object t.phase

```

#### `CoreReader.Engineering.Reflection.Model.follows`

`CoreReader/Engineering/Reflection.lean:91–99`; def.

```lean
def Model.follows {W Object : Type} (m : Model W Object) : Prop :=
  ∀ activity object phase, object ∈ m.objects →
    (match activity with
      | .generation => m.generationApplies object phase
      | .assessment => m.assessmentApplies object phase) →
    interpret activity (m.input ⟨m.owner, object, phase⟩) (m.recorded activity object phase)

                                                                           
                                                                                   
```

#### `CoreReader.Engineering.Reflection.recordedReflexivity`

`CoreReader/Engineering/Reflection.lean:100–128`; theorem.

```lean
theorem recordedReflexivity {W Object : Type} (m : Model W Object) (checked : m.follows) :
    reflexivitySpecification m.rules m.self m.performed := by
  constructor
  · intro p hp q hq equal
    simp only [Model.rules, List.mem_cons, List.not_mem_nil, or_false] at hp hq
    rcases hp with rfl | rfl <;> rcases hq with rfl | rfl
    · rfl
    · have bad := congrArg PrincipleKey.localId equal; contradiction
    · have bad := congrArg PrincipleKey.localId equal; contradiction
    · rfl
  · intro rule hr target hs ha
    simp only [Model.rules, List.mem_cons, List.not_mem_nil, or_false] at hr
    rcases hr with rfl | rfl
    · refine ⟨m.recorded .generation target.object target.phase,
        ⟨hs, rfl, .generation, rfl, rfl⟩, ?_⟩
      have actual := checked .generation target.object target.phase hs.2 ha.2
      rcases target with ⟨owner, object, phase⟩
      have ownerEqual : owner = m.owner := hs.1
      subst owner
      exact actual
    · refine ⟨m.recorded .assessment target.object target.phase,
        ⟨hs, rfl, .assessment, rfl, rfl⟩, ?_⟩
      have actual := checked .assessment target.object target.phase hs.2 ha.2
      rcases target with ⟨owner, object, phase⟩
      have ownerEqual : owner = m.owner := hs.1
      subst owner
      exact actual

end CoreReader.Engineering.Reflection
```

### CoreReader/Engineering/SelfApplication.lean

#### `CoreReader.Engineering.ReviewObject`

`CoreReader/Engineering/SelfApplication.lean:8–10`; inductive.

```lean
inductive ReviewObject | activity | commitment (principle : CoreCommitment) | priority | evolutionMethod
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.ReviewCase`

`CoreReader/Engineering/SelfApplication.lean:11–14`; abbrev.

```lean
abbrev ReviewCase := Candidate × Nat

                                                                              
                                                                               
```

#### `CoreReader.Engineering.objectTest`

`CoreReader/Engineering/SelfApplication.lean:15–21`; def.

```lean
def objectTest (object : ReviewObject) (point : ReviewCase) : Bool :=
  match object with
  | .activity => decide (Meets currentContinuing.required (currentContinuing.profiles point.1))
  | .commitment principle => safeguardExperiment principle true point.1
  | .priority => decide (EvolutionPriority currentContinuing point.1)
  | .evolutionMethod => staticBatch 21 point.2 == liveBatch 21 point.2

```

#### `CoreReader.Engineering.reviewObjects`

`CoreReader/Engineering/SelfApplication.lean:22–25`; def.

```lean
def reviewObjects (chosen : Candidate) : List ReviewObject :=
  [.activity] ++ coreCommitments.map ReviewObject.commitment ++
    (if chosen = .evolvable then [.priority] else []) ++ [.evolutionMethod]

```

#### `CoreReader.Engineering.requestedCases`

`CoreReader/Engineering/SelfApplication.lean:26–29`; def.

```lean
def requestedCases (chosen : Candidate) : CoreReader.Agency.Phase → List ReviewCase
  | .formation | .application => [(chosen, 10)]
  | .revision => [(chosen, 10), (chosen, 5)]

```

#### `CoreReader.Engineering.reviewReasons`

`CoreReader/Engineering/SelfApplication.lean:30–43`; def.

```lean
def reviewReasons (object : ReviewObject) (phase : CoreReader.Agency.Phase) : List String :=
  let content := match object with
    | .activity => "actual order, safety, latency and retention requirements of this activity"
    | .commitment principle => criticismFor principle
    | .priority => "credible design revision, successor and agent paths, necessary requirements and concrete costs"
    | .evolutionMethod => "the same batch forecast at its recorded size and the proposed runtime size"
  [content, match phase with
    | .formation => "identify this object's purpose and the conditions of its initial contract"
    | .application => "apply that contract to the currently selected design in this continuing activity"
    | .revision => "examine the proposed wider input scope and retain any counterexample"]

                                                                            
                                                                             
                                                                       
```

#### `CoreReader.Engineering.statedReview`

`CoreReader/Engineering/SelfApplication.lean:44–54`; def.

```lean
def statedReview (chosen : Candidate) (activity : CoreReader.Agency.Activity)
    (object : ReviewObject) (phase : CoreReader.Agency.Phase) : Reflection.Outcome ReviewCase :=
  match activity with
  | .generation => .generated (requestedCases chosen phase) (requestedCases chosen phase)
  | .assessment => .assessed (match object, phase with
    | .evolutionMethod, .revision => .counterexample
    | _, _ => .supportedWithinScope)

                                                                         
                                                                             
                                                    
```

#### `CoreReader.Engineering.reviewBasis`

`CoreReader/Engineering/SelfApplication.lean:55–63`; def.

```lean
def reviewBasis (chosen : Candidate) : ReviewObject → CoreReader.Agency.Phase → Prop
  | .activity, _ => ActivityScope currentContinuing.activity ∧
      Meets currentContinuing.required (currentContinuing.profiles chosen)
  | .commitment principle, _ => ReasonRelevant principle (reasonFor principle) chosen
  | .priority, _ => PriorityConditions currentContinuing ∧ ¬ HasThreat currentContinuing .evolvable
  | .evolutionMethod, .revision =>
      staticBatch 21 10 = liveBatch 21 10 ∧ staticBatch 21 5 ≠ liveBatch 21 5
  | .evolutionMethod, _ => staticBatch 21 10 = liveBatch 21 10

```

#### `CoreReader.Engineering.selfModel`

`CoreReader/Engineering/SelfApplication.lean:64–77`; def.

```lean
def selfModel (chosen : Candidate) : Reflection.Model ReviewCase ReviewObject where
  owner := 0
  objects := reviewObjects chosen
  contracts object := ⟨objectTest object, [(chosen, 10)], [(chosen, 10)]⟩
  requested _ := requestedCases chosen
  reasons := reviewReasons
  basis := reviewBasis chosen
  generationApplies _ phase := phase ≠ .application
  assessmentApplies _ _ := True
  recorded := statedReview chosen

                                                                            
                                                                                 
                                                                            
```

#### `CoreReader.Engineering.reviewIdentity`

`CoreReader/Engineering/SelfApplication.lean:78–86`; theorem.

```lean
theorem reviewIdentity (chosen : Candidate) (object : ReviewObject)
    (phase : CoreReader.Agency.Phase) :
    ((selfModel chosen).input ⟨0, object, phase⟩).target.object = object ∧
    ((selfModel chosen).input ⟨0, object, phase⟩).contract.test = objectTest object ∧
    ((selfModel chosen).input ⟨0, object, phase⟩).requested = requestedCases chosen phase ∧
    ((selfModel chosen).input ⟨0, object, phase⟩).reasons = reviewReasons object phase ∧
    ((selfModel chosen).input ⟨0, object, phase⟩).basis = reviewBasis chosen object phase :=
  ⟨rfl, rfl, rfl, rfl, rfl⟩

```

#### `CoreReader.Engineering.currentSelfRecords`

`CoreReader/Engineering/SelfApplication.lean:87–108`; theorem.

```lean
theorem currentSelfRecords (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) :
    (selfModel chosen).follows := by
  rcases ordinary with rfl | rfl
  all_goals
    intro activity object phase member applies
    cases activity <;> cases object <;> cases phase
    all_goals first
      | rename_i principle; cases principle
      | skip
    all_goals simp_all [Reflection.interpret, Reflection.Model.input,
      Reflection.evaluate, selfModel, statedReview, reviewObjects, coreCommitments,
      requestedCases, reviewReasons, criticismFor, objectTest, safeguardExperiment,
      reviewBasis, ReasonRelevant, reasonFor, HasThreat, burdens, ConcreteThreat, cost,
      EvolutionPriority, PriorityConditions, JustifiedDeparture, currentContinuing,
      Continuing, ActivityScope, Meets, profile, normalRequirements, initialGrounds,
      ContinuingCapability, continuingActivity, maintainers, changePath,
      changeWork, abstractionComplexity, credible, CredibleDirection, articulateGround,
      supportGround, normalLimits, staticBatch, liveBatch, batchCount, orderedUnique,
      sortedUnique, sortValues, insertOrdered, List.eraseDups]
    all_goals decide

```

#### `CoreReader.Engineering.currentSelfApplication`

`CoreReader/Engineering/SelfApplication.lean:109–117`; theorem.

```lean
theorem currentSelfApplication (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) :
    reflexivitySpecification (selfModel chosen).rules (selfModel chosen).self
      (selfModel chosen).performed :=
  Reflection.recordedReflexivity _ (currentSelfRecords chosen ordinary)

                                                                            
                                                                              
                                                                               
```

#### `CoreReader.Engineering.actualSelfCriticism`

`CoreReader/Engineering/SelfApplication.lean:118–133`; theorem.

```lean
theorem actualSelfCriticism (chosen : Candidate) :
    objectTest .evolutionMethod (chosen, 10) = true ∧
    objectTest .evolutionMethod (chosen, 5) = false ∧
    Reflection.evaluate ((selfModel chosen).input ⟨0, .evolutionMethod, .revision⟩) = .counterexample ∧
    statedReview chosen .generation .evolutionMethod .revision =
      .generated [(chosen, 10), (chosen, 5)] [(chosen, 10), (chosen, 5)] ∧
    staticBatch 21 5 ≠ liveBatch 21 5 := by
  refine ⟨?_, ?_, ?_, rfl, by decide⟩
  · change (staticBatch 21 10 == liveBatch 21 10) = true
    decide
  · change (staticBatch 21 5 == liveBatch 21 5) = false
    decide
  · simp [Reflection.evaluate, Reflection.Model.input, selfModel, requestedCases,
      objectTest, staticBatch, liveBatch, batchCount]

end CoreReader.Engineering
```

### CoreReader/Engineering/Values.lean

#### `CoreReader.Engineering.CoreCommitment`

`CoreReader/Engineering/Values.lean:8–10`; inductive.

```lean
inductive CoreCommitment | generation | consistency | reflexivity | grounds | choice
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.coreCommitments`

`CoreReader/Engineering/Values.lean:11–15`; def.

```lean
def coreCommitments : List CoreCommitment :=
  [.generation, .consistency, .reflexivity, .grounds, .choice]

                                                                             
                                                                           
```

#### `CoreReader.Engineering.coreAdopted`

`CoreReader/Engineering/Values.lean:16–17`; def.

```lean
def coreAdopted (_ : CoreCommitment) : Bool := true

```

#### `CoreReader.Engineering.AdoptionReason`

`CoreReader/Engineering/Values.lean:18–25`; inductive.

```lean
inductive AdoptionReason
  | plannedChange (release : Nat) (direction : Change)
  | incompatibleOrders (input : List Nat)
  | ownMethodCounterexample (items size : Nat)
  | unsupportedScope (items observedSize extendedSize : Nat)
  | statusBudgetContrast (statusSelected : Candidate) (capacity : Nat)
  deriving DecidableEq, Repr

```

#### `CoreReader.Engineering.reasonFor`

`CoreReader/Engineering/Values.lean:26–35`; def.

```lean
def reasonFor : CoreCommitment → AdoptionReason
  | .generation => .plannedChange 2 .designRevision
  | .consistency => .incompatibleOrders [2, 1, 2]
  | .reflexivity => .ownMethodCounterexample 21 5
  | .grounds => .unsupportedScope 21 10 5
  | .choice => .statusBudgetContrast .maximal 12

                                                                            
                                                                             
                                                                                 
```

#### `CoreReader.Engineering.ReasonRelevant`

`CoreReader/Engineering/Values.lean:36–52`; abbrev.

```lean
abbrev ReasonRelevant : CoreCommitment → AdoptionReason → Candidate → Prop
  | .generation, .plannedChange release direction, _ =>
      DirectionGround.plan release [direction, .migration] ∈ currentContinuing.evidence ∧
      credible currentContinuing.evidence direction ∧ Continuing currentContinuing.activity
  | .consistency, .incompatibleOrders input, _ =>
      currentContinuing.required.orderRequired = true ∧
      orderedUnique input ≠ sortedUnique input
  | .reflexivity, .ownMethodCounterexample items size, _ =>
      staticBatch items 10 = liveBatch items 10 ∧ staticBatch items size ≠ liveBatch items size
  | .grounds, .unsupportedScope items observedSize extendedSize, _ =>
      staticBatch items observedSize = liveBatch items observedSize ∧
      staticBatch items extendedSize ≠ liveBatch items extendedSize
  | .choice, .statusBudgetContrast candidate capacity, selected =>
      capacity = currentContinuing.limits.capacity .understanding ∧
      capacity < abstractionComplexity candidate ∧ abstractionComplexity selected ≤ capacity
  | _, _, _ => False

```

#### `CoreReader.Engineering.valueScope`

`CoreReader/Engineering/Values.lean:53–57`; abbrev.

```lean
abbrev valueScope (selected : Candidate) : Prop := abstractionComplexity selected ≤ 3

                                                                            
                                                                                 
                                                                            
```

#### `CoreReader.Engineering.safeguardExperiment`

`CoreReader/Engineering/Values.lean:58–78`; def.

```lean
def safeguardExperiment (principle : CoreCommitment) (enabled : Bool)
    (selected : Candidate) : Bool :=
  match principle with
  | .generation =>
      let allowed : List Change := if enabled then [.designRevision, .migration] else []
      allowed.contains .designRevision && decide (credible currentContinuing.evidence .designRevision)
  | .consistency =>
      let firstDemand := orderedUnique [2, 1, 2]
      let secondDemand := sortedUnique [2, 1, 2]
      let permitsBoth := if enabled then firstDemand == secondDemand else true
      !permitsBoth
  | .reflexivity =>
      let selfTests := if enabled then [(21, 10), (21, 5)] else [(21, 10)]
      selfTests.any (fun point => staticBatch point.1 point.2 != liveBatch point.1 point.2)
  | .grounds =>
      let licensed := if enabled then [10] else [10, 5]
      licensed.all (fun size => staticBatch 21 size == liveBatch 21 size)
  | .choice =>
      let selectedByRule := if enabled then selected else .maximal
      decide (abstractionComplexity selectedByRule ≤ currentContinuing.limits.capacity .understanding)

```

#### `CoreReader.Engineering.criticismFor`

`CoreReader/Engineering/Values.lean:79–85`; def.

```lean
def criticismFor : CoreCommitment → String
  | .generation => "Reconsider this reason if the committed change or continuing maintenance ends."
  | .consistency => "Reconsider the comparison if the parties deliberately revise the observable order contract."
  | .reflexivity => "This counterexample concerns the stated batch rule; it does not validate all self-assessment."
  | .grounds => "A new input condition requires its own support; success at size ten does not cover size five."
  | .choice => "If objectives or budgets change, compare the actual alternatives and reasons again."

```

#### `CoreReader.Engineering.governancePosition`

`CoreReader/Engineering/Values.lean:86–99`; def.

```lean
def governancePosition (principle : CoreCommitment) : ValuePosition Candidate where
  Position := Bool
  Outcome := Bool
  adopted := true
  selected _ := coreAdopted principle
  outcome selected enabled := safeguardExperiment principle enabled selected
  objective result := result = true
  constraints selected _ := valueScope selected
  starting := singleton valueScope
  reasons := [fun selected _ => ReasonRelevant principle (reasonFor principle) selected]
  limits := valueScope
  relevantCriticism _ := True
  response _ := some (criticismFor principle)

```

#### `CoreReader.Engineering.adoptionReasonRelevant`

`CoreReader/Engineering/Values.lean:100–109`; theorem.

```lean
theorem adoptionReasonRelevant (principle : CoreCommitment) (selected : Candidate)
    (scope : valueScope selected) : ReasonRelevant principle (reasonFor principle) selected := by
  cases principle
  · dsimp only [ReasonRelevant, reasonFor]; decide
  · dsimp only [ReasonRelevant, reasonFor]; decide
  · dsimp only [ReasonRelevant, reasonFor]; decide
  · dsimp only [ReasonRelevant, reasonFor]; decide
  · refine ⟨rfl, by decide, ?_⟩
    exact Nat.le_trans scope (by decide)

```

#### `CoreReader.Engineering.safeguardEnabled`

`CoreReader/Engineering/Values.lean:110–119`; theorem.

```lean
theorem safeguardEnabled (principle : CoreCommitment) (selected : Candidate)
    (scope : valueScope selected) : safeguardExperiment principle true selected = true := by
  cases principle
  · dsimp only [safeguardExperiment]; decide
  · dsimp only [safeguardExperiment]; decide
  · dsimp only [safeguardExperiment]; decide
  · dsimp only [safeguardExperiment]; decide
  · apply decide_eq_true
    exact Nat.le_trans scope (by change 3 ≤ 12; decide)

```

#### `CoreReader.Engineering.safeguardDisabled`

`CoreReader/Engineering/Values.lean:120–123`; theorem.

```lean
theorem safeguardDisabled (principle : CoreCommitment) (selected : Candidate) :
    safeguardExperiment principle false selected = false := by
  cases principle <;> simp only [safeguardExperiment, Bool.false_eq_true, ↓reduceIte] <;> decide

```

#### `CoreReader.Engineering.governanceValueProcedure`

`CoreReader/Engineering/Values.lean:124–136`; theorem.

```lean
theorem governanceValueProcedure (principle : CoreCommitment) :
    ValueProcedure (governancePosition principle) := by
  refine ⟨by simp [governancePosition], ?_, ?_, ?_⟩
  · refine ⟨.evolvable, (modelsSingleton _ _).2 (by change 3 ≤ 3; decide),
      (by change 3 ≤ 3; decide), rfl, ?_⟩
    intro reason member
    cases List.mem_singleton.mp member
    exact adoptionReasonRelevant principle .evolvable (by change 3 ≤ 3; decide)
  · intro selected _ scope _
    exact ⟨safeguardEnabled principle selected scope, scope⟩
  · intro selected _ _
    exact ⟨criticismFor principle, rfl, by cases principle <;> decide⟩

```

#### `CoreReader.Engineering.governanceGrounded`

`CoreReader/Engineering/Values.lean:137–142`; theorem.

```lean
theorem governanceGrounded (principle : CoreCommitment) :
    valueSpecification (governancePosition principle) :=
  grounds012Singleton _ (governanceValueProcedure principle)

                                                                            
                                                                           
```

#### `CoreReader.Engineering.governanceRationaleLimits`

`CoreReader/Engineering/Values.lean:143–156`; theorem.

```lean
theorem governanceRationaleLimits :
    ¬ ReasonRelevant .consistency (reasonFor .generation) .evolvable ∧
    ¬ ReasonRelevant .reflexivity (.ownMethodCounterexample 21 10) .evolvable ∧
    ¬ ReasonRelevant .generation (.plannedChange 9 .addition) .evolvable ∧
    ¬ valueScope .maximal ∧
    (∀ principle, safeguardExperiment principle false .evolvable = false) ∧
    (∀ principle, (governancePosition principle).commitment .presentSimple) := by
  refine ⟨by change ¬ False; decide, by decide, by decide, by change ¬ (30 ≤ 3); decide,
    fun principle => safeguardDisabled principle .evolvable, fun _ => rfl⟩

                                                                               
                                                                         
                                                                              
                                                                                           
```

#### `CoreReader.Engineering.selectionObjective`

`CoreReader/Engineering/Values.lean:157–162`; def.

```lean
def selectionObjective (adopted : Candidate) (outcome : Nat × Nat) : Prop :=
  match adopted with
  | .presentSimple => outcome.1 ≤ 1
  | .evolvable => outcome.2 ≤ 6
  | .maximal => outcome.1 ≤ 1

```

#### `CoreReader.Engineering.selectionPosition`

`CoreReader/Engineering/Values.lean:163–181`; def.

```lean
def selectionPosition (adopted : Candidate) : ValuePosition Candidate where
  Position := Candidate
  Outcome := Nat × Nat
  adopted := adopted
  selected := id
  outcome _ candidate := (abstractionComplexity candidate, changeWork candidate .designRevision)
  objective := selectionObjective adopted
  constraints _ candidate := abstractionComplexity candidate ≤ currentContinuing.limits.capacity .understanding
  starting := singleton (fun candidate => candidate = adopted)
  reasons := [fun _ candidate =>
    abstractionComplexity candidate = (if adopted = .presentSimple then 1 else 3) ∧
    changeWork candidate .designRevision = (if adopted = .presentSimple then 17 else 6)]
  limits _ := Continuing currentContinuing.activity ∧
    credible currentContinuing.evidence .designRevision
  relevantCriticism _ := True
  response _ := some (if adopted = .presentSimple then
    "The successor lacks the private-layout path; this choice does not claim evolution priority and must be reconsidered if that value is adopted."
    else "The six-step design-revision path does not establish every change is cheap or every forecast is correct.")

```

#### `CoreReader.Engineering.selectionValueProcedure`

`CoreReader/Engineering/Values.lean:182–218`; theorem.

```lean
theorem selectionValueProcedure (adopted : Candidate)
    (ordinary : adopted = .presentSimple ∨ adopted = .evolvable) :
    ValueProcedure (selectionPosition adopted) := by
  rcases ordinary with rfl | rfl
  · refine ⟨by simp [selectionPosition], ?_, ?_, ?_⟩
    · refine ⟨.presentSimple, (modelsSingleton _ _).2 rfl, ?_, rfl, ?_⟩
      · change Continuing currentContinuing.activity ∧ credible currentContinuing.evidence .designRevision
        decide
      · intro reason member
        cases List.mem_singleton.mp member
        decide
    · intro selected _ _ allReasons
      have actual := allReasons _ (List.mem_singleton.mpr rfl)
      change abstractionComplexity .presentSimple = 1 ∧ changeWork .presentSimple .designRevision = 17 at actual
      change abstractionComplexity .presentSimple ≤ 1 ∧
        abstractionComplexity .presentSimple ≤ currentContinuing.limits.capacity .understanding
      exact ⟨by rw [actual.1]; exact Nat.le_refl _, by rw [actual.1]; decide⟩
    · intro selected _ _
      refine ⟨_, rfl, ?_⟩
      simp
  · refine ⟨by simp [selectionPosition], ?_, ?_, ?_⟩
    · refine ⟨.evolvable, (modelsSingleton _ _).2 rfl, ?_, rfl, ?_⟩
      · change Continuing currentContinuing.activity ∧ credible currentContinuing.evidence .designRevision
        decide
      · intro reason member
        cases List.mem_singleton.mp member
        decide
    · intro selected _ _ allReasons
      have actual := allReasons _ (List.mem_singleton.mpr rfl)
      change abstractionComplexity .evolvable = 3 ∧ changeWork .evolvable .designRevision = 6 at actual
      change changeWork .evolvable .designRevision ≤ 6 ∧
        abstractionComplexity .evolvable ≤ currentContinuing.limits.capacity .understanding
      exact ⟨by rw [actual.2]; exact Nat.le_refl _, by rw [actual.1]; decide⟩
    · intro selected _ _
      refine ⟨_, rfl, ?_⟩
      simp

```

#### `CoreReader.Engineering.selectionGrounded`

`CoreReader/Engineering/Values.lean:219–224`; theorem.

```lean
theorem selectionGrounded (adopted : Candidate)
    (ordinary : adopted = .presentSimple ∨ adopted = .evolvable) :
    valueSpecification (selectionPosition adopted) :=
  grounds012Singleton _ (selectionValueProcedure adopted ordinary)

end CoreReader.Engineering
```

### CoreReader/Evidence.lean

#### `CoreReader.Evidence.Record`

`CoreReader/Evidence.lean:9–12`; structure.

```lean
structure Record (W : Type) where
  test : W → Bool
  observed : Bool
                                                                                    
```

#### `CoreReader.Evidence.Compatible`

`CoreReader/Evidence.lean:13–15`; def.

```lean
def Compatible {W : Type} (records : List (Record W)) (w : W) : Prop :=
  ∀ r, r ∈ records → r.test w = r.observed
                                                                                     
```

#### `CoreReader.Evidence.Supports`

`CoreReader/Evidence.lean:16–18`; def.

```lean
def Supports {W : Type} (records : List (Record W)) (claim : Claim W) : Prop :=
  ∀ w, Compatible records w → claim w
                                                                                           
```

#### `CoreReader.Evidence.Articulation`

`CoreReader/Evidence.lean:19–24`; structure.

```lean
structure Articulation (W : Type) where
  concepts : List String
  assumptions : Theory W
  reasons : List (Claim W)
  limits : Claim W
                                                                                          
```

#### `CoreReader.Evidence.Articulated`

`CoreReader/Evidence.lean:25–27`; def.

```lean
def Articulated {W : Type} (a : Articulation W) : Prop :=
  a.concepts ≠ [] ∧ a.reasons ≠ []
                                                                                                                   
```

#### `CoreReader.Evidence.ValuePosition`

`CoreReader/Evidence.lean:28–41`; structure.

```lean
structure ValuePosition (W : Type) where
  Position : Type
  Outcome : Type
  adopted : Position
  selected : W → Position
  outcome : W → Position → Outcome
  objective : Outcome → Prop
  constraints : W → Position → Prop
  starting : Theory W
  reasons : List (W → Position → Prop)
  limits : Claim W
  relevantCriticism : Claim W
  response : W → Option String
                                                                                                               
```

#### `CoreReader.Evidence.ValuePosition.commitment`

`CoreReader/Evidence.lean:42–44`; def.

```lean
def ValuePosition.commitment {W : Type} (v : ValuePosition W) : Claim W :=
  fun w => v.selected w = v.adopted
                                                                                                    
```

#### `CoreReader.Evidence.ValuePosition.consequence`

`CoreReader/Evidence.lean:45–47`; def.

```lean
def ValuePosition.consequence {W : Type} (v : ValuePosition W) : Claim W :=
  fun w => v.objective (v.outcome w v.adopted) ∧ v.constraints w v.adopted
                                                                                              
```

#### `CoreReader.Evidence.ValuePosition.activeReasons`

`CoreReader/Evidence.lean:48–50`; def.

```lean
def ValuePosition.activeReasons {W : Type} (v : ValuePosition W) : List (Claim W) :=
  v.reasons.map (fun reason w => reason w v.adopted)
                                                                                  
```

#### `CoreReader.Evidence.JointAdoption`

`CoreReader/Evidence.lean:51–54`; def.

```lean
def JointAdoption {W : Type} (v : ValuePosition W) : Prop :=
  ∃ w, Models v.starting w ∧ v.limits w ∧ v.commitment w ∧
    ∀ reason, reason ∈ v.reasons → reason w v.adopted
                                                                                                                                                              
```

#### `CoreReader.Evidence.ValueProcedure`

`CoreReader/Evidence.lean:55–60`; def.

```lean
def ValueProcedure {W : Type} (v : ValuePosition W) : Prop :=
  v.reasons ≠ [] ∧ JointAdoption v ∧
  (∀ w, Models v.starting w → v.limits w →
    (∀ reason, reason ∈ v.reasons → reason w v.adopted) → v.consequence w) ∧
  (∀ w, v.limits w → v.relevantCriticism w → ∃ answer, v.response w = some answer ∧ answer ≠ "")
                                                                                                   
```

#### `CoreReader.Evidence.Facet`

`CoreReader/Evidence.lean:61–65`; inductive.

```lean
inductive Facet (W : Type) where
  | empirical (records : List (Record W)) (scope conclusion uncertainty : Claim W)
  | inferential (assumptions : Theory W) (conclusion : Claim W)
  | value (position : ValuePosition W)
                                                                 
```

#### `CoreReader.Evidence.Facet.claim`

`CoreReader/Evidence.lean:66–70`; def.

```lean
def Facet.claim {W : Type} : Facet W → Claim W
  | .empirical _ _ p _ => p
  | .inferential _ p => p
  | .value v => v.commitment
                                                                                                                                                        
```

#### `CoreReader.Evidence.FacetDischarged`

`CoreReader/Evidence.lean:71–77`; def.

```lean
def FacetDischarged {W : Type} : Facet W → Prop
  | .empirical records scope p uncertainty =>
      (∃ w, Compatible records w ∧ scope w) ∧
      Supports records (fun w => scope w → p w) ∧ Supports records uncertainty
  | .inferential assumptions p => Satisfiable assumptions ∧ Entails assumptions p
  | .value v => ValueProcedure v
                                                                                                           
```

#### `CoreReader.Evidence.FacetArticulated`

`CoreReader/Evidence.lean:78–84`; def.

```lean
def FacetArticulated {W : Type} (a : Articulation W) : Facet W → Prop
  | .empirical records scope _ _ =>
      a.assumptions = singleton (Compatible records) ∧ a.reasons = [Compatible records] ∧ a.limits = scope
  | .inferential assumptions _ =>
      a.assumptions = assumptions ∧ a.reasons = [Models assumptions] ∧ a.limits = (fun _ => True)
  | .value v => a.assumptions = v.starting ∧ a.reasons = v.activeReasons ∧ a.limits = v.limits
                                                                                                                           
```

#### `CoreReader.Evidence.canonicalArticulation`

`CoreReader/Evidence.lean:85–92`; def.

```lean
def canonicalArticulation {W : Type} : Facet W → Articulation W
  | .empirical records scope _ _ =>
      ⟨["recorded test outcomes", "observation conditions"], singleton (Compatible records), [Compatible records], scope⟩
  | .inferential assumptions _ =>
      ⟨["stated assumptions", "semantic consequence"], assumptions, [Models assumptions], fun _ => True⟩
  | .value v =>
      ⟨["adopted position", "reasons and consequences"], v.starting, v.activeReasons, v.limits⟩
                                                                                        
```

#### `CoreReader.Evidence.canonicalFacetArticulated`

`CoreReader/Evidence.lean:93–96`; theorem.

```lean
theorem canonicalFacetArticulated {W : Type} (f : Facet W) :
    FacetArticulated (canonicalArticulation f) f := by
  cases f <;> exact ⟨rfl, rfl, rfl⟩
                                                                                                                        
```

#### `CoreReader.Evidence.canonicalArticulated`

`CoreReader/Evidence.lean:97–105`; theorem.

```lean
theorem canonicalArticulated {W : Type} (f : Facet W) (h : FacetDischarged f) :
    Articulated (canonicalArticulation f) := by
  cases f with
  | empirical records scope p uncertainty => simp [Articulated, canonicalArticulation]
  | inferential assumptions p => simp [Articulated, canonicalArticulation]
  | value v =>
      refine ⟨by simp [canonicalArticulation], ?_⟩
      simpa [canonicalArticulation, ValuePosition.activeReasons] using h.1
                                                                                                                                                                                                                            
```

#### `CoreReader.Evidence.Grounds`

`CoreReader/Evidence.lean:106–111`; def.

```lean
def Grounds {W : Type} (claim : Claim W) (articulations : Facet W → Articulation W)
    (actualApplicable : Facet W → Prop) (facets : List (Facet W)) : Prop :=
  facets ≠ [] ∧ (∀ facet, actualApplicable facet → facet ∈ facets) ∧
  ∀ facet, facet ∈ facets → facet.claim = claim ∧ Articulated (articulations facet) ∧
    FacetArticulated (articulations facet) facet ∧ FacetDischarged facet
                                                                                                                           
```

#### `CoreReader.Evidence.AchievementAccountability`

`CoreReader/Evidence.lean:112–115`; def.

```lean
def AchievementAccountability {W : Type} (achievement : Claim W) (articulations : Facet W → Articulation W)
    (actualApplicable : Facet W → Prop) (facets : List (Facet W)) : Prop :=
  Grounds achievement articulations actualApplicable facets
                                                                                         
```

#### `CoreReader.Evidence.transitionAchievement`

`CoreReader/Evidence.lean:116–118`; def.

```lean
def transitionAchievement : Claim TransitionCase :=
  fun transition => Expanded (transitionBefore transition) (transitionAfter transition)
                                                                                                                         
```

#### `CoreReader.Evidence.transitionPerformanceRecord`

`CoreReader/Evidence.lean:119–122`; def.

```lean
def transitionPerformanceRecord : Record TransitionCase :=
  ⟨fun transition => (transitionAfter transition).constructed.any
    (fun operation => operation == .successor && decide (operation.run (transitionInput transition) = 1)), true⟩
                                                                                                                                    
```

#### `CoreReader.Evidence.transitionReportRecord`

`CoreReader/Evidence.lean:123–127`; def.

```lean
def transitionReportRecord : Record TransitionCase :=
  ⟨fun transition =>
    let report := transitionAnnouncement transition
    report.reportedNewOperation == .successor && report.input == 0 && report.expectedOutput == 1, true⟩
                                                                                                            
```

#### `CoreReader.Evidence.transitionPerformanceCompatible`

`CoreReader/Evidence.lean:128–140`; theorem.

```lean
theorem transitionPerformanceCompatible :
    ∀ transition, Compatible [transitionPerformanceRecord] transition ↔ transition = .extend := by
  intro transition
  constructor
  · intro h
    have observed := h transitionPerformanceRecord (List.mem_singleton.mpr rfl)
    cases transition
    · cases observed
    · rfl
  · intro h; cases h
    intro record hr; have hr' := List.mem_singleton.mp hr; subst record
    rfl
                                                                                                                                
```

#### `CoreReader.Evidence.transitionSupported`

`CoreReader/Evidence.lean:141–149`; theorem.

```lean
theorem transitionSupported : Supports [transitionPerformanceRecord] transitionAchievement := by
  intro transition compatible
  have h := (transitionPerformanceCompatible transition).1 compatible
  subst transition
  have reportTrue : (transitionAnnouncement .extend).claim := by
    simp [transitionAnnouncement, transitionAfter, transitionInput,
      Announcement.claim, GeneratingSystem.report, generatingSystem, extendedState, baseState, Operation.run]
  exact announcementClaimImpliesExpansion _ reportTrue
                                                                                                      
```

#### `CoreReader.Evidence.transitionFacet`

`CoreReader/Evidence.lean:150–153`; def.

```lean
def transitionFacet : Facet TransitionCase :=
  .empirical [transitionPerformanceRecord] (fun transition => transitionInput transition = 0)
    transitionAchievement (fun _ => True)
                                                                                                  
```

#### `CoreReader.Evidence.transitionFacetDischarged`

`CoreReader/Evidence.lean:154–158`; theorem.

```lean
theorem transitionFacetDischarged : FacetDischarged transitionFacet := by
  refine ⟨⟨.extend, (transitionPerformanceCompatible _).2 rfl, rfl⟩, ?_, ?_⟩
  · intro transition compatible _; exact transitionSupported transition compatible
  · intro _ _; trivial
                                                                                                                    
```

#### `CoreReader.Evidence.transitionAccountable`

`CoreReader/Evidence.lean:159–167`; theorem.

```lean
theorem transitionAccountable :
    AchievementAccountability transitionAchievement canonicalArticulation
      (fun facet => facet = transitionFacet) [transitionFacet] := by
  refine ⟨by simp, ?_, ?_⟩
  · intro facet hf; subst facet; exact List.mem_singleton.mpr rfl
  · intro facet hf; have hf' := List.mem_singleton.mp hf; subst facet
    exact ⟨rfl, canonicalArticulated _ transitionFacetDischarged,
      canonicalFacetArticulated _, transitionFacetDischarged⟩
                                                                                                   
```

#### `CoreReader.Evidence.transitionReportCompatible`

`CoreReader/Evidence.lean:168–172`; theorem.

```lean
theorem transitionReportCompatible (transition : TransitionCase) :
    Compatible [transitionReportRecord] transition := by
  intro record hr; have hr' := List.mem_singleton.mp hr; subst record
  rfl
                                                                                                                                       
```

#### `CoreReader.Evidence.transitionReportDoesNotSupport`

`CoreReader/Evidence.lean:173–179`; theorem.

```lean
theorem transitionReportDoesNotSupport :
    Compatible [transitionReportRecord] .inflate ∧ ¬ transitionAchievement .inflate ∧
    ¬ Supports [transitionReportRecord] transitionAchievement := by
  have noExpansion : ¬ transitionAchievement .inflate := by
    simp [transitionAchievement, transitionBefore, transitionAfter, Expanded, baseState, inflatedState]
  exact ⟨transitionReportCompatible _, noExpansion, fun h => noExpansion (h _ (transitionReportCompatible _))⟩
                                                                                                                                  
```

#### `CoreReader.Evidence.ConcreteAchievementExample`

`CoreReader/Evidence.lean:180–190`; def.

```lean
def ConcreteAchievementExample : Prop :=
  AchievementAccountability transitionAchievement canonicalArticulation
    (fun facet => facet = transitionFacet) [transitionFacet] ∧
  Compatible [transitionPerformanceRecord] .extend ∧
  Supports [transitionPerformanceRecord] transitionAchievement ∧ transitionAchievement .extend ∧
  (Compatible [transitionReportRecord] .inflate ∧ ¬ transitionAchievement .inflate ∧
    ¬ Supports [transitionReportRecord] transitionAchievement) ∧
  (∀ transition, (transitionAnnouncement transition).before = transitionBefore transition ∧
    (transitionAnnouncement transition).after = transitionAfter transition ∧
    (transitionAnnouncement transition).input = transitionInput transition ∧ transitionInput transition = 0)
                                                                                                                                  
```

#### `CoreReader.Evidence.concreteAchievementExample`

`CoreReader/Evidence.lean:191–196`; theorem.

```lean
theorem concreteAchievementExample : ConcreteAchievementExample := by
  refine ⟨transitionAccountable, (transitionPerformanceCompatible _).2 rfl, transitionSupported,
    transitionSupported .extend ((transitionPerformanceCompatible _).2 rfl),
    transitionReportDoesNotSupport, ?_⟩
  intro transition; exact ⟨rfl,rfl,rfl,rfl⟩
                                                                                                       
```

#### `CoreReader.Evidence.achievementNeedsSupport`

`CoreReader/Evidence.lean:197–201`; theorem.

```lean
theorem achievementNeedsSupport {W : Type} (achievement : Claim W) (records : List (Record W))
    (actual : W) (reliableHere : Compatible records actual) (support : Supports records achievement) :
    achievement actual ∧ ConcreteAchievementExample :=
  ⟨support actual reliableHere, concreteAchievementExample⟩
                                                                                                 
```

#### `CoreReader.Evidence.supportWeakening`

`CoreReader/Evidence.lean:202–205`; theorem.

```lean
theorem supportWeakening {W : Type} (records : List (Record W)) (p q : Claim W)
    (support : Supports records p) (weaker : ∀ w, p w → q w) : Supports records q :=
  fun w hw => weaker w (support w hw)
                                                                                               
```

#### `CoreReader.Evidence.evidenceWeakeningCanLoseSupport`

`CoreReader/Evidence.lean:206–212`; theorem.

```lean
theorem evidenceWeakeningCanLoseSupport :
    Supports ([⟨id, true⟩] : List (Record Bool)) (fun w => w = true) ∧
    ¬ Supports ([] : List (Record Bool)) (fun w => w = true) := by
  refine ⟨?_, ?_⟩
  · intro w hw; exact hw ⟨id,true⟩ (by simp)
  · intro h; have bad := h false (by intro r hr; cases hr); cases bad
                                                                                               
```

#### `CoreReader.Evidence.scopeRestriction`

`CoreReader/Evidence.lean:213–218`; theorem.

```lean
theorem scopeRestriction {W X : Type} (records : List (Record W)) (p : W → X → Prop)
    (wide narrow : X → Prop) (included : ∀ x, narrow x → wide x)
    (support : Supports records (fun w => ∀ x, wide x → p w x)) :
    Supports records (fun w => ∀ x, narrow x → p w x) :=
  fun w hw x hx => support w hw x (included x hx)
                                                                                                      
```

#### `CoreReader.Evidence.Duties`

`CoreReader/Evidence.lean:219–220`; def.

```lean
def Duties {W : Type} (applicable : Facet W → Prop) : Prop :=
  ∀ f, applicable f → FacetDischarged f
```

#### `CoreReader.Evidence.LabeledDuties`

`CoreReader/Evidence.lean:221–223`; def.

```lean
def LabeledDuties {W : Type} (_labels : List String) (applicable : Facet W → Prop) : Prop :=
  Duties applicable
                                                                           
```

#### `CoreReader.Evidence.assessmentUnion`

`CoreReader/Evidence.lean:224–229`; theorem.

```lean
theorem assessmentUnion {W : Type} (a b : Facet W → Prop) :
    Duties (fun f => a f ∨ b f) ↔ Duties a ∧ Duties b := by
  constructor
  · intro h; exact ⟨fun f hf => h f (Or.inl hf), fun f hf => h f (Or.inr hf)⟩
  · rintro ⟨ha,hb⟩ f (hf|hf); exact ha f hf; exact hb f hf
                                                                     
```

#### `CoreReader.Evidence.labelsCannotWaive`

`CoreReader/Evidence.lean:230–232`; theorem.

```lean
theorem labelsCannotWaive {W : Type} (xs ys : List String) (a : Facet W → Prop) :
    LabeledDuties xs a ↔ LabeledDuties ys a := Iff.rfl
                                                                         
```

#### `CoreReader.Evidence.switchRecord`

`CoreReader/Evidence.lean:233–233`; def.

```lean
def switchRecord : Record Bool := ⟨id, true⟩
```

#### `CoreReader.Evidence.switchCompatible`

`CoreReader/Evidence.lean:234–237`; theorem.

```lean
theorem switchCompatible (w : Bool) : Compatible [switchRecord] w ↔ w = true := by
  constructor
  · intro h; exact h switchRecord (by simp)
  · intro hw r hr; simp only [List.mem_singleton] at hr; cases hr; exact hw
```

#### `CoreReader.Evidence.switchSupported`

`CoreReader/Evidence.lean:238–240`; theorem.

```lean
theorem switchSupported : Supports [switchRecord] (fun w : Bool => w = true) :=
  fun w hw => (switchCompatible w).1 hw
                                                                                                        
```

#### `CoreReader.Evidence.optionBenefit`

`CoreReader/Evidence.lean:241–241`; def.

```lean
def optionBenefit (selected : Bool) : Nat := if selected then 4 else 0
```

#### `CoreReader.Evidence.optionCost`

`CoreReader/Evidence.lean:242–243`; def.

```lean
def optionCost (selected : Bool) : Nat := if selected then 3 else 0
                                                                                                                              
```

#### `CoreReader.Evidence.optionReport`

`CoreReader/Evidence.lean:244–246`; def.

```lean
def optionReport (selected : Bool) : Prop :=
  optionCost selected ≤ 3 ∧ optionBenefit selected = (if selected then 4 else 0)
                                                                                             
```

#### `CoreReader.Evidence.switchPosition`

`CoreReader/Evidence.lean:247–259`; def.

```lean
def switchPosition : ValuePosition Bool where
  Position := Bool
  Outcome := Nat × Nat
  adopted := true
  selected := id
  outcome := fun _ option => (optionBenefit option, optionCost option)
  objective := fun result => result.2 < result.1
  constraints := fun _ option => optionCost option ≤ 3
  starting := singleton (fun w => w = true)
  reasons := [fun _ option => optionReport option]
  limits := fun _ => True
  relevantCriticism := fun w => w = false
  response := fun w => if w then some "benefit exceeds cost within budget" else some "reconsider if the budget no longer permits this cost"
```

#### `CoreReader.Evidence.switchValueProcedure`

`CoreReader/Evidence.lean:260–273`; theorem.

```lean
theorem switchValueProcedure : ValueProcedure switchPosition := by
  refine ⟨by simp [switchPosition], ?_, ?_, ?_⟩
  · refine ⟨true, (modelsSingleton _ _).2 rfl, trivial, rfl, ?_⟩
    intro reason hr
    have hr' : reason = (fun (_ : Bool) (option : Bool) => optionReport option) := List.mem_singleton.mp hr
    subst reason
    exact ⟨by decide, rfl⟩
  · intro w _ _ allReasons
    have evidence := allReasons (fun (_ : Bool) (option : Bool) => optionReport option) (List.mem_singleton.mpr rfl)
    change optionReport true at evidence
    have benefitAboveBudget : 3 < optionBenefit true := by rw [evidence.2]; decide
    exact ⟨Nat.lt_of_le_of_lt evidence.1 benefitAboveBudget, evidence.1⟩
  · intro w _ _; cases w <;> simp [switchPosition]
                                                                                                                               
```

#### `CoreReader.Evidence.oppositePosition`

`CoreReader/Evidence.lean:274–276`; def.

```lean
def oppositePosition : ValuePosition Bool :=
  { switchPosition with adopted := false, starting := singleton (fun w => w = false) }
                                                                                                                               
```

#### `CoreReader.Evidence.oppositePositionRejected`

`CoreReader/Evidence.lean:277–293`; theorem.

```lean
theorem oppositePositionRejected : JointAdoption oppositePosition ∧ ¬ ValueProcedure oppositePosition := by
  have witness : JointAdoption oppositePosition := by
    refine ⟨false, (modelsSingleton _ _).2 rfl, trivial, rfl, ?_⟩
    intro reason hr
    have hr' : reason = (fun (_ : Bool) (option : Bool) => optionReport option) := List.mem_singleton.mp hr
    subst reason
    exact ⟨by decide, rfl⟩
  refine ⟨witness, ?_⟩
  intro h
  have allReasons : ∀ reason, reason ∈ oppositePosition.reasons → reason false oppositePosition.adopted := by
    intro reason hr
    have hr' : reason = (fun (_ : Bool) (option : Bool) => optionReport option) := List.mem_singleton.mp hr
    subst reason
    exact ⟨by decide, rfl⟩
  have bad := h.2.2.1 false ((modelsSingleton _ _).2 rfl) trivial allReasons
  exact Nat.lt_irrefl 0 bad.1
                                                                                                                        
```

#### `CoreReader.Evidence.contradictoryStartingPosition`

`CoreReader/Evidence.lean:294–295`; def.

```lean
def contradictoryStartingPosition : ValuePosition Bool :=
  { switchPosition with starting := singleton (fun _ => False) }
```

#### `CoreReader.Evidence.impossibleAdoptionPosition`

`CoreReader/Evidence.lean:296–298`; def.

```lean
def impossibleAdoptionPosition : ValuePosition Bool :=
  { switchPosition with selected := fun _ => false }
                                                                                                                         
```

#### `CoreReader.Evidence.inadmissibleValuePositionsRejected`

`CoreReader/Evidence.lean:299–306`; theorem.

```lean
theorem inadmissibleValuePositionsRejected :
    ¬ ValueProcedure contradictoryStartingPosition ∧ ¬ ValueProcedure impossibleAdoptionPosition := by
  constructor
  · intro h; obtain ⟨w,hw,_,_,_⟩ := h.2.1
    exact (modelsSingleton _ _).1 hw
  · intro h; obtain ⟨w,_,_,hw,_⟩ := h.2.1
    cases hw
                                                                                                  
```

#### `CoreReader.Evidence.unsupportedPosition`

`CoreReader/Evidence.lean:307–307`; def.

```lean
def unsupportedPosition : ValuePosition Bool := { switchPosition with reasons := [] }
```

#### `CoreReader.Evidence.switchEmpirical`

`CoreReader/Evidence.lean:308–309`; def.

```lean
def switchEmpirical : Facet Bool :=
  .empirical [switchRecord] (fun _ => True) (fun w => w = true) (fun _ => True)
```

#### `CoreReader.Evidence.switchEmpiricalDischarged`

`CoreReader/Evidence.lean:310–314`; theorem.

```lean
theorem switchEmpiricalDischarged : FacetDischarged switchEmpirical := by
  refine ⟨⟨true, (switchCompatible true).2 rfl, trivial⟩, ?_, ?_⟩
  · intro w hw _; exact switchSupported w hw
  · intro w _; trivial
                                                                                                           
```

#### `CoreReader.Evidence.mixedMissingResponsibility`

`CoreReader/Evidence.lean:315–322`; theorem.

```lean
theorem mixedMissingResponsibility :
    FacetDischarged switchEmpirical ∧
    ¬ LabeledDuties [] (fun f : Facet Bool => f = switchEmpirical ∨ f = .value unsupportedPosition) := by
  refine ⟨switchEmpiricalDischarged, ?_⟩
  intro h
  have bad := (h (.value unsupportedPosition) (Or.inr rfl)).1
  exact bad rfl
                                                                                 
```

#### `CoreReader.Evidence.uninformativeArgument`

`CoreReader/Evidence.lean:323–324`; def.

```lean
def uninformativeArgument : Articulation Bool :=
  ⟨["switch state"], emptyTheory, [fun _ => True], fun _ => True⟩
```

#### `CoreReader.Evidence.articulationNotSupport`

`CoreReader/Evidence.lean:325–329`; theorem.

```lean
theorem articulationNotSupport : Articulated uninformativeArgument ∧
    ¬ Entails uninformativeArgument.assumptions (fun w : Bool => w = true) := by
  exact ⟨⟨by simp [uninformativeArgument], by simp [uninformativeArgument]⟩,
    consistentIncomplete.2.1⟩
                                                                                                                           
```

#### `CoreReader.Evidence.unrelatedArticulationRejected`

`CoreReader/Evidence.lean:330–338`; theorem.

```lean
theorem unrelatedArticulationRejected :
    Articulated uninformativeArgument ∧ FacetDischarged switchEmpirical ∧
    ¬ FacetArticulated uninformativeArgument switchEmpirical := by
  refine ⟨articulationNotSupport.1, switchEmpiricalDischarged, ?_⟩
  intro h
  have relation := congrFun h.1 (Compatible [switchRecord])
  have bad : False := relation.mpr rfl
  exact bad
                                                                                                    
```

#### `CoreReader.Evidence.temperatureRecord`

`CoreReader/Evidence.lean:339–339`; def.

```lean
def temperatureRecord : Record (Bool × Bool) := ⟨Prod.fst, true⟩
```

#### `CoreReader.Evidence.temperatureCompatible`

`CoreReader/Evidence.lean:340–346`; theorem.

```lean
theorem temperatureCompatible (b : Bool) :
    Compatible [temperatureRecord, temperatureRecord] (true,b) := by
  intro r hr
  simp at hr
  cases hr
  rfl
                                                                                          
```

#### `CoreReader.Evidence.BudgetWorld`

`CoreReader/Evidence.lean:347–348`; abbrev.

```lean
abbrev BudgetWorld := Bool × Nat
                                                                                                   
```

#### `CoreReader.Evidence.announcement`

`CoreReader/Evidence.lean:349–349`; def.

```lean
def announcement : String := "activate"
```

#### `CoreReader.Evidence.announcementPosition`

`CoreReader/Evidence.lean:350–363`; def.

```lean
def announcementPosition : ValuePosition BudgetWorld where
  Position := Bool
  Outcome := Nat × Nat
  adopted := true
  selected := Prod.fst
  outcome := fun _ option => (optionBenefit option, optionCost option)
  objective := fun result => result.2 < result.1
  constraints := fun w option => optionCost option ≤ w.2
  starting := singleton (fun w => w.1 = true)
  reasons := [fun _ option => announcement = (if option then "activate" else "disable")]
  limits := fun _ => True
  relevantCriticism := fun w => w.2 < 3
  response := fun _ => some "reconsider the action when its cost exceeds budget"
                                                                                                           
```

#### `CoreReader.Evidence.announcementHasJointAdoption`

`CoreReader/Evidence.lean:364–371`; theorem.

```lean
theorem announcementHasJointAdoption : JointAdoption announcementPosition := by
  refine ⟨(true,0), (modelsSingleton _ _).2 rfl, trivial, rfl, ?_⟩
  intro reason hr
  have hr' : reason = (fun (_ : BudgetWorld) (option : Bool) => announcement = (if option then "activate" else "disable")) :=
    List.mem_singleton.mp hr
  subst reason
  rfl
                                                                                                                                   
```

#### `CoreReader.Evidence.announcementNotBudgetReason`

`CoreReader/Evidence.lean:372–389`; theorem.

```lean
theorem announcementNotBudgetReason :
    announcementPosition.reasons ≠ [] ∧ announcementPosition.commitment (true,0) ∧
    (∀ reason, reason ∈ announcementPosition.reasons → reason (true,0) announcementPosition.adopted) ∧
    ¬ announcementPosition.consequence (true,0) ∧ ¬ ValueProcedure announcementPosition := by
  refine ⟨by simp [announcementPosition], rfl, ?_, (by intro h; cases h.2), ?_⟩
  · intro reason hr
    have hr' : reason = (fun (_ : BudgetWorld) (option : Bool) => announcement = (if option then "activate" else "disable")) := List.mem_singleton.mp hr
    subst reason
    rfl
  · intro h
    have allReasons : ∀ reason, reason ∈ announcementPosition.reasons → reason (true,0) announcementPosition.adopted := by
      intro reason hr
      have hr' : reason = (fun (_ : BudgetWorld) (option : Bool) => announcement = (if option then "activate" else "disable")) := List.mem_singleton.mp hr
      subst reason
      rfl
    have bad := h.2.2.1 (true,0) ((modelsSingleton _ _).2 rfl) trivial allReasons
    cases bad.2
                                                                             
```

#### `CoreReader.Evidence.actionRecord`

`CoreReader/Evidence.lean:390–390`; def.

```lean
def actionRecord : Record BudgetWorld := ⟨Prod.fst, true⟩
```

#### `CoreReader.Evidence.actionCompatible`

`CoreReader/Evidence.lean:391–393`; theorem.

```lean
theorem actionCompatible (budget : Nat) : Compatible [actionRecord, actionRecord] (true,budget) := by
  intro r hr; simp at hr; cases hr; rfl
                                                                                                                          
```

#### `CoreReader.Evidence.measurementRepeatNotSupport`

`CoreReader/Evidence.lean:394–415`; theorem.

```lean
theorem measurementRepeatNotSupport :
    temperatureRecord.test (true,false) = true ∧
    Compatible [temperatureRecord,temperatureRecord] (true,false) ∧
    Compatible [temperatureRecord,temperatureRecord] (true,true) ∧
    ¬ Supports [temperatureRecord] (fun w : Bool × Bool => w.2 = true) ∧
    ¬ Supports [temperatureRecord,temperatureRecord] (fun w : Bool × Bool => w.2 = true) ∧
    Compatible [actionRecord,actionRecord] (true,0) ∧
    Compatible [actionRecord,actionRecord] (true,3) ∧
    ¬ Supports [actionRecord] announcementPosition.consequence ∧
    ¬ Supports [actionRecord,actionRecord] announcementPosition.consequence ∧
    ¬ ValueProcedure announcementPosition := by
  refine ⟨rfl, temperatureCompatible false, temperatureCompatible true, ?_, ?_,
    actionCompatible 0, actionCompatible 3, ?_, ?_, announcementNotBudgetReason.2.2.2.2⟩
  · intro h
    have bad := h (true,false) (by intro r hr; simp only [List.mem_singleton] at hr; cases hr; rfl)
    cases bad
  · intro h; have bad := h (true,false) (temperatureCompatible false); cases bad
  · intro h
    have bad := h (true,0) (by intro r hr; simp only [List.mem_singleton] at hr; cases hr; rfl)
    cases bad.2
  · intro h; have bad := h (true,0) (actionCompatible 0); cases bad.2
                                                                                                                                 
```

#### `CoreReader.Evidence.selfAssertionNotReason`

`CoreReader/Evidence.lean:416–425`; theorem.

```lean
theorem selfAssertionNotReason :
    (unsupportedPosition.commitment true ∧ ¬ ValueProcedure unsupportedPosition) ∧
    (announcementPosition.reasons ≠ [] ∧ announcementPosition.commitment (true,0) ∧
      ¬ announcementPosition.consequence (true,0) ∧ ¬ ValueProcedure announcementPosition) ∧
    JointAdoption announcementPosition :=
  ⟨⟨rfl, fun h => h.1 rfl⟩,
    ⟨announcementNotBudgetReason.1, announcementNotBudgetReason.2.1,
      announcementNotBudgetReason.2.2.2.1, announcementNotBudgetReason.2.2.2.2⟩,
    announcementHasJointAdoption⟩
                                                                                                                 
```

#### `CoreReader.Evidence.valueWithoutSelfProof`

`CoreReader/Evidence.lean:426–433`; theorem.

```lean
theorem valueWithoutSelfProof : ValueProcedure switchPosition ∧
    Satisfiable switchPosition.starting ∧
    ¬ Entails (emptyTheory : Theory Bool) switchPosition.commitment ∧
    (JointAdoption oppositePosition ∧ ¬ ValueProcedure oppositePosition) ∧
    (¬ ValueProcedure contradictoryStartingPosition ∧ ¬ ValueProcedure impossibleAdoptionPosition) :=
  ⟨switchValueProcedure, ⟨true, (modelsSingleton _ _).2 rfl⟩, consistentIncomplete.2.1,
    oppositePositionRejected, inadmissibleValuePositionsRejected⟩
                                                                                 
```

#### `CoreReader.Evidence.BenefitCostWorld`

`CoreReader/Evidence.lean:434–434`; abbrev.

```lean
abbrev BenefitCostWorld := Bool × (Nat × Nat)
```

#### `CoreReader.Evidence.measuredOutcome`

`CoreReader/Evidence.lean:435–436`; def.

```lean
def measuredOutcome (world : BenefitCostWorld) (option : Bool) : Nat × Nat :=
  if option then world.2 else (0,0)
```

#### `CoreReader.Evidence.benefitReason`

`CoreReader/Evidence.lean:437–438`; def.

```lean
def benefitReason (world : BenefitCostWorld) (option : Bool) : Prop :=
  (measuredOutcome world option).1 = 4
```

#### `CoreReader.Evidence.costReason`

`CoreReader/Evidence.lean:439–441`; def.

```lean
def costReason (world : BenefitCostWorld) (option : Bool) : Prop :=
  (measuredOutcome world option).2 ≤ 3
                                                                                                           
```

#### `CoreReader.Evidence.jointReasonPosition`

`CoreReader/Evidence.lean:442–455`; def.

```lean
def jointReasonPosition : ValuePosition BenefitCostWorld where
  Position := Bool
  Outcome := Nat × Nat
  adopted := true
  selected := Prod.fst
  outcome := measuredOutcome
  objective := fun result => result.2 < result.1
  constraints := fun world option => (measuredOutcome world option).2 ≤ 3
  starting := singleton (fun world => world.1 = true)
  reasons := [benefitReason, costReason]
  limits := fun _ => True
  relevantCriticism := fun world => 3 < world.2.2
  response := fun _ => some "reassess the option when its cost exceeds the budget"
                                                                                                  
```

#### `CoreReader.Evidence.jointReasonProcedure`

`CoreReader/Evidence.lean:456–476`; theorem.

```lean
theorem jointReasonProcedure : ValueProcedure jointReasonPosition := by
  refine ⟨by simp [jointReasonPosition], ?_, ?_, ?_⟩
  · refine ⟨(true,(4,3)), (modelsSingleton _ _).2 rfl, trivial, rfl, ?_⟩
    intro reason hr
    change reason ∈ [benefitReason,costReason] at hr
    rcases List.mem_cons.mp hr with hr | hr
    · subst reason; rfl
    · have hr' := List.mem_singleton.mp hr
      subst reason
      change 3 ≤ 3; exact Nat.le_refl 3
  · intro world _ _ reasons
    have benefit := reasons benefitReason (by change benefitReason ∈ [benefitReason,costReason]; simp)
    have cost := reasons costReason (by change costReason ∈ [benefitReason,costReason]; simp)
    change (measuredOutcome world true).1 = 4 at benefit
    change (measuredOutcome world true).2 ≤ 3 at cost
    refine ⟨?_, cost⟩
    have bigger : 3 < (measuredOutcome world true).1 := by rw [benefit]; decide
    exact Nat.lt_of_le_of_lt cost bigger
  · intro world _ _
    exact ⟨"reassess the option when its cost exceeds the budget", rfl, by decide⟩
                                                                                                                  
```

#### `CoreReader.Evidence.JointReasonsExample`

`CoreReader/Evidence.lean:477–484`; def.

```lean
def JointReasonsExample : Prop :=
  ValueProcedure jointReasonPosition ∧
  (Models jointReasonPosition.starting (true,(4,5)) ∧ jointReasonPosition.limits (true,(4,5)) ∧
    jointReasonPosition.commitment (true,(4,5)) ∧ benefitReason (true,(4,5)) true ∧
    ¬ jointReasonPosition.consequence (true,(4,5))) ∧
  (Models jointReasonPosition.starting (true,(0,3)) ∧ jointReasonPosition.limits (true,(0,3)) ∧
    jointReasonPosition.commitment (true,(0,3)) ∧ costReason (true,(0,3)) true ∧
    ¬ jointReasonPosition.consequence (true,(0,3)))
```

#### `CoreReader.Evidence.jointReasonsExample`

`CoreReader/Evidence.lean:485–491`; theorem.

```lean
theorem jointReasonsExample : JointReasonsExample := by
  refine ⟨jointReasonProcedure,
    ⟨(modelsSingleton _ _).2 rfl, trivial, rfl, rfl, ?_⟩,
    ⟨(modelsSingleton _ _).2 rfl, trivial, rfl, Nat.le_refl 3, ?_⟩⟩
  · intro h; have bad : 5 ≤ 3 := h.2; omega
  · intro h; have bad : 3 < 0 := h.1; omega
                                                                                                                 
```

#### `CoreReader.Evidence.heterogeneousReasons`

`CoreReader/Evidence.lean:492–499`; theorem.

```lean
theorem heterogeneousReasons :
    FacetDischarged switchEmpirical ∧
    FacetDischarged (Facet.inferential (singleton (fun w : Bool => w = true)) (fun w => w = true)) ∧
    FacetDischarged (Facet.value switchPosition) ∧ JointReasonsExample := by
  refine ⟨switchEmpiricalDischarged, ⟨⟨true, (modelsSingleton _ _).2 rfl⟩, ?_⟩, switchValueProcedure, jointReasonsExample⟩
  intro w hw; exact (modelsSingleton (fun x : Bool => x = true) w).1 hw

                                                                    
```

#### `CoreReader.Evidence.zeroRecord`

`CoreReader/Evidence.lean:500–500`; def.

```lean
def zeroRecord : Record (Nat → Bool) := ⟨fun f => f 0, true⟩
```

#### `CoreReader.Evidence.localGenerator`

`CoreReader/Evidence.lean:501–502`; def.

```lean
def localGenerator (seed : Nat) : Nat → Bool := fun n => n == seed
                                                                                   
```

#### `CoreReader.Evidence.allTrue`

`CoreReader/Evidence.lean:503–503`; def.

```lean
def allTrue : Claim (Nat → Bool) := fun f => ∀ n, f n = true
```

#### `CoreReader.Evidence.zeroCompatible`

`CoreReader/Evidence.lean:504–508`; theorem.

```lean
theorem zeroCompatible (f : Nat → Bool) : Compatible [zeroRecord] f ↔ f 0 = true := by
  constructor
  · intro h; exact h zeroRecord (by simp)
  · intro hf r hr; simp only [List.mem_singleton] at hr; cases hr; exact hf
                                                                                                     
```

#### `CoreReader.Evidence.GeneratingProcess`

`CoreReader/Evidence.lean:509–513`; structure.

```lean
structure GeneratingProcess where
  owner : Nat
  prior : Nat → Bool
  generateSeed : Nat
                                                                                                          
```

#### `CoreReader.Evidence.GeneratingProcess.outputRevision`

`CoreReader/Evidence.lean:514–516`; def.

```lean
def GeneratingProcess.outputRevision (process : GeneratingProcess) : Nat → Bool :=
  fun input => process.prior input || localGenerator process.generateSeed input
                                                                         
```

#### `CoreReader.Evidence.ProducedRevision`

`CoreReader/Evidence.lean:517–521`; structure.

```lean
structure ProducedRevision where
  producer : Nat
  before : Nat → Bool
  after : Nat → Bool
                                                                           
```

#### `CoreReader.Evidence.GeneratingProcess.produce`

`CoreReader/Evidence.lean:522–523`; def.

```lean
def GeneratingProcess.produce (process : GeneratingProcess) : ProducedRevision :=
  ⟨process.owner, process.prior, process.outputRevision⟩
```

#### `CoreReader.Evidence.sampleGeneratingProcess`

`CoreReader/Evidence.lean:524–525`; def.

```lean
def sampleGeneratingProcess : GeneratingProcess := ⟨17, fun _ => false, 0⟩
                                                                                                                  
```

#### `CoreReader.Evidence.OwnedRevisionExample`

`CoreReader/Evidence.lean:526–534`; def.

```lean
def OwnedRevisionExample : Prop :=
  sampleGeneratingProcess.produce.producer = sampleGeneratingProcess.owner ∧
  sampleGeneratingProcess.produce.before = sampleGeneratingProcess.prior ∧
  sampleGeneratingProcess.produce.after = sampleGeneratingProcess.outputRevision ∧
  sampleGeneratingProcess.produce.before 0 = false ∧ sampleGeneratingProcess.produce.after 0 = true ∧
  sampleGeneratingProcess.produce.after 1 = false ∧
  Compatible [zeroRecord] sampleGeneratingProcess.produce.after ∧
  ¬ Supports [zeroRecord] allTrue
                                                                                                                 
```

#### `CoreReader.Evidence.ownedRevisionExample`

`CoreReader/Evidence.lean:535–540`; theorem.

```lean
theorem ownedRevisionExample : OwnedRevisionExample := by
  refine ⟨rfl,rfl,rfl,rfl,rfl,rfl,(zeroCompatible _).2 rfl, ?_⟩
  intro h
  have bad := h sampleGeneratingProcess.produce.after ((zeroCompatible _).2 rfl) 1
  cases bad
                                                                                                              
```

#### `CoreReader.Evidence.selfOriginDoesNotSupport`

`CoreReader/Evidence.lean:541–549`; theorem.

```lean
theorem selfOriginDoesNotSupport :
    localGenerator 0 0 = true ∧ localGenerator 0 1 = false ∧
    Compatible [zeroRecord] (localGenerator 0) ∧
    ¬ Supports [zeroRecord] allTrue ∧ OwnedRevisionExample := by
  refine ⟨rfl, rfl, (zeroCompatible _).2 rfl, ?_, ownedRevisionExample⟩
  intro h
  have bad := h (localGenerator 0) ((zeroCompatible _).2 rfl) 1
  cases bad
                                                                                              
```

#### `CoreReader.Evidence.localNotUniversal`

`CoreReader/Evidence.lean:550–559`; theorem.

```lean
theorem localNotUniversal :
    (∃ outside : Nat, outside ≠ 0) ∧
    Compatible [zeroRecord] (fun _ => true) ∧
    Compatible [zeroRecord] (localGenerator 0) ∧
    allTrue (fun _ => true) ∧ ¬ allTrue (localGenerator 0) ∧
    ¬ Supports [zeroRecord] allTrue := by
  refine ⟨⟨1, by decide⟩, (zeroCompatible _).2 rfl, (zeroCompatible _).2 rfl,
    (fun _ => rfl), ?_, selfOriginDoesNotSupport.2.2.2.1⟩
  intro h; have bad := h 1; cases bad
                                                                                                              
```

#### `CoreReader.Evidence.hiddenDifference`

`CoreReader/Evidence.lean:560–565`; theorem.

```lean
theorem hiddenDifference :
    (∀ n : Nat, n = 0 → (fun _ : Nat => true) n = localGenerator 0 n) ∧
    (fun _ : Nat => true) 1 ≠ localGenerator 0 1 := by
  refine ⟨?_, by decide⟩
  intro n hn; cases hn; rfl
                                                                                              
```

#### `CoreReader.Evidence.singleObservation`

`CoreReader/Evidence.lean:566–572`; theorem.

```lean
theorem singleObservation : [zeroRecord].length = 1 ∧
    (∃ f, Compatible [zeroRecord] f) ∧
    Supports [zeroRecord] (fun f => f 0 = true) ∧
    ¬ Supports [zeroRecord] allTrue :=
  ⟨rfl, ⟨localGenerator 0, (zeroCompatible _).2 rfl⟩,
    (fun f hf => (zeroCompatible f).1 hf), selfOriginDoesNotSupport.2.2.2.1⟩
                                                                                                                  
```

#### `CoreReader.Evidence.arithmeticFacet`

`CoreReader/Evidence.lean:573–573`; def.

```lean
def arithmeticFacet : Facet Nat := .inferential (singleton (fun n => n = 2)) (fun n => n + 1 = 3)
```

#### `CoreReader.Evidence.usesObservation`

`CoreReader/Evidence.lean:574–577`; def.

```lean
def usesObservation {W : Type} : Facet W → Bool
  | .empirical _ _ _ _ => true
  | _ => false
                                                                                                        
```

#### `CoreReader.Evidence.noUniversalChain`

`CoreReader/Evidence.lean:578–584`; theorem.

```lean
theorem noUniversalChain : FacetDischarged arithmeticFacet ∧ usesObservation arithmeticFacet = false := by
  refine ⟨⟨⟨2, (modelsSingleton _ _).2 rfl⟩, ?_⟩, rfl⟩
  intro n hn
  have premise := (modelsSingleton (fun x : Nat => x = 2) n).1 hn
  change n + 1 = 3
  rw [premise]
                                                                                              
```

#### `CoreReader.Evidence.Trial`

`CoreReader/Evidence.lean:585–589`; structure.

```lean
structure Trial where
  setting : Nat
  actualOutcome : Nat
  recordedOutcome : Nat
                                                                                                  
```

#### `CoreReader.Evidence.Verified`

`CoreReader/Evidence.lean:590–590`; def.

```lean
def Verified (t : Trial) : Prop := t.recordedOutcome = t.actualOutcome
```

#### `CoreReader.Evidence.Reproduced`

`CoreReader/Evidence.lean:591–591`; def.

```lean
def Reproduced (a b : Trial) : Prop := a.setting = b.setting
```

#### `CoreReader.Evidence.Bounded`

`CoreReader/Evidence.lean:592–593`; def.

```lean
def Bounded (t : Trial) : Prop := t.actualOutcome ≤ 2
                                                                                                                     
```

#### `CoreReader.Evidence.variableOutcomesStableBound`

`CoreReader/Evidence.lean:594–599`; theorem.

```lean
theorem variableOutcomesStableBound :
    let a : Trial := ⟨0,1,1⟩
    let b : Trial := ⟨0,2,2⟩
    Reproduced a b ∧ a.actualOutcome ≠ b.actualOutcome ∧ Bounded a ∧ Bounded b := by
  simp [Reproduced, Bounded]
                                                                                                    
```

#### `CoreReader.Evidence.verificationReproductionStability`

`CoreReader/Evidence.lean:600–605`; theorem.

```lean
theorem verificationReproductionStability :
    (Verified ⟨0,1,1⟩ ∧ Verified ⟨1,1,1⟩ ∧ ¬ Reproduced ⟨0,1,1⟩ ⟨1,1,1⟩) ∧
    (Reproduced ⟨0,1,1⟩ ⟨0,3,2⟩ ∧ ¬ Verified ⟨0,3,2⟩ ∧ ¬ Bounded ⟨0,3,2⟩) ∧
    (Bounded ⟨0,1,1⟩ ∧ Bounded ⟨0,2,0⟩ ∧ ¬ Verified ⟨0,2,0⟩) := by
  simp [Verified, Reproduced, Bounded]
                                                                                      
```

#### `CoreReader.Evidence.Program`

`CoreReader/Evidence.lean:606–608`; inductive.

```lean
inductive Program where
  | doubleInput
  | constant (value : Nat)
```

#### `CoreReader.Evidence.Program.eval`

`CoreReader/Evidence.lean:609–612`; def.

```lean
def Program.eval : Program → Nat → Nat
  | .doubleInput, n => n + n
  | .constant value, _ => value
                                                                                                                    
```

#### `CoreReader.Evidence.Process`

`CoreReader/Evidence.lean:613–616`; structure.

```lean
structure Process where
  output : Nat → Nat
  explanation : Option Program
                                                                       
```

#### `CoreReader.Evidence.OutputContract`

`CoreReader/Evidence.lean:617–618`; def.

```lean
def OutputContract (p : Process) : Prop := ∀ n, p.output n = n + n
                                                                                                         
```

#### `CoreReader.Evidence.ExplanationContract`

`CoreReader/Evidence.lean:619–621`; def.

```lean
def ExplanationContract (p : Process) : Prop :=
  ∃ program, p.explanation = some program ∧ ∀ n, program.eval n = p.output n
                                                                                  
```

#### `CoreReader.Evidence.outputOnlyProcess`

`CoreReader/Evidence.lean:622–622`; def.

```lean
def outputOnlyProcess : Process := ⟨fun n => n + n, none⟩
```

#### `CoreReader.Evidence.explainedProcess`

`CoreReader/Evidence.lean:623–624`; def.

```lean
def explainedProcess : Process := ⟨fun n => n + n, some .doubleInput⟩
                                                                                                                               
```

#### `CoreReader.Evidence.processScope`

`CoreReader/Evidence.lean:625–627`; def.

```lean
def processScope (assessed : Process) : Theory Process :=
  singleton (fun candidate => candidate = assessed)
                                                                                                  
```

#### `CoreReader.Evidence.processContractFacet`

`CoreReader/Evidence.lean:628–630`; def.

```lean
def processContractFacet (assessed : Process) (contract : Claim Process) : Facet Process :=
  .inferential (processScope assessed) contract
                                                                                                            
```

#### `CoreReader.Evidence.processScopeModels`

`CoreReader/Evidence.lean:631–634`; theorem.

```lean
theorem processScopeModels (assessed candidate : Process) :
    Models (processScope assessed) candidate ↔ candidate = assessed :=
  modelsSingleton (fun process => process = assessed) candidate
                                                                                       
```

#### `CoreReader.Evidence.processContractDischarged`

`CoreReader/Evidence.lean:635–642`; theorem.

```lean
theorem processContractDischarged (assessed : Process) (contract : Claim Process) (proof : contract assessed) :
    FacetDischarged (processContractFacet assessed contract) := by
  refine ⟨⟨assessed,(processScopeModels _ _).2 rfl⟩, ?_⟩
  intro candidate hc
  have same := (processScopeModels _ _).1 hc
  subst candidate
  exact proof
                                                                                                                               
```

#### `CoreReader.Evidence.ProcessGrounds`

`CoreReader/Evidence.lean:643–645`; def.

```lean
def ProcessGrounds (assessed : Process) (contract : Claim Process) : Prop :=
  Grounds contract canonicalArticulation (fun facet => facet = processContractFacet assessed contract)
    [processContractFacet assessed contract]
```

#### `CoreReader.Evidence.processGrounds`

`CoreReader/Evidence.lean:646–653`; theorem.

```lean
theorem processGrounds (assessed : Process) (contract : Claim Process) (proof : contract assessed) :
    ProcessGrounds assessed contract := by
  have discharged := processContractDischarged assessed contract proof
  refine ⟨by simp, ?_, ?_⟩
  · intro facet hf; subst facet; exact List.mem_singleton.mpr rfl
  · intro facet hf; have hf' := List.mem_singleton.mp hf; subst facet
    exact ⟨rfl,canonicalArticulated _ discharged,canonicalFacetArticulated _,discharged⟩
                                                                                                                         
```

#### `CoreReader.Evidence.outputCorrectByEvaluation`

`CoreReader/Evidence.lean:654–655`; theorem.

```lean
theorem outputCorrectByEvaluation : OutputContract outputOnlyProcess := fun _ => rfl
                                                                    
```

#### `CoreReader.Evidence.outputOnlyNoExplanation`

`CoreReader/Evidence.lean:656–658`; theorem.

```lean
theorem outputOnlyNoExplanation : ¬ ExplanationContract outputOnlyProcess := by
  rintro ⟨program,h,_⟩; cases h
                                                                                             
```

#### `CoreReader.Evidence.FullProcessContract`

`CoreReader/Evidence.lean:659–660`; def.

```lean
def FullProcessContract (assessed : Process) : Prop := OutputContract assessed ∧ ExplanationContract assessed
                                                                                                      
```

#### `CoreReader.Evidence.OutputContractEvidence`

`CoreReader/Evidence.lean:661–665`; def.

```lean
def OutputContractEvidence : Prop :=
  ProcessGrounds outputOnlyProcess OutputContract ∧
  Models (processScope outputOnlyProcess) outputOnlyProcess ∧
  ¬ Entails (processScope outputOnlyProcess) FullProcessContract
                                                                                                    
```

#### `CoreReader.Evidence.outputContractEvidence`

`CoreReader/Evidence.lean:666–670`; theorem.

```lean
theorem outputContractEvidence : OutputContractEvidence := by
  refine ⟨processGrounds _ _ outputCorrectByEvaluation, (processScopeModels _ _).2 rfl, ?_⟩
  intro stronger
  exact outputOnlyNoExplanation (stronger outputOnlyProcess ((processScopeModels _ _).2 rfl)).2
                                                                                                        
```

#### `CoreReader.Evidence.ScopedApplicationEvidence`

`CoreReader/Evidence.lean:671–677`; def.

```lean
def ScopedApplicationEvidence : Prop :=
  ProcessGrounds outputOnlyProcess OutputContract ∧
  ProcessGrounds explainedProcess FullProcessContract ∧
  (∀ candidate, Models (processScope outputOnlyProcess) candidate ↔ candidate = outputOnlyProcess) ∧
  (∀ candidate, Models (processScope explainedProcess) candidate ↔ candidate = explainedProcess) ∧
  Satisfiable (processScope outputOnlyProcess) ∧ Satisfiable (processScope explainedProcess)
                                                                                                                 
```

#### `CoreReader.Evidence.scopedApplicationEvidence`

`CoreReader/Evidence.lean:678–683`; theorem.

```lean
theorem scopedApplicationEvidence : ScopedApplicationEvidence := by
  refine ⟨processGrounds _ _ outputCorrectByEvaluation, processGrounds _ _ ?_,
    processScopeModels _,processScopeModels _,⟨_,(processScopeModels _ _).2 rfl⟩,
    ⟨_,(processScopeModels _ _).2 rfl⟩⟩
  exact ⟨fun _ => rfl,⟨.doubleInput,rfl,fun _ => rfl⟩⟩
                                                                                                           
```

#### `CoreReader.Evidence.outputNotExplanation`

`CoreReader/Evidence.lean:684–687`; theorem.

```lean
theorem outputNotExplanation : OutputContract outputOnlyProcess ∧
    ¬ ExplanationContract outputOnlyProcess ∧ OutputContractEvidence :=
  ⟨outputCorrectByEvaluation, outputOnlyNoExplanation, outputContractEvidence⟩
                                                                                                       
```

#### `CoreReader.Evidence.applicationContractsDiffer`

`CoreReader/Evidence.lean:688–694`; theorem.

```lean
theorem applicationContractsDiffer :
    (OutputContract outputOnlyProcess ∧ ¬ (OutputContract outputOnlyProcess ∧ ExplanationContract outputOnlyProcess)) ∧
    (OutputContract explainedProcess ∧ ExplanationContract explainedProcess) ∧
    ScopedApplicationEvidence :=
  ⟨⟨outputCorrectByEvaluation, fun h => outputOnlyNoExplanation h.2⟩,
    ⟨(fun _ => rfl), ⟨.doubleInput, rfl, fun _ => rfl⟩⟩, scopedApplicationEvidence⟩
                                                                                                              
```

#### `CoreReader.Evidence.ExternalCertificate`

`CoreReader/Evidence.lean:695–700`; structure.

```lean
structure ExternalCertificate (p : Process) where
  assessorId : Nat
  assessedId : Nat
  distinctParticipants : assessorId ≠ assessedId
  outputCorrect : ∀ n, p.output n = n + n
                                                                                                                     
```

#### `CoreReader.Evidence.externalOutputCertificate`

`CoreReader/Evidence.lean:701–703`; def.

```lean
def externalOutputCertificate : ExternalCertificate outputOnlyProcess :=
  ⟨42,7,by decide,fun _ => rfl⟩
                                                                                                        
```

#### `CoreReader.Evidence.externalAssessment`

`CoreReader/Evidence.lean:704–714`; theorem.

```lean
theorem externalAssessment :
    (∃ certificate : ExternalCertificate outputOnlyProcess,
      certificate.assessorId = 42 ∧ certificate.assessedId = 7 ∧
      certificate.assessorId ≠ certificate.assessedId ∧ OutputContract outputOnlyProcess) ∧
    ProcessGrounds outputOnlyProcess OutputContract ∧
    ¬ ExplanationContract outputOnlyProcess :=
  ⟨⟨externalOutputCertificate,rfl,rfl,externalOutputCertificate.distinctParticipants,
    externalOutputCertificate.outputCorrect⟩,
    processGrounds outputOnlyProcess OutputContract externalOutputCertificate.outputCorrect,
    outputOnlyNoExplanation⟩
                                                                                                                    
```

#### `CoreReader.Evidence.arithmeticArticulation`

`CoreReader/Evidence.lean:715–716`; def.

```lean
def arithmeticArticulation : Articulation Nat := canonicalArticulation arithmeticFacet
                                                                                                                                
```

#### `CoreReader.Evidence.nonExecutableAssessment`

`CoreReader/Evidence.lean:717–725`; theorem.

```lean
theorem nonExecutableAssessment :
    Grounds (fun n : Nat => n + 1 = 3) canonicalArticulation (fun f => f = arithmeticFacet) [arithmeticFacet] ∧
    usesObservation arithmeticFacet = false ∧
    FacetDischarged switchEmpirical ∧ usesObservation switchEmpirical = true := by
  refine ⟨⟨by simp, (by intro f hf; cases hf; simp), ?_⟩, rfl, switchEmpiricalDischarged, rfl⟩
  intro f hf; simp only [List.mem_singleton] at hf; cases hf
  exact ⟨rfl, canonicalArticulated _ noUniversalChain.1, canonicalFacetArticulated _, noUniversalChain.1⟩

end CoreReader.Evidence
```

### CoreReader/Integration.lean

#### `CoreReader.Integration.canonicalGrounds`

`CoreReader/Integration.lean:8–14`; theorem.

```lean
theorem canonicalGrounds {W : Type} (claim : Claim W) (facets : List (Facet W))
    (hne : facets ≠ []) (checked : ∀ f ∈ facets, f.claim = claim ∧ FacetDischarged f) :
    Grounds claim canonicalArticulation (fun f => f ∈ facets) facets := by
  exact ⟨hne, fun _ h => h, fun f hf =>
    ⟨(checked f hf).1, canonicalArticulated f (checked f hf).2,
      canonicalFacetArticulated f, (checked f hf).2⟩⟩

```

#### `CoreReader.Integration.canonicalGroundsForSingleton`

`CoreReader/Integration.lean:15–23`; theorem.

```lean
theorem canonicalGroundsForSingleton {W : Type} (f : Facet W) (checked : FacetDischarged f) :
    Grounds f.claim canonicalArticulation (fun g => g = f) [f] := by
  refine ⟨by simp, (by intro g hg; cases hg; simp), ?_⟩
  intro g hg
  simp only [List.mem_singleton] at hg
  subst g
  exact ⟨rfl, canonicalArticulated f checked, canonicalFacetArticulated f, checked⟩

                                                                                    
```

#### `CoreReader.Integration.Mode`

`CoreReader/Integration.lean:24–27`; inductive.

```lean
inductive Mode | apply | waive
  deriving DecidableEq, Repr

                                                                                                   
```

#### `CoreReader.Integration.World`

`CoreReader/Integration.lean:28–29`; abbrev.

```lean
abbrev World := Candidate × Mode

```

#### `CoreReader.Integration.actual`

`CoreReader/Integration.lean:30–32`; def.

```lean
def actual : World := (.identity, .apply)

                                                                                    
```

#### `CoreReader.Integration.Method`

`CoreReader/Integration.lean:33–37`; structure.

```lean
structure Method where
  form : Form
  realize : World → Implementation

                                                                                                
```

#### `CoreReader.Integration.System`

`CoreReader/Integration.lean:38–44`; structure.

```lean
structure System where
  owner : Nat
  method : Method
  principleForm : Form
  governance : World → Mode
  requirements : Requirements

```

#### `CoreReader.Integration.policyFor`

`CoreReader/Integration.lean:45–48`; def.

```lean
def policyFor : Mode → Policy
  | .apply => openPolicy
  | .waive => neutralPolicy

```

#### `CoreReader.Integration.workFor`

`CoreReader/Integration.lean:49–52`; def.

```lean
def workFor (owner : Nat) : Mode → List WorkRecord
  | .apply => completeOwnWork owner
  | .waive => []

```

#### `CoreReader.Integration.System.policy`

`CoreReader/Integration.lean:53–53`; def.

```lean
def System.policy (s : System) (w : World) : Policy := policyFor (s.governance w)
```

#### `CoreReader.Integration.System.rules`

`CoreReader/Integration.lean:54–54`; def.

```lean
def System.rules (s : System) (_w : World) : List Principle := ownRules s.owner
```

#### `CoreReader.Integration.System.work`

`CoreReader/Integration.lean:55–56`; def.

```lean
def System.work (s : System) (w : World) : List WorkRecord := workFor s.owner (s.governance w)

```

#### `CoreReader.Integration.actualSystem`

`CoreReader/Integration.lean:57–63`; def.

```lean
def actualSystem : System where
  owner := 0
  method := ⟨⟨.method, 0⟩, fun w => implementation w.1⟩
  principleForm := ⟨.principle, 0⟩
  governance := Prod.snd
  requirements := identityRequirements

```

#### `CoreReader.Integration.systemCapability`

`CoreReader/Integration.lean:64–66`; def.

```lean
def systemCapability (s : System) : Claim World :=
  fun w => ∀ n, s.requirements.inputs n → (s.method.realize w).run n = s.requirements.expected n

```

#### `CoreReader.Integration.systemBudget`

`CoreReader/Integration.lean:67–69`; def.

```lean
def systemBudget (s : System) : Claim World :=
  fun w => (s.method.realize w).cost ≤ s.requirements.budget

```

#### `CoreReader.Integration.systemObservation`

`CoreReader/Integration.lean:70–72`; def.

```lean
def systemObservation (s : System) : Record World :=
  ⟨fun w => decide ((s.method.realize w).run 0 = s.requirements.expected 0), true⟩

```

#### `CoreReader.Integration.systemHeld`

`CoreReader/Integration.lean:73–75`; def.

```lean
def systemHeld (s : System) : Theory World :=
  union (singleton (systemCapability s)) (singleton (systemBudget s))

```

#### `CoreReader.Integration.Question`

`CoreReader/Integration.lean:76–78`; inductive.

```lean
inductive Question | correctOutput | affordable
  deriving DecidableEq, Repr

```

#### `CoreReader.Integration.systemContext`

`CoreReader/Integration.lean:79–83`; def.

```lean
def systemContext (s : System) : Context World Question :=
  ⟨singleton (Compatible [systemObservation s]),
    (fun q => match q with | .correctOutput => systemCapability s | .affordable => systemBudget s),
    fun w => (s.method.realize w).domain 0 ∧ w.2 = .apply⟩

```

#### `CoreReader.Integration.capability`

`CoreReader/Integration.lean:84–84`; abbrev.

```lean
abbrev capability := systemCapability actualSystem
```

#### `CoreReader.Integration.observation`

`CoreReader/Integration.lean:85–85`; abbrev.

```lean
abbrev observation := systemObservation actualSystem
```

#### `CoreReader.Integration.held`

`CoreReader/Integration.lean:86–86`; abbrev.

```lean
abbrev held := systemHeld actualSystem
```

#### `CoreReader.Integration.context`

`CoreReader/Integration.lean:87–89`; abbrev.

```lean
abbrev context := systemContext actualSystem

                                                                                                                    
```

#### `CoreReader.Integration.observationIdentifies`

`CoreReader/Integration.lean:90–94`; theorem.

```lean
theorem observationIdentifies (w : World) : Compatible [observation] w ↔ w.1 = .identity := by
  rcases w with ⟨candidate, mode⟩
  cases candidate <;> simp [Compatible, observation, systemObservation, actualSystem,
    implementation, identityRequirements, identityImpl, successorImpl]

```

#### `CoreReader.Integration.capabilityActual`

`CoreReader/Integration.lean:95–96`; theorem.

```lean
theorem capabilityActual : capability actual := fun _ _ => rfl

```

#### `CoreReader.Integration.observedCapability`

`CoreReader/Integration.lean:97–104`; theorem.

```lean
theorem observedCapability : Supports [observation] capability := by
  intro w hw
  have hid := (observationIdentifies w).1 hw
  rcases w with ⟨candidate, mode⟩
  change candidate = .identity at hid
  subst candidate
  exact fun _ _ => rfl

```

#### `CoreReader.Integration.capabilityFacet`

`CoreReader/Integration.lean:105–106`; def.

```lean
def capabilityFacet : Facet World := .empirical [observation] (fun _ => True) capability (fun _ => True)

```

#### `CoreReader.Integration.capabilityFacetChecked`

`CoreReader/Integration.lean:107–110`; theorem.

```lean
theorem capabilityFacetChecked : FacetDischarged capabilityFacet := by
  exact ⟨⟨actual, (observationIdentifies actual).2 rfl, trivial⟩,
    (fun w hw _ => observedCapability w hw), fun _ _ => trivial⟩

```

#### `CoreReader.Integration.capabilityGrounds`

`CoreReader/Integration.lean:111–114`; theorem.

```lean
theorem capabilityGrounds : Grounds capability canonicalArticulation
    (fun f => f = capabilityFacet) [capabilityFacet] :=
  canonicalGroundsForSingleton capabilityFacet capabilityFacetChecked

```

#### `CoreReader.Integration.actualAdmissible`

`CoreReader/Integration.lean:115–119`; theorem.

```lean
theorem actualAdmissible : Admissible held context actual := by
  refine ⟨(modelsUnion _ _ _).2 ⟨(modelsSingleton _ _).2 capabilityActual,
    (modelsSingleton _ _).2 (by change 1 ≤ 1; decide)⟩,
    (modelsSingleton _ _).2 ((observationIdentifies actual).2 rfl), trivial, rfl⟩

```

#### `CoreReader.Integration.jointConsistent`

`CoreReader/Integration.lean:120–123`; theorem.

```lean
theorem jointConsistent : Consistent held context :=
  consequenceConsistency held context ⟨actual, actualAdmissible⟩

                                                                                                                 
```

#### `CoreReader.Integration.Charter`

`CoreReader/Integration.lean:124–128`; def.

```lean
def Charter (s : System) (w : World) : Prop :=
  Generative (s.policy w) ∧ Consistent (systemHeld s) (systemContext s) ∧
  Reflexive s.owner (s.rules w) (s.work w) ∧
  (s.policy w).current s.method.form ∧ (s.policy w).current s.principleForm

```

#### `CoreReader.Integration.charterChecked`

`CoreReader/Integration.lean:129–132`; theorem.

```lean
theorem charterChecked : Charter actualSystem actual :=
  ⟨⟨Or.inl rfl, fun _ _ => trivial⟩, jointConsistent, completeOwnWork_reflexive 0, rfl, rfl⟩

                                                                                                 
```

#### `CoreReader.Integration.revisedHeld`

`CoreReader/Integration.lean:133–135`; def.

```lean
def revisedHeld : Theory World := union held
  (singleton (fun w => (actualSystem.method.realize w).run 0 = actualSystem.requirements.expected 0))

```

#### `CoreReader.Integration.initialSnapshot`

`CoreReader/Integration.lean:136–136`; def.

```lean
def initialSnapshot : Snapshot World Question := ⟨held, context, 0⟩
```

#### `CoreReader.Integration.revisedSnapshot`

`CoreReader/Integration.lean:137–138`; def.

```lean
def revisedSnapshot : Snapshot World Question := ⟨revisedHeld, context, 1⟩

```

#### `CoreReader.Integration.revisionKeepsConsistency`

`CoreReader/Integration.lean:139–150`; theorem.

```lean
theorem revisionKeepsConsistency :
    Charter actualSystem actual ∧ Consistent revisedHeld context ∧
    TruthfulReport initialSnapshot revisedSnapshot true ∧
    ¬ TruthfulReport initialSnapshot revisedSnapshot false := by
  refine ⟨charterChecked, consequenceConsistency revisedHeld context ⟨actual,
    (modelsUnion _ _ _).2 ⟨actualAdmissible.1, (modelsSingleton _ _).2 rfl⟩,
    actualAdmissible.2⟩, (fun _ => rfl), ?_⟩
  intro h
  have bad := h (Or.inr (by decide))
  cases bad

                                                                                 
```

#### `CoreReader.Integration.OwnCapabilityDuty`

`CoreReader/Integration.lean:151–154`; def.

```lean
def OwnCapabilityDuty (s : System) (w : World) (facets : List (Facet World)) : Prop :=
  Performed (s.work w) (.system s.owner) .assessment ∧
  Grounds (systemCapability s) canonicalArticulation (fun f => f ∈ facets) facets

```

#### `CoreReader.Integration.ownCapabilityGrounded`

`CoreReader/Integration.lean:155–162`; theorem.

```lean
theorem ownCapabilityGrounded :
    OwnCapabilityDuty actualSystem actual [capabilityFacet] ∧ capability actual := by
  refine ⟨⟨?_, ?_⟩, capabilityActual⟩
  · exact ownAssessmentPerformed 0 (.system 0) (by simp [ownSubjects])
  · exact canonicalGrounds capability [capabilityFacet] (by simp)
      (by intro f hf; simp only [List.mem_singleton] at hf; cases hf; exact ⟨rfl, capabilityFacetChecked⟩)

                                                                                                       
```

#### `CoreReader.Integration.costAllowanceRecord`

`CoreReader/Integration.lean:163–165`; def.

```lean
def costAllowanceRecord : Record World :=
  ⟨fun w => decide ((actualSystem.method.realize w).cost ≤ 2), true⟩

```

#### `CoreReader.Integration.unsupportedCapabilityFacet`

`CoreReader/Integration.lean:166–168`; def.

```lean
def unsupportedCapabilityFacet : Facet World :=
  .empirical [costAllowanceRecord] (fun _ => True) capability (fun _ => True)

```

#### `CoreReader.Integration.costCompatibleWithFailure`

`CoreReader/Integration.lean:169–174`; theorem.

```lean
theorem costCompatibleWithFailure : Compatible [costAllowanceRecord] (.successor, .apply) := by
  intro r hr
  simp only [List.mem_singleton] at hr
  subst r
  rfl

```

#### `CoreReader.Integration.costDoesNotSupportOutput`

`CoreReader/Integration.lean:175–179`; theorem.

```lean
theorem costDoesNotSupportOutput : ¬ Supports [costAllowanceRecord] capability := by
  intro h
  have bad := h (.successor, .apply) costCompatibleWithFailure 0 trivial
  cases bad

```

#### `CoreReader.Integration.unsupportedGrounds`

`CoreReader/Integration.lean:180–186`; theorem.

```lean
theorem unsupportedGrounds : ¬ Grounds capability canonicalArticulation
    (fun f => f = unsupportedCapabilityFacet) [unsupportedCapabilityFacet] := by
  intro h
  have discharged := (h.2.2 unsupportedCapabilityFacet (by simp)).2.2.2
  exact costDoesNotSupportOutput (fun w hw => discharged.2.1 w hw trivial)

                                                                                                                             
```

#### `CoreReader.Integration.Commitment`

`CoreReader/Integration.lean:187–190`; inductive.

```lean
inductive Commitment | generation | consistency | reflexivity | grounds | choice
  deriving DecidableEq, Repr

                                                                                                                            
```

#### `CoreReader.Integration.groundsPermission`

`CoreReader/Integration.lean:191–196`; def.

```lean
def groundsPermission (mode : Mode) (claim : Claim World) (a : Facet World → Articulation World)
    (applicable : Facet World → Prop) (facets : List (Facet World)) : Prop :=
  match mode with
  | .apply => Grounds claim a applicable facets
  | .waive => True

```

#### `CoreReader.Integration.GroundsProvision`

`CoreReader/Integration.lean:197–200`; def.

```lean
def GroundsProvision (mode : Mode) : Prop :=
  ∀ claim a applicable facets, groundsPermission mode claim a applicable facets →
    Grounds claim a applicable facets

```

#### `CoreReader.Integration.groundsProvisionMeaning`

`CoreReader/Integration.lean:201–211`; theorem.

```lean
theorem groundsProvisionMeaning (mode : Mode) : GroundsProvision mode ↔ mode = .apply := by
  cases mode with
  | apply => exact ⟨fun _ => rfl, fun _ _ _ _ _ h => h⟩
  | waive =>
    constructor
    · intro h
      exact False.elim (unsupportedGrounds (h capability canonicalArticulation
        (fun f => f = unsupportedCapabilityFacet) [unsupportedCapabilityFacet] trivial))
    · intro h; cases h

                                                                                        
```

#### `CoreReader.Integration.consistencyPermission`

`CoreReader/Integration.lean:212–214`; def.

```lean
def consistencyPermission (mode : Mode) (t : Theory World) (c : Context World Question) : Prop :=
  match mode with | .apply => Consistent t c | .waive => True

```

#### `CoreReader.Integration.conflictingHeld`

`CoreReader/Integration.lean:215–216`; def.

```lean
def conflictingHeld : Theory World := union (singleton capability) (singleton (fun w => ¬ capability w))

```

#### `CoreReader.Integration.conflictConsequences`

`CoreReader/Integration.lean:217–222`; theorem.

```lean
theorem conflictConsequences :
    Consequence conflictingHeld context .correctOutput true ∧
    Consequence conflictingHeld context .correctOutput false := by
  exact ⟨fun w hw => hw.1 capability (Or.inl rfl),
    fun w hw => hw.1 (fun w => ¬ capability w) (Or.inr rfl)⟩

```

#### `CoreReader.Integration.conflictingHeldInconsistent`

`CoreReader/Integration.lean:223–226`; theorem.

```lean
theorem conflictingHeldInconsistent : ¬ Consistent conflictingHeld context :=
  conflictRequiresChange conflictingHeld context .correctOutput conflictConsequences.1 conflictConsequences.2

                                                                                                                   
```

#### `CoreReader.Integration.choicePermission`

`CoreReader/Integration.lean:227–230`; def.

```lean
def choicePermission (mode : Mode) (req : Requirements) (i : Implementation) (reasons : List Reason) : Prop :=
  match mode with | .apply => JustifiedChoice req i reasons | .waive => True

                                                                                                                          
```

#### `CoreReader.Integration.proposedOperation`

`CoreReader/Integration.lean:231–234`; def.

```lean
def proposedOperation : Mode → Operation
  | .apply => .successor
  | .waive => .copy

```

#### `CoreReader.Integration.selfSamples`

`CoreReader/Integration.lean:235–238`; def.

```lean
def selfSamples : Mode → List Nat
  | .apply => [0, 1]
  | .waive => [1]

```

#### `CoreReader.Integration.conflictDecision`

`CoreReader/Integration.lean:239–241`; def.

```lean
noncomputable def conflictDecision (mode : Mode) : Bool :=
  @decide (consistencyPermission mode conflictingHeld context) (Classical.propDecidable _)

```

#### `CoreReader.Integration.groundsDecision`

`CoreReader/Integration.lean:242–245`; def.

```lean
noncomputable def groundsDecision (mode : Mode) (facet : Facet World) : Bool :=
  @decide (groundsPermission mode facet.claim canonicalArticulation (fun f => f = facet) [facet])
    (Classical.propDecidable _)

```

#### `CoreReader.Integration.choiceDecision`

`CoreReader/Integration.lean:246–248`; def.

```lean
noncomputable def choiceDecision (mode : Mode) (i : Implementation) (reasons : List Reason) : Bool :=
  @decide (choicePermission mode identityRequirements i reasons) (Classical.propDecidable _)

```

#### `CoreReader.Integration.decisionsApply`

`CoreReader/Integration.lean:249–260`; theorem.

```lean
theorem decisionsApply : conflictDecision .apply = false ∧
    groundsDecision .apply unsupportedCapabilityFacet = false ∧
    groundsDecision .apply capabilityFacet = true ∧
    choiceDecision .apply cheapSuccessor [.method .simplicity] = false ∧
    choiceDecision .apply identityImpl objectiveReason = true := by
  classical
  simp only [conflictDecision, groundsDecision, choiceDecision, consistencyPermission,
    groundsPermission, choicePermission]
  exact ⟨decide_eq_false conflictingHeldInconsistent,
    decide_eq_false unsupportedGrounds, decide_eq_true capabilityGrounds,
    decide_eq_false eligibleInternalReasonNotSufficient.2, decide_eq_true identityJustified⟩

```

#### `CoreReader.Integration.decisionsWaive`

`CoreReader/Integration.lean:261–271`; theorem.

```lean
theorem decisionsWaive : conflictDecision .waive = true ∧
    groundsDecision .waive unsupportedCapabilityFacet = true ∧
    choiceDecision .waive cheapSuccessor [.method .simplicity] = true := by
  exact ⟨@decide_eq_true (consistencyPermission .waive conflictingHeld context)
    (Classical.propDecidable _) trivial,
    @decide_eq_true (groundsPermission .waive unsupportedCapabilityFacet.claim canonicalArticulation
      (fun f => f = unsupportedCapabilityFacet) [unsupportedCapabilityFacet]) (Classical.propDecidable _) trivial,
    @decide_eq_true (choicePermission .waive identityRequirements cheapSuccessor [.method .simplicity])
      (Classical.propDecidable _) trivial⟩

                                                                                                                       
```

#### `CoreReader.Integration.commitmentPositionFor`

`CoreReader/Integration.lean:272–328`; def.

```lean
noncomputable def commitmentPositionFor (c : Commitment) (chosenMode : Mode) : ValuePosition World :=
  match c with
  | .generation => {
      Position := Mode, Outcome := Operation, adopted := chosenMode, selected := actualSystem.governance,
      outcome := fun _ mode => proposedOperation mode,
      objective := fun op => op.run 0 ≠ Operation.copy.run 0,
      constraints := fun _ mode => Generative (policyFor mode),
      starting := singleton (fun w => actualSystem.governance w = chosenMode),
      reasons := [fun _ mode => (proposedOperation mode).run 0 = 1 ∧ Operation.copy.run 0 = 0],
      limits := fun w => w.1 = .identity,
      relevantCriticism := fun _ => ¬ Expanded baseState inflatedState,
      response := fun _ => some "Pursuing expansion does not guarantee it; assess the actual before and after capabilities separately" }
  | .consistency => {
      Position := Mode, Outcome := Bool, adopted := chosenMode, selected := actualSystem.governance,
      outcome := fun _ mode => conflictDecision mode,
      objective := fun accepted => accepted = false,
      constraints := fun _ mode => consistencyPermission mode held context,
      starting := singleton (fun w => actualSystem.governance w = chosenMode),
      reasons := [fun _ _ => Consequence conflictingHeld context .correctOutput true ∧
        Consequence conflictingHeld context .correctOutput false],
      limits := fun w => w.1 = .identity,
      relevantCriticism := fun _ => ¬ Entails (emptyTheory : Theory Bool) (fun w => w = true),
      response := fun _ => some "Consistency alone does not establish sufficient support; assess the claim with its grounds as well" }
  | .reflexivity => {
      Position := Mode, Outcome := List Nat, adopted := chosenMode, selected := actualSystem.governance,
      outcome := fun _ mode => selfSamples mode,
      objective := fun samples => ∃ n ∈ samples, ownArithmeticPrinciple n = false,
      constraints := fun _ mode => Reflexive 0 (ownRules 0) (workFor 0 mode),
      starting := singleton (fun w => actualSystem.governance w = chosenMode),
      reasons := [fun _ _ => ownArithmeticPrinciple 0 = false ∧ ownArithmeticPrinciple 1 = true],
      limits := fun w => w.1 = .identity,
      relevantCriticism := fun _ => selfTest [1] = true ∧ ownArithmeticPrinciple 0 = false,
      response := fun _ => some "A passing self-test does not certify the principle; retain the relevant counterexample and its scope" }
  | .grounds => {
      Position := Mode, Outcome := Bool, adopted := chosenMode, selected := actualSystem.governance,
      outcome := fun _ mode => groundsDecision mode unsupportedCapabilityFacet,
      objective := fun accepted => accepted = false,
      constraints := fun _ mode => groundsPermission mode capability canonicalArticulation
        (fun f => f = capabilityFacet) [capabilityFacet],
      starting := singleton (fun w => actualSystem.governance w = chosenMode),
      reasons := [fun _ _ => Compatible [costAllowanceRecord] (.successor, .apply) ∧
        ¬ capability (.successor, .apply)],
      limits := fun w => w.1 = .identity,
      relevantCriticism := fun _ => OutputContract outputOnlyProcess ∧ ¬ ExplanationContract outputOnlyProcess,
      response := fun _ => some "Grounds allows an external output assessment without requiring this process to provide an internal explanation" }
  | .choice => {
      Position := Mode, Outcome := Bool, adopted := chosenMode, selected := actualSystem.governance,
      outcome := fun _ mode => choiceDecision mode cheapSuccessor [.method .simplicity],
      objective := fun accepted => accepted = false,
      constraints := fun _ mode => choicePermission mode identityRequirements identityImpl objectiveReason,
      starting := singleton (fun w => actualSystem.governance w = chosenMode),
      reasons := [fun _ _ => cheapSuccessor.run 0 = 1 ∧ identityRequirements.expected 0 = 0 ∧
        cheapSuccessor.cost ≤ identityRequirements.budget],
      limits := fun w => w.1 = .identity,
      relevantCriticism := fun _ => identityImpl.conventional = true ∧ identityImpl.established = true,
      response := fun _ => some "An existing conventional method remains eligible when actual output and budget reasons justify it" }

```

#### `CoreReader.Integration.commitmentPosition`

`CoreReader/Integration.lean:329–331`; def.

```lean
noncomputable def commitmentPosition (c : Commitment) : ValuePosition World := commitmentPositionFor c .apply

                                                                                             
```

#### `CoreReader.Integration.positionReasons`

`CoreReader/Integration.lean:332–345`; theorem.

```lean
theorem positionReasons (c : Commitment) :
    ∀ r ∈ (commitmentPosition c).reasons, r actual (commitmentPosition c).adopted := by
  cases c <;> intro r hr <;> dsimp [commitmentPosition, commitmentPositionFor] at hr ⊢ <;>
    rcases List.mem_singleton.mp hr with rfl
  · exact ⟨rfl, rfl⟩
  · exact conflictConsequences
  · exact ⟨rfl, rfl⟩
  · refine ⟨costCompatibleWithFailure, ?_⟩
    intro h
    have bad := h 0 trivial
    cases bad
  · exact ⟨rfl, rfl, by decide⟩

                                                                                                                                    
```

#### `CoreReader.Integration.positionConsequence`

`CoreReader/Integration.lean:346–353`; theorem.

```lean
theorem positionConsequence (c : Commitment) (w : World) : (commitmentPosition c).consequence w := by
  cases c <;> dsimp [commitmentPosition, commitmentPositionFor, ValuePosition.consequence]
  · exact ⟨by decide, ⟨Or.inl rfl, fun _ _ => trivial⟩⟩
  · exact ⟨decisionsApply.1, jointConsistent⟩
  · exact ⟨⟨0, by simp [selfSamples], rfl⟩, completeOwnWork_reflexive 0⟩
  · exact ⟨decisionsApply.2.1, capabilityGrounds⟩
  · exact ⟨decisionsApply.2.2.2.1, identityJustified⟩

```

#### `CoreReader.Integration.positionProcedure`

`CoreReader/Integration.lean:354–366`; theorem.

```lean
theorem positionProcedure (c : Commitment) : ValueProcedure (commitmentPosition c) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · cases c <;> simp [commitmentPosition, commitmentPositionFor]
  · refine ⟨actual, ?_, ?_, ?_, positionReasons c⟩
    · cases c <;> exact (modelsSingleton _ _).2 rfl
    · cases c <;> rfl
    · cases c <;> rfl
  · intro w _ _ _
    exact positionConsequence c w
  · intro w _ _
    cases c <;> exact ⟨_, rfl, by decide⟩

                                                                                                    
```

#### `CoreReader.Integration.criticismWithinScope`

`CoreReader/Integration.lean:367–378`; theorem.

```lean
theorem criticismWithinScope (c : Commitment) :
    (commitmentPosition c).limits actual ∧ (commitmentPosition c).relevantCriticism actual := by
  constructor
  · cases c <;> rfl
  · cases c
    · simp [commitmentPosition, commitmentPositionFor, Expanded, baseState, inflatedState]
    · exact consistentIncomplete.2.1
    · exact ⟨rfl, rfl⟩
    · exact ⟨outputNotExplanation.1, outputNotExplanation.2.1⟩
    · exact ⟨rfl, rfl⟩

                                                                                                                                      
```

#### `CoreReader.Integration.oppositeConsequenceFails`

`CoreReader/Integration.lean:379–397`; theorem.

```lean
theorem oppositeConsequenceFails (c : Commitment) (w : World) :
    ¬ (commitmentPositionFor c .waive).consequence w := by
  cases c <;> intro h
  · exact permissionNotValuation.2.2 h.2
  · have bad : conflictDecision .waive = false := h.1
    rw [decisionsWaive.1] at bad
    cases bad
  · obtain ⟨n, hn, hf⟩ := h.1
    change n ∈ [1] at hn
    have he : n = 1 := List.mem_singleton.mp hn
    subst n
    cases hf
  · have bad : groundsDecision .waive unsupportedCapabilityFacet = false := h.1
    rw [decisionsWaive.2.1] at bad
    cases bad
  · have bad : choiceDecision .waive cheapSuccessor [.method .simplicity] = false := h.1
    rw [decisionsWaive.2.2] at bad
    cases bad

```

#### `CoreReader.Integration.oppositeProcedureRejected`

`CoreReader/Integration.lean:398–403`; theorem.

```lean
theorem oppositeProcedureRejected (c : Commitment) : ¬ ValueProcedure (commitmentPositionFor c .waive) := by
  intro h
  obtain ⟨w, hs, hl, _, hr⟩ := h.2.1
  exact oppositeConsequenceFails c w (h.2.2.1 w hs hl hr)

                                                                                                           
```

#### `CoreReader.Integration.commitmentClaim`

`CoreReader/Integration.lean:404–405`; def.

```lean
noncomputable def commitmentClaim (c : Commitment) : Claim World := (commitmentPosition c).commitment

```

#### `CoreReader.Integration.commitmentFacet`

`CoreReader/Integration.lean:406–407`; def.

```lean
noncomputable def commitmentFacet (c : Commitment) : Facet World := .value (commitmentPosition c)

```

#### `CoreReader.Integration.reasonsBelongToCommitments`

`CoreReader/Integration.lean:408–417`; theorem.

```lean
theorem reasonsBelongToCommitments (c : Commitment) :
    Grounds (commitmentClaim c) canonicalArticulation
      (fun f => f = commitmentFacet c) [commitmentFacet c] ∧
    JointAdoption (commitmentPosition c) ∧
    (commitmentPosition c).relevantCriticism actual ∧
    ¬ ValueProcedure (commitmentPositionFor c .waive) := by
  exact ⟨canonicalGroundsForSingleton (commitmentFacet c) (positionProcedure c),
    (positionProcedure c).2.1, (criticismWithinScope c).2, oppositeProcedureRejected c⟩

                                                                                                            
```

#### `CoreReader.Integration.groundsCommitmentIsProvision`

`CoreReader/Integration.lean:418–422`; theorem.

```lean
theorem groundsCommitmentIsProvision : commitmentClaim .grounds = (fun w => GroundsProvision w.2) := by
  funext w
  apply propext
  exact (groundsProvisionMeaning w.2).symm

```

#### `CoreReader.Integration.groundsSelfAssessment`

`CoreReader/Integration.lean:423–435`; theorem.

```lean
theorem groundsSelfAssessment :
    Grounds (fun w => GroundsProvision w.2) canonicalArticulation
      (fun f => f = commitmentFacet .grounds) [commitmentFacet .grounds] ∧
    (commitmentPosition .grounds).limits actual ∧
    (commitmentPosition .grounds).relevantCriticism actual ∧
    ¬ ValueProcedure (commitmentPositionFor .grounds .waive) := by
  rw [← groundsCommitmentIsProvision]
  exact ⟨(reasonsBelongToCommitments .grounds).1,
    (criticismWithinScope .grounds).1, (criticismWithinScope .grounds).2,
    oppositeProcedureRejected .grounds⟩

                                                                                                 
                                                                                   
```

#### `CoreReader.Integration.PhilosophyMethod`

`CoreReader/Integration.lean:436–439`; structure.

```lean
structure PhilosophyMethod where
  form : Form
  mode : Mode

```

#### `CoreReader.Integration.currentPhilosophy`

`CoreReader/Integration.lean:440–442`; def.

```lean
def currentPhilosophy (s : System) (w : World) : PhilosophyMethod :=
  ⟨s.principleForm, s.governance w⟩

```

#### `CoreReader.Integration.PhilosophyMethod.review`

`CoreReader/Integration.lean:443–447`; def.

```lean
noncomputable def PhilosophyMethod.review (p : PhilosophyMethod) (input : Nat) : Nat :=
  if input = 0 then
    if choiceDecision p.mode identityImpl objectiveReason then 1 else 0
  else if choiceDecision p.mode cheapSuccessor [.method .simplicity] then 1 else 0

```

#### `CoreReader.Integration.PhilosophyMethod.implementation`

`CoreReader/Integration.lean:448–457`; def.

```lean
noncomputable def PhilosophyMethod.implementation (p : PhilosophyMethod) : Implementation where
  name := "Current philosophy's proposal review"
  conventional := true
  established := true
  run := p.review
  cost := 1
  domain n := n = 0 ∨ n = 1
  explanation := p.review
  trace n := [n, p.review n]

```

#### `CoreReader.Integration.proposalRequirements`

`CoreReader/Integration.lean:458–463`; def.

```lean
def proposalRequirements : Requirements where
  inputs n := n = 0 ∨ n = 1
  expected n := if n = 0 then 1 else 0
  budget := 1
  values _ := True

```

#### `CoreReader.Integration.currentReviewCorrect`

`CoreReader/Integration.lean:464–471`; theorem.

```lean
theorem currentReviewCorrect : ∀ n, proposalRequirements.inputs n →
    (currentPhilosophy actualSystem actual).review n = proposalRequirements.expected n := by
  intro n hn
  rcases hn with rfl | rfl <;>
    simp [PhilosophyMethod.review, currentPhilosophy, actualSystem, actual,
      proposalRequirements, decisionsApply.2.2.2.1, decisionsApply.2.2.2.2]

                                                                                                                      
```

#### `CoreReader.Integration.existingPhilosophyNotPrivileged`

`CoreReader/Integration.lean:472–486`; theorem.

```lean
theorem existingPhilosophyNotPrivileged :
    (currentPhilosophy actualSystem actual).form = actualSystem.principleForm ∧
    (currentPhilosophy actualSystem actual).mode = actualSystem.governance actual ∧
    ¬ JustifiedChoice proposalRequirements
      (currentPhilosophy actualSystem actual).implementation [.status .standing] ∧
    JustifiedChoice proposalRequirements
      (currentPhilosophy actualSystem actual).implementation [.method .output] ∧
    (currentPhilosophy actualSystem actual).review 0 = 1 ∧
    (currentPhilosophy actualSystem actual).review 1 = 0 := by
  refine ⟨rfl, rfl, statusOnlyFails _ _ _, ?_, currentReviewCorrect 0 (Or.inl rfl),
    currentReviewCorrect 1 (Or.inr rfl)⟩
  exact ⟨⟨currentReviewCorrect, by change 1 ≤ 1; decide⟩,
    .method .output, by simp, trivial, currentReviewCorrect⟩

                                                                                                                    
```

#### `CoreReader.Integration.applicationClaim`

`CoreReader/Integration.lean:487–490`; def.

```lean
def applicationClaim (s : System) (req : Requirements)
    (contract : Requirements → Implementation → Prop) : Claim World :=
  fun w => contract req (s.method.realize w)

```

#### `CoreReader.Integration.ApplicationDuties`

`CoreReader/Integration.lean:491–498`; def.

```lean
def ApplicationDuties (s : System) (w : World) (req : Requirements)
    (contract : Requirements → Implementation → Prop)
    (articulations : Facet World → Articulation World)
    (applicable : Facet World → Prop) (facets : List (Facet World)) : Prop :=
  Reflexive s.owner (s.rules w) (s.work w) ∧
  Grounds (applicationClaim s req contract) articulations applicable facets

                                                                                                               
```

#### `CoreReader.Integration.applicationRetainsDuties`

`CoreReader/Integration.lean:499–509`; theorem.

```lean
theorem applicationRetainsDuties (s : System) (w : World) (req : Requirements)
    (contract : Requirements → Implementation → Prop)
    (articulations : Facet World → Articulation World)
    (applicable : Facet World → Prop) (facets : List (Facet World))
    (h : ApplicationDuties s w req contract articulations applicable facets) :
    Reflexive s.owner (s.rules w) (s.work w) ∧
    (∀ f, applicable f → f ∈ facets) ∧
    (∀ f ∈ facets, f.claim = applicationClaim s req contract ∧
      Articulated (articulations f) ∧ FacetArticulated (articulations f) f ∧ FacetDischarged f) :=
  ⟨h.1, h.2.2.1, h.2.2.2⟩

```

#### `CoreReader.Integration.outputContract`

`CoreReader/Integration.lean:510–512`; def.

```lean
def outputContract (req : Requirements) (i : Implementation) : Prop :=
  ∀ n, req.inputs n → i.run n = req.expected n

```

#### `CoreReader.Integration.successorRequirements`

`CoreReader/Integration.lean:513–516`; def.

```lean
def successorRequirements : Requirements :=
  { identityRequirements with expected := fun n => n + 1 }

                                                                                                                
```

#### `CoreReader.Integration.changedObjectiveFacet`

`CoreReader/Integration.lean:517–520`; def.

```lean
def changedObjectiveFacet : Facet World :=
  .empirical [observation] (fun _ => True)
    (applicationClaim actualSystem successorRequirements outputContract) (fun _ => True)

```

#### `CoreReader.Integration.applicationVariation`

`CoreReader/Integration.lean:521–536`; theorem.

```lean
theorem applicationVariation :
    ApplicationDuties actualSystem actual identityRequirements outputContract
      canonicalArticulation (fun f => f = capabilityFacet) [capabilityFacet] ∧
    ¬ applicationClaim actualSystem successorRequirements outputContract actual ∧
    ¬ Grounds (applicationClaim actualSystem successorRequirements outputContract)
      canonicalArticulation (fun f => f = changedObjectiveFacet) [changedObjectiveFacet] := by
  refine ⟨⟨completeOwnWork_reflexive 0, capabilityGrounds⟩, ?_, ?_⟩
  · intro h
    have bad := h 0 trivial
    cases bad
  · intro h
    have discharged := (h.2.2 changedObjectiveFacet (by simp)).2.2.2
    have bad := discharged.2.1 actual ((observationIdentifies actual).2 rfl) trivial 0 trivial
    cases bad

                                                                                                                  
```

#### `CoreReader.Integration.charterNotGrounds`

`CoreReader/Integration.lean:537–545`; theorem.

```lean
theorem charterNotGrounds :
    Charter actualSystem actual ∧
    Compatible [costAllowanceRecord] actual ∧
    ¬ Grounds capability canonicalArticulation
      (fun f => f = unsupportedCapabilityFacet) [unsupportedCapabilityFacet] := by
  exact ⟨charterChecked, (by intro r hr; cases List.mem_singleton.mp hr; rfl), unsupportedGrounds⟩

                                                                                           
                                                                             
```

#### `CoreReader.Integration.jointWitness`

`CoreReader/Integration.lean:546–558`; theorem.

```lean
theorem jointWitness :
    ∃ s : System, ∃ w : World,
      Admissible (systemHeld s) (systemContext s) w ∧ Charter s w ∧
      OwnCapabilityDuty s w [capabilityFacet] ∧ systemCapability s w ∧
      JustifiedChoice s.requirements (s.method.realize w) objectiveReason ∧
      (∀ c : Commitment, Grounds (commitmentClaim c) canonicalArticulation
        (fun f => f = commitmentFacet c) [commitmentFacet c]) ∧
      s = actualSystem ∧ w = actual := by
  exact ⟨actualSystem, actual, actualAdmissible, charterChecked,
    ownCapabilityGrounded.1, capabilityActual, identityJustified,
    fun c => (reasonsBelongToCommitments c).1, rfl, rfl⟩

end CoreReader.Integration
```

### CoreReader/Logic.lean

#### `CoreReader.Logic.Claim`

`CoreReader/Logic.lean:4–5`; abbrev.

```lean
abbrev Claim (W : Type) := W → Prop
                                                             
```

#### `CoreReader.Logic.Theory`

`CoreReader/Logic.lean:6–7`; abbrev.

```lean
abbrev Theory (W : Type) := Claim W → Prop
                                                         
```

#### `CoreReader.Logic.Models`

`CoreReader/Logic.lean:8–9`; def.

```lean
def Models {W : Type} (t : Theory W) (w : W) : Prop := ∀ p, t p → p w
                                                     
```

#### `CoreReader.Logic.Entails`

`CoreReader/Logic.lean:10–11`; def.

```lean
def Entails {W : Type} (t : Theory W) (p : Claim W) : Prop := ∀ w, Models t w → p w
                                                
```

#### `CoreReader.Logic.Satisfiable`

`CoreReader/Logic.lean:12–13`; def.

```lean
def Satisfiable {W : Type} (t : Theory W) : Prop := ∃ w, Models t w
                                                                                         
```

#### `CoreReader.Logic.Context`

`CoreReader/Logic.lean:14–18`; structure.

```lean
structure Context (W Q : Type) where
  assumptions : Theory W
  meaning : Q → Claim W
  scope : Claim W
                                                                           
```

#### `CoreReader.Logic.Admissible`

`CoreReader/Logic.lean:19–21`; def.

```lean
def Admissible {W Q : Type} (t : Theory W) (c : Context W Q) (w : W) : Prop :=
  Models t w ∧ Models c.assumptions w ∧ c.scope w
                                                                               
```

#### `CoreReader.Logic.Consequence`

`CoreReader/Logic.lean:22–24`; def.

```lean
def Consequence {W Q : Type} (t : Theory W) (c : Context W Q) (q : Q) (positive : Bool) : Prop :=
  ∀ w, Admissible t c w → if positive then c.meaning q w else ¬ c.meaning q w
                                                                                     
```

#### `CoreReader.Logic.Consistent`

`CoreReader/Logic.lean:25–27`; def.

```lean
def Consistent {W Q : Type} (t : Theory W) (c : Context W Q) : Prop :=
  ∀ q, ¬ (Consequence t c q true ∧ Consequence t c q false)
                                                                                
```

#### `CoreReader.Logic.consequenceConsistency`

`CoreReader/Logic.lean:28–33`; theorem.

```lean
theorem consequenceConsistency {W Q : Type} (t : Theory W) (c : Context W Q)
    (inhabited : ∃ w, Admissible t c w) : Consistent t c := by
  intro q h
  obtain ⟨w, hw⟩ := inhabited
  exact (h.2 w hw) (h.1 w hw)
                                                                      
```

#### `CoreReader.Logic.emptyTheory`

`CoreReader/Logic.lean:34–34`; def.

```lean
def emptyTheory {W : Type} : Theory W := fun _ => False
```

#### `CoreReader.Logic.singleton`

`CoreReader/Logic.lean:35–35`; def.

```lean
def singleton {W : Type} (p : Claim W) : Theory W := fun q => q = p
```

#### `CoreReader.Logic.union`

`CoreReader/Logic.lean:36–36`; def.

```lean
def union {W : Type} (a b : Theory W) : Theory W := fun p => a p ∨ b p
```

#### `CoreReader.Logic.modelsSingleton`

`CoreReader/Logic.lean:37–40`; theorem.

```lean
theorem modelsSingleton {W : Type} (p : Claim W) (w : W) : Models (singleton p) w ↔ p w := by
  constructor
  · intro h; exact h p rfl
  · intro h q hq; cases hq; exact h
```

#### `CoreReader.Logic.modelsUnion`

`CoreReader/Logic.lean:41–46`; theorem.

```lean
theorem modelsUnion {W : Type} (a b : Theory W) (w : W) :
    Models (union a b) w ↔ Models a w ∧ Models b w := by
  constructor
  · intro h; exact ⟨fun p hp => h p (Or.inl hp), fun p hp => h p (Or.inr hp)⟩
  · rintro ⟨ha,hb⟩ p (hp|hp); exact ha p hp; exact hb p hp
                                                                          
```

#### `CoreReader.Logic.premiseP`

`CoreReader/Logic.lean:47–47`; def.

```lean
def premiseP : Claim (Bool × Bool) := fun w => w.1 = true
```

#### `CoreReader.Logic.premiseRule`

`CoreReader/Logic.lean:48–48`; def.

```lean
def premiseRule : Claim (Bool × Bool) := fun w => w.1 = true → w.2 = true
```

#### `CoreReader.Logic.premiseNotQ`

`CoreReader/Logic.lean:49–49`; def.

```lean
def premiseNotQ : Claim (Bool × Bool) := fun w => w.2 ≠ true
```

#### `CoreReader.Logic.jointTheory`

`CoreReader/Logic.lean:50–52`; def.

```lean
def jointTheory : Theory (Bool × Bool) :=
  union (singleton premiseP) (union (singleton premiseRule) (singleton premiseNotQ))
                                                                                          
```

#### `CoreReader.Logic.jointConflict`

`CoreReader/Logic.lean:53–64`; theorem.

```lean
theorem jointConflict :
    Satisfiable (singleton premiseP) ∧ Satisfiable (singleton premiseRule) ∧
    Satisfiable (singleton premiseNotQ) ∧ ¬ Satisfiable jointTheory := by
  refine ⟨⟨(true,true), (modelsSingleton _ _).2 rfl⟩,
    ⟨(false,false), (modelsSingleton _ _).2 (by intro h; cases h)⟩,
    ⟨(false,false), (modelsSingleton _ _).2 (by intro h; cases h)⟩, ?_⟩
  rintro ⟨w, hw⟩
  have hp := hw premiseP (Or.inl rfl)
  have hr := hw premiseRule (Or.inr (Or.inl rfl))
  have hn := hw premiseNotQ (Or.inr (Or.inr rfl))
  exact hn (hr hp)
                                                                                           
```

#### `CoreReader.Logic.revisionSlice`

`CoreReader/Logic.lean:65–67`; def.

```lean
def revisionSlice (time : Nat) : Theory Bool :=
  singleton (fun w => w = (time == 0))
                                                                                       
```

#### `CoreReader.Logic.revisionCanReverse`

`CoreReader/Logic.lean:68–79`; theorem.

```lean
theorem revisionCanReverse :
    Satisfiable (revisionSlice 0) ∧ Satisfiable (revisionSlice 1) ∧
    ¬ Satisfiable (union (revisionSlice 0) (revisionSlice 1)) := by
  refine ⟨⟨true, (modelsSingleton _ _).2 rfl⟩,
    ⟨false, (modelsSingleton _ _).2 rfl⟩, ?_⟩
  rintro ⟨w, hw⟩
  have hs := (modelsUnion _ _ _).1 hw
  have hp := (modelsSingleton _ _).1 hs.1
  have hn := (modelsSingleton _ _).1 hs.2
  have bad : true = false := hp.symm.trans hn
  cases bad
                                                                    
```

#### `CoreReader.Logic.onQuestion`

`CoreReader/Logic.lean:80–80`; def.

```lean
def onQuestion : Unit → Claim Bool := fun _ w => w = true
```

#### `CoreReader.Logic.assumptionContext`

`CoreReader/Logic.lean:81–82`; def.

```lean
def assumptionContext (b : Bool) : Context Bool Unit :=
  ⟨singleton (fun w => w = b), onQuestion, fun _ => True⟩
```

#### `CoreReader.Logic.meaningContext`

`CoreReader/Logic.lean:83–84`; def.

```lean
def meaningContext (b : Bool) : Context Bool Unit :=
  ⟨singleton (fun w => w = true), (fun _ w => w = b), fun _ => True⟩
```

#### `CoreReader.Logic.scopeContext`

`CoreReader/Logic.lean:85–87`; def.

```lean
def scopeContext (b : Bool) : Context Bool Unit :=
  ⟨emptyTheory, onQuestion, fun w => w = b⟩
                                                                                                            
```

#### `CoreReader.Logic.contextDifferences`

`CoreReader/Logic.lean:88–109`; theorem.

```lean
theorem contextDifferences :
    (Consequence emptyTheory (assumptionContext true) () true ∧
      Consequence emptyTheory (assumptionContext false) () false) ∧
    (Consequence emptyTheory (meaningContext true) () true ∧
      Consequence emptyTheory (meaningContext false) () false) ∧
    (Consequence emptyTheory (scopeContext true) () true ∧
      Consequence emptyTheory (scopeContext false) () false) ∧
    (∀ b, ∃ w, Admissible emptyTheory (assumptionContext b) w) ∧
    (∀ b, ∃ w, Admissible emptyTheory (meaningContext b) w) ∧
    (∀ b, ∃ w, Admissible emptyTheory (scopeContext b) w) := by
  have empty : ∀ w : Bool, Models emptyTheory w := by intro w p hp; cases hp
  refine ⟨⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ?_, ?_, ?_⟩
  · intro w h; change w = true; exact (modelsSingleton (fun x : Bool => x = true) w).1 h.2.1
  · intro w h hp; have hn := (modelsSingleton _ _).1 h.2.1; cases hp.symm.trans hn
  · intro w h; change w = true; exact (modelsSingleton (fun x : Bool => x = true) w).1 h.2.1
  · intro w h hn; have hp := (modelsSingleton _ _).1 h.2.1; cases hp.symm.trans hn
  · intro w h; exact h.2.2
  · intro w h hp; cases hp.symm.trans h.2.2
  · intro b; exact ⟨b, empty b, (modelsSingleton _ _).2 rfl, trivial⟩
  · intro b; exact ⟨true, empty true, (modelsSingleton _ _).2 rfl, trivial⟩
  · intro b; exact ⟨b, empty b, empty b, rfl⟩
                                                                                               
```

#### `CoreReader.Logic.Snapshot`

`CoreReader/Logic.lean:110–114`; structure.

```lean
structure Snapshot (W Q : Type) where
  held : Theory W
  context : Context W Q
  revisionIdentity : Nat
                                                                               
```

#### `CoreReader.Logic.SameContent`

`CoreReader/Logic.lean:115–120`; def.

```lean
def SameContent {W Q : Type} (a b : Snapshot W Q) : Prop :=
  (∀ p, a.held p ↔ b.held p) ∧
  (∀ p, a.context.assumptions p ↔ b.context.assumptions p) ∧
  (∀ q w, a.context.meaning q w ↔ b.context.meaning q w) ∧
  (∀ w, a.context.scope w ↔ b.context.scope w)
                                                                                            
```

#### `CoreReader.Logic.TruthfulReport`

`CoreReader/Logic.lean:121–123`; def.

```lean
def TruthfulReport {W Q : Type} (a b : Snapshot W Q) (reported : Bool) : Prop :=
  (¬ SameContent a b ∨ a.revisionIdentity ≠ b.revisionIdentity) → reported = true
                                                                             
```

#### `CoreReader.Logic.semanticChangeMustBeReported`

`CoreReader/Logic.lean:124–127`; theorem.

```lean
theorem semanticChangeMustBeReported {W Q : Type} (a b : Snapshot W Q) (reported : Bool)
    (changed : ¬ SameContent a b ∨ a.revisionIdentity ≠ b.revisionIdentity)
    (h : TruthfulReport a b reported) : reported = true := h changed
                                                                              
```

#### `CoreReader.Logic.representationOrderIrrelevant`

`CoreReader/Logic.lean:128–130`; theorem.

```lean
theorem representationOrderIrrelevant {W : Type} (p q : Claim W) :
    ∀ r, union (singleton p) (singleton q) r ↔ union (singleton q) (singleton p) r := by
  intro r; exact or_comm
```

#### `CoreReader.Logic.contextSnapshot`

`CoreReader/Logic.lean:131–133`; def.

```lean
def contextSnapshot (c : Context Bool Unit) (revision : Nat := 0) : Snapshot Bool Unit :=
  ⟨emptyTheory, c, revision⟩
                                                                                                                          
```

#### `CoreReader.Logic.hiddenContextChangeRejected`

`CoreReader/Logic.lean:134–156`; theorem.

```lean
theorem hiddenContextChangeRejected :
    ¬ TruthfulReport (contextSnapshot (assumptionContext true)) (contextSnapshot (assumptionContext false)) false ∧
    ¬ TruthfulReport (contextSnapshot (meaningContext true)) (contextSnapshot (meaningContext false)) false ∧
    ¬ TruthfulReport (contextSnapshot (scopeContext true)) (contextSnapshot (scopeContext false)) false ∧
    ¬ TruthfulReport (contextSnapshot (scopeContext true) 0) (contextSnapshot (scopeContext true) 1) false ∧
    (TruthfulReport (contextSnapshot (assumptionContext true)) (contextSnapshot (assumptionContext false)) true ∧
      ¬ Models (assumptionContext false).assumptions true) := by
  have neq : (fun w : Bool => w = true) ≠ (fun w : Bool => w = false) := by
    intro h; have k := congrFun h true; have z : true = false := k.mp rfl; cases z
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · intro h
    have bad := h (Or.inl (by intro s; exact neq ((s.2.1 _).mp rfl)))
    cases bad
  · intro h
    have bad := h (Or.inl (by intro s; have z := (s.2.2.1 () true).mp rfl; cases z))
    cases bad
  · intro h
    have bad := h (Or.inl (by intro s; have z := (s.2.2.2 true).mp rfl; cases z))
    cases bad
  · intro h; have bad := h (Or.inr (by decide)); cases bad
  · refine ⟨fun _ => rfl, ?_⟩
    intro h; have z := (modelsSingleton _ _).1 h; cases z
                                                                           
```

#### `CoreReader.Logic.tensionWithoutContradiction`

`CoreReader/Logic.lean:157–162`; theorem.

```lean
theorem tensionWithoutContradiction :
    (∃ budget : Nat, 4 ≤ budget ∧ budget ≤ 6) ∧
    ¬ ((fun n : Nat => 4 ≤ n) = (fun n : Nat => n ≤ 6)) := by
  refine ⟨⟨5, by decide, by decide⟩, ?_⟩
  intro h; have k := congrFun h 0; have bad : 4 ≤ 0 := k.mpr (by decide); cases bad
                                                                                       
```

#### `CoreReader.Logic.conflictRequiresChange`

`CoreReader/Logic.lean:163–166`; theorem.

```lean
theorem conflictRequiresChange {W Q : Type} (t : Theory W) (c : Context W Q) (q : Q)
    (positive : Consequence t c q true) (negative : Consequence t c q false) :
    ¬ Consistent t c := fun h => h q ⟨positive,negative⟩
                                                                                   
```

#### `CoreReader.Logic.consistentFalse`

`CoreReader/Logic.lean:167–171`; theorem.

```lean
theorem consistentFalse : Satisfiable (singleton (fun w : Bool => w = true)) ∧
    ¬ Models (singleton (fun w : Bool => w = true)) false := by
  refine ⟨⟨true, (modelsSingleton _ _).2 rfl⟩, ?_⟩
  intro h; have bad := (modelsSingleton _ _).1 h; cases bad
                                                                                          
```

#### `CoreReader.Logic.consistentIncomplete`

`CoreReader/Logic.lean:172–179`; theorem.

```lean
theorem consistentIncomplete : Satisfiable (emptyTheory : Theory Bool) ∧
    ¬ Entails emptyTheory (fun w : Bool => w = true) ∧
    ¬ Entails emptyTheory (fun w : Bool => w ≠ true) := by
  have empty : ∀ w : Bool, Models emptyTheory w := by intro w p hp; cases hp
  refine ⟨⟨true, empty true⟩, ?_, ?_⟩
  · intro h; have bad := h false (empty false); cases bad
  · intro h; exact h true (empty true) rfl
                                                                               
```

#### `CoreReader.Logic.compatibilityNotEntailment`

`CoreReader/Logic.lean:180–187`; theorem.

```lean
theorem compatibilityNotEntailment :
    Satisfiable (union emptyTheory (singleton (fun w : Bool => w = true))) ∧
    ¬ Entails emptyTheory (fun w : Bool => w = true) := by
  refine ⟨⟨true, (modelsUnion _ _ _).2 ⟨?_, (modelsSingleton _ _).2 rfl⟩⟩,
    consistentIncomplete.2.1⟩
  intro p hp; cases hp

end CoreReader.Logic
```

### CoreReader/Reflexivity.lean

#### `CoreReader.Agency.Phase`

`CoreReader/Reflexivity.lean:5–7`; inductive.

```lean
inductive Phase | formation | application | revision
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.PrincipleKey`

`CoreReader/Reflexivity.lean:8–12`; structure.

```lean
structure PrincipleKey where
  owner : Nat
  localId : Nat
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.Subject`

`CoreReader/Reflexivity.lean:13–18`; inductive.

```lean
inductive Subject
  | system (owner : Nat)
  | principle (owner id : Nat)
  | process (owner id : Nat) (phase : Phase)
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.Subject.owner`

`CoreReader/Reflexivity.lean:19–23`; def.

```lean
def Subject.owner : Subject → Nat
  | .system n => n
  | .principle n _ => n
  | .process n _ _ => n

```

#### `CoreReader.Agency.Activity`

`CoreReader/Reflexivity.lean:24–26`; inductive.

```lean
inductive Activity | generation | assessment
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.QuestionKind`

`CoreReader/Reflexivity.lean:27–29`; inductive.

```lean
inductive QuestionKind | conformity | formationBasis | applicability | revisionGrounds
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.SampleProgram`

`CoreReader/Reflexivity.lean:30–32`; inductive.

```lean
inductive SampleProgram | alwaysTrue | onlyAtZero
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.SampleProgram.run`

`CoreReader/Reflexivity.lean:33–37`; def.

```lean
def SampleProgram.run : SampleProgram → Nat → Bool
  | .alwaysTrue, _ => true
  | .onlyAtZero, n => n == 0

                                                                                                    
```

#### `CoreReader.Agency.MethodDraft`

`CoreReader/Reflexivity.lean:38–42`; structure.

```lean
structure MethodDraft where
  testedInputs : List Nat
  claimedScope : List Nat
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.MethodDraft.accepts`

`CoreReader/Reflexivity.lean:43–46`; def.

```lean
def MethodDraft.accepts (draft : MethodDraft) (program : SampleProgram) : Bool :=
  draft.testedInputs.all program.run

                                                                                                             
```

#### `CoreReader.Agency.Inquiry`

`CoreReader/Reflexivity.lean:47–53`; structure.

```lean
structure Inquiry where
  target : Subject
  kind : QuestionKind
  requestedScope : List Nat
  currentMethod : MethodDraft
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.ReasonContent`

`CoreReader/Reflexivity.lean:54–60`; inductive.

```lean
inductive ReasonContent
  | purpose (inputs : List Nat)
  | declaredScope (inputs : List Nat)
  | observation (input : Nat) (output : Bool)
  | counterexample (program : SampleProgram) (input : Nat)
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.ReasonContent.identifier`

`CoreReader/Reflexivity.lean:61–67`; def.

```lean
def ReasonContent.identifier : ReasonContent → Nat
  | .purpose _ => 0
  | .declaredScope _ => 1
  | .observation _ _ => 2
  | .counterexample _ _ => 3

                                                                                                                
```

#### `CoreReader.Agency.ReasonObject`

`CoreReader/Reflexivity.lean:68–73`; structure.

```lean
structure ReasonObject where
  reference : Nat
  target : Subject
  content : ReasonContent
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.AssessmentResult`

`CoreReader/Reflexivity.lean:74–76`; inductive.

```lean
inductive AssessmentResult | supportedWithinScope | insufficient | notApplicable | undetermined
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.WorkOutcome`

`CoreReader/Reflexivity.lean:77–83`; inductive.

```lean
inductive WorkOutcome
  | assessment (result : AssessmentResult)
  | generated (draft : MethodDraft)
  deriving DecidableEq, Repr

                                                                                                        
                                                                                         
```

#### `CoreReader.Agency.Principle`

`CoreReader/Reflexivity.lean:84–93`; structure.

```lean
structure Principle where
  key : PrincipleKey
  activity : Activity
  declaredMethod : MethodDraft
  applicable : Subject → Prop
  inquiry : Subject → Inquiry
  reasons : Subject → List ReasonObject
  limits : Subject → List Nat
  meaning : Inquiry → List ReasonObject → List Nat → WorkOutcome → Prop

```

#### `CoreReader.Agency.WorkRecord`

`CoreReader/Reflexivity.lean:94–103`; structure.

```lean
structure WorkRecord where
  usedPrinciple : PrincipleKey
  target : Subject
  activity : Activity
  inquiry : Inquiry
  reasons : List ReasonObject
  limits : List Nat
  outcome : WorkOutcome
  deriving DecidableEq, Repr

```

#### `CoreReader.Agency.RegistryCoherent`

`CoreReader/Reflexivity.lean:104–106`; def.

```lean
def RegistryCoherent (rules : List Principle) : Prop :=
  ∀ p ∈ rules, ∀ q ∈ rules, p.key = q.key → p = q

```

#### `CoreReader.Agency.TargetResolved`

`CoreReader/Reflexivity.lean:107–112`; def.

```lean
def TargetResolved (rules : List Principle) : Subject → Prop
  | .system owner => ∃ p ∈ rules, p.key.owner = owner
  | .principle owner id | .process owner id _ => ∃ p ∈ rules, p.key = ⟨owner,id⟩

                                                                                                  
                                                                                                           
```

#### `CoreReader.Agency.TargetContentResolved`

`CoreReader/Reflexivity.lean:113–118`; def.

```lean
def TargetContentResolved (rules : List Principle) (question : Inquiry) : Prop :=
  match question.target with
  | .system owner => ∃ p ∈ rules, p.key = ⟨owner,0⟩ ∧ question.currentMethod = p.declaredMethod
  | .principle owner id | .process owner id _ =>
      ∃ p ∈ rules, p.key = ⟨owner,id⟩ ∧ question.currentMethod = p.declaredMethod

```

#### `CoreReader.Agency.Performed`

`CoreReader/Reflexivity.lean:119–122`; def.

```lean
def Performed (records : List WorkRecord) (s : Subject) (a : Activity) : Prop :=
  ∃ record ∈ records, record.target = s ∧ record.activity = a

                                                                                                 
```

#### `CoreReader.Agency.ReflexiveScope`

`CoreReader/Reflexivity.lean:123–127`; def.

```lean
def ReflexiveScope (owner : Nat) (rules : List Principle) (records : List WorkRecord) : Prop :=
  ∀ rule ∈ rules, ∀ s, s.owner = owner → rule.applicable s → Performed records s rule.activity

                                                                                                    
                                                                                                            
```

#### `CoreReader.Agency.ValidApplication`

`CoreReader/Reflexivity.lean:128–145`; structure.

```lean
structure ValidApplication (rules : List Principle) (rule : Principle) (s : Subject)
    (record : WorkRecord) : Prop where
  registered : rule ∈ rules
  applicable : rule.applicable s
  usedIdentity : record.usedPrinciple = rule.key
  targetIdentity : record.target = s
  targetResolved : TargetResolved rules s
  activityIdentity : record.activity = rule.activity
  inquiryIdentity : record.inquiry = rule.inquiry s
  inquiryTarget : record.inquiry.target = s
  targetContent : TargetContentResolved rules record.inquiry
  reasonsIdentity : record.reasons = rule.reasons s
  reasonsNonempty : record.reasons ≠ []
  reasonTargets : ∀ reason ∈ record.reasons, reason.target = s
  limitsIdentity : record.limits = rule.limits s
  followsMeaning : rule.meaning record.inquiry record.reasons record.limits record.outcome

                                                                                                   
```

#### `CoreReader.Agency.Reflexive`

`CoreReader/Reflexivity.lean:146–150`; def.

```lean
def Reflexive (owner : Nat) (rules : List Principle) (records : List WorkRecord) : Prop :=
  RegistryCoherent rules ∧
  ∀ rule ∈ rules, ∀ s, s.owner = owner → rule.applicable s →
    ∃ record ∈ records, ValidApplication rules rule s record

```

#### `CoreReader.Agency.Reflexive.toScope`

`CoreReader/Reflexivity.lean:151–156`; theorem.

```lean
theorem Reflexive.toScope {owner : Nat} {rules : List Principle} {records : List WorkRecord}
    (h : Reflexive owner rules records) : ReflexiveScope owner rules records := by
  intro rule hr s hs ha
  obtain ⟨record, hm, hv⟩ := h.2 rule hr s hs ha
  exact ⟨record, hm, hv.targetIdentity, hv.activityIdentity⟩

```

#### `CoreReader.Agency.noSelfExemption`

`CoreReader/Reflexivity.lean:157–161`; theorem.

```lean
theorem noSelfExemption (owner : Nat) (rules : List Principle) (records : List WorkRecord)
    (h : Reflexive owner rules records) (rule : Principle) (hr : rule ∈ rules)
    (s : Subject) (hs : s.owner = owner) (ha : rule.applicable s) :
    Performed records s rule.activity := h.toScope rule hr s hs ha

```

#### `CoreReader.Agency.localMethod`

`CoreReader/Reflexivity.lean:162–163`; def.

```lean
def localMethod : MethodDraft := ⟨[0],[0]⟩

```

#### `CoreReader.Agency.inquiryFor`

`CoreReader/Reflexivity.lean:164–171`; def.

```lean
def inquiryFor (s : Subject) : Inquiry :=
  match s with
  | .process _ _ .formation => ⟨s, .formationBasis, [0], localMethod⟩
  | .process _ _ .application => ⟨s, .applicability, [0], localMethod⟩
  | .process _ _ .revision => ⟨s, .revisionGrounds, [0,1], localMethod⟩
  | _ => ⟨s, .conformity, [0], localMethod⟩

                                                                                             
```

#### `CoreReader.Agency.sourceReasonContents`

`CoreReader/Reflexivity.lean:172–177`; def.

```lean
def sourceReasonContents : QuestionKind → List ReasonContent
  | .formationBasis => [.purpose [0], .declaredScope [0], .observation 0 true]
  | .applicability | .conformity => [.declaredScope [0], .observation 0 true]
  | .revisionGrounds => [.purpose [0,1], .declaredScope [0], .observation 0 true,
      .counterexample .onlyAtZero 1]

```

#### `CoreReader.Agency.reasonsFor`

`CoreReader/Reflexivity.lean:178–182`; def.

```lean
def reasonsFor (s : Subject) : List ReasonObject :=
  (sourceReasonContents (inquiryFor s).kind).map fun content => ⟨content.identifier,s,content⟩

                                                                                               
                                                                                             
```

#### `CoreReader.Agency.assessInquiry`

`CoreReader/Reflexivity.lean:183–207`; def.

```lean
def assessInquiry (question : Inquiry) (reasons : List ReasonObject) (limits : List Nat) : AssessmentResult :=
  let contents := reasons.map ReasonObject.content
  if limits ≠ question.currentMethod.claimedScope then .undetermined else
  match question.kind with
  | .formationBasis =>
      if ReasonContent.purpose question.requestedScope ∈ contents ∧
          ReasonContent.declaredScope limits ∈ contents ∧ question.requestedScope = limits
      then .supportedWithinScope else .undetermined
  | .applicability | .conformity =>
      if question.requestedScope.all (fun n => limits.contains n) then
        if ReasonContent.declaredScope limits ∈ contents ∧
            ReasonContent.observation 0 true ∈ contents ∧ question.requestedScope = [0]
        then .supportedWithinScope else .undetermined
      else .notApplicable
  | .revisionGrounds =>
      if ReasonContent.purpose question.requestedScope ∈ contents ∧
          ReasonContent.declaredScope limits ∈ contents ∧
          ReasonContent.observation 0 true ∈ contents ∧
          contents.any (fun reason => match reason with
            | .counterexample program input => question.requestedScope.contains input &&
                question.currentMethod.accepts program &&
                !(program.run input)
            | _ => false)
      then .insufficient else .undetermined

```

#### `CoreReader.Agency.finiteMethodResult`

`CoreReader/Reflexivity.lean:208–213`; def.

```lean
def finiteMethodResult (activity : Activity) (question : Inquiry)
    (reasons : List ReasonObject) (limits : List Nat) : WorkOutcome :=
  match activity with
  | .generation => .generated ⟨question.currentMethod.testedInputs,question.requestedScope⟩
  | .assessment => .assessment (assessInquiry question reasons limits)

```

#### `CoreReader.Agency.finiteMethodMeaning`

`CoreReader/Reflexivity.lean:214–217`; def.

```lean
def finiteMethodMeaning (activity : Activity) (question : Inquiry)
    (reasons : List ReasonObject) (limits : List Nat) (outcome : WorkOutcome) : Prop :=
  outcome = finiteMethodResult activity question reasons limits

```

#### `CoreReader.Agency.ownSubjects`

`CoreReader/Reflexivity.lean:218–223`; def.

```lean
def ownSubjects (owner : Nat) : List Subject :=
  [.system owner, .principle owner 0, .principle owner 1,
   .process owner 0 .formation, .process owner 0 .application, .process owner 0 .revision,
   .process owner 1 .formation, .process owner 1 .application, .process owner 1 .revision]

                                                                              
```

#### `CoreReader.Agency.generationEligible`

`CoreReader/Reflexivity.lean:224–227`; def.

```lean
def generationEligible : Subject → Bool
  | .process _ _ .application => false
  | _ => true

```

#### `CoreReader.Agency.generatingRule`

`CoreReader/Reflexivity.lean:228–237`; def.

```lean
def generatingRule (owner : Nat) : Principle where
  key := ⟨owner,0⟩
  activity := .generation
  declaredMethod := localMethod
  applicable s := s ∈ ownSubjects owner ∧ generationEligible s = true
  inquiry := inquiryFor
  reasons := reasonsFor
  limits _ := [0]
  meaning := finiteMethodMeaning .generation

```

#### `CoreReader.Agency.assessingRule`

`CoreReader/Reflexivity.lean:238–247`; def.

```lean
def assessingRule (owner : Nat) : Principle where
  key := ⟨owner,1⟩
  activity := .assessment
  declaredMethod := localMethod
  applicable s := s ∈ ownSubjects owner
  inquiry := inquiryFor
  reasons := reasonsFor
  limits _ := [0]
  meaning := finiteMethodMeaning .assessment

```

#### `CoreReader.Agency.ownRules`

`CoreReader/Reflexivity.lean:248–250`; def.

```lean
def ownRules (owner : Nat) : List Principle := [generatingRule owner, assessingRule owner]

                                                                                                
```

#### `CoreReader.Agency.statedOutcome`

`CoreReader/Reflexivity.lean:251–257`; def.

```lean
def statedOutcome (activity : Activity) (s : Subject) : WorkOutcome :=
  match activity with
  | .generation => .generated ⟨(inquiryFor s).currentMethod.testedInputs,(inquiryFor s).requestedScope⟩
  | .assessment => .assessment (match (inquiryFor s).kind with
      | .revisionGrounds => .insufficient
      | _ => .supportedWithinScope)

```

#### `CoreReader.Agency.recordFor`

`CoreReader/Reflexivity.lean:258–260`; def.

```lean
def recordFor (rule : Principle) (s : Subject) : WorkRecord :=
  ⟨rule.key,s,rule.activity,rule.inquiry s,rule.reasons s,rule.limits s,statedOutcome rule.activity s⟩

```

#### `CoreReader.Agency.reasonsFor_nonempty`

`CoreReader/Reflexivity.lean:261–266`; theorem.

```lean
theorem reasonsFor_nonempty (s : Subject) : reasonsFor s ≠ [] := by
  cases s with
  | system owner => simp [reasonsFor, inquiryFor, sourceReasonContents]
  | principle owner id => simp [reasonsFor, inquiryFor, sourceReasonContents]
  | process owner id phase => cases phase <;> simp [reasonsFor, inquiryFor, sourceReasonContents]

```

#### `CoreReader.Agency.reasonsFor_target`

`CoreReader/Reflexivity.lean:267–271`; theorem.

```lean
theorem reasonsFor_target (s : Subject) : ∀ reason ∈ reasonsFor s, reason.target = s := by
  intro reason h
  obtain ⟨content, _, rfl⟩ := List.mem_map.mp h
  rfl

```

#### `CoreReader.Agency.inquiryFor_target`

`CoreReader/Reflexivity.lean:272–278`; theorem.

```lean
theorem inquiryFor_target (s : Subject) : (inquiryFor s).target = s := by
  cases s with
  | system owner => rfl
  | principle owner id => rfl
  | process owner id phase => cases phase <;> rfl

                                                                                                
```

#### `CoreReader.Agency.ownContentEvaluates`

`CoreReader/Reflexivity.lean:279–288`; theorem.

```lean
theorem ownContentEvaluates (activity : Activity) (s : Subject) :
    statedOutcome activity s = finiteMethodResult activity (inquiryFor s) (reasonsFor s) [0] := by
  cases activity with
  | generation => rfl
  | assessment =>
      cases s with
      | system owner => rfl
      | principle owner id => rfl
      | process owner id phase => cases phase <;> rfl

```

#### `CoreReader.Agency.ownRegistryCoherent`

`CoreReader/Reflexivity.lean:289–297`; theorem.

```lean
theorem ownRegistryCoherent (owner : Nat) : RegistryCoherent (ownRules owner) := by
  intro p hp q hq hkey
  simp only [ownRules, List.mem_cons, List.not_mem_nil, or_false] at hp hq
  rcases hp with rfl | rfl <;> rcases hq with rfl | rfl
  · rfl
  · have bad := congrArg PrincipleKey.localId hkey; contradiction
  · have bad := congrArg PrincipleKey.localId hkey; contradiction
  · rfl

```

#### `CoreReader.Agency.ownTargetResolved`

`CoreReader/Reflexivity.lean:298–303`; theorem.

```lean
theorem ownTargetResolved (owner : Nat) (s : Subject) (hs : s ∈ ownSubjects owner) :
    TargetResolved (ownRules owner) s := by
  simp only [ownSubjects, List.mem_cons, List.not_mem_nil, or_false] at hs
  rcases hs with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp [TargetResolved, ownRules, generatingRule, assessingRule]

```

#### `CoreReader.Agency.ownTargetContent`

`CoreReader/Reflexivity.lean:304–309`; theorem.

```lean
theorem ownTargetContent (owner : Nat) (s : Subject) (hs : s ∈ ownSubjects owner) :
    TargetContentResolved (ownRules owner) (inquiryFor s) := by
  simp only [ownSubjects, List.mem_cons, List.not_mem_nil, or_false] at hs
  rcases hs with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp [TargetContentResolved, inquiryFor, ownRules, generatingRule, assessingRule]

```

#### `CoreReader.Agency.ownRecordValid`

`CoreReader/Reflexivity.lean:310–342`; theorem.

```lean
theorem ownRecordValid (owner : Nat) (rule : Principle) (hr : rule ∈ ownRules owner)
    (s : Subject) (ha : rule.applicable s) :
    ValidApplication (ownRules owner) rule s (recordFor rule s) := by
  have hs : s ∈ ownSubjects owner := by
    simp only [ownRules, List.mem_cons, List.not_mem_nil, or_false] at hr
    rcases hr with rfl | rfl
    · exact ha.1
    · exact ha
  have hq : rule.inquiry = inquiryFor := by
    simp only [ownRules, List.mem_cons, List.not_mem_nil, or_false] at hr
    rcases hr with rfl | rfl <;> rfl
  have hg : rule.reasons = reasonsFor := by
    simp only [ownRules, List.mem_cons, List.not_mem_nil, or_false] at hr
    rcases hr with rfl | rfl <;> rfl
  have hl : rule.limits s = [0] := by
    simp only [ownRules, List.mem_cons, List.not_mem_nil, or_false] at hr
    rcases hr with rfl | rfl <;> rfl
  have hm : rule.meaning = finiteMethodMeaning rule.activity := by
    simp only [ownRules, List.mem_cons, List.not_mem_nil, or_false] at hr
    rcases hr with rfl | rfl <;> rfl
  refine ⟨hr, ha, rfl, rfl, ownTargetResolved owner s hs, rfl, rfl, ?_, ?_, rfl, ?_, ?_, rfl, ?_⟩
  · change (rule.inquiry s).target = s
    rw [hq]; exact inquiryFor_target s
  · change TargetContentResolved (ownRules owner) (rule.inquiry s)
    rw [hq]; exact ownTargetContent owner s hs
  · change rule.reasons s ≠ []
    rw [hg]; exact reasonsFor_nonempty s
  · change ∀ reason ∈ rule.reasons s, reason.target = s
    rw [hg]; exact reasonsFor_target s
  · change rule.meaning (rule.inquiry s) (rule.reasons s) (rule.limits s) (statedOutcome rule.activity s)
    rw [hm, hq, hg, hl]
    exact ownContentEvaluates rule.activity s

```

#### `CoreReader.Agency.completeOwnWork`

`CoreReader/Reflexivity.lean:343–347`; def.

```lean
def completeOwnWork (owner : Nat) : List WorkRecord :=
  (ownSubjects owner).flatMap fun s =>
    if generationEligible s then [recordFor (generatingRule owner) s, recordFor (assessingRule owner) s]
    else [recordFor (assessingRule owner) s]

```

#### `CoreReader.Agency.assessingRecord_member`

`CoreReader/Reflexivity.lean:348–353`; theorem.

```lean
theorem assessingRecord_member (owner : Nat) (s : Subject) (hs : s ∈ ownSubjects owner) :
    recordFor (assessingRule owner) s ∈ completeOwnWork owner := by
  apply List.mem_flatMap.mpr
  refine ⟨s,hs,?_⟩
  cases generationEligible s <;> simp

```

#### `CoreReader.Agency.generatingRecord_member`

`CoreReader/Reflexivity.lean:354–357`; theorem.

```lean
theorem generatingRecord_member (owner : Nat) (s : Subject) (hs : s ∈ ownSubjects owner)
    (hg : generationEligible s = true) : recordFor (generatingRule owner) s ∈ completeOwnWork owner := by
  exact List.mem_flatMap.mpr ⟨s,hs,by simp [hg]⟩

```

#### `CoreReader.Agency.completeOwnWork_reflexive`

`CoreReader/Reflexivity.lean:358–367`; theorem.

```lean
theorem completeOwnWork_reflexive (owner : Nat) :
    Reflexive owner (ownRules owner) (completeOwnWork owner) := by
  refine ⟨ownRegistryCoherent owner, ?_⟩
  intro rule hr s _ ha
  refine ⟨recordFor rule s, ?_, ownRecordValid owner rule hr s ha⟩
  simp only [ownRules, List.mem_cons, List.not_mem_nil, or_false] at hr
  rcases hr with rfl | rfl
  · exact generatingRecord_member owner s ha.1 ha.2
  · exact assessingRecord_member owner s ha

```

#### `CoreReader.Agency.ownAssessmentPerformed`

`CoreReader/Reflexivity.lean:368–371`; theorem.

```lean
theorem ownAssessmentPerformed (owner : Nat) (s : Subject) (hs : s ∈ ownSubjects owner) :
    Performed (completeOwnWork owner) s .assessment :=
  ⟨recordFor (assessingRule owner) s, assessingRecord_member owner s hs, rfl, rfl⟩

```

#### `CoreReader.Agency.applicationRule`

`CoreReader/Reflexivity.lean:372–374`; def.

```lean
def applicationRule : Principle :=
  { assessingRule 0 with key := ⟨0,0⟩, applicable := fun s => s = .process 0 0 .application }

```

#### `CoreReader.Agency.applicationWork`

`CoreReader/Reflexivity.lean:375–376`; def.

```lean
def applicationWork : List WorkRecord := [recordFor applicationRule (.process 0 0 .application)]

```

#### `CoreReader.Agency.applicationWork_reflexive`

`CoreReader/Reflexivity.lean:377–395`; theorem.

```lean
theorem applicationWork_reflexive : Reflexive 0 [applicationRule] applicationWork := by
  constructor
  · intro p hp q hq _
    simp only [List.mem_singleton] at hp hq
    rw [hp,hq]
  · intro rule hr s _ ha
    simp only [List.mem_singleton] at hr
    subst rule
    change s = .process 0 0 .application at ha
    subst s
    refine ⟨recordFor applicationRule (.process 0 0 .application), by simp [applicationWork], ?_⟩
    refine ⟨by simp, rfl, rfl, rfl, ?_, rfl, rfl, rfl, ?_, rfl, ?_, ?_, rfl, ?_⟩
    · exact ⟨applicationRule, by simp, rfl⟩
    · exact ⟨applicationRule, by simp, rfl, rfl⟩
    · exact reasonsFor_nonempty _
    · exact reasonsFor_target _
    · change statedOutcome .assessment (.process 0 0 .application) = finiteMethodResult .assessment (inquiryFor (.process 0 0 .application)) (reasonsFor (.process 0 0 .application)) [0]
      exact ownContentEvaluates .assessment _

```

#### `CoreReader.Agency.applicabilityRetained`

`CoreReader/Reflexivity.lean:396–416`; theorem.

```lean
theorem applicabilityRetained (owner : Nat) (rules : List Principle) (records : List WorkRecord) :
    (Reflexive owner rules records → ReflexiveScope owner rules records) ∧
    (ReflexiveScope owner rules records ↔
      ∀ rule ∈ rules, ∀ s, s.owner = owner → (¬ rule.applicable s ∨ Performed records s rule.activity)) ∧
    (Reflexive 0 [applicationRule] applicationWork ∧
      ¬ Performed applicationWork (.system 0) .assessment) := by
  classical
  refine ⟨Reflexive.toScope, ?_, applicationWork_reflexive, ?_⟩
  · constructor
    · intro h rule hr s hs
      by_cases ha : rule.applicable s
      · exact Or.inr (h rule hr s hs ha)
      · exact Or.inl ha
    · intro h rule hr s hs ha
      exact (h rule hr s hs).resolve_left (not_not_intro ha)
  · rintro ⟨record, hm, ht, _⟩
    simp only [applicationWork, List.mem_singleton] at hm
    subst record
    cases ht

end CoreReader.Agency
```
