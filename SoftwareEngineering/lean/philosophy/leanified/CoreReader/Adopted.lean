import CoreReader.Integration

namespace CoreReader.Adopted
open CoreReader.Logic CoreReader.Agency CoreReader.Evidence CoreReader.Choice

/- These are three explicit mathematical assessment tasks, not an exhaustive or
exclusive taxonomy of claim natures. A task fixes the original claim and support
context before any candidate assessment is proposed. Its identity must be retained
when comparing alternative assessments; taskOfFacet declares a new task and does
not authorize replacing a previously identified task. -/
inductive AssessmentTask (W : Type) where
  | empirical (records : List (Record W)) (scope claim uncertainty : Claim W)
  | inferential (assumptions : Theory W) (claim : Claim W)
  | value (position : ValuePosition W)

def taskOfFacet {W : Type} : Facet W → AssessmentTask W
  | .empirical records scope claim uncertainty => .empirical records scope claim uncertainty
  | .inferential assumptions claim => .inferential assumptions claim
  | .value position => .value position

/- This is a content-based sufficient adapter for the declared task, not a
philosophical rule requiring one unique assessment form. The empirical task may
also be assessed inferentially from exactly its observation/scope premises; its
original uncertainty obligation is still checked. In particular, adding the
conclusion as a new premise cannot replace the original empirical grounds.
The finite adapter need not accept every semantically equivalent presentation. -/
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

theorem taskOfFacetAppropriate {W : Type} (f : Facet W) : NatureAppropriate (taskOfFacet f) f := by
  cases f with
  | empirical _ _ _ _ => exact ⟨rfl, rfl, rfl, rfl⟩
  | inferential _ _ => exact ⟨rfl, rfl⟩
  | value _ => rfl

/- Core 0.1.2 requires appropriateness to the original claim task. Supplied facets
are an explicit assessment scope, without importing Core 0.1.3's all-applicable
coverage requirement. No claim-kind label or freely assigned success flag proves
appropriateness: NatureAppropriate compares the actual task and facet contents. -/
/-- organon-map CoreReader.Adopted.Grounds012
organon.grounds#p1 sha256 4ee74dc8617388ee75d63b507176ecb73b8527758b648f7c588d3ae7f3445ec6
organon.grounds.assessment#p1 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.assessment#p2 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.assessment#p3 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
-/
def Grounds012 {W : Type} (claim : Claim W)
    (articulations : Facet W → Articulation W) (facets : List (Facet W))
    (task : AssessmentTask W) : Prop :=
  facets ≠ [] ∧ ∀ facet ∈ facets,
    facet.claim = claim ∧ Articulated (articulations facet) ∧
    FacetArticulated (articulations facet) facet ∧ FacetDischarged facet ∧
    NatureAppropriate task facet

/- This helper proves the newly declared taskOfFacet f only. It supplies no
appropriateness proof for another, previously fixed task with the same claim. -/
theorem grounds012Singleton {W : Type} (f : Facet W) (h : FacetDischarged f) :
    Grounds012 f.claim canonicalArticulation [f] (taskOfFacet f) := by
  refine ⟨by simp, ?_⟩
  intro facet hf
  cases List.mem_singleton.mp hf
  exact ⟨rfl, canonicalArticulated f h, canonicalFacetArticulated f, h, taskOfFacetAppropriate f⟩

/-- organon-map CoreReader.Adopted.generationSpecification
organon.charter.overview#p2 sha256 75d7d941d3c07ea748c4a9261d36a75fbd5664ff9c817c4034a9a36a3a12664c
organon.charter.overview#p3 sha256 75d7d941d3c07ea748c4a9261d36a75fbd5664ff9c817c4034a9a36a3a12664c
organon.charter.self-transcendence#p1 sha256 f4ca590e2ae15e3882f70c7b2bc46a8911c97cee547c8b137b5493fbf862c8c0
organon.charter.self-transcendence.orientation#p1 sha256 7f9b85c0816b3d69e417cf3cbe17b7b59931388f84d799ce6730c998037358bf
organon.charter.self-transcendence.non-finality#p1 sha256 4ae4497523e79e0606ab3849c47b6ea16f8888a952e063e6966eb36b750f3df8
organon.charter.self-transcendence.limits#p2 sha256 6dade83f0b7fcc004bdb37b6726c15b31b06a377de4e86d506c9d2e67847029d
organon.relationships.terms#p1 sha256 61cb7ce4f2920f1aa6771502b87a66536ae0504acccfebd9dd23bcc62756eddf
-/
def generationSpecification (policy : Policy) : Prop := Generative policy

/- All consequences use the whole currently held set. Historical reporting is
separate and does not require simultaneous compatibility with withdrawn claims. -/
/-- organon-map CoreReader.Adopted.consistencySpecification
organon.charter.consistency#p1 sha256 c6960c590c096d33250599cf418e3c6a1dc26bfc7d7800c82b8efde656950f42
organon.charter.consistency.meaning#p1 sha256 81c09e38a3349499f95401d1c08f6069666c13547a43bc4e4395330743055faa
organon.charter.consistency.meaning#p2 sha256 81c09e38a3349499f95401d1c08f6069666c13547a43bc4e4395330743055faa
organon.charter.consistency.limits#p1 sha256 4fa1c29bf95ad6ef04c6d27671a832c0af8ba31b9c0d8018a8d09c4f33c38e75
-/
def consistencySpecification {W Q : Type} (before after : Snapshot W Q)
    (reported : Bool) : Prop :=
  Consistent after.held after.context ∧ TruthfulReport before after reported

/- A method's actual input and interpretation are parameters, permitting domain
methods as well as the small arithmetic adapter. Key coherence prevents records
for another method from silently satisfying the duty. -/
structure ReflexiveRule (T I O : Type) where
  key : PrincipleKey
  activity : Activity
  applicable : T → Prop
  input : T → I
  meaning : I → O → Prop

/-- organon-map CoreReader.Adopted.reflexivitySpecification
organon.charter.reflexivity#p1 sha256 13293b45c2fa89068c68ae7ef3c5df38f0efadb3ef3873d78a5ba67d9691a757
organon.charter.reflexivity.meaning#p1 sha256 8a2caede01a43d8b6c60b54c78ac089c51868e9956f316948077ccee2e45c9cc
organon.charter.reflexivity.limits#p1 sha256 ac0baae0d86e69f84c1ca4dee837de2759e2d29c295ffc257d988962158d4bbc
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
def reflexivitySpecification {T I O : Type} (rules : List (ReflexiveRule T I O))
    (isSelf : T → Prop) (performed : PrincipleKey → T → I → O → Prop) : Prop :=
  (∀ p ∈ rules, ∀ q ∈ rules, p.key = q.key → p = q) ∧
  ∀ rule ∈ rules, ∀ target, isSelf target → rule.applicable target →
    ∃ outcome, performed rule.key target (rule.input target) outcome ∧
      rule.meaning (rule.input target) outcome

def legacyRule (p : Principle) : ReflexiveRule Subject Inquiry WorkOutcome :=
  ⟨p.key, p.activity, p.applicable, p.inquiry,
    fun inquiry outcome => p.meaning inquiry (p.reasons inquiry.target) (p.limits inquiry.target) outcome⟩

def legacyPerformed (rules : List Principle) (records : List WorkRecord)
    (key : PrincipleKey) (target : Subject) (input : Inquiry) (outcome : WorkOutcome) : Prop :=
  ∃ p ∈ rules, ∃ record ∈ records,
    p.key = key ∧ ValidApplication rules p target record ∧
    record.inquiry = input ∧ record.outcome = outcome

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

/- These are fulfillment interfaces for the named mathematical adapters, not
universal empirical adequacy claims or definitions of all possible claim kinds. -/
/-- organon-map CoreReader.Adopted.empiricalSpecification
organon.grounds.assessment#p2 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
-/
def empiricalSpecification {W : Type} (records : List (Record W))
    (scope claim uncertainty : Claim W) : Prop :=
  Grounds012 claim canonicalArticulation [.empirical records scope claim uncertainty]
    (.empirical records scope claim uncertainty)

/-- organon-map CoreReader.Adopted.inferentialSpecification
organon.grounds.assessment#p2 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.relationships.roles#p2 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
def inferentialSpecification {W : Type} (assumptions : Theory W) (claim : Claim W) : Prop :=
  Grounds012 claim canonicalArticulation [.inferential assumptions claim] (.inferential assumptions claim)

/-- organon-map CoreReader.Adopted.valueSpecification
organon.grounds.assessment#p2 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.assessment#p3 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
-/
def valueSpecification {W : Type} (position : ValuePosition W) : Prop :=
  Grounds012 position.commitment canonicalArticulation [.value position] (.value position)

/- Scope and roles are explicitly identified relative to a claim. An actually
used method needs an explanation; unused methods are not required. The input
relation can encode contextual relevance without a universal numeric scale. -/
inductive AssessmentMethod | measurement | repetition | framework
  deriving DecidableEq
structure ScopeAccount (W : Type) where
  claim : Claim W
  conditions : Claim W
  observationScope : Claim W
  relevant : W → W → Prop
  compared : W → W → Prop
  used : AssessmentMethod → Prop
  role : AssessmentMethod → String
  explains : AssessmentMethod → String → Claim W → Claim W → Prop

/-- organon-map CoreReader.Adopted.scopeSpecification
organon.grounds.scope#p1 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
organon.grounds.scope#p2 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
organon.grounds.scope#p3 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
-/
def scopeSpecification {W : Type} (account : ScopeAccount W) : Prop :=
  (∀ a b, account.compared a b → account.conditions a ∧ account.conditions b ∧
    account.observationScope a ∧ account.observationScope b ∧ account.relevant a b) ∧
  ∀ method, account.used method → account.role method ≠ "" ∧
    account.explains method (account.role method) account.claim account.conditions

/- A capability is selected by the application as an exact object-scoped
contract; whether explanation is part of it remains an application choice. -/
/-- organon-map CoreReader.Adopted.capabilitySpecification
organon.grounds.capabilities#p1 sha256 7249f6f2ef327baaa72349cae53b9245f23a34436356dd05f3c6005cab35e8f0
organon.grounds.capabilities#p2 sha256 7249f6f2ef327baaa72349cae53b9245f23a34436356dd05f3c6005cab35e8f0
organon.relationships.roles#p2 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
def capabilitySpecification (assessed : Process) (contract : Claim Process) : Prop :=
  Grounds012 contract canonicalArticulation [processContractFacet assessed contract]
    (.inferential (processScope assessed) contract)

/-- organon-map CoreReader.Adopted.choiceSpecification
organon.grounds.implementations#p1 sha256 bb2a822a304d4a20f513218f356ddbeeca8ee139e3ed802213591e9ff6c5095c
organon.grounds.implementations#p2 sha256 bb2a822a304d4a20f513218f356ddbeeca8ee139e3ed802213591e9ff6c5095c
organon.grounds.implementations.limits#p1 sha256 db9b5f1803baab0e1b05a3a9e068948667412afa7d692e1da3869ca54be4b870
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
def choiceSpecification (requirements : Requirements) (implementation : Implementation)
    (reasons : List Reason) : Prop := JustifiedChoice requirements implementation reasons

/- A collaborator supplies the successor operation. Removing that resource
leaves the initial state; progress is tested on actual added operation content. -/
def collaborativeRevision (resources : ExternalResources) : State :=
  if resources.collaborator.isSome then extendedState else baseState

theorem collaborativeProgress :
    generationSpecification openPolicy ∧
    Expanded baseState (collaborativeRevision availableResources) ∧
    ¬ Expanded baseState (collaborativeRevision { availableResources with collaborator := none }) ∧
    assistedExecution ⟨none, none, none⟩ = none := by
  refine ⟨⟨Or.inl rfl, fun _ _ => trivial⟩, ?_, ?_, rfl⟩
  · exact Or.inr ⟨.successor, by simp [collaborativeRevision, availableResources, extendedState],
      by simp [baseState]⟩
  · simp [collaborativeRevision, Expanded, baseState]

/- A truth-preserving current slice need not retain an earlier incompatible
slice. Context changes and presentation order have separate semantics. -/
/-- organon-map CoreReader.Adopted.consistencyConsequences
organon.charter.consistency#p1 sha256 c6960c590c096d33250599cf418e3c6a1dc26bfc7d7800c82b8efde656950f42
organon.charter.consistency.meaning#p1 sha256 81c09e38a3349499f95401d1c08f6069666c13547a43bc4e4395330743055faa
organon.charter.consistency.meaning#p2 sha256 81c09e38a3349499f95401d1c08f6069666c13547a43bc4e4395330743055faa
organon.charter.consistency.limits#p1 sha256 4fa1c29bf95ad6ef04c6d27671a832c0af8ba31b9c0d8018a8d09c4f33c38e75
-/
theorem consistencyConsequences {W Q : Type} (t : Theory W) (c : Context W Q) (q : Q)
    (positive : Consequence t c q true) (negative : Consequence t c q false) :
    ¬ Consistent t c := conflictRequiresChange t c q positive negative

def broadBoolContext : Context Bool Unit := ⟨emptyTheory, onQuestion, fun _ => True⟩

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

/- One observed input supports the local claim. The identical records cannot
support all inputs, nor the stronger claim that both Boolean outputs are true. -/
def localFacet012 : Facet (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) (fun f => f 0 = true) (fun _ => True)
def globalFacet012 : Facet (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) allTrue (fun _ => True)
def strongFacet012 : Facet (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) (fun f => f 0 = true ∧ f 1 = true) (fun _ => True)

theorem localFacetChecked012 : FacetDischarged localFacet012 :=
  ⟨⟨localGenerator 0, (zeroCompatible _).2 rfl, trivial⟩,
    (fun f hf _ => (zeroCompatible f).1 hf), fun _ _ => trivial⟩

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

/- A bounded outcome statement can leave another observable entirely unknown.
This represents uncertainty by a range of compatible worlds, not a probability. -/
def uncertainFacet012 : Facet (Bool × Bool) :=
  .empirical [temperatureRecord, temperatureRecord] (fun _ => True)
    (fun w => w.1 = true) (fun w => w.2 = true ∨ w.2 = false)

theorem uncertainSupported012 :
    empiricalSpecification [temperatureRecord, temperatureRecord] (fun _ => True)
      (fun w => w.1 = true) (fun w => w.2 = true ∨ w.2 = false) ∧
    Compatible [temperatureRecord, temperatureRecord] (true,true) ∧
    Compatible [temperatureRecord, temperatureRecord] (true,false) := by
  refine ⟨grounds012Singleton uncertainFacet012 ?_, temperatureCompatible true, temperatureCompatible false⟩
  refine ⟨⟨(true,false), temperatureCompatible false, trivial⟩, ?_, ?_⟩
  · intro w hw _; exact hw temperatureRecord (by simp)
  · intro w _; cases w.2 <;> simp

/- Correctly completed negative examination is distinct from a supported
conclusion. The countervaluation satisfies the same premises. -/
def InferenceExamined {W : Type} (premises : Theory W) (conclusion : Claim W)
    (accepted : Bool) : Prop := accepted = true ↔ Entails premises conclusion

theorem inferenceChecked012 :
    inferentialSpecification (singleton (fun n : Nat => n = 2)) (fun n => n + 1 = 3) ∧
    InferenceExamined (emptyTheory : Theory Bool) (fun w => w = true) false ∧
    Models (emptyTheory : Theory Bool) false ∧ ¬ ((fun w : Bool => w = true) false) := by
  refine ⟨grounds012Singleton arithmeticFacet noUniversalChain.1, ?_, (by intro p hp; cases hp), by decide⟩
  constructor
  · intro h; cases h
  · intro h; exact False.elim (consistentIncomplete.2.1 h)

/- Closing a response to an actually relevant criticism fails the value
procedure even when its budget/benefit reasons and joint adoption are unchanged. -/
def closedPosition012 : ValuePosition Bool := { switchPosition with response := fun _ => none }

theorem closedCriticism012 : ¬ ValueProcedure closedPosition012 := by
  intro h
  obtain ⟨answer, ha, _⟩ := h.2.2.2 false trivial rfl
  cases ha

theorem valueFulfilled012 : valueSpecification switchPosition :=
  grounds012Singleton _ switchValueProcedure

/- Qualitative entailment orders claims by implication, without conversion of
value and empirical/inferential reasons to a common numeric scale. -/
def ClaimNoStronger {W : Type} (weaker stronger : Claim W) : Prop := ∀ w, stronger w → weaker w

theorem qualitativeProportionality012 :
    ClaimNoStronger (fun f : Nat → Bool => f 0 = true) allTrue ∧
    ¬ ClaimNoStronger allTrue (fun f : Nat → Bool => f 0 = true) ∧
    valueSpecification switchPosition := by
  refine ⟨fun _ h => h 0, ?_, valueFulfilled012⟩
  intro h
  have bad := h (localGenerator 0) rfl 1
  cases bad

def scopeRole012 : AssessmentMethod → String
  | .measurement => "identify the output at the observed input zero"
  | .repetition => "check the same local conclusion against repeated input-zero observations"
  | .framework => "compare only the declared input; keep broader claims separate"

def scopeRoleContent012 : AssessmentMethod → Prop
  | .measurement => Supports [zeroRecord] (fun f => f 0 = true)
  | .repetition => Supports [zeroRecord, zeroRecord] (fun f => f 0 = true)
  | .framework => ¬ Supports [zeroRecord] allTrue

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

/- This application asks the assessed object to predict a multiplier mechanism
at changed inputs and multiplier values. This is one operational understanding
criterion selected by an application, not a definition of psychological understanding.
The original output and explanation alone do not answer the additional questions. -/
structure MechanismApplication012 where
  process : Process
  answer : Nat → Nat → Nat

def mechanism012 (multiplier input : Nat) : Nat := multiplier * input

def UnderstandingApplication012 (assessed : MechanismApplication012) : Prop :=
  FullProcessContract assessed.process ∧
  (∀ input, assessed.process.output input = mechanism012 2 input) ∧
  ∀ multiplier input, assessed.answer multiplier input = mechanism012 multiplier input

def explainedWithoutVariation012 : MechanismApplication012 :=
  ⟨explainedProcess, fun _ input => input + input⟩

def mechanismResponder012 : MechanismApplication012 :=
  ⟨explainedProcess, mechanism012⟩

/- The assessment task is fixed by this very application object and the stronger
contract. Identity is a scope premise; the positive case still proves the contract. -/
def understandingScope012 (assessed : MechanismApplication012) : Theory MechanismApplication012 :=
  singleton (fun candidate => candidate = assessed)

def understandingTask012 (assessed : MechanismApplication012) : AssessmentTask MechanismApplication012 :=
  .inferential (understandingScope012 assessed) UnderstandingApplication012

def understandingFacet012 (assessed : MechanismApplication012) : Facet MechanismApplication012 :=
  .inferential (understandingScope012 assessed) UnderstandingApplication012

theorem mechanismResponderUnderstands012 : UnderstandingApplication012 mechanismResponder012 := by
  refine ⟨⟨(fun _ => rfl), .doubleInput, rfl, (fun _ => rfl)⟩, ?_, fun _ _ => rfl⟩
  intro input
  simp [mechanismResponder012, explainedProcess, mechanism012, Nat.two_mul]

theorem explainedWithoutVariationFails012 :
    ¬ UnderstandingApplication012 explainedWithoutVariation012 := by
  intro h
  have wrong := h.2.2 3 1
  change 2 = 3 at wrong
  cases wrong

theorem understandingApplicationCases012 :
    explainedWithoutVariation012.process = mechanismResponder012.process ∧
    FullProcessContract explainedWithoutVariation012.process ∧
    ¬ UnderstandingApplication012 explainedWithoutVariation012 ∧
    UnderstandingApplication012 mechanismResponder012 ∧
    Grounds012 UnderstandingApplication012 canonicalArticulation
      [understandingFacet012 mechanismResponder012] (understandingTask012 mechanismResponder012) ∧
    ¬ Grounds012 UnderstandingApplication012 canonicalArticulation
      [understandingFacet012 explainedWithoutVariation012] (understandingTask012 explainedWithoutVariation012) := by
  refine ⟨rfl, ⟨(fun _ => rfl), .doubleInput, rfl, (fun _ => rfl)⟩,
    explainedWithoutVariationFails012, mechanismResponderUnderstands012, ?_, ?_⟩
  · apply grounds012Singleton
    refine ⟨⟨mechanismResponder012, (modelsSingleton _ _).2 rfl⟩, ?_⟩
    intro candidate hc
    have same := (modelsSingleton _ _).1 hc
    subst candidate
    exact mechanismResponderUnderstands012
  · intro h
    have discharged := (h.2 (understandingFacet012 explainedWithoutVariation012) (by simp)).2.2.2.1
    exact explainedWithoutVariationFails012
      (discharged.2 explainedWithoutVariation012 ((modelsSingleton _ _).2 rfl))

/- The same exact application contract receives Grounds when its owner asserts
it; external certificates change who supplies reasons, not the asserted object. -/
def OwnCapability012 (owner claimant : Nat) (process : Process) (contract : Claim Process) : Prop :=
  owner = claimant ∧ capabilitySpecification process contract

theorem ownCapability012 : OwnCapability012 7 7 outputOnlyProcess OutputContract :=
  ⟨rfl, capabilityFulfilled012.1⟩

/- A complete represented Charter includes generation, whole-set consistency,
truthful revision reporting and applicable contentful self-work on the same
system. The world type is the finite Candidate × Mode type. -/
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

theorem completeCharter012 : CompleteCharter012 CoreReader.Integration.actualSystem CoreReader.Integration.actual := by
  refine ⟨CoreReader.Integration.charterChecked.1,
    ⟨CoreReader.Integration.jointConsistent, ?_⟩,
    legacyReflexivity 0 _ _ (completeOwnWork_reflexive 0), rfl, rfl⟩
  rintro (h | h)
  · exact False.elim (h ⟨fun _ => Iff.rfl, fun _ => Iff.rfl, fun _ _ => Iff.rfl, fun _ => Iff.rfl⟩)
  · exact False.elim (h rfl)

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

/- Permission to assert is evaluated on the same claim, articulation and facets.
The countercase derives inadequacy from the actual unobserved output. -/
def groundsPermission012 {W : Type} (enabled : Bool) (claim : Claim W)
    (a : Facet W → Articulation W) (facets : List (Facet W)) (task : AssessmentTask W) : Prop :=
  if enabled then Grounds012 claim a facets task else True

def GroundsProvision012 (enabled : Bool) : Prop :=
  ∀ (claim : Claim (Nat → Bool)) a facets task,
    groundsPermission012 enabled claim a facets task → Grounds012 claim a facets task

theorem groundsProvision012Meaning (enabled : Bool) : GroundsProvision012 enabled ↔ enabled = true := by
  cases enabled with
  | true => exact ⟨fun _ => rfl, fun _ _ _ _ _ h => h⟩
  | false =>
    constructor
    · intro h
      exact False.elim (scopeStrength012.2.2.1 (h globalFacet012.claim canonicalArticulation [globalFacet012] (taskOfFacet globalFacet012) trivial))
    · intro h; cases h

/- The value rationale concerns this fixed empirical assertion task. The
same task, observed grounds and concrete counterworld are retained when the
permission policy is enabled or disabled. -/
def groundsExperimentTask012 : AssessmentTask (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) allTrue (fun _ => True)

noncomputable def groundsExperiment012 (enabled : Bool) : Bool :=
  @decide (groundsPermission012 enabled allTrue canonicalArticulation [globalFacet012]
    groundsExperimentTask012) (Classical.propDecidable _)

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

theorem groundsOnGrounds012 :
    Grounds012 (fun enabled => GroundsProvision012 enabled) canonicalArticulation [.value groundsPosition012] (.value groundsPosition012) ∧
    groundsPosition012.limits true ∧ groundsPosition012.relevantCriticism true := by
  have same : (Facet.value groundsPosition012).claim = (fun enabled => GroundsProvision012 enabled) := by
    funext enabled
    exact propext (groundsProvision012Meaning enabled).symm
  refine ⟨?_, trivial, singleObservation.2.2.2⟩
  rw [← same]
  exact grounds012Singleton _ groundsPosition012Checked

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

theorem achievementSupported012 :
    Grounds012 transitionAchievement canonicalArticulation [transitionFacet] (taskOfFacet transitionFacet) ∧
    Compatible [transitionPerformanceRecord] .extend ∧
    transitionAchievement .extend ∧ ¬ transitionAchievement .inflate ∧
    ¬ Supports [transitionReportRecord] transitionAchievement := by
  refine ⟨grounds012Singleton _ transitionFacetDischarged, ?_, ?_, ?_, transitionReportDoesNotSupport.2.2⟩
  · exact (transitionPerformanceCompatible .extend).mpr rfl
  · simp [transitionAchievement, transitionBefore, transitionAfter, Expanded, baseState, extendedState]
  · simp [transitionAchievement, transitionBefore, transitionAfter, Expanded, baseState, inflatedState]

theorem semanticOrder012 : ∀ p q : Claim Bool,
    ∀ r, union (singleton p) (singleton q) r ↔ union (singleton q) (singleton p) r :=
  representationOrderIrrelevant

def clearFalseArgument012 : Articulation Bool :=
  ⟨["the actual switch is on"], singleton (fun w => w = true), [fun w => w = true], fun _ => True⟩

theorem clearFalseReason012 :
    Articulated clearFalseArgument012 ∧ ¬ Models clearFalseArgument012.assumptions false :=
  ⟨⟨by simp [clearFalseArgument012], by simp [clearFalseArgument012]⟩, consistentFalse.2⟩

def valueNeutralRecord012 : Record Bool := ⟨fun _ => true, true⟩

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

def wrongExplanation012 : Implementation := { identityImpl with explanation := fun n => n + 1 }

theorem internalReasonDistinguishes012 :
    (∀ n, identityImpl.run n = wrongExplanation012.run n) ∧
    Feasible identityRequirements identityImpl ∧ Feasible identityRequirements wrongExplanation012 ∧
    Relevant identityRequirements identityImpl (.method .explanation) ∧
    ¬ Relevant identityRequirements wrongExplanation012 (.method .explanation) := by
  refine ⟨fun _ => rfl, identityFeasible, identityFeasible, internalReasons.1, ?_⟩
  intro h
  have bad := h.2 0 trivial
  cases bad

theorem inventoryCases012 : ∀ kind : InventoryKind,
    Available [⟨kind, .copy⟩, ⟨kind, .copy⟩] .copy ∧
    ¬ Available [⟨kind, .copy⟩, ⟨kind, .copy⟩] .successor := by
  intro kind
  simp [Available]


def selfExemptRule012 : ReflexiveRule Nat Nat Bool :=
  ⟨⟨0,1⟩, .assessment, fun _ => True, id,
    fun input output => output = ownArithmeticPrinciple input⟩
def selfExemptPerformed012 (key : PrincipleKey) (target input : Nat) (output : Bool) : Prop :=
  key = ⟨0,1⟩ ∧ target = 1 ∧ input = target ∧ output = ownArithmeticPrinciple input

theorem openSelfExempt012 :
    generationSpecification openPolicy ∧ openPolicy.revisable ⟨.principle,0⟩ ∧
    selfExemptPerformed012 ⟨0,1⟩ 1 1 true ∧
    selfExemptRule012.applicable 0 ∧
    ¬ reflexivitySpecification [selfExemptRule012] (fun target => target = 0) selfExemptPerformed012 := by
  refine ⟨⟨Or.inl rfl, fun _ _ => trivial⟩, trivial, ⟨rfl,rfl,rfl,by decide⟩, trivial, ?_⟩
  intro h
  obtain ⟨outcome, performed, _⟩ := h.2 selfExemptRule012 (by simp) 0 rfl trivial
  cases performed.2.1

theorem ownPhilosophyStatus012 :
    ¬ choiceSpecification CoreReader.Integration.proposalRequirements
      (CoreReader.Integration.currentPhilosophy CoreReader.Integration.actualSystem CoreReader.Integration.actual).implementation
      [.status .standing] ∧
    choiceSpecification CoreReader.Integration.proposalRequirements
      (CoreReader.Integration.currentPhilosophy CoreReader.Integration.actualSystem CoreReader.Integration.actual).implementation
      [.method .output] :=
  ⟨CoreReader.Integration.existingPhilosophyNotPrivileged.2.2.1,
    CoreReader.Integration.existingPhilosophyNotPrivileged.2.2.2.1⟩

def jointContext012 : Context (Bool × Bool) Unit :=
  ⟨emptyTheory, fun _ w => w.2 = true, fun _ => True⟩

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

def tensionContext012 : Context Nat Unit :=
  ⟨emptyTheory, fun _ n => n ≤ 6, fun _ => True⟩

theorem tensionConsistent012 :
    Consistent (union (singleton (fun n : Nat => 4 ≤ n)) (singleton (fun n => n ≤ 6))) tensionContext012 := by
  apply consequenceConsistency
  exact ⟨5, (modelsUnion _ _ _).2 ⟨(modelsSingleton _ _).2 (by decide),
    (modelsSingleton _ _).2 (by decide)⟩, (by intro p hp; cases hp), trivial⟩

theorem qualitativeUnmeasured012 :
    inferentialSpecification (singleton (fun on : Bool => on = true)) (fun on => on ≠ false) ∧
    usesObservation (Facet.inferential (singleton (fun on : Bool => on = true)) (fun on => on ≠ false)) = false := by
  refine ⟨grounds012Singleton _ ⟨⟨true, (modelsSingleton _ _).2 rfl⟩, ?_⟩, rfl⟩
  intro on hon hf
  have ht := (modelsSingleton (fun on : Bool => on = true) on).1 hon
  cases ht.symm.trans hf


theorem allStatusOnly012 : ∀ kind : StatusKind,
    ¬ choiceSpecification identityRequirements identityImpl [.status kind] :=
  statusOnlyFails identityRequirements identityImpl

/- A finite two-draw experiment assigns positive equal weights to both possible
outcomes. It models possibility and a stable conclusion, not empirical claims
about any physical random-number source. -/
def drawWeight012 (_draw : Bool) : Nat := 1
def randomTrial012 (draw : Bool) : Trial :=
  ⟨0, if draw then 1 else 2, if draw then 1 else 2⟩

theorem randomOutcomes012 :
    drawWeight012 true > 0 ∧ drawWeight012 false > 0 ∧
    drawWeight012 true = drawWeight012 false ∧
    Reproduced (randomTrial012 true) (randomTrial012 false) ∧
    (randomTrial012 true).actualOutcome ≠ (randomTrial012 false).actualOutcome ∧
    (∀ draw, Verified (randomTrial012 draw) ∧ Bounded (randomTrial012 draw)) := by
  refine ⟨by decide, by decide, rfl, rfl, by decide, ?_⟩
  intro draw
  cases draw <;> simp [Verified, Bounded, randomTrial012]


/- Original tasks are fixed independently of the candidate substitutions below. -/
def originalGlobalTask012 : AssessmentTask (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) allTrue (fun _ => True)
def originalLocalTask012 : AssessmentTask (Nat → Bool) :=
  .empirical [zeroRecord] (fun _ => True) (fun f => f 0 = true) (fun _ => True)

def circularGlobalFacet012 : Facet (Nat → Bool) := .inferential (singleton allTrue) allTrue

theorem circularGlobalConditional012 : FacetDischarged circularGlobalFacet012 := by
  refine ⟨⟨fun _ => true, (modelsSingleton _ _).2 (fun _ => rfl)⟩, ?_⟩
  intro f hf
  exact (modelsSingleton _ _).1 hf

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

def observedPremises012 : Theory (Nat → Bool) := singleton (fun f => Compatible [zeroRecord] f ∧ True)
def observedInferenceFacet012 : Facet (Nat → Bool) :=
  .inferential observedPremises012 (fun f => f 0 = true)

theorem observedInferenceChecked012 : FacetDischarged observedInferenceFacet012 := by
  refine ⟨⟨localGenerator 0, (modelsSingleton _ _).2 ⟨(zeroCompatible _).2 rfl, trivial⟩⟩, ?_⟩
  intro f hf
  exact (zeroCompatible _).1 ((modelsSingleton _ _).1 hf).1

theorem sameEmpiricalTaskTwoMethods012 :
    Grounds012 (fun f => f 0 = true) canonicalArticulation [localFacet012] originalLocalTask012 ∧
    Grounds012 (fun f => f 0 = true) canonicalArticulation [observedInferenceFacet012] originalLocalTask012 := by
  refine ⟨grounds012Singleton _ localFacetChecked012, ?_⟩
  refine ⟨by simp, ?_⟩
  intro f hf
  cases List.mem_singleton.mp hf
  exact ⟨rfl, canonicalArticulated _ observedInferenceChecked012,
    canonicalFacetArticulated _, observedInferenceChecked012, rfl, rfl, fun _ _ => trivial⟩

/- The second coordinate remains unobserved. Switching assessment form cannot
remove that uncertainty responsibility from the original empirical task. -/
def originalUncertaintyTask012 : AssessmentTask (Bool × Bool) :=
  .empirical [temperatureRecord, temperatureRecord] (fun _ => True)
    (fun w => w.1 = true) (fun w => w.2 = true)
def uncertaintyBypassFacet012 : Facet (Bool × Bool) :=
  .inferential (singleton (fun w => Compatible [temperatureRecord, temperatureRecord] w ∧ True))
    (fun w => w.1 = true)

theorem uncertaintyBypassChecked012 : FacetDischarged uncertaintyBypassFacet012 := by
  refine ⟨⟨(true,false), (modelsSingleton _ _).2 ⟨temperatureCompatible false, trivial⟩⟩, ?_⟩
  intro w hw
  exact ((modelsSingleton _ _).1 hw).1 temperatureRecord (by simp)

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

def selectedFactFacet012 : Facet Bool :=
  .empirical [switchRecord] (fun _ => True) switchPosition.commitment (fun _ => True)

theorem valueFactSubstitutionRejected012 :
    FacetDischarged selectedFactFacet012 ∧ valueSpecification switchPosition ∧
    ¬ Grounds012 switchPosition.commitment canonicalArticulation [selectedFactFacet012] (.value switchPosition) := by
  refine ⟨switchEmpiricalDischarged, valueFulfilled012, ?_⟩
  intro h
  exact (h.2 selectedFactFacet012 (by simp)).2.2.2.2

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


/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.generationCases
organon.charter.overview#p2 sha256 75d7d941d3c07ea748c4a9261d36a75fbd5664ff9c817c4034a9a36a3a12664c
organon.charter.overview#p3 sha256 75d7d941d3c07ea748c4a9261d36a75fbd5664ff9c817c4034a9a36a3a12664c
organon.charter.self-transcendence#p1 sha256 f4ca590e2ae15e3882f70c7b2bc46a8911c97cee547c8b137b5493fbf862c8c0
organon.charter.self-transcendence.orientation#p1 sha256 7f9b85c0816b3d69e417cf3cbe17b7b59931388f84d799ce6730c998037358bf
organon.charter.self-transcendence.non-finality#p1 sha256 4ae4497523e79e0606ab3849c47b6ea16f8888a952e063e6966eb36b750f3df8
organon.charter.self-transcendence.limits#p2 sha256 6dade83f0b7fcc004bdb37b6726c15b31b06a377de4e86d506c9d2e67847029d
organon.relationships.terms#p1 sha256 61cb7ce4f2920f1aa6771502b87a66536ae0504acccfebd9dd23bcc62756eddf
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.generationLimits012
organon.charter.self-transcendence.orientation#p1 sha256 7f9b85c0816b3d69e417cf3cbe17b7b59931388f84d799ce6730c998037358bf
organon.charter.self-transcendence.non-finality#p1 sha256 4ae4497523e79e0606ab3849c47b6ea16f8888a952e063e6966eb36b750f3df8
organon.charter.self-transcendence.limits#p1 sha256 6dade83f0b7fcc004bdb37b6726c15b31b06a377de4e86d506c9d2e67847029d
organon.charter.self-transcendence.limits#p2 sha256 6dade83f0b7fcc004bdb37b6726c15b31b06a377de4e86d506c9d2e67847029d
organon.relationships.roles#p2 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.consistencyCases
organon.charter.consistency#p1 sha256 c6960c590c096d33250599cf418e3c6a1dc26bfc7d7800c82b8efde656950f42
organon.charter.consistency.meaning#p1 sha256 81c09e38a3349499f95401d1c08f6069666c13547a43bc4e4395330743055faa
organon.charter.consistency.meaning#p2 sha256 81c09e38a3349499f95401d1c08f6069666c13547a43bc4e4395330743055faa
organon.charter.consistency.limits#p1 sha256 4fa1c29bf95ad6ef04c6d27671a832c0af8ba31b9c0d8018a8d09c4f33c38e75
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.consistencyLimits012
organon.charter.consistency.meaning#p2 sha256 81c09e38a3349499f95401d1c08f6069666c13547a43bc4e4395330743055faa
organon.charter.consistency.limits#p1 sha256 4fa1c29bf95ad6ef04c6d27671a832c0af8ba31b9c0d8018a8d09c4f33c38e75
organon.relationships.roles#p2 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.reflexivityCases012
organon.charter.reflexivity#p1 sha256 13293b45c2fa89068c68ae7ef3c5df38f0efadb3ef3873d78a5ba67d9691a757
organon.charter.reflexivity.meaning#p1 sha256 8a2caede01a43d8b6c60b54c78ac089c51868e9956f316948077ccee2e45c9cc
organon.charter.reflexivity.limits#p1 sha256 ac0baae0d86e69f84c1ca4dee837de2759e2d29c295ffc257d988962158d4bbc
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.reflexivityLimits012
organon.charter.reflexivity.limits#p1 sha256 ac0baae0d86e69f84c1ca4dee837de2759e2d29c295ffc257d988962158d4bbc
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p1 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.grounds#p1 sha256 4ee74dc8617388ee75d63b507176ecb73b8527758b648f7c588d3ae7f3445ec6
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.groundsCases012
organon.grounds#p1 sha256 4ee74dc8617388ee75d63b507176ecb73b8527758b648f7c588d3ae7f3445ec6
organon.grounds.assessment#p1 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.assessment#p2 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.assessment#p3 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.empiricalCases012
organon.grounds.assessment#p2 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.inferentialCases012
organon.grounds.assessment#p2 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.relationships.roles#p2 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.valueCases012
organon.grounds.assessment#p2 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.assessment#p3 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.groundsLimits012
organon.grounds.assessment#p1 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.assessment#p2 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
organon.grounds.assessment#p3 sha256 ac2f84ce07036731964e26221e6d3ef83c9b647ebe249862eb2bc115856e6e4d
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.scopeCases012
organon.grounds.scope#p1 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
organon.grounds.scope#p2 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
organon.grounds.scope#p3 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
-/
theorem scopeCases012 :
    (scopeSpecification localScopeAccount012) ∧
    ((∀ n : Nat, n = 0 → (fun _ : Nat => true) n = localGenerator 0 n) ∧
    (fun _ : Nat => true) 1 ≠ localGenerator 0 1) :=
  ⟨scopeFulfilled012, hiddenDifference⟩

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.scopeLimits012
organon.grounds.scope#p1 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
organon.grounds.scope#p2 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
organon.grounds.scope#p3 sha256 4a0e93c7834e4ef62f129ee4621cf7bf1c93b64d86f9f145d1592adcf9fb6693
organon.grounds.implementations.limits#p1 sha256 db9b5f1803baab0e1b05a3a9e068948667412afa7d692e1da3869ca54be4b870
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.capabilityCases012
organon.grounds.capabilities#p1 sha256 7249f6f2ef327baaa72349cae53b9245f23a34436356dd05f3c6005cab35e8f0
organon.grounds.capabilities#p2 sha256 7249f6f2ef327baaa72349cae53b9245f23a34436356dd05f3c6005cab35e8f0
organon.relationships.roles#p2 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
theorem capabilityCases012 :
    (capabilitySpecification outputOnlyProcess OutputContract ∧
    capabilitySpecification explainedProcess FullProcessContract ∧
    (∃ certificate : ExternalCertificate outputOnlyProcess,
      certificate.assessorId ≠ certificate.assessedId ∧ OutputContract outputOnlyProcess) ∧
    ¬ ExplanationContract outputOnlyProcess) ∧
    (OwnCapability012 7 7 outputOnlyProcess OutputContract) ∧
    (explainedWithoutVariation012.process = mechanismResponder012.process ∧
    FullProcessContract explainedWithoutVariation012.process ∧
    ¬ UnderstandingApplication012 explainedWithoutVariation012 ∧
    UnderstandingApplication012 mechanismResponder012 ∧
    Grounds012 UnderstandingApplication012 canonicalArticulation
      [understandingFacet012 mechanismResponder012] (understandingTask012 mechanismResponder012) ∧
    ¬ Grounds012 UnderstandingApplication012 canonicalArticulation
      [understandingFacet012 explainedWithoutVariation012] (understandingTask012 explainedWithoutVariation012)) :=
  ⟨capabilityFulfilled012, ownCapability012, understandingApplicationCases012⟩

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.capabilityLimits012
organon.grounds.capabilities#p1 sha256 7249f6f2ef327baaa72349cae53b9245f23a34436356dd05f3c6005cab35e8f0
organon.grounds.capabilities#p2 sha256 7249f6f2ef327baaa72349cae53b9245f23a34436356dd05f3c6005cab35e8f0
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.choiceCases012
organon.grounds.implementations#p1 sha256 bb2a822a304d4a20f513218f356ddbeeca8ee139e3ed802213591e9ff6c5095c
organon.grounds.implementations#p2 sha256 bb2a822a304d4a20f513218f356ddbeeca8ee139e3ed802213591e9ff6c5095c
organon.grounds.implementations.limits#p1 sha256 db9b5f1803baab0e1b05a3a9e068948667412afa7d692e1da3869ca54be4b870
organon.relationships.roles#p3 sha256 24b533c77fe93d0570da65ee361893f2c445842f48ee6f315f99f8abc06a0e5e
-/
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

/- The bundle preserves the full checked propositions of its named component cases. -/
/-- organon-map CoreReader.Adopted.choiceLimits012
organon.grounds.implementations#p1 sha256 bb2a822a304d4a20f513218f356ddbeeca8ee139e3ed802213591e9ff6c5095c
organon.grounds.implementations#p2 sha256 bb2a822a304d4a20f513218f356ddbeeca8ee139e3ed802213591e9ff6c5095c
organon.grounds.implementations.limits#p1 sha256 db9b5f1803baab0e1b05a3a9e068948667412afa7d692e1da3869ca54be4b870
-/
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
