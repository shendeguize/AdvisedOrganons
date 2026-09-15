import Std

namespace CoreReader.Engineering

/- This is a bounded engineering application model. Work units count explicit
operations; they are not a universal exchange rate or empirical forecast. -/
inductive Maintainer where
  | original | successor | agent
  deriving DecidableEq, Repr
inductive Tool where
  | editor | compiler | contractRunner | migrationRunner
  deriving DecidableEq, Repr
inductive Knowledge where
  | privateLayout | publicContract | changeGuide | migrationGuide
  deriving DecidableEq, Repr
inductive Change where
  | addition | replacement | deletion | withdrawal | redrawing | migration
  | independent | coordinated | designRevision | other (name : String)
  deriving DecidableEq, Repr
inductive Candidate where
  | presentSimple | evolvable | maximal
  deriving DecidableEq, Repr
inductive Burden where
  | understanding | construction | diagnosis | verification | coordination
  | operation | migration
  deriving DecidableEq, Repr

def maintainers : List Maintainer := [.original, .successor, .agent]
def changes : List Change := [.addition, .replacement, .deletion, .withdrawal,
  .redrawing, .migration, .independent, .coordinated, .designRevision]
def burdens : List Burden := [.understanding, .construction, .diagnosis,
  .verification, .coordination, .operation, .migration]

structure Activity where
  participants : List Maintainer
  software : String
  tools : List Tool
  available : Maintainer → List Knowledge
  scheduledReleases : Nat
  scheduledMaintenance : Nat
  boundedRuns : Option Nat
  label : String

/-- organon-map CoreReader.Engineering.ActivityScope
software-engineering.purpose#p1 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.purpose#p2 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.purpose#p3 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
-/
abbrev ActivityScope (a : Activity) : Prop :=
  a.participants ≠ [] ∧ a.software ≠ "" ∧ a.tools ≠ [] ∧
  a.participants.all (fun m => !(a.available m).isEmpty) = true

abbrev Continuing (a : Activity) : Prop :=
  0 < a.scheduledReleases ∧ 0 < a.scheduledMaintenance

abbrev BoundedLifecycle (a : Activity) : Prop :=
  a.boundedRuns.isSome = true ∧ a.scheduledReleases = 0 ∧
  a.scheduledMaintenance = 0

def continuingActivity : Activity := {
  participants := maintainers, software := "order-preserving queue",
  tools := [.editor, .compiler, .contractRunner, .migrationRunner],
  available := fun m => match m with
    | .original => [.privateLayout, .publicContract, .changeGuide, .migrationGuide]
    | _ => [.publicContract, .changeGuide, .migrationGuide],
  scheduledReleases := 3, scheduledMaintenance := 6,
  boundedRuns := none, label := "temporary" }

def temporaryActivity : Activity := { continuingActivity with
  scheduledReleases := 0, scheduledMaintenance := 0, boundedRuns := some 1,
  label := "one-shot import" }
def prototypeActivity : Activity := { temporaryActivity with
  boundedRuns := some 4, label := "bounded prototype" }
def retiringActivity : Activity := { temporaryActivity with
  boundedRuns := some 2, label := "retiring service" }

structure EditStep where
  component : Nat
  requires : Knowledge
  tool : Tool
  units : Nat
  deriving DecidableEq, Repr

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

def changeWork (c : Candidate) (d : Change) : Nat :=
  ((changePath c d).map EditStep.units).sum

abbrev CanChange (a : Activity) (c : Candidate) (m : Maintainer) (d : Change) : Prop :=
  (changePath c d) ≠ [] ∧ m ∈ a.participants ∧ (changePath c d).all
    (fun step => (a.available m).contains step.requires && a.tools.contains step.tool) = true

abbrev ContinuingCapability (a : Activity) (c : Candidate) (d : Change) : Prop :=
  (changePath c d) ≠ [] ∧ a.participants.all (fun m => (changePath c d).all
    (fun step => (a.available m).contains step.requires && a.tools.contains step.tool)) = true

/- Maximal is maximal only on this explicitly registered finite set. The
extra CSV direction has an actual documented compilation path and later state
transformation; unsupported names do not gain a capability from an empty path. -/
def registeredDirections : List Change := changes ++ [.other "csv export"]
def supportedDirections (a : Activity) (c : Candidate) : List Change :=
  registeredDirections.filter (fun d => decide (ContinuingCapability a c d))
abbrev MaximumRegisteredCapability (a : Activity) (c : Candidate) : Prop :=
  registeredDirections.all (fun d => decide (ContinuingCapability a c d)) = true

/- A software value here is a passive function: no intention is stored in it.
An engineering intention is an agent's selected set of changes. -/
def passiveArtifact (xs : List Nat) : List Nat := xs

def orientation : Maintainer → List Change := fun _ => [.designRevision, .migration]

inductive EngineeringAction where
  | propose (direction : Change)
  | execute (result : List Nat)
  deriving DecidableEq, Repr

def maintainerActions (m : Maintainer) : List EngineeringAction :=
  (orientation m).map EngineeringAction.propose

def artifactActions (input : List Nat) : List EngineeringAction :=
  [.execute (passiveArtifact input)]

/-- organon-map CoreReader.Engineering.subjectLifecycleCases
software-engineering.purpose#p1 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.purpose#p2 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.purpose#p3 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
-/
theorem subjectLifecycleCases :
    ActivityScope continuingActivity ∧
    CanChange continuingActivity .evolvable .successor .designRevision ∧
    CanChange continuingActivity .evolvable .agent .designRevision ∧
    continuingActivity.label = "temporary" ∧ Continuing continuingActivity ∧
    ¬ BoundedLifecycle continuingActivity ∧ BoundedLifecycle temporaryActivity ∧
    BoundedLifecycle prototypeActivity ∧ BoundedLifecycle retiringActivity := by decide

/-- organon-map CoreReader.Engineering.subjectLimits
software-engineering.purpose#p1 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.purpose#p2 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.purpose#p3 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
-/
theorem subjectLimits :
    CanChange continuingActivity .presentSimple .original .designRevision ∧
    ¬ CanChange continuingActivity .presentSimple .successor .designRevision ∧
    ¬ ContinuingCapability continuingActivity .presentSimple .designRevision ∧
    continuingActivity.label = "temporary" ∧ ¬ BoundedLifecycle continuingActivity ∧
    orientation .agent ≠ [] ∧ passiveArtifact [2, 1] = [2, 1] ∧
    EngineeringAction.propose .designRevision ∈ maintainerActions .agent ∧
    EngineeringAction.propose .designRevision ∉ artifactActions [2, 1] := by decide

/- Ground is intentionally parameterized: the examples below do not exhaust
possible sources of credibility. The supplied support relation needs review. -/
/-- organon-map CoreReader.Engineering.CredibleDirection
software-engineering.evolution-priority#p2 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
-/
abbrev CredibleDirection {Ground : Type} (grounds : List Ground)
    (articulated : Ground → Bool) (supports : Ground → Change → Bool)
    (d : Change) : Prop :=
  grounds.any (fun g => articulated g && supports g d) = true

inductive DirectionGround where
  | plan (release : Nat) (committed : List Change)
  | knowledge (service : String) (affected : List Change) (mechanism : String)
  | history (service : String) (observed : List Change)
  | other (account : String) (supported : List Change)
  deriving DecidableEq, Repr

def articulateGround : DirectionGround → Bool
  | .plan release ds => release > 0 && !ds.isEmpty
  | .knowledge service ds mechanism => service != "" && !ds.isEmpty && mechanism != ""
  | .history service ds => service != "" && !ds.isEmpty
  | .other account ds => account != "" && !ds.isEmpty

def supportGround : DirectionGround → Change → Bool
  | .plan release ds, d => release > 0 && ds.contains d
  | .knowledge service ds mechanism, d =>
    service == "queue" && mechanism == "tenant-config-reload" && ds.contains d
  | .history service ds, d => service == "queue" && (ds.filter (· == d)).length >= 2
  | .other account ds, d => account == "reviewed customer migration requirement" && ds.contains d

abbrev initialGrounds : List DirectionGround := [.plan 2 [.designRevision, .migration]]
def forecastGrounds : List DirectionGround := [.plan 3 [.deletion]]
abbrev credible (gs : List DirectionGround) (d : Change) : Prop :=
  CredibleDirection gs articulateGround supportGround d

abbrev WarrantedAccommodation (gs : List DirectionGround) (d : Change)
    (objectiveGain investment : Nat) : Prop :=
  credible gs d ∧ 0 < objectiveGain ∧ investment ≤ objectiveGain

/-- organon-map CoreReader.Engineering.credibilityCases
software-engineering.evolution-priority#p2 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
-/
theorem credibilityCases :
    credible initialGrounds .designRevision ∧
    credible [.knowledge "queue" [.designRevision] "tenant-config-reload"] .designRevision ∧
    credible [.history "queue" [.migration, .migration]] .migration ∧
    ¬ credible [] (.other "quantum backend") ∧
    credible forecastGrounds .deletion ∧ ¬ credible forecastGrounds .designRevision := by decide

def abstractionComplexity : Candidate → Nat
  | .presentSimple => 1 | .evolvable => 3 | .maximal => 30

def implementedVariants : List Candidate := [.presentSimple]

/- No scalar conversion across burden dimensions is used by the priority rule. -/
structure CostVector where
  amount : Burden → Nat
structure CostLimits where
  capacity : Burden → Nat
  objective : Burden → String

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

structure Requirements where
  orderRequired : Bool
  maxUnsafeOperations : Nat
  maxLatency : Nat
  minRetention : Nat

def normalRequirements : Requirements := ⟨true, 0, 10, 30⟩
def behavior : Candidate → List Nat → List Nat := fun _ xs => xs.eraseDups

/- Candidate profiles are observations in this bounded scenario. Modified
profiles below test all four independent necessary-requirement gates. -/
structure CandidateProfile where
  orderOutput : List Nat
  unsafeOperations : Nat
  latency : Nat
  retention : Nat

def profile (c : Candidate) : CandidateProfile := ⟨behavior c [2, 1, 2], 0, 5, 30⟩
abbrev Meets (r : Requirements) (p : CandidateProfile) : Prop :=
  (r.orderRequired = true → p.orderOutput = [2, 1]) ∧
  p.unsafeOperations ≤ r.maxUnsafeOperations ∧ p.latency ≤ r.maxLatency ∧
  r.minRetention ≤ p.retention

structure Context where
  activity : Activity
  required : Requirements
  evidence : List DirectionGround
  limits : CostLimits
  departure : Option Burden
  profiles : Candidate → CandidateProfile := profile

def currentContinuing : Context := {
  activity := continuingActivity, required := normalRequirements,
  evidence := initialGrounds, limits := normalLimits, departure := none }

abbrev ConcreteThreat (ctx : Context) (c : Candidate) (b : Burden) : Prop :=
  cost .presentSimple b < cost c b ∧ ctx.limits.capacity b < cost c b ∧
  ctx.limits.objective b ≠ ""

abbrev HasThreat (ctx : Context) (c : Candidate) : Prop :=
  burdens.any (fun b => decide (ConcreteThreat ctx c b)) = true

/-- organon-map CoreReader.Engineering.JustifiedDeparture
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
-/
abbrev JustifiedDeparture (ctx : Context) (c : Candidate) : Prop :=
  match ctx.departure with
  | none => False
  | some b => ConcreteThreat ctx c b

instance (ctx : Context) (c : Candidate) : Decidable (JustifiedDeparture ctx c) := by
  unfold JustifiedDeparture
  split <;> infer_instance

abbrev PriorityConditions (ctx : Context) : Prop :=
  Continuing ctx.activity ∧ ActivityScope ctx.activity ∧
  Meets ctx.required (ctx.profiles .presentSimple) ∧ Meets ctx.required (ctx.profiles .evolvable) ∧
  credible ctx.evidence .designRevision ∧
  ContinuingCapability ctx.activity .evolvable .designRevision ∧
  changeWork .evolvable .designRevision < changeWork .presentSimple .designRevision ∧
  abstractionComplexity .presentSimple < abstractionComplexity .evolvable

/-- organon-map CoreReader.Engineering.EvolutionPriority
software-engineering.purpose#p3 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.evolution-priority#p1 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p2 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
-/
abbrev EvolutionPriority (ctx : Context) (chosen : Candidate) : Prop :=
  PriorityConditions ctx → chosen = .evolvable ∨ JustifiedDeparture ctx .evolvable

theorem currentPriorityConditions : PriorityConditions currentContinuing := by decide
theorem currentNoThreat : ¬ HasThreat currentContinuing .evolvable ∧
    ¬ JustifiedDeparture currentContinuing .evolvable := by decide

def threatened (b : Burden) : Context := { currentContinuing with
  limits := { normalLimits with capacity := fun x => if x = b then 1 else 12 },
  departure := some b }

/-- organon-map CoreReader.Engineering.priorityWhenApplicable
software-engineering.evolution-priority#p1 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p2 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
-/
theorem priorityWhenApplicable (ctx : Context) (chosen : Candidate)
    (rule : EvolutionPriority ctx chosen) (applicable : PriorityConditions ctx)
    (noDeparture : ¬ JustifiedDeparture ctx .evolvable) :
    chosen = .evolvable ∧
      abstractionComplexity .presentSimple < abstractionComplexity chosen := by
  have hc := (rule applicable).resolve_right noDeparture
  exact ⟨hc, hc ▸ applicable.2.2.2.2.2.2.2⟩

theorem currentSimpleViolates : ¬ EvolutionPriority currentContinuing .presentSimple := by
  intro h
  have bad := (h currentPriorityConditions).resolve_right currentNoThreat.2
  cases bad

def withEvolvableProfile (p : CandidateProfile) : Context := { currentContinuing with
  profiles := fun c => if c = .evolvable then p else profile c }

theorem unmetRequirementsBlockPriority :
    ¬ PriorityConditions (withEvolvableProfile { profile .evolvable with orderOutput := [1, 2] }) ∧
    ¬ PriorityConditions (withEvolvableProfile { profile .evolvable with unsafeOperations := 1 }) ∧
    ¬ PriorityConditions (withEvolvableProfile { profile .evolvable with latency := 11 }) ∧
    ¬ PriorityConditions (withEvolvableProfile { profile .evolvable with retention := 29 }) := by
  simp [PriorityConditions, withEvolvableProfile, currentContinuing, Meets,
    normalRequirements]

/-- organon-map CoreReader.Engineering.priorityConditionsCases
software-engineering.purpose#p3 sha256 946a96680b1a00867f58e7921588e5a56e79b336ba3d322b8aef1122cc75a60b
software-engineering.evolution-priority#p1 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p2 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
-/
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

/-- organon-map CoreReader.Engineering.priorityChoices
software-engineering.evolution-priority#p1 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p2 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
-/
theorem priorityChoices :
    EvolutionPriority currentContinuing .evolvable ∧
    ¬ EvolutionPriority currentContinuing .presentSimple ∧
    EvolutionPriority (threatened .verification) .presentSimple := by
  exact ⟨by decide, currentSimpleViolates, by decide⟩

/-- organon-map CoreReader.Engineering.credibilityLimits
software-engineering.evolution-priority#p2 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
-/
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

/-- organon-map CoreReader.Engineering.costCases
software-engineering.evolution-priority#p3 sha256 c2237515e869b2f88269cf19e3c97ef80c3c87342d1a03cd911cac03fe5a3a04
-/
theorem costCases :
    JustifiedDeparture (threatened .understanding) .evolvable ∧
    JustifiedDeparture (threatened .construction) .evolvable ∧
    JustifiedDeparture (threatened .diagnosis) .evolvable ∧
    JustifiedDeparture (threatened .verification) .evolvable ∧
    JustifiedDeparture (threatened .coordination) .evolvable ∧
    JustifiedDeparture (threatened .operation) .evolvable ∧
    JustifiedDeparture (threatened .migration) .evolvable ∧
    ¬ JustifiedDeparture { currentContinuing with departure := some .migration } .evolvable := by decide

/- Total functions model an identified order-preserving de-duplication API.
The test corpus is explicitly finite; universal preservation is separate. -/
def orderedUnique (xs : List Nat) : List Nat := xs.eraseDups
def orderedRefactor (xs : List Nat) : List Nat := xs.eraseDups ++ []
def insertOrdered (n : Nat) : List Nat → List Nat
  | [] => [n]
  | x :: xs => if n ≤ x then n :: x :: xs else x :: insertOrdered n xs

def sortValues : List Nat → List Nat
  | [] => []
  | x :: xs => insertOrdered x (sortValues xs)

def sortedUnique (xs : List Nat) : List Nat := (sortValues xs).eraseDups

structure SoftwareState where
  capabilities : List String
  implementation : Nat
  mechanisms : List String
  abstractions : List String
  boundary : Nat
  technology : String
  batchSize : Nat
  deriving DecidableEq, Repr

def originalSoftware : SoftwareState :=
  ⟨["deduplicate"], 0, ["queue", "legacy cache"], ["fixed batch"], 0, "legacy store", 10⟩

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

def evolutionBehavior (d : Change) : List Nat → List Nat :=
  if d = .redrawing ∨ d = .designRevision then sortedUnique else orderedUnique

/- Changes include an open other constructor. Work, maintainer knowledge and
obligation treatment are separate dimensions, not one extensibility score. -/
inductive ObligationTreatment where
  | preserve | revise
  deriving DecidableEq, Repr
structure ChangeClaim where
  direction : Change
  byMaintainer : Maintainer
  treatment : ObligationTreatment

abbrev contractInputs : List (List Nat) := [[], [2, 1, 2], [1, 3, 1], [4, 4]]
def PreservesOn {Input Output : Type} (scope : Input → Prop)
    (old new : Input → Output) : Prop := ∀ x, scope x → new x = old x

abbrev PreservesFinite (old new : List Nat → List Nat) : Prop :=
  contractInputs.all (fun xs => new xs == old xs) = true

/- The actual contracts and observer dependencies are inputs independent of
any revision report. Reports cannot redefine the affected population or the
old/new retry behavior merely by changing their own fields. -/
structure ObservableContract where
  order : List Nat → List Nat
  maxAttempts : Nat

def retry (contract : ObservableContract) (attempts : Nat) : Bool :=
  attempts < contract.maxAttempts

def orderContract (order : List Nat → List Nat) : ObservableContract := ⟨order, 3⟩
def originalContract : ObservableContract := orderContract orderedUnique
def refactoredContract : ObservableContract := orderContract orderedRefactor
def revisedContract : ObservableContract := ⟨sortedUnique, 5⟩
def evolutionContract (d : Change) : ObservableContract :=
  ⟨evolutionBehavior d, if d = .redrawing ∨ d = .designRevision then 5 else 3⟩

def failureInputs : List Nat := [0, 1, 2, 3, 4, 5]
abbrev PreservesContractFinite (old new : ObservableContract) : Prop :=
  PreservesFinite old.order new.order ∧
  failureInputs.all (fun attempts => retry new attempts == retry old attempts) = true

inductive ContractAspect where
  | order | retry
  deriving DecidableEq, Repr
structure PartyDependency where
  party : String
  observes : ContractAspect
  deriving DecidableEq, Repr

def partyDependencies : List PartyDependency :=
  [⟨"queue consumer", .order⟩, ⟨"queue operator", .retry⟩]

def aspectChanged (old new : ObservableContract) : ContractAspect → Bool
  | .order => contractInputs.any (fun xs => new.order xs != old.order xs)
  | .retry => failureInputs.any (fun attempts => retry new attempts != retry old attempts)

def affectedParties (old new : ObservableContract) : List String :=
  (partyDependencies.filter (fun dependency => aspectChanged old new dependency.observes)).map
    PartyDependency.party

structure ContractRevision where
  deliberate : Bool
  revisedOrder : List Nat
  affected : List String
  oldFailureLimit : Nat
  newFailureLimit : Nat
  recordedOldFailureLimit : Nat
  recordedNewFailureLimit : Nat
  procedure : String

def normalRevision : ContractRevision := {
  deliberate := true, revisedOrder := [1, 2],
  affected := ["queue consumer", "queue operator"],
  oldFailureLimit := 3, newFailureLimit := 5,
  recordedOldFailureLimit := 3, recordedNewFailureLimit := 5,
  procedure := "contract review" }

abbrev RevisionDuties (old new : ObservableContract) (r : ContractRevision) : Prop :=
  r.deliberate = true ∧ r.revisedOrder = new.order [2, 1, 2] ∧
  (affectedParties old new).all (fun p => r.affected.contains p) = true ∧
  r.oldFailureLimit = old.maxAttempts ∧ r.newFailureLimit = new.maxAttempts ∧
  r.recordedOldFailureLimit = old.maxAttempts ∧
  r.recordedNewFailureLimit = new.maxAttempts

/-- organon-map CoreReader.Engineering.ContractChangeAccount
software-engineering.structural-judgment#p3 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
-/
abbrev ContractChangeAccount (old new : ObservableContract) (r : ContractRevision) : Prop :=
  PreservesContractFinite old new ∨ RevisionDuties old new r

/-- organon-map CoreReader.Engineering.EvolutionClaim
software-engineering.evolution-meaning#p1 sha256 c3fa878716f4370ebd1d352d2c135255695cfec6e1d33900a184cb46acb80bf6
software-engineering.evolution-meaning#p2 sha256 c3fa878716f4370ebd1d352d2c135255695cfec6e1d33900a184cb46acb80bf6
-/
abbrev EvolutionClaim (a : Activity) (c : Candidate) (claim : ChangeClaim) : Prop :=
  CanChange a c claim.byMaintainer claim.direction ∧
  ContractChangeAccount originalContract (evolutionContract claim.direction) normalRevision ∧
  (changePath c claim.direction).any (fun step => step.tool == .contractRunner) = true ∧
  ((claim.treatment = .preserve ∧
      evolutionBehavior claim.direction [2, 1, 2] = orderedUnique [2, 1, 2]) ∨
    (claim.treatment = .revise ∧
      evolutionBehavior claim.direction [2, 1, 2] ≠ orderedUnique [2, 1, 2]))

/-- organon-map CoreReader.Engineering.evolutionKindsCases
software-engineering.evolution-meaning#p1 sha256 c3fa878716f4370ebd1d352d2c135255695cfec6e1d33900a184cb46acb80bf6
software-engineering.evolution-meaning#p2 sha256 c3fa878716f4370ebd1d352d2c135255695cfec6e1d33900a184cb46acb80bf6
-/
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

/-- organon-map CoreReader.Engineering.evolutionDimensionsLimits
software-engineering.evolution-meaning#p1 sha256 c3fa878716f4370ebd1d352d2c135255695cfec6e1d33900a184cb46acb80bf6
software-engineering.evolution-meaning#p2 sha256 c3fa878716f4370ebd1d352d2c135255695cfec6e1d33900a184cb46acb80bf6
-/
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

theorem oneDimensionDoesNotEntailEveryDimension :
    changeWork .evolvable .designRevision < changeWork .presentSimple .designRevision ∧
    ¬ (∀ d : Change, changeWork .evolvable d < changeWork .presentSimple d) := by
  refine ⟨by decide, ?_⟩
  intro allDirections
  exact (by decide : ¬ changeWork .evolvable .addition < changeWork .presentSimple .addition)
    (allDirections .addition)

def propagation (c : Candidate) (d : Change) : List Nat :=
  ((changePath c d).map EditStep.component).eraseDups

def batchCount (items size : Nat) : Nat := (items + size - 1) / size
def staticBatch (items _runtimeSize : Nat) : Nat := batchCount items 10
def liveBatch (items runtimeSize : Nat) : Nat := batchCount items runtimeSize

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

def structuralEvidence (c : Candidate) (d : Change) : StructuralEvidence := {
  intended := d, participants := maintainers, touched := propagation c d,
  contractObservations := contractInputs,
  observedBefore := contractInputs.map orderedUnique,
  observedAfter := contractInputs.map (evolutionBehavior d),
  understandingWork := changeWork c d,
  verificationWork := ((changePath c d).filter (fun step => step.tool == .contractRunner)).length,
  boundaryGain := changeWork .presentSimple d - changeWork c d }

/-- organon-map CoreReader.Engineering.StructuralAccount
software-engineering.structural-judgment#p1 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
software-engineering.structural-judgment#p2 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
-/
abbrev StructuralAccount (a : Activity) (c : Candidate) (e : StructuralEvidence) : Prop :=
  e.participants = a.participants ∧ e.touched = propagation c e.intended ∧
  e.contractObservations = contractInputs ∧
  e.observedBefore = contractInputs.map orderedUnique ∧
  e.observedAfter = contractInputs.map (evolutionBehavior e.intended) ∧
  e.understandingWork = changeWork c e.intended ∧
  e.verificationWork = ((changePath c e.intended).filter
    (fun step => step.tool == .contractRunner)).length ∧
  e.boundaryGain = changeWork .presentSimple e.intended - changeWork c e.intended

structure InterfaceView where
  signature : String
  modules : Nat
  extensionPoints : Nat
  principle : String
  deriving DecidableEq, Repr

def sameShape : InterfaceView := ⟨"List Nat → List Nat", 8, 12, "dependency inversion"⟩
def moduleAssumptions : List (Nat × Nat) :=
  (List.range 8).map (fun component => (component, 10))

def modulesNeedingRevision (newSize : Nat) : List Nat :=
  (moduleAssumptions.filter (fun p => p.2 != newSize)).map Prod.fst

structure Boundary where
  caller : Nat
  callee : Nat
  contract : String
  deriving DecidableEq, Repr

structure EngineeringDesign where
  metadata : InterfaceView
  run : List Nat → List Nat
  paths : Change → List EditStep
  components : List Nat
  boundaries : List Boundary
  batchAssumptions : List (Nat × Nat)

def privateDesign : EngineeringDesign := {
  metadata := sameShape, run := orderedUnique, paths := changePath .presentSimple,
  components := List.range 8, boundaries := [], batchAssumptions := moduleAssumptions }

def documentedDesign : EngineeringDesign := {
  privateDesign with paths := changePath .evolvable }

def sortedDesign : EngineeringDesign := { documentedDesign with run := sortedUnique }

/- This application has a caller at component 2 and a callee at component 1.
Editing the callee crosses that actual edge. The caller must recheck the
observable order contract in this finite case; the contract name alone is not
evidence that either the verification work or the observable equality holds. -/
def coordinatedBoundary : Boundary := ⟨2, 1, "order-preserving queue"⟩

def boundaryDesign : EngineeringDesign :=
  { documentedDesign with boundaries := [coordinatedBoundary] }

def crossesBoundary (design : EngineeringDesign) (direction : Change) (edge : Boundary) : Bool :=
  design.boundaries.contains edge && design.components.contains edge.caller &&
    design.components.contains edge.callee && edge.caller != edge.callee &&
    (design.paths direction).any (fun step => step.component == edge.callee &&
      (step.tool == .editor || step.tool == .compiler))

def boundaryObligationChecked (design : EngineeringDesign) (direction : Change)
    (edge : Boundary) : Bool :=
  crossesBoundary design direction edge &&
    (design.paths direction).any (fun step => step.component == edge.caller &&
      step.tool == .contractRunner && step.requires == .publicContract) &&
    decide (PreservesFinite orderedUnique design.run)

def omittedCallerCheck : EngineeringDesign :=
  { boundaryDesign with paths := fun direction =>
      (boundaryDesign.paths direction).filter (fun step =>
        !(step.component == coordinatedBoundary.caller && step.tool == .contractRunner)) }

def otherCalleeBoundary : Boundary := { coordinatedBoundary with callee := 7 }

def otherCalleeDesign : EngineeringDesign :=
  { boundaryDesign with boundaries := [otherCalleeBoundary] }

theorem actualCrossBoundaryObligation :
    crossesBoundary boundaryDesign .coordinated coordinatedBoundary = true ∧
    boundaryObligationChecked boundaryDesign .coordinated coordinatedBoundary = true ∧
    crossesBoundary omittedCallerCheck .coordinated coordinatedBoundary = true ∧
    boundaryObligationChecked omittedCallerCheck .coordinated coordinatedBoundary = false ∧
    crossesBoundary otherCalleeDesign .coordinated otherCalleeBoundary = false ∧
    boundaryObligationChecked { boundaryDesign with run := sortedUnique }
      .coordinated coordinatedBoundary = false := by decide

/-- organon-map CoreReader.Engineering.structuralCases
software-engineering.structural-judgment#p1 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
software-engineering.structural-judgment#p2 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
-/
theorem structuralCases :
    StructuralAccount continuingActivity .evolvable (structuralEvidence .evolvable .designRevision) ∧
    (propagation .presentSimple .designRevision).length = 3 ∧
    (propagation .evolvable .designRevision).length = 2 ∧
    (changePath .evolvable .coordinated).any (fun s => s.component == 2 && s.requires == .publicContract) = true ∧
    PreservesFinite orderedUnique orderedRefactor ∧
    (structuralEvidence .evolvable .designRevision).observedBefore ≠
      (structuralEvidence .evolvable .designRevision).observedAfter ∧
    staticBatch 21 10 = liveBatch 21 10 ∧ staticBatch 21 5 ≠ liveBatch 21 5 ∧
    changeWork .presentSimple .withdrawal = 17 ∧
    (crossesBoundary boundaryDesign .coordinated coordinatedBoundary = true ∧
      boundaryObligationChecked boundaryDesign .coordinated coordinatedBoundary = true ∧
      crossesBoundary omittedCallerCheck .coordinated coordinatedBoundary = true ∧
      boundaryObligationChecked omittedCallerCheck .coordinated coordinatedBoundary = false ∧
      crossesBoundary otherCalleeDesign .coordinated otherCalleeBoundary = false ∧
      boundaryObligationChecked { boundaryDesign with run := sortedUnique }
        .coordinated coordinatedBoundary = false) := by decide

abbrev DesignCanChange (a : Activity) (design : EngineeringDesign)
    (m : Maintainer) (d : Change) : Prop :=
  design.paths d ≠ [] ∧ m ∈ a.participants ∧
  (design.paths d).all (fun step =>
    (a.available m).contains step.requires && a.tools.contains step.tool) = true

def designWork (design : EngineeringDesign) (d : Change) : Nat :=
  ((design.paths d).map EditStep.units).sum

def designModulesNeedingRevision (design : EngineeringDesign) (newSize : Nat) : List Nat :=
  (design.batchAssumptions.filter (fun p => p.2 != newSize)).map Prod.fst

/- In this finite model, a facade adds an actual component, forwarding edge
and contract verification step. It preserves observable order but does not
remove the original edit/compilation work or supply private maintainer knowledge. -/
def introduceBoundary (design : EngineeringDesign) : EngineeringDesign := {
  metadata := { design.metadata with modules := design.metadata.modules + 1, extensionPoints := design.metadata.extensionPoints + 1 },
  run := fun xs => design.run (xs ++ []),
  paths := fun d => if (design.paths d).isEmpty then [] else
    design.paths d ++ [⟨design.components.length, .publicContract, .contractRunner, 1⟩],
  components := design.components ++ [design.components.length],
  boundaries := design.boundaries ++
    [⟨design.components.length, 0, design.metadata.signature⟩],
  batchAssumptions := design.batchAssumptions }

def wrappedDesign : EngineeringDesign := introduceBoundary privateDesign

/- This second facade relocates the existing contract-verification work to
the new component. It changes the actual boundary and step locations without
reducing the work or making the private edit knowledge public. -/
def relocateVerification (design : EngineeringDesign) : EngineeringDesign := {
  introduceBoundary design with
  paths := fun d => (design.paths d).map (fun step =>
    if step.tool = .contractRunner then { step with component := design.components.length }
    else step) }

def sameWorkDesign : EngineeringDesign := relocateVerification privateDesign

/-- organon-map CoreReader.Engineering.structureNotCapability
software-engineering.structural-judgment#p1 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
software-engineering.structural-judgment#p2 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
-/
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

/-- organon-map CoreReader.Engineering.contractPreservation
software-engineering.structural-judgment#p3 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
-/
theorem contractPreservation {Input Output : Type} (scope : Input → Prop)
    (old new : Input → Output) (observations : ∀ x, scope x → new x = old x) :
    PreservesOn scope old new := observations

theorem changedObservationNotPreserved {Input Output : Type} (scope : Input → Prop)
    (old new : Input → Output) (x : Input) (inside : scope x)
    (different : new x ≠ old x) : ¬ PreservesOn scope old new := by
  intro h
  exact different (h x inside)

theorem contractRevisionObligations (old new : ObservableContract)
    (r : ContractRevision) (account : ContractChangeAccount old new r)
    (changed : ¬ PreservesContractFinite old new) :
    RevisionDuties old new r := account.resolve_left changed

def retiredBehavior (xs : List Nat) : List Nat :=
  if xs = [99] then [] else orderedUnique xs

/-- organon-map CoreReader.Engineering.contractCases
software-engineering.structural-judgment#p3 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
-/
theorem contractCases :
    ContractChangeAccount originalContract refactoredContract normalRevision ∧
    ContractChangeAccount originalContract revisedContract normalRevision ∧
    ¬ ContractChangeAccount originalContract revisedContract { normalRevision with affected := [] } ∧
    PreservesFinite orderedUnique retiredBehavior ∧ retiredBehavior [99] ≠ orderedUnique [99] ∧
    ContractChangeAccount originalContract revisedContract { normalRevision with procedure := "paired audit" } := by decide

/-- organon-map CoreReader.Engineering.contractDistinctions
software-engineering.structural-judgment#p3 sha256 8014457feae3410a7220426dbbe4293f7b5d1d2aa152f4085ccd1f03d5983a42
-/
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

/- Revision records time-indexed evidence rather than changing a past event.
Judgment is choice under current evidence; forecast truth is a separate value. -/
structure RevisionState where
  time : Nat
  forecast : List Change
  maintenance : Nat
  maintainers : List Maintainer
  migrationCost : Nat
  objectiveCapacity : Nat
  choice : Candidate
  deriving DecidableEq, Repr
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

abbrev MaterialGroundsChanged (old current : RevisionState) : Prop :=
  old.forecast ≠ current.forecast ∨ old.maintenance ≠ current.maintenance ∨
  old.maintainers ≠ current.maintainers ∨
  old.migrationCost ≠ current.migrationCost ∨ old.objectiveCapacity ≠ current.objectiveCapacity

def oldState : RevisionState := ⟨0, [.designRevision], 6, [.original], 8, 12, .evolvable⟩
def newState : RevisionState := ⟨1, [.deletion], 2, [.successor, .agent], 14, 10, .presentSimple⟩

structure HistoricalEvidence where
  software : String
  state : RevisionState
  predictedBatchCount : Nat
  actualBatchCount : Nat

/- Independent event content: the recorded predictor used a fixed batch size
of ten; the actual event had runtime size five and twenty-one queue items. -/
def observedHistory : HistoricalEvidence :=
  ⟨"order-preserving queue", oldState, staticBatch 21 5, liveBatch 21 5⟩

abbrev RevisionAccountAgainst (history : HistoricalEvidence) (r : RevisionRecord) : Prop :=
  r.software = history.software ∧
  r.old = history.state ∧ r.recordedOld = history.state ∧
  r.predictedBatchCount = history.predictedBatchCount ∧
  r.actualBatchCount = history.actualBatchCount ∧
  r.old.time < r.current.time ∧ r.recordedCurrent = r.current ∧
  (r.old.choice ≠ r.current.choice → MaterialGroundsChanged r.old r.current) ∧
  r.reportedPredictionSucceeded = decide (history.predictedBatchCount = history.actualBatchCount) ∧
  r.consideredChanges.all (fun d => r.criticizedDirections.contains d) = true

/-- organon-map CoreReader.Engineering.RevisionAccount
software-engineering.revision#p2 sha256 5d31bed0197ea7e7028eb7a85e56059516421c6c27613cc5479e0b98c5111d99
software-engineering.revision#p1 sha256 5d31bed0197ea7e7028eb7a85e56059516421c6c27613cc5479e0b98c5111d99
-/
abbrev RevisionAccount (r : RevisionRecord) : Prop := RevisionAccountAgainst observedHistory r

theorem failedHistoryNotRewritten (history : HistoricalEvidence) (r : RevisionRecord)
    (account : RevisionAccountAgainst history r)
    (failed : history.predictedBatchCount ≠ history.actualBatchCount) :
    r.reportedPredictionSucceeded = false := by
  simpa [failed] using account.2.2.2.2.2.2.2.2.1

def revisionRecord : RevisionRecord := {
  software := "order-preserving queue",
  old := oldState, current := newState, recordedOld := oldState, recordedCurrent := newState,
  predictedBatchCount := staticBatch 21 5, actualBatchCount := liveBatch 21 5,
  reportedPredictionSucceeded := false,
  consideredChanges := changes, criticizedDirections := changes }

abbrev SupportedAlternative (gs : List DirectionGround) (d : Change) : Prop := credible gs d

abbrev RetentionJustified (ctx : Context) (alternatives : List Change) : Prop :=
  alternatives.all (fun d => !decide (SupportedAlternative ctx.evidence d)) = true ∨
  JustifiedDeparture ctx .evolvable

def stableRecord : RevisionRecord := { revisionRecord with
  current := { newState with choice := .evolvable },
  recordedCurrent := { newState with choice := .evolvable } }

/-- organon-map CoreReader.Engineering.revisionCases
software-engineering.revision#p2 sha256 5d31bed0197ea7e7028eb7a85e56059516421c6c27613cc5479e0b98c5111d99
software-engineering.revision#p1 sha256 5d31bed0197ea7e7028eb7a85e56059516421c6c27613cc5479e0b98c5111d99
-/
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

def observations : List (Nat × Nat) := [(21, 10), (30, 10), (40, 10)]
def revisionsMade : List Nat := [1, 2, 3]
def agreedBatch (reviewers : List Maintainer) (items size : Nat) : List Nat :=
  reviewers.map (fun _ => staticBatch items size)

def rewrittenOldRecord : RevisionRecord := { revisionRecord with
  old := { oldState with forecast := [.deletion] },
  recordedOld := { oldState with forecast := [.deletion] } }

def rewrittenPredictionRecord : RevisionRecord := { revisionRecord with
  predictedBatchCount := 5, reportedPredictionSucceeded := true }

def rewrittenObservationRecord : RevisionRecord := { revisionRecord with
  actualBatchCount := 3, reportedPredictionSucceeded := true }

def unrelatedSoftwareRecord : RevisionRecord := {
  revisionRecord with software := "unrelated batch processor" }

theorem historicalTamperingRejected :
    RevisionAccount revisionRecord ∧
    ¬ RevisionAccount rewrittenOldRecord ∧
    ¬ RevisionAccount rewrittenPredictionRecord ∧
    ¬ RevisionAccount rewrittenObservationRecord ∧
    observedHistory.predictedBatchCount = 3 ∧ observedHistory.actualBatchCount = 5 ∧
    ¬ RevisionAccount unrelatedSoftwareRecord := by
  exact ⟨by decide, by decide, by decide, by decide, by decide, by decide, by decide⟩

/-- organon-map CoreReader.Engineering.revisionLimits
software-engineering.revision#p2 sha256 5d31bed0197ea7e7028eb7a85e56059516421c6c27613cc5479e0b98c5111d99
software-engineering.revision#p1 sha256 5d31bed0197ea7e7028eb7a85e56059516421c6c27613cc5479e0b98c5111d99
-/
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

def groundedChanges : DirectionGround → List Change
  | .plan _ ds | .knowledge _ ds _ | .history _ ds | .other _ ds => ds

def currentRevisionState (ctx : Context) (chosen : Candidate) : RevisionState := {
  time := 1, forecast := ctx.evidence.flatMap groundedChanges,
  maintenance := ctx.activity.scheduledMaintenance, maintainers := ctx.activity.participants,
  migrationCost := cost chosen .migration,
  objectiveCapacity := ctx.limits.capacity .migration,
  choice := chosen }

def revisionFor (ctx : Context) (chosen : Candidate) : RevisionRecord := {
  stableRecord with software := ctx.activity.software, current := currentRevisionState ctx chosen, recordedCurrent := currentRevisionState ctx chosen }

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

/- Whole domain satisfaction keeps actual subject, credibility, account and
revision duties. The same context is passed to priority and every domain duty.
Application account choices below are finite records, not universal claims. -/
abbrev DomainSatisfied (ctx : Context) (chosen : Candidate) : Prop :=
  ActivityScope ctx.activity ∧ EvolutionPriority ctx chosen ∧
  credible ctx.evidence .designRevision ∧
  (ctx.departure ≠ none → JustifiedDeparture ctx .evolvable) ∧
  EvolutionClaim ctx.activity chosen ⟨.designRevision, .successor, .revise⟩ ∧
  StructuralAccount ctx.activity chosen (structuralEvidence chosen .designRevision) ∧
  ContractChangeAccount (orderContract (behavior chosen)) (evolutionContract .designRevision) normalRevision ∧
  RevisionAccount (revisionFor ctx chosen)

theorem currentDomainSatisfied : DomainSatisfied currentContinuing .evolvable := by
  refine ⟨by decide, by decide, by decide, ?_, by decide, by decide, by decide, by decide⟩
  simp [currentContinuing]

end CoreReader.Engineering
