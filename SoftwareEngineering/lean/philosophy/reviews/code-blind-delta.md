# Blind explanation of the code delta

Stage: **code-only delta; source fidelity unevaluated**. I compared the new supplied Lean snapshot with the initial code-only snapshot, discarding blank/whitespace-only lines for semantic-diff detection. I did not inspect source prose, mapping comments, author explanations, or external review verdicts. The initial manuscript and artifacts remain untouched. The previous initial manuscript SHA256 is `cf9280ddd3365440e848b14043a6208b9fea5114f9ff13cea4e236e3358317df`.

Only `CoreReader/Engineering/Domain.lean` has a nonblank code change: two new definitions and one expanded theorem statement/proof. Other Lean files have identical nonblank line sequences; their new raw hashes still reflect their supplied whitespace and positions. This delta does not alter `CoreReader.Adopted.*`, the engineering evidence/value/self-application interfaces, or the final inheritance/priority witnesses. The initial explanation therefore remains applicable to their unchanged nonblank code, with location changes documented in the new declaration inventory.

## Actual new definitions

`CoreReader.Engineering.relocateVerification : EngineeringDesign → EngineeringDesign` has one explicit input argument, no hidden generic binder, no domain-specific typeclass assumption, and no proof premise. Its result is a data record, not a proposition or theorem. `CoreReader.Engineering.sameWorkDesign : EngineeringDesign` is the instance obtained from `privateDesign`.

`EngineeringDesign` contains metadata, a total `List Nat → List Nat` run function, a `Change → List EditStep` path function, a list of component Nat IDs, a list of boundary records, and batch assumptions. Each edit step contains a component Nat ID, one required knowledge label, a tool label, and Nat work units. A boundary contains caller/callee Nat IDs and a contract string.

The new transformation starts with the result of `introduceBoundary design`. Thus it inherits that transformation's incremented module/extension-point metadata; run function `fun xs => design.run (xs ++ [])`; original component list with its length appended; original boundary list with the record `(caller = original component count, callee = 0, contract = original metadata signature)` appended; and unchanged batch assumptions.

It then **overwrites the path function**. It maps over each **original** `design.paths d`, changing an existing step's component ID to the original component count precisely when its tool is `.contractRunner`. Every other step is unchanged. A changed step retains its original required knowledge, tool and work units. This record update replaces the one-unit contract-runner step that `introduceBoundary` would have appended; it does not retain that extra step and then relocate verification. If an original path is empty, the mapped path remains empty. The transformation is defined for every `Change`, including every `.other String` value, not just the enumerated registered list.

This distinction explains the numeric result. `wrappedDesign` still uses `introduceBoundary privateDesign` directly and costs 18 for design revision. `sameWorkDesign` uses the new transformation and costs 17 because it changes component locations in the original five-step path while preserving the entire sequence of work-unit values. The new boundary is an actual record in the model, and the path function really changes; the unchanged work is not obtained merely by renaming the old object. Conversely, the code does not execute software calls through that boundary or charge a separate overhead for it: work is exactly the sum of step units.

The independent delta probe proves the stronger code-derived equalities

```lean
∀ (design : EngineeringDesign) (xs : List Nat),
  (relocateVerification design).run xs = design.run xs

∀ (design : EngineeringDesign) (d : Change),
  designWork (relocateVerification design) d = designWork design d
```

These are supplemental audit examples, not additions to the project's proof inputs. The first proof simplifies append-empty. The second expands `designWork`, composes the two list maps, and checks both cases of the tool test: the step's units are unchanged in either branch. The quantifiers range over all values of these Lean types; no empirical timing or boundary-effect hypothesis is needed because equality follows from the definitions.

## Expanded theorem

`CoreReader.Engineering.structureNotCapability` is a theorem with no parameters or extra hypotheses. Its fully elaborated declaration type is the entire concrete conjunction printed in `delta-actual-audit.log` and reproduced below. That conjunction is a proposition; the declaration is a proof of it. The original four conjunction blocks are retained:

1. Equal signature metadata can accompany different outputs (deduplication versus sorted deduplication on [2,1,2]).
2. The private design has eight components and eight batch assumptions that all need revision at batch size 5.
3. The same “dependency inversion” metadata can coexist with absent/present successor capability depending on the path's knowledge requirements.
4. The earlier appended-step boundary example grows the component count to nine and work from 17 to 18 without changing its sample output.

A fifth conjunction block now gives one different example. It establishes all of the following **for the same `sameWorkDesign` value**:

- Its boundary list is exactly `[⟨8, 0, "List Nat → List Nat"⟩]`.
- It has nine components.
- Its design-revision path differs from the private design's path.
- Both run functions agree on [2,1,2].
- Its design-revision work equals the private design's work and is exactly 17.
- The successor still fails `DesignCanChange` for design revision in the continuing activity.

The proof changes from a four-component tuple of `by decide` results to five components. Every newly stated property is decided from finite concrete data. The actual declaration/axiom audit reports no axioms for the two new definitions and `[propext]` for the expanded theorem; no `sorryAx` or new domain axiom is present.

## Exact path evaluation and retained capability constraint

The audit evaluates both original and new paths. Each has five steps:

| Step | Required knowledge | Tool | Units | Original component | New component |
| --- | --- | --- | --- | --- | --- |
| 1 | privateLayout | editor | 1 | 0 | 0 |
| 2 | publicContract | contractRunner | 1 | 0 | 8 |
| 3 | privateLayout | editor | 5 | 1 | 1 |
| 4 | privateLayout | compiler | 5 | 2 | 2 |
| 5 | publicContract | contractRunner | 5 | 2 | 8 |

`sameWorkDesign.components` evaluates to `[0,1,2,3,4,5,6,7,8]`, so component 8 really is listed in this concrete design. The new paths differ at their contract-runner steps; the sum remains `1 + 1 + 5 + 5 + 5 = 17`.

`DesignCanChange activity design maintainer direction` requires a nonempty path, membership of that maintainer in the activity, and that every step's knowledge and tool are available. It does **not** inspect the step's component number, the boundary list, or the run function. The continuing successor lacks `privateLayout`; the unchanged editor/compiler steps still require it, so capability remains false. The original maintainer has it and can change the new design; a supplemental concrete probe checks both results. This is an independently inspectable cause in the actual definition, rather than an arbitrary assignment of a negative capability label.

## What this delta establishes and does not establish

The delta supplies an additional concrete case where adding a modeled boundary and relocating existing verification steps leaves the model's revision work exactly unchanged and does not grant the successor the missing path prerequisites. Together with the retained 18-unit case, the file now contains both increased-work and equal-work boundary examples. These examples disprove a universal inference from the represented structural change alone to strictly lower `designWork` or newly available `DesignCanChange`, within the definitions used here.

The code does not show that every real boundary relocation leaves effort unchanged, that the cost model measures real total engineering effort, that relocated test execution is valid in a concrete software system, or that boundaries cannot help. The new transformation does not add an operational semantics connecting boundary caller/callee fields to path execution, verify a caller/callee contract, or establish component-ID uniqueness for every arbitrary input design. For the concrete private design the appended ID is fresh and the boundary endpoints are listed, but the generic transformation simply uses list length and callee 0 with no preconditions. Those generic record-design limitations are unchanged from its existing `introduceBoundary` dependency.

No empirical/inferential/value support predicate, assessment-task identity, value objective, applicability rule, own-fact theory, `Inherited` field, or final witness changes in this delta. The new conjunction is additional finite evidence for the structure/capability example; it does not repair or alter the broader semantic limits documented in the initial blind manuscript. Source correspondence remains a separate, not-yet-performed comparison.

## Actual audit and preservation

`delta-code-hashes.json` binds each new input file and the previous initial-manuscript hash. `nonblank-code.diff` records the complete nonblank difference. `delta-declarations.json` gives all 788 declarations' current locations. `DeltaAudit.lean` checks all declarations with `#check @` and prints all their transitive axioms; `delta-actual-audit.log` records exit code 0. All 269 theorem declarations remain present. `delta-build.log` records a fresh full project build under the installed Lean 4.33.1. `DeltaProbes.lean` and `delta-probes.log` retain actual evaluations and the two universal transformation equalities, also with exit code 0. The first supplemental proof attempt needed one function-composition reduction; its failed log is retained and no project proof input was changed.

The original frozen artifacts were not overwritten. The delta manuscript and its own manifest are preserved before any source comparison material is disclosed.

## Exact current code excerpts and locations

### `CoreReader.Engineering.EngineeringDesign`

`CoreReader/Engineering/Domain.lean:686–693`

```lean
structure EngineeringDesign where
  metadata : InterfaceView
  run : List Nat → List Nat
  paths : Change → List EditStep
  components : List Nat
  boundaries : List Boundary
  batchAssumptions : List (Nat × Nat)

```

### `CoreReader.Engineering.DesignCanChange`

`CoreReader/Engineering/Domain.lean:703–708`

```lean
abbrev DesignCanChange (a : Activity) (design : EngineeringDesign)
    (m : Maintainer) (d : Change) : Prop :=
  design.paths d ≠ [] ∧ m ∈ a.participants ∧
  (design.paths d).all (fun step =>
    (a.available m).contains step.requires && a.tools.contains step.tool) = true

```

### `CoreReader.Engineering.designWork`

`CoreReader/Engineering/Domain.lean:709–711`

```lean
def designWork (design : EngineeringDesign) (d : Change) : Nat :=
  ((design.paths d).map EditStep.units).sum

```

### `CoreReader.Engineering.introduceBoundary`

`CoreReader/Engineering/Domain.lean:718–727`

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

### `CoreReader.Engineering.wrappedDesign`

`CoreReader/Engineering/Domain.lean:728–732`

```lean
def wrappedDesign : EngineeringDesign := introduceBoundary privateDesign

                                                                          
                                                                            
                                                                 
```

### `CoreReader.Engineering.relocateVerification`

`CoreReader/Engineering/Domain.lean:733–738`

```lean
def relocateVerification (design : EngineeringDesign) : EngineeringDesign := {
  introduceBoundary design with
  paths := fun d => (design.paths d).map (fun step =>
    if step.tool = .contractRunner then { step with component := design.components.length }
    else step) }

```

### `CoreReader.Engineering.sameWorkDesign`

`CoreReader/Engineering/Domain.lean:739–744`

```lean
def sameWorkDesign : EngineeringDesign := relocateVerification privateDesign

                                                             
                                                                                                                   
                                                                                                                   
  
```

### `CoreReader.Engineering.structureNotCapability`

`CoreReader/Engineering/Domain.lean:745–773`

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
      ¬ designWork wrappedDesign .designRevision < designWork privateDesign .designRevision) ∧
    (sameWorkDesign.boundaries = [⟨8, 0, "List Nat → List Nat"⟩] ∧
      sameWorkDesign.components.length = 9 ∧
      sameWorkDesign.paths .designRevision ≠ privateDesign.paths .designRevision ∧
      sameWorkDesign.run [2, 1, 2] = privateDesign.run [2, 1, 2] ∧
      designWork sameWorkDesign .designRevision = designWork privateDesign .designRevision ∧
      designWork sameWorkDesign .designRevision = 17 ∧
      ¬ DesignCanChange continuingActivity sameWorkDesign .successor .designRevision) := by
  exact ⟨by decide, by decide, by decide, by decide, by decide⟩

                                                           
                                                                                                                   
  
```
