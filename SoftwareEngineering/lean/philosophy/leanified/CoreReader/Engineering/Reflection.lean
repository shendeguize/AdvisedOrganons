import CoreReader.Adopted

namespace CoreReader.Engineering.Reflection

open CoreReader.Agency CoreReader.Adopted

/- A target retains the owner, the actual object and the stage being examined. -/
structure Target (Object : Type) where
  owner : Nat
  object : Object
  phase : Phase

/- A finite assessment contract has actual tests and a scope it claims to cover.
The scope is an application limit, not a universal definition of assessment. -/
structure Contract (W : Type) where
  test : W → Bool
  tested : List W
  claimed : List W

/- Inputs carry the contract belonging to the named target, so another object's
test result cannot silently discharge this target's inquiry. -/
structure Input (W Object : Type) where
  target : Target Object
  contract : Contract W
  requested : List W
  reasons : List String
  basis : Prop

inductive Verdict | supportedWithinScope | counterexample | noSupportingSample
  deriving DecidableEq, Repr

inductive Outcome (W : Type)
  | generated (tests scope : List W)
  | assessed (verdict : Verdict)
  deriving DecidableEq

/- A successful sample does not license the wider scope: an actual failing
instance there changes the assessment to counterexample. -/
def evaluate {W Object : Type} (input : Input W Object) : Verdict :=
  if input.contract.tested.all input.contract.test then
    if input.requested.all input.contract.test then .supportedWithinScope
    else .counterexample
  else .noSupportingSample

/- Generation proposes an expanded test set. Proposal generation does not prove
that the resulting contract passes those tests or warrants adoption. -/
def generate {W Object : Type} (input : Input W Object) : Outcome W :=
  .generated input.requested input.requested

def interpret {W Object : Type} (activity : Activity) (input : Input W Object)
    (outcome : Outcome W) : Prop :=
  input.reasons ≠ [] ∧ input.basis ∧ match activity with
  | .generation => outcome = generate input
  | .assessment => outcome = .assessed (evaluate input)

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

def Model.input {W Object : Type} (m : Model W Object) (t : Target Object) : Input W Object :=
  ⟨t, m.contracts t.object, m.requested t.object t.phase, m.reasons t.object t.phase,
    m.basis t.object t.phase⟩

def Model.self {W Object : Type} (m : Model W Object) (t : Target Object) : Prop :=
  t.owner = m.owner ∧ t.object ∈ m.objects

def Model.rule {W Object : Type} (m : Model W Object) (activity : Activity) :
    ReflexiveRule (Target Object) (Input W Object) (Outcome W) where
  key := ⟨m.owner, match activity with | .generation => 0 | .assessment => 1⟩
  activity := activity
  applicable t := m.self t ∧ match activity with
    | .generation => m.generationApplies t.object t.phase
    | .assessment => m.assessmentApplies t.object t.phase
  input := m.input
  meaning := interpret activity

def Model.rules {W Object : Type} (m : Model W Object) :=
  [m.rule .generation, m.rule .assessment]

/- These are the stated records. The separate follows test compares each stated
outcome with the actual input's evaluation, rather than defining success by its name. -/
def Model.performed {W Object : Type} (m : Model W Object)
    (key : PrincipleKey) (t : Target Object) (input : Input W Object) (outcome : Outcome W) : Prop :=
  m.self t ∧ input = m.input t ∧
    ∃ activity, key = (m.rule activity).key ∧
      outcome = m.recorded activity t.object t.phase

def Model.follows {W Object : Type} (m : Model W Object) : Prop :=
  ∀ activity object phase, object ∈ m.objects →
    (match activity with
      | .generation => m.generationApplies object phase
      | .assessment => m.assessmentApplies object phase) →
    interpret activity (m.input ⟨m.owner, object, phase⟩) (m.recorded activity object phase)

/- This generic implication retains the actual evaluation premise. Concrete
engineering instances must discharge follows separately for their own contracts. -/
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
