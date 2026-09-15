import CoreReader.Engineering.Values
import CoreReader.Engineering.Reflection

namespace CoreReader.Engineering

open CoreReader.Adopted

inductive ReviewObject | activity | commitment (principle : CoreCommitment) | priority | evolutionMethod
  | generationRule | assessmentRule
  deriving DecidableEq, Repr

abbrev ReviewCase := Candidate × Nat

def generationApplies (_ : ReviewObject) (phase : CoreReader.Agency.Phase) : Prop :=
  phase ≠ .application

def assessmentApplies (_ : ReviewObject) (_ : CoreReader.Agency.Phase) : Prop := True

def ruleObject : CoreReader.Agency.Activity → ReviewObject
  | .generation => .generationRule
  | .assessment => .assessmentRule

/- These inputs test the current reflection functions themselves. Size 10 has
an actual supporting sample; size 5 removes that sample while retaining the
requested claim. The domain batch predictor is not used in this method test. -/
def ruleProbe (activity : CoreReader.Agency.Activity) (point : ReviewCase) :
    Reflection.Input ReviewCase ReviewObject where
  target := ⟨0, ruleObject activity, .revision⟩
  contract := ⟨fun _ => true, if point.2 = 10 then [point] else [], [point]⟩
  requested := [point]
  reasons := ["retain the proposed scope and distinguish actual samples from an empty test set"]
  basis := True

def generationRuleTest
    (method : Reflection.Input ReviewCase ReviewObject → Reflection.Outcome ReviewCase)
    (point : ReviewCase) : Bool :=
  let input := ruleProbe .generation point
  method input == .generated input.requested input.requested

def assessmentRuleTest
    (method : Reflection.Input ReviewCase ReviewObject → Reflection.Verdict)
    (point : ReviewCase) : Bool :=
  method (ruleProbe .assessment point) ==
    (if point.2 = 10 then .supportedWithinScope else .noSupportingSample)

/- A candidate revision supplies the previously missing empty-sample check.
It is kept distinct from the current evaluator and is not silently adopted. -/
def sampleAwareAssessment (input : Reflection.Input ReviewCase ReviewObject) : Reflection.Verdict :=
  if input.contract.tested.isEmpty then .noSupportingSample else Reflection.evaluate input

/- The method under criticism is the activity's own static batch forecast. Its
contract is checked at its original size and at the credible runtime change. -/
def objectTest (object : ReviewObject) (point : ReviewCase) : Bool :=
  match object with
  | .activity => decide (Meets currentContinuing.required (currentContinuing.profiles point.1))
  | .commitment principle => safeguardExperiment principle true point.1
  | .priority => decide (EvolutionPriority currentContinuing point.1)
  | .evolutionMethod => staticBatch 21 point.2 == liveBatch 21 point.2
  | .generationRule => generationRuleTest Reflection.generate point
  | .assessmentRule => assessmentRuleTest Reflection.evaluate point

def reviewObjects (chosen : Candidate) : List ReviewObject :=
  [.activity] ++ coreCommitments.map ReviewObject.commitment ++
    (if chosen = .evolvable then [.priority] else []) ++
    [.evolutionMethod, .generationRule, .assessmentRule]

def requestedCases (chosen : Candidate) : CoreReader.Agency.Phase → List ReviewCase
  | .formation | .application => [(chosen, 10)]
  | .revision => [(chosen, 10), (chosen, 5)]

def reviewReasons (object : ReviewObject) (phase : CoreReader.Agency.Phase) : List String :=
  let content := match object with
    | .activity => "actual order, safety, latency and retention requirements of this activity"
    | .commitment principle => criticismFor principle
    | .priority => "credible design revision, successor and agent paths, necessary requirements and concrete costs"
    | .evolutionMethod => "the same batch forecast at its recorded size and the proposed runtime size"
    | .generationRule => "the actual generator must retain its input's requested tests and scope"
    | .assessmentRule => "the actual evaluator's acceptance depends on whether its input has supporting samples"
  [content, match phase with
    | .formation => "identify this object's purpose and the conditions of its initial contract"
    | .application => "apply that contract to the currently selected design in this continuing activity"
    | .revision => "examine the proposed wider input scope and retain any counterexample"]

/- The recorded verdict is independent of the evaluator: the revision of the
batch method is explicitly reported as a counterexample; other current checks
are reported supported only in the scope that will be checked below. -/
def statedReview (chosen : Candidate) (activity : CoreReader.Agency.Activity)
    (object : ReviewObject) (phase : CoreReader.Agency.Phase) : Reflection.Outcome ReviewCase :=
  match activity with
  | .generation => .generated (requestedCases chosen phase) (requestedCases chosen phase)
  | .assessment => .assessed (match object, phase with
    | .evolutionMethod, .revision | .assessmentRule, .revision => .counterexample
    | _, _ => .supportedWithinScope)

/- The basis is not a free approval flag. Each inquiry requires the facts
relevant to its own object; a counterexample can ground criticism rather than
the truth of the original method's broader claim. -/
def reviewBasis (chosen : Candidate) : ReviewObject → CoreReader.Agency.Phase → Prop
  | .activity, _ => ActivityScope currentContinuing.activity ∧
      Meets currentContinuing.required (currentContinuing.profiles chosen)
  | .commitment principle, _ => ReasonRelevant principle (reasonFor principle) chosen
  | .priority, _ => PriorityConditions currentContinuing ∧ ¬ HasThreat currentContinuing .evolvable
  | .evolutionMethod, .revision =>
      staticBatch 21 10 = liveBatch 21 10 ∧ staticBatch 21 5 ≠ liveBatch 21 5
  | .evolutionMethod, _ => staticBatch 21 10 = liveBatch 21 10
  | .generationRule, _ =>
      generationRuleTest Reflection.generate (chosen, 10) = true ∧
      generationRuleTest (fun _ => .generated [] []) (chosen, 10) = false
  | .assessmentRule, .revision =>
      assessmentRuleTest Reflection.evaluate (chosen, 10) = true ∧
      assessmentRuleTest Reflection.evaluate (chosen, 5) = false
  | .assessmentRule, _ => assessmentRuleTest Reflection.evaluate (chosen, 10) = true

def selfModel (chosen : Candidate) : Reflection.Model ReviewCase ReviewObject where
  owner := 0
  objects := reviewObjects chosen
  contracts object := ⟨objectTest object, [(chosen, 10)], [(chosen, 10)]⟩
  requested _ := requestedCases chosen
  reasons := reviewReasons
  basis := reviewBasis chosen
  generationApplies := generationApplies
  assessmentApplies := assessmentApplies
  recorded := statedReview chosen

/- The named normative object and its finite rationale test are deliberately
distinct: a supported rationale experiment is not proof of universal correctness.
The same commitment identifier controls adoption, reasons and reflection. -/
theorem reviewIdentity (chosen : Candidate) (object : ReviewObject)
    (phase : CoreReader.Agency.Phase) :
    ((selfModel chosen).input ⟨0, object, phase⟩).target.object = object ∧
    ((selfModel chosen).input ⟨0, object, phase⟩).contract.test = objectTest object ∧
    ((selfModel chosen).input ⟨0, object, phase⟩).requested = requestedCases chosen phase ∧
    ((selfModel chosen).input ⟨0, object, phase⟩).reasons = reviewReasons object phase ∧
    ((selfModel chosen).input ⟨0, object, phase⟩).basis = reviewBasis chosen object phase :=
  ⟨rfl, rfl, rfl, rfl, rfl⟩

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
      generationApplies, assessmentApplies, generationRuleTest, assessmentRuleTest,
      ruleProbe, Reflection.generate,
      reviewBasis, ReasonRelevant, reasonFor, HasThreat, burdens, ConcreteThreat, cost,
      EvolutionPriority, PriorityConditions, JustifiedDeparture, currentContinuing,
      Continuing, ActivityScope, Meets, profile, normalRequirements, initialGrounds,
      ContinuingCapability, continuingActivity, maintainers, changePath,
      changeWork, abstractionComplexity, credible, CredibleDirection, articulateGround,
      supportGround, normalLimits, staticBatch, liveBatch, batchCount, orderedUnique,
      sortedUnique, sortValues, insertOrdered, List.eraseDups]
    all_goals decide

theorem currentSelfApplication (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) :
    reflexivitySpecification (selfModel chosen).rules (selfModel chosen).self
      (selfModel chosen).performed :=
  Reflection.recordedReflexivity _ (currentSelfRecords chosen ordinary)

/- The activity's own assessment method passes its old observation while the
expanded input exposes its actual failed forecast. Neither applying the method
to itself nor generating a broader candidate makes the failed forecast true. -/
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

/- The objects use the very functions in the adopted rules, and the same
applicability functions. Assessment applies in all three phases; generation
applies to formation and revision, including formation/revision of these rules. -/
theorem ownRuleIdentity (chosen : Candidate) (activity : CoreReader.Agency.Activity)
    (phase : CoreReader.Agency.Phase) :
    ruleObject activity ∈ (selfModel chosen).objects ∧
    ((selfModel chosen).rule activity).meaning = Reflection.interpret activity ∧
    ((selfModel chosen).input ⟨0, ruleObject activity, phase⟩).contract.test =
      objectTest (ruleObject activity) ∧
    (selfModel chosen).generationApplies (ruleObject activity) phase =
      generationApplies (ruleObject activity) phase ∧
    (selfModel chosen).assessmentApplies (ruleObject activity) phase =
      assessmentApplies (ruleObject activity) phase := by
  refine ⟨?_, rfl, rfl, rfl, rfl⟩
  cases activity <;> simp [ruleObject, selfModel, reviewObjects]

/- Changing the actual generator changes its object's result despite keeping
the object name. The evaluator really approves an empty initial sample set;
its own revision review reports that bounded defect instead of a self-proof. -/
theorem ownRuleContentVariation (chosen : Candidate) :
    generationRuleTest Reflection.generate (chosen, 10) = true ∧
    generationRuleTest (fun _ => .generated [] []) (chosen, 10) = false ∧
    assessmentRuleTest Reflection.evaluate (chosen, 10) = true ∧
    assessmentRuleTest Reflection.evaluate (chosen, 5) = false ∧
    Reflection.evaluate ((selfModel chosen).input ⟨0, .assessmentRule, .revision⟩) = .counterexample ∧
    generationApplies .generationRule .formation ∧
    generationApplies .generationRule .revision ∧
    ¬ generationApplies .generationRule .application ∧
    (∀ phase, assessmentApplies .assessmentRule phase) := by
  simp [generationRuleTest, assessmentRuleTest, ruleProbe, Reflection.generate,
    Reflection.evaluate, Reflection.Model.input, selfModel, requestedCases,
    objectTest, generationApplies, assessmentApplies]

theorem proposedRuleRevision (chosen : Candidate) :
    assessmentRuleTest Reflection.evaluate (chosen, 5) = false ∧
    assessmentRuleTest sampleAwareAssessment (chosen, 5) = true ∧
    assessmentRuleTest sampleAwareAssessment (chosen, 10) = true ∧
    ((selfModel chosen).rule .generation).applicable ⟨0, .generationRule, .revision⟩ ∧
    ¬ (({ selfModel chosen with generationApplies := fun _ _ => False }).rule .generation).applicable
      ⟨0, .generationRule, .revision⟩ := by
  simp [assessmentRuleTest, sampleAwareAssessment, ruleProbe, Reflection.evaluate,
    Reflection.Model.rule, Reflection.Model.self, selfModel, reviewObjects,
    generationApplies]

end CoreReader.Engineering
