namespace CoreReader.Logic

/- A claim denotes the worlds in which its content holds. -/
abbrev Claim (W : Type) := W → Prop
/- A theory is a collection of simultaneously held claims. -/
abbrev Theory (W : Type) := Claim W → Prop
/- A model satisfies every member of the whole theory. -/
def Models {W : Type} (t : Theory W) (w : W) : Prop := ∀ p, t p → p w
/- Semantic entailment quantifies over all models. -/
def Entails {W : Type} (t : Theory W) (p : Claim W) : Prop := ∀ w, Models t w → p w
/- Satisfiability requires an actual witness. -/
def Satisfiable {W : Type} (t : Theory W) : Prop := ∃ w, Models t w
/- Assumptions, meanings and scope are distinct components; questions remain explicit. -/
structure Context (W Q : Type) where
  assumptions : Theory W
  meaning : Q → Claim W
  scope : Claim W
/- Admissible worlds satisfy held claims, assumptions and scope jointly. -/
def Admissible {W Q : Type} (t : Theory W) (c : Context W Q) (w : W) : Prop :=
  Models t w ∧ Models c.assumptions w ∧ c.scope w
/- A negative judgment denies the very same question under the same meaning. -/
def Consequence {W Q : Type} (t : Theory W) (c : Context W Q) (q : Q) (positive : Bool) : Prop :=
  ∀ w, Admissible t c w → if positive then c.meaning q w else ¬ c.meaning q w
/- The consistency obligation prohibits both consequences at one comparison basis. -/
def Consistent {W Q : Type} (t : Theory W) (c : Context W Q) : Prop :=
  ∀ q, ¬ (Consequence t c q true ∧ Consequence t c q false)
/- An inhabited joint interpretation prevents opposite semantic consequences. -/
theorem consequenceConsistency {W Q : Type} (t : Theory W) (c : Context W Q)
    (inhabited : ∃ w, Admissible t c w) : Consistent t c := by
  intro q h
  obtain ⟨w, hw⟩ := inhabited
  exact (h.2 w hw) (h.1 w hw)
/- Empty and singleton theories provide concrete semantic contexts. -/
def emptyTheory {W : Type} : Theory W := fun _ => False
def singleton {W : Type} (p : Claim W) : Theory W := fun q => q = p
def union {W : Type} (a b : Theory W) : Theory W := fun p => a p ∨ b p
theorem modelsSingleton {W : Type} (p : Claim W) (w : W) : Models (singleton p) w ↔ p w := by
  constructor
  · intro h; exact h p rfl
  · intro h q hq; cases hq; exact h
theorem modelsUnion {W : Type} (a b : Theory W) (w : W) :
    Models (union a b) w ↔ Models a w ∧ Models b w := by
  constructor
  · intro h; exact ⟨fun p hp => h p (Or.inl hp), fun p hp => h p (Or.inr hp)⟩
  · rintro ⟨ha,hb⟩ p (hp|hp); exact ha p hp; exact hb p hp
/- The paired world records independent truth values for two questions. -/
def premiseP : Claim (Bool × Bool) := fun w => w.1 = true
def premiseRule : Claim (Bool × Bool) := fun w => w.1 = true → w.2 = true
def premiseNotQ : Claim (Bool × Bool) := fun w => w.2 ≠ true
def jointTheory : Theory (Bool × Bool) :=
  union (singleton premiseP) (union (singleton premiseRule) (singleton premiseNotQ))
/- Each premise has a model, but their joint implication makes the union unsatisfiable. -/
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
/- A retraction replaces the old singleton, rather than retaining both at the same time. -/
def revisionSlice (time : Nat) : Theory Bool :=
  singleton (fun w => w = (time == 0))
/- The initial and revised slices have models; keeping both would create a conflict. -/
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
/- This basic question asks whether the represented switch is on. -/
def onQuestion : Unit → Claim Bool := fun _ w => w = true
def assumptionContext (b : Bool) : Context Bool Unit :=
  ⟨singleton (fun w => w = b), onQuestion, fun _ => True⟩
def meaningContext (b : Bool) : Context Bool Unit :=
  ⟨singleton (fun w => w = true), (fun _ w => w = b), fun _ => True⟩
def scopeContext (b : Bool) : Context Bool Unit :=
  ⟨emptyTheory, onQuestion, fun w => w = b⟩
/- Distinct assumptions, meanings and scopes each admit opposite judgments without same-context conflict. -/
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
/- Snapshots preserve identifiable adopted-form revisions even when semantic content agrees. -/
structure Snapshot (W Q : Type) where
  held : Theory W
  context : Context W Q
  revisionIdentity : Nat
/- Semantic equivalence compares represented content, not its list ordering. -/
def SameContent {W Q : Type} (a b : Snapshot W Q) : Prop :=
  (∀ p, a.held p ↔ b.held p) ∧
  (∀ p, a.context.assumptions p ↔ b.context.assumptions p) ∧
  (∀ q w, a.context.meaning q w ↔ b.context.meaning q w) ∧
  (∀ w, a.context.scope w ↔ b.context.scope w)
/- The reporting norm covers both semantic change and independently identified revisions. -/
def TruthfulReport {W Q : Type} (a b : Snapshot W Q) (reported : Bool) : Prop :=
  (¬ SameContent a b ∨ a.revisionIdentity ≠ b.revisionIdentity) → reported = true
/- A real represented change and compliance entail an acknowledged change. -/
theorem semanticChangeMustBeReported {W Q : Type} (a b : Snapshot W Q) (reported : Bool)
    (changed : ¬ SameContent a b ∨ a.revisionIdentity ≠ b.revisionIdentity)
    (h : TruthfulReport a b reported) : reported = true := h changed
/- Reordering a two-claim presentation preserves the held theory extension. -/
theorem representationOrderIrrelevant {W : Type} (p q : Claim W) :
    ∀ r, union (singleton p) (singleton q) r ↔ union (singleton q) (singleton p) r := by
  intro r; exact or_comm
def contextSnapshot (c : Context Bool Unit) (revision : Nat := 0) : Snapshot Bool Unit :=
  ⟨emptyTheory, c, revision⟩
/- Hiding each kind of contextual change violates the reporting interface; reporting alone supplies no truth guarantee. -/
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
/- Two nonidentical resource objectives can share a feasible allocation. -/
theorem tensionWithoutContradiction :
    (∃ budget : Nat, 4 ≤ budget ∧ budget ≤ 6) ∧
    ¬ ((fun n : Nat => 4 ≤ n) = (fun n : Nat => n ≤ 6)) := by
  refine ⟨⟨5, by decide, by decide⟩, ?_⟩
  intro h; have k := congrFun h 0; have bad : 4 ≤ 0 := k.mpr (by decide); cases bad
/- Conflicting conclusions cannot be retained under the same consistency obligation. -/
theorem conflictRequiresChange {W Q : Type} (t : Theory W) (c : Context W Q) (q : Q)
    (positive : Consequence t c q true) (negative : Consequence t c q false) :
    ¬ Consistent t c := fun h => h q ⟨positive,negative⟩
/- A satisfiable theory can have a false assumption at a specified actual world. -/
theorem consistentFalse : Satisfiable (singleton (fun w : Bool => w = true)) ∧
    ¬ Models (singleton (fun w : Bool => w = true)) false := by
  refine ⟨⟨true, (modelsSingleton _ _).2 rfl⟩, ?_⟩
  intro h; have bad := (modelsSingleton _ _).1 h; cases bad
/- The explicitly asked on/off question is undecided by the empty but inhabited theory. -/
theorem consistentIncomplete : Satisfiable (emptyTheory : Theory Bool) ∧
    ¬ Entails emptyTheory (fun w : Bool => w = true) ∧
    ¬ Entails emptyTheory (fun w : Bool => w ≠ true) := by
  have empty : ∀ w : Bool, Models emptyTheory w := by intro w p hp; cases hp
  refine ⟨⟨true, empty true⟩, ?_, ?_⟩
  · intro h; have bad := h false (empty false); cases bad
  · intro h; exact h true (empty true) rfl
/- A claim can share a model with a theory without following in every model. -/
theorem compatibilityNotEntailment :
    Satisfiable (union emptyTheory (singleton (fun w : Bool => w = true))) ∧
    ¬ Entails emptyTheory (fun w : Bool => w = true) := by
  refine ⟨⟨true, (modelsUnion _ _ _).2 ⟨?_, (modelsSingleton _ _).2 rfl⟩⟩,
    consistentIncomplete.2.1⟩
  intro p hp; cases hp

end CoreReader.Logic
