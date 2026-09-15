import CoreReader.Adopted
import CoreReader.Engineering.Domain

namespace CoreReader.Engineering

open CoreReader.Logic CoreReader.Evidence CoreReader.Adopted

inductive CoreCommitment | generation | consistency | reflexivity | grounds | choice
  deriving DecidableEq, Repr

def coreCommitments : List CoreCommitment :=
  [.generation, .consistency, .reflexivity, .grounds, .choice]

/- Initial adoption is explicit. The following reasons neither infer adoption
from facts nor claim that every alternative value position is untenable. -/
def coreAdopted (_ : CoreCommitment) : Bool := true

inductive AdoptionReason
  | plannedChange (release : Nat) (direction : Change)
  | incompatibleOrders (input : List Nat)
  | ownMethodCounterexample (items size : Nat)
  | unsupportedScope (items observedSize extendedSize : Nat)
  | statusBudgetContrast (statusSelected : Candidate) (capacity : Nat)
  deriving DecidableEq, Repr

def reasonFor : CoreCommitment → AdoptionReason
  | .generation => .plannedChange 2 .designRevision
  | .consistency => .incompatibleOrders [2, 1, 2]
  | .reflexivity => .ownMethodCounterexample 21 5
  | .grounds => .unsupportedScope 21 10 5
  | .choice => .statusBudgetContrast .maximal 12

/- Each factual reason has contents specific to the principle's purpose. The
context is the very continuing activity and its current requirements/grounds.
Matching a constructor alone is insufficient: the represented facts must hold. -/
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

abbrev valueScope (selected : Candidate) : Prop := abstractionComplexity selected ≤ 3

/- A small operational experiment explains each adopted safeguard's purpose.
These consequences are limited to the stated experiment, not a total value score.
The disabled branch supplies a real contrast for this application policy. -/
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

def criticismFor : CoreCommitment → String
  | .generation => "Reconsider this reason if the committed change or continuing maintenance ends."
  | .consistency => "Reconsider the comparison if the parties deliberately revise the observable order contract."
  | .reflexivity => "This counterexample concerns the stated batch rule; it does not validate all self-assessment."
  | .grounds => "A new input condition requires its own support; success at size ten does not cover size five."
  | .choice => "If objectives or budgets change, compare the actual alternatives and reasons again."

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

theorem adoptionReasonRelevant (principle : CoreCommitment) (selected : Candidate)
    (scope : valueScope selected) : ReasonRelevant principle (reasonFor principle) selected := by
  cases principle
  · dsimp only [ReasonRelevant, reasonFor]; decide
  · dsimp only [ReasonRelevant, reasonFor]; decide
  · dsimp only [ReasonRelevant, reasonFor]; decide
  · dsimp only [ReasonRelevant, reasonFor]; decide
  · refine ⟨rfl, by decide, ?_⟩
    exact Nat.le_trans scope (by decide)

theorem safeguardEnabled (principle : CoreCommitment) (selected : Candidate)
    (scope : valueScope selected) : safeguardExperiment principle true selected = true := by
  cases principle
  · dsimp only [safeguardExperiment]; decide
  · dsimp only [safeguardExperiment]; decide
  · dsimp only [safeguardExperiment]; decide
  · dsimp only [safeguardExperiment]; decide
  · apply decide_eq_true
    exact Nat.le_trans scope (by change 3 ≤ 12; decide)

theorem safeguardDisabled (principle : CoreCommitment) (selected : Candidate) :
    safeguardExperiment principle false selected = false := by
  cases principle <;> simp only [safeguardExperiment, Bool.false_eq_true, ↓reduceIte] <;> decide

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

theorem governanceGrounded (principle : CoreCommitment) :
    valueSpecification (governancePosition principle) :=
  grounds012Singleton _ (governanceValueProcedure principle)

/- Factual relevance, rationale experiments and value adoption are separate.
Swapping a reason or altering the input makes the finite rationale fail. -/
theorem governanceRationaleLimits :
    ¬ ReasonRelevant .consistency (reasonFor .generation) .evolvable ∧
    ¬ ReasonRelevant .reflexivity (.ownMethodCounterexample 21 10) .evolvable ∧
    ¬ ReasonRelevant .generation (.plannedChange 9 .addition) .evolvable ∧
    ¬ valueScope .maximal ∧
    (∀ principle, safeguardExperiment principle false .evolvable = false) ∧
    (∀ principle, (governancePosition principle).commitment .presentSimple) := by
  refine ⟨by change ¬ False; decide, by decide, by decide, by change ¬ (30 ≤ 3); decide,
    fun principle => safeguardDisabled principle .evolvable, fun _ => rfl⟩

/- This additional value priority is a real selection between the same designs.
Both scopes retain all necessary domain conditions and no cost exception.
The present-simple stance values less abstraction now without claiming that it
has the better successor-maintainer capability. The other stance values that capability. -/
def selectionObjective (adopted : Candidate) (outcome : Nat × Nat) : Prop :=
  match adopted with
  | .presentSimple => outcome.1 ≤ 1
  | .evolvable => outcome.2 ≤ 6
  | .maximal => outcome.1 ≤ 1

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

theorem selectionGrounded (adopted : Candidate)
    (ordinary : adopted = .presentSimple ∨ adopted = .evolvable) :
    valueSpecification (selectionPosition adopted) :=
  grounds012Singleton _ (selectionValueProcedure adopted ordinary)

end CoreReader.Engineering
