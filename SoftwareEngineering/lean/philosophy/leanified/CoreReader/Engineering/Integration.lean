import CoreReader.Engineering.Domain
import CoreReader.Engineering.Reflection
import CoreReader.Engineering.SelfApplication

namespace CoreReader.Engineering

open CoreReader.Logic CoreReader.Evidence CoreReader.Adopted

/- All interpretations below share this activity, requirements, evidence and
cost limits. Only the selected implementation and its stated value priority vary. -/
abbrev sharedContext : Context := currentContinuing

def maintainedOutput (chosen : Candidate) (n : Nat) : Nat :=
  (behavior chosen [n]).headD 0

def chosenImplementation (chosen : Candidate) : CoreReader.Choice.Implementation where
  name := "order-preserving queue"
  conventional := chosen == .presentSimple
  established := chosen == .presentSimple
  run := maintainedOutput chosen
  cost := abstractionComplexity chosen
  domain _ := True
  explanation := maintainedOutput chosen
  trace n := [maintainedOutput chosen n]

/- This Core choice projection checks the queue's one-item observable contract
and present understanding budget. Domain retains its additional required checks. -/
def chosenRequirements : CoreReader.Choice.Requirements where
  inputs _ := True
  expected n := n
  budget := sharedContext.limits.capacity .understanding
  values _ := True

def chosenReasons : List CoreReader.Choice.Reason :=
  [.method .output, .method .simplicity]

theorem maintainedOutputCorrect (chosen : Candidate) (n : Nat) :
    maintainedOutput chosen n = n := by
  rfl

theorem implementationReasoned (chosen : Candidate)
    (budget : abstractionComplexity chosen ≤ chosenRequirements.budget) :
    choiceSpecification chosenRequirements (chosenImplementation chosen) chosenReasons := by
  refine ⟨⟨fun n _ => maintainedOutputCorrect chosen n, budget⟩,
    .method .output, ?_, ?_⟩
  · simp [chosenReasons]
  · exact ⟨trivial, fun n _ => maintainedOutputCorrect chosen n⟩

/- This reported capability concerns actual paths for each maintainer. Zero
records the unavailable path, not an assertion that an unsupported path exists. -/
def capabilityOutput (chosen : Candidate) (input : Nat) : Nat :=
  let maintainer := if input = 0 then Maintainer.original
    else if input = 1 then Maintainer.successor else Maintainer.agent
  if decide (CanChange sharedContext.activity chosen maintainer .designRevision)
  then changeWork chosen .designRevision else 0

def engineeringProcess (chosen : Candidate) : Process :=
  ⟨capabilityOutput chosen, none⟩

def engineeringCapability (chosen : Candidate) : Claim Process :=
  fun process => ∀ input, process.output input = capabilityOutput chosen input

theorem engineeringCapabilityGrounded (chosen : Candidate) :
    capabilitySpecification (engineeringProcess chosen) (engineeringCapability chosen) := by
  exact grounds012Singleton _ (processContractDischarged _ _ (fun _ => rfl))

theorem actualCapabilityContrast :
    (engineeringProcess .presentSimple).output 0 = 17 ∧
    (engineeringProcess .presentSimple).output 1 = 0 ∧
    (engineeringProcess .presentSimple).output 2 = 0 ∧
    (engineeringProcess .evolvable).output 0 = 6 ∧
    (engineeringProcess .evolvable).output 1 = 6 ∧
    (engineeringProcess .evolvable).output 2 = 6 := by decide

/- A recorded threshold test measures present abstraction complexity in this
finite model. It does not observe future maintainability or establish a value. -/
def presentBudgetRecord : Record Candidate :=
  ⟨fun candidate => decide (abstractionComplexity candidate ≤ 3), true⟩

abbrev presentBudgetClaim : Claim Candidate := fun candidate => abstractionComplexity candidate ≤ 3

theorem budgetObservationMeaning (candidate : Candidate) :
    Compatible [presentBudgetRecord] candidate ↔ presentBudgetClaim candidate := by
  constructor
  · intro observed
    have result := observed presentBudgetRecord (List.mem_singleton.mpr rfl)
    exact of_decide_eq_true result
  · intro enough record member
    cases List.mem_singleton.mp member
    exact decide_eq_true enough

def budgetEmpiricalFacet : Facet Candidate :=
  .empirical [presentBudgetRecord] (fun _ => True) presentBudgetClaim (fun _ => True)

theorem budgetEmpiricalDischarged : FacetDischarged budgetEmpiricalFacet := by
  refine ⟨⟨.evolvable, (budgetObservationMeaning _).2 (by decide), trivial⟩, ?_, ?_⟩
  · intro candidate observed _
    exact (budgetObservationMeaning candidate).1 observed
  · intro _ _; trivial

def capacityClaim : Claim Candidate :=
  fun candidate => abstractionComplexity candidate ≤ sharedContext.limits.capacity .understanding

def capacityAssumptions : Theory Candidate := singleton presentBudgetClaim

def budgetInferentialFacet : Facet Candidate := .inferential capacityAssumptions capacityClaim

theorem budgetInferentialDischarged : FacetDischarged budgetInferentialFacet := by
  refine ⟨⟨.evolvable, (modelsSingleton _ _).2 (by decide)⟩, ?_⟩
  intro candidate premises
  have small := (modelsSingleton _ _).1 premises
  exact Nat.le_trans small (by decide)

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

theorem budgetScopeExplained : scopeSpecification budgetScopeAccount := by
  constructor
  · intro a b _; exact ⟨trivial, trivial, trivial, trivial, rfl⟩
  · intro method hm
    exact ⟨by change "threshold observation of present complexity; no future-performance conclusion" ≠ ""; decide,
      hm, rfl, rfl, rfl⟩

/- The unchanged observation cannot justify a stronger complexity bound. -/
theorem budgetObservationLimit :
    Compatible [presentBudgetRecord] .evolvable ∧
    ¬ Supports [presentBudgetRecord] (fun candidate => abstractionComplexity candidate ≤ 1) := by
  refine ⟨(budgetObservationMeaning _).2 (by decide), ?_⟩
  intro support
  have impossible := support .evolvable ((budgetObservationMeaning _).2 (by decide))
  exact (by decide : ¬ (3 ≤ 1)) impossible

/- The policy values expansion while keeping every represented organization,
method and principle form revisable. It does not assert that a revision occurs. -/
def engineeringPolicy : CoreReader.Agency.Policy where
  worthPursuing aim :=
    (aim = .expandUnderstandingAndConstruction ∧ coreAdopted .generation = true) ∨
      aim = .preserveSafeOperation
  current form := form.version = 1
  revisable form := ∃ next, form.version < next ∧ coreAdopted .generation = true
  permitsVersion old next := old ≤ next

theorem engineeringGenerative : generationSpecification engineeringPolicy := by
  exact ⟨Or.inl ⟨rfl, rfl⟩, fun form _ => ⟨form.version + 1, Nat.lt_succ_self _, rfl⟩⟩

/- Own facts are mathematical reports about this model and its recorded state.
Their inferential tasks do not replace the separate empirical or value tasks. -/
inductive OwnFact
  | selected | requirements | capacity | capability | forecast | revision
  | generativePolicy | reflection | coreAdoption (principle : CoreCommitment)
  deriving DecidableEq, Repr

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

def ownFactPremises (chosen : Candidate) : Theory Candidate :=
  singleton (fun candidate => candidate = chosen)

theorem actualOwnFactGrounded (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) (fact : OwnFact) :
    inferentialSpecification (ownFactPremises chosen) (ownFactClaim chosen fact) := by
  apply grounds012Singleton
  refine ⟨⟨chosen, (modelsSingleton _ _).2 rfl⟩, ?_⟩
  intro candidate same
  have identity := (modelsSingleton _ _).1 same
  subst candidate
  exact actualOwnFact chosen ordinary fact

/- In this fixed applicable context, the actual priority rule and the adopted
evolution value select exactly the same candidate. This identity connects its
value grounds to the normative rule, not merely to an adoption label. -/
theorem priorityValueMeaning (candidate : Candidate) :
    (selectionPosition .evolvable).commitment candidate ↔
      EvolutionPriority sharedContext candidate := by
  constructor
  · intro selected
    change candidate = .evolvable at selected
    subst candidate
    exact currentDomainSatisfied.2.1
  · intro priority
    exact (priorityWhenApplicable sharedContext candidate priority
      currentPriorityConditions currentNoThreat.2).1

theorem priorityGrounds :
    Grounds012 (EvolutionPriority sharedContext) canonicalArticulation
      [.value (selectionPosition .evolvable)] (.value (selectionPosition .evolvable)) := by
  have same : (selectionPosition .evolvable).commitment = EvolutionPriority sharedContext :=
    funext (fun candidate => propext (priorityValueMeaning candidate))
  rw [← same]
  exact selectionGrounded .evolvable (Or.inr rfl)

/- Facts of adoption remain distinct from the actual normative contents. Each
constructor below denotes its full represented duty, with its original task,
conditions, reasons and scope. Domain duties enter only for the domain adopter.
Consistency is the constraint on the resulting whole theory below; it is not
encoded as a self-referential proposition in that theory's own definition. -/
inductive OwnNorm
  | generation | reflection | empirical | inferential | principleValue (principle : CoreCommitment)
  | selectionValue | scope | capability | choice | ownGrounds (fact : OwnFact)
  | domain | priorityValue
  deriving DecidableEq, Repr

def normApplies (adopted : Candidate) : OwnNorm → Prop
  | .domain | .priorityValue => adopted = .evolvable
  | _ => True

def ownNormClaim (adopted : Candidate) : OwnNorm → Claim Candidate
  | .generation => fun _ => generationSpecification engineeringPolicy
  | .reflection => fun candidate => reflexivitySpecification
      (selfModel candidate).rules (selfModel candidate).self (selfModel candidate).performed
  | .empirical => fun _ => empiricalSpecification [presentBudgetRecord] (fun _ => True)
      presentBudgetClaim (fun _ => True)
  | .inferential => fun _ => inferentialSpecification capacityAssumptions capacityClaim
  | .principleValue principle => fun _ => valueSpecification (governancePosition principle)
  | .selectionValue => fun candidate => valueSpecification (selectionPosition adopted) ∧
      (selectionPosition adopted).commitment candidate
  | .scope => fun _ => scopeSpecification budgetScopeAccount
  | .capability => fun candidate => capabilitySpecification
      (engineeringProcess candidate) (engineeringCapability candidate)
  | .choice => fun candidate => choiceSpecification
      chosenRequirements (chosenImplementation candidate) chosenReasons
  | .ownGrounds fact => fun _ => inferentialSpecification
      (ownFactPremises adopted) (ownFactClaim adopted fact)
  | .domain => fun candidate => DomainSatisfied sharedContext candidate
  | .priorityValue => fun _ => Grounds012 (EvolutionPriority sharedContext) canonicalArticulation
      [.value (selectionPosition .evolvable)] (.value (selectionPosition .evolvable))

theorem actualOwnNorm (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable)
    (norm : OwnNorm) (applicable : normApplies chosen norm) : ownNormClaim chosen norm chosen := by
  cases norm with
  | generation => exact engineeringGenerative
  | reflection => exact currentSelfApplication chosen ordinary
  | empirical => exact grounds012Singleton _ budgetEmpiricalDischarged
  | inferential => exact grounds012Singleton _ budgetInferentialDischarged
  | principleValue principle => exact governanceGrounded principle
  | selectionValue => exact ⟨selectionGrounded chosen ordinary, rfl⟩
  | scope => exact budgetScopeExplained
  | capability => exact engineeringCapabilityGrounded chosen
  | choice =>
    apply implementationReasoned
    rcases ordinary with rfl | rfl <;> change _ ≤ 12 <;> decide
  | ownGrounds fact => exact actualOwnFactGrounded chosen ordinary fact
  | domain =>
    change chosen = .evolvable at applicable
    subst chosen
    exact currentDomainSatisfied
  | priorityValue => exact priorityGrounds

def ownFactTheory (chosen : Candidate) : Theory Candidate :=
  fun claim => ∃ fact : OwnFact, claim = ownFactClaim chosen fact

def ownNormTheory (chosen : Candidate) : Theory Candidate :=
  fun claim => ∃ norm : OwnNorm, normApplies chosen norm ∧ claim = ownNormClaim chosen norm

/- The consequence relation now acts on all these facts and normative contents
together, including the implications of their union. -/
def ownTheory (chosen : Candidate) : Theory Candidate :=
  union (ownFactTheory chosen) (ownNormTheory chosen)

theorem allNormativeContentHeld (chosen : Candidate) (norm : OwnNorm)
    (applicable : normApplies chosen norm) : ownTheory chosen (ownNormClaim chosen norm) :=
  Or.inr ⟨norm, applicable, rfl⟩

theorem nonemptyOwnObjects (chosen : Candidate) :
    ownTheory chosen (ownFactClaim chosen .selected) ∧
    ownTheory chosen (ownFactClaim chosen (.coreAdoption .grounds)) ∧
    (.activity : ReviewObject) ∈ (selfModel chosen).objects ∧
    (.commitment .grounds : ReviewObject) ∈ (selfModel chosen).objects := by
  refine ⟨Or.inl ⟨.selected, rfl⟩, Or.inl ⟨.coreAdoption .grounds, rfl⟩, ?_, ?_⟩ <;>
    simp [selfModel, reviewObjects, coreCommitments]

def comparisonContext (chosen : Candidate) : CoreReader.Logic.Context Candidate OwnFact where
  assumptions := ownFactPremises chosen
  meaning := ownFactClaim chosen
  scope := valueScope

def engineeringSnapshot (chosen : Candidate) (revision : Nat) : Snapshot Candidate OwnFact :=
  ⟨ownTheory chosen, comparisonContext chosen, revision⟩

theorem currentAdmissible (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) :
    Admissible (ownTheory chosen) (comparisonContext chosen) chosen := by
  refine ⟨?_, (modelsSingleton _ _).2 rfl, ?_⟩
  · intro claim held
    rcases held with factHeld | normHeld
    · obtain ⟨fact, rfl⟩ := factHeld
      exact actualOwnFact chosen ordinary fact
    · obtain ⟨norm, applicable, rfl⟩ := normHeld
      exact actualOwnNorm chosen ordinary norm applicable
  · rcases ordinary with rfl | rfl <;> change _ ≤ 3 <;> decide

theorem currentConsistency (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) :
    consistencySpecification (engineeringSnapshot .evolvable 0)
      (engineeringSnapshot chosen 1) true := by
  exact ⟨consequenceConsistency _ _ ⟨chosen, currentAdmissible chosen ordinary⟩, fun _ => rfl⟩

theorem wholeClaimGrounded (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable)
    (claim : Claim Candidate) (held : ownTheory chosen claim) :
    inferentialSpecification (ownFactPremises chosen) claim := by
  apply grounds012Singleton
  refine ⟨⟨chosen, (modelsSingleton _ _).2 rfl⟩, ?_⟩
  intro candidate same
  have identity := (modelsSingleton _ _).1 same
  subst candidate
  exact (currentAdmissible chosen ordinary).1 claim held

/- Keeping the same adoption marker does not conceal contradictory normative
contents. Both demands act on the very same candidate, question and scope. -/
def incompatibleNormTheory : Theory Candidate :=
  union (singleton (fun candidate => candidate = .presentSimple))
    (singleton (fun candidate => candidate ≠ .presentSimple))

def incompatibleNormContext : CoreReader.Logic.Context Candidate Unit :=
  ⟨emptyTheory, fun _ candidate => candidate = .presentSimple, fun _ => True⟩

theorem normativeContentVariation :
    coreAdopted .choice = true ∧
    ¬ Consistent incompatibleNormTheory incompatibleNormContext ∧
    normApplies .evolvable .domain ∧ ¬ normApplies .presentSimple .domain ∧
    ownTheory .evolvable (ownNormClaim .evolvable .domain) ∧
    ¬ ownTheory .presentSimple (ownNormClaim .presentSimple .domain) := by
  refine ⟨rfl, ?_, rfl, by unfold normApplies; decide, allNormativeContentHeld _ _ rfl, ?_⟩
  · apply conflictRequiresChange _ _ ()
    · intro candidate admissible
      change candidate = .presentSimple
      exact (modelsSingleton (fun c : Candidate => c = .presentSimple) candidate).1
        ((modelsUnion _ _ _).1 admissible.1).1
    · intro candidate admissible
      change candidate ≠ .presentSimple
      exact (modelsSingleton (fun c : Candidate => c ≠ .presentSimple) candidate).1
        ((modelsUnion _ _ _).1 admissible.1).2
  · intro held
    have domain := (currentAdmissible .presentSimple (Or.inl rfl)).1 _ held
    exact currentSimpleViolates domain.2.1

/- Every field is an actual satisfaction or support condition. Value accounts
and assessment completion do not replace the normative fields they explain.
The identity field limits this implementation to its disclosed common context. -/
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
  fullNormativeContents : ∀ norm, normApplies chosen norm →
    ownTheory chosen (ownNormClaim chosen norm)
  wholeClaimGrounds : ∀ claim, ownTheory chosen claim →
    inferentialSpecification (ownFactPremises chosen) claim

theorem inheritedCurrent (chosen : Candidate)
    (ordinary : chosen = .presentSimple ∨ chosen = .evolvable) :
    Inherited sharedContext chosen := by
  refine ⟨rfl, engineeringGenerative, currentConsistency chosen ordinary,
    currentSelfApplication chosen ordinary, governanceGrounded,
    selectionGrounded chosen ordinary, grounds012Singleton _ budgetEmpiricalDischarged,
    grounds012Singleton _ budgetInferentialDischarged, budgetScopeExplained,
    engineeringCapabilityGrounded chosen, ?_, actualOwnFactGrounded chosen ordinary,
    ?_, rfl, (currentAdmissible chosen ordinary).1,
    allNormativeContentHeld chosen, wholeClaimGrounded chosen ordinary⟩
  · apply implementationReasoned
    rcases ordinary with rfl | rfl <;> change _ ≤ 12 <;> decide
  · apply (budgetObservationMeaning _).2
    rcases ordinary with rfl | rfl <;> change _ ≤ 3 <;> decide

/- Mutual application extracts duties for the same system, principles, claims
and actual chosen implementation. It retains the full Inherited premise. -/
/-- organon-map CoreReader.Engineering.inheritedMutualApplication
organon.relationships.roles#p1 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p2 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
theorem inheritedMutualApplication (ctx : Context) (chosen : Candidate)
    (inherited : Inherited ctx chosen) :
    generationSpecification engineeringPolicy ∧
    reflexivitySpecification (selfModel chosen).rules (selfModel chosen).self
      (selfModel chosen).performed ∧
    (∀ principle, valueSpecification (governancePosition principle)) ∧
    capabilitySpecification (engineeringProcess chosen) (engineeringCapability chosen) ∧
    choiceSpecification chosenRequirements (chosenImplementation chosen) chosenReasons ∧
    (∀ fact, inferentialSpecification (ownFactPremises chosen) (ownFactClaim chosen fact)) ∧
    (∀ norm, normApplies chosen norm → ownTheory chosen (ownNormClaim chosen norm)) ∧
    (∀ claim, ownTheory chosen claim → inferentialSpecification (ownFactPremises chosen) claim) ∧
    consistencySpecification (engineeringSnapshot .evolvable 0)
      (engineeringSnapshot chosen 1) true :=
  ⟨inherited.generation, inherited.reflection, inherited.ownPrincipleGrounds,
    inherited.capabilityGrounds, inherited.implementationChoice, inherited.ownClaimGrounds,
    inherited.fullNormativeContents, inherited.wholeClaimGrounds, inherited.consistency⟩

/-- organon-map CoreReader.Engineering.inheritedMutualCases
organon.relationships.roles#p1 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p2 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
theorem inheritedMutualCases :
    Inherited sharedContext .evolvable ∧
    valueSpecification (governancePosition .grounds) ∧
    capabilitySpecification (engineeringProcess .evolvable) (engineeringCapability .evolvable) ∧
    choiceSpecification chosenRequirements (chosenImplementation .evolvable) chosenReasons ∧
    Reflection.evaluate ((selfModel .evolvable).input ⟨0, .evolutionMethod, .revision⟩) = .counterexample ∧
    (.generationRule : ReviewObject) ∈ (selfModel .evolvable).objects ∧
    (.assessmentRule : ReviewObject) ∈ (selfModel .evolvable).objects ∧
    Reflection.evaluate ((selfModel .evolvable).input ⟨0, .assessmentRule, .revision⟩) = .counterexample :=
  ⟨inheritedCurrent .evolvable (Or.inr rfl), governanceGrounded .grounds,
    engineeringCapabilityGrounded .evolvable,
    (inheritedCurrent .evolvable (Or.inr rfl)).implementationChoice,
    (actualSelfCriticism .evolvable).2.2.1,
    (ownRuleIdentity .evolvable .generation .revision).1,
    (ownRuleIdentity .evolvable .assessment .revision).1,
    (ownRuleContentVariation .evolvable).2.2.2.2.1⟩

/- In the adopter's same context, the actual priority object and its own
assessment method remain within the inherited criticism/generation contract. -/
/-- organon-map CoreReader.Engineering.priorityRemainsReflexive
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
extensions#p1 sha256 ec87a2f17b2f88addcadea0108add11ad3d4239daf56db466ba0ddbe7cc92b66
software-engineering.structural-judgment#p1 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
software-engineering.revision#p2 sha256 5d31bed0197ea7e7028eb7a85e56059516421c6c27613cc5479e0b98c5111d99
-/
theorem priorityRemainsReflexive (ctx : Context) (chosen : Candidate)
    (inherited : Inherited ctx chosen) (domain : DomainSatisfied ctx chosen)
    (applicable : PriorityConditions ctx) (noDeparture : ¬ JustifiedDeparture ctx .evolvable) :
    chosen = .evolvable ∧
    (.priority : ReviewObject) ∈ (selfModel chosen).objects ∧
    reflexivitySpecification (selfModel chosen).rules (selfModel chosen).self
      (selfModel chosen).performed ∧
    (∀ principle, valueSpecification (governancePosition principle)) ∧
    Grounds012 (EvolutionPriority ctx) canonicalArticulation
      [.value (selectionPosition .evolvable)] (.value (selectionPosition .evolvable)) ∧
    ownTheory chosen (ownNormClaim chosen .domain) ∧
    consistencySpecification (engineeringSnapshot .evolvable 0)
      (engineeringSnapshot chosen 1) true := by
  have selected := (priorityWhenApplicable ctx chosen domain.2.1 applicable noDeparture).1
  refine ⟨selected, ?_, inherited.reflection, inherited.ownPrincipleGrounds,
    ?_, allNormativeContentHeld chosen .domain selected, inherited.consistency⟩
  · subst chosen; decide
  · rw [inherited.sameContext]
    exact priorityGrounds

/-- organon-map CoreReader.Engineering.priorityReflexiveCases
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
extensions#p1 sha256 ec87a2f17b2f88addcadea0108add11ad3d4239daf56db466ba0ddbe7cc92b66
software-engineering.structural-judgment#p1 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
software-engineering.revision#p2 sha256 5d31bed0197ea7e7028eb7a85e56059516421c6c27613cc5479e0b98c5111d99
-/
theorem priorityReflexiveCases :
    (.priority : ReviewObject) ∈ (selfModel .evolvable).objects ∧
    objectTest .priority (.evolvable, 10) = true ∧
    (selfModel .evolvable).performed ⟨0, 1⟩ ⟨0, .priority, .revision⟩
      ((selfModel .evolvable).input ⟨0, .priority, .revision⟩)
      (.assessed .supportedWithinScope) ∧
    Reflection.evaluate ((selfModel .evolvable).input ⟨0, .evolutionMethod, .revision⟩) = .counterexample ∧
    objectTest .evolutionMethod (.evolvable, 10) = true ∧
    objectTest .evolutionMethod (.evolvable, 5) = false ∧
    Grounds012 (EvolutionPriority sharedContext) canonicalArticulation
      [.value (selectionPosition .evolvable)] (.value (selectionPosition .evolvable)) ∧
    Reflection.evaluate ((selfModel .evolvable).input ⟨0, .assessmentRule, .revision⟩) = .counterexample := by
  refine ⟨by decide, by decide, ?_, (actualSelfCriticism .evolvable).2.2.1,
    (actualSelfCriticism .evolvable).1, (actualSelfCriticism .evolvable).2.1,
    priorityGrounds, (ownRuleContentVariation .evolvable).2.2.2.2.1⟩
  exact ⟨⟨rfl, by decide⟩, rfl, .assessment, rfl, rfl⟩

/- The witness is nonempty and satisfies the entire represented inherited and
domain bundles in the very same continuing activity, with active priority. -/
/-- organon-map CoreReader.Engineering.jointWitness
organon.charter.overview#p2 sha256 75d7d941d3c07ea748c4a9261d36a75fbd5664ff9c817c4034a9a36a3a12664c
organon.charter.overview#p3 sha256 75d7d941d3c07ea748c4a9261d36a75fbd5664ff9c817c4034a9a36a3a12664c
organon.charter.self-transcendence#p1 sha256 f4ca590e2ae15e3882f70c7b2bc46a8911c97cee547c8b137b5493fbf862c8c0
organon.charter.self-transcendence.orientation#p1 sha256 7f9b85c0816b3d69e417cf3cbe17b7b59931388f84d799ce6730c998037358bf
organon.charter.self-transcendence.non-finality#p1 sha256 4ae4497523e79e0606ab3849c47b6ea16f8888a952e063e6966eb36b750f3df8
organon.charter.self-transcendence.limits#p1 sha256 6dade83f0b7fcc004bdb37b6726c15b31b06a377de4e86d506c9d2e67847029d
organon.charter.self-transcendence.limits#p2 sha256 6dade83f0b7fcc004bdb37b6726c15b31b06a377de4e86d506c9d2e67847029d
organon.charter.consistency#p1 sha256 c6960c590c096d33250599cf418e3c6a1dc26bfc7d7800c82b8efde656950f42
organon.charter.consistency.meaning#p1 sha256 81c09e38a3349499f95401d1c08f6069666c13547a43bc4e4395330743055faa
organon.charter.consistency.meaning#p2 sha256 81c09e38a3349499f95401d1c08f6069666c13547a43bc4e4395330743055faa
organon.charter.consistency.limits#p1 sha256 4fa1c29bf95ad6ef04c6d27671a832c0af8ba31b9c0d8018a8d09c4f33c38e75
organon.charter.reflexivity#p1 sha256 13293b45c2fa89068c68ae7ef3c5df38f0efadb3ef3873d78a5ba67d9691a757
organon.charter.reflexivity.meaning#p1 sha256 8a2caede01a43d8b6c60b54c78ac089c51868e9956f316948077ccee2e45c9cc
organon.charter.reflexivity.limits#p1 sha256 ac0baae0d86e69f84c1ca4dee837de2759e2d29c295ffc257d988962158d4bbc
organon.grounds#p1 sha256 4ee74dc8617388ee75d63b507176ecb73b8527758b648f7c588d3ae7f3445ec6
organon.grounds.assessment#p1 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.assessment#p2 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.assessment#p3 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.scope#p1 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
organon.grounds.scope#p2 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
organon.grounds.scope#p3 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
organon.grounds.capabilities#p1 sha256 7249f6f2ef327baaa72349cae53b9245f23a34436356dd05f3c6005cab35e8f0
organon.grounds.capabilities#p2 sha256 7249f6f2ef327baaa72349cae53b9245f23a34436356dd05f3c6005cab35e8f0
organon.grounds.implementations#p1 sha256 bb2a822a304d4a20f513218f356ddbeeca8ee139e3ed802213591e9ff6c5095c
organon.grounds.implementations#p2 sha256 bb2a822a304d4a20f513218f356ddbeeca8ee139e3ed802213591e9ff6c5095c
organon.grounds.implementations.limits#p1 sha256 db9b5f1803baab0e1b05a3a9e068948667412afa7d692e1da3869ca54be4b870
organon.relationships.roles#p1 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p2 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
extensions#p1 sha256 ec87a2f17b2f88addcadea0108add11ad3d4239daf56db466ba0ddbe7cc92b66
software-engineering.purpose#p1 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.purpose#p2 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.purpose#p3 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.evolution-priority#p1 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p2 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-meaning#p1 sha256 c3fa878716f4370ebd1d352d2c135255695cfec6e1d33900a184cb46acb80bf6
software-engineering.evolution-meaning#p2 sha256 c3fa878716f4370ebd1d352d2c135255695cfec6e1d33900a184cb46acb80bf6
software-engineering.structural-judgment#p1 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
software-engineering.structural-judgment#p2 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
software-engineering.structural-judgment#p3 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
software-engineering.revision#p1 sha256 5d31bed0197ea7e7028eb7a85e56059516421c6c27613cc5479e0b98c5111d99
software-engineering.revision#p2 sha256 5d31bed0197ea7e7028eb7a85e56059516421c6c27613cc5479e0b98c5111d99
-/
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

/- The countermodel adopts a supported present-simplicity value and actually
chooses that option. Every inherited duty still holds. The domain conditions
are active; neither lifecycle nor threatened costs supplies an escape. -/
/-- organon-map CoreReader.Engineering.inheritedDoesNotEntailPriority
organon.relationships.roles#p1 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p2 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
extensions#p1 sha256 ec87a2f17b2f88addcadea0108add11ad3d4239daf56db466ba0ddbe7cc92b66
software-engineering.evolution-priority#p1 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p2 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
-/
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
