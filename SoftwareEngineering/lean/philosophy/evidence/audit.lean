import Lean
import CoreReader
#check CoreReader.Adopted.generationSpecification
#print axioms CoreReader.Adopted.generationSpecification
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.generationSpecification
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.generationSpecification " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.generationCases
#print axioms CoreReader.Adopted.generationCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.generationCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.generationCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.generationLimits012
#print axioms CoreReader.Adopted.generationLimits012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.generationLimits012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.generationLimits012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.consistencySpecification
#print axioms CoreReader.Adopted.consistencySpecification
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.consistencySpecification
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.consistencySpecification " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.consistencyCases
#print axioms CoreReader.Adopted.consistencyCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.consistencyCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.consistencyCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.consistencyConsequences
#print axioms CoreReader.Adopted.consistencyConsequences
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.consistencyConsequences
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.consistencyConsequences " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.consistencyLimits012
#print axioms CoreReader.Adopted.consistencyLimits012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.consistencyLimits012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.consistencyLimits012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.reflexivitySpecification
#print axioms CoreReader.Adopted.reflexivitySpecification
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.reflexivitySpecification
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.reflexivitySpecification " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.reflexivityCases012
#print axioms CoreReader.Adopted.reflexivityCases012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.reflexivityCases012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.reflexivityCases012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.reflexivityLimits012
#print axioms CoreReader.Adopted.reflexivityLimits012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.reflexivityLimits012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.reflexivityLimits012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.Grounds012
#print axioms CoreReader.Adopted.Grounds012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.Grounds012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.Grounds012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.groundsCases012
#print axioms CoreReader.Adopted.groundsCases012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.groundsCases012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.groundsCases012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.empiricalSpecification
#print axioms CoreReader.Adopted.empiricalSpecification
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.empiricalSpecification
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.empiricalSpecification " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.empiricalCases012
#print axioms CoreReader.Adopted.empiricalCases012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.empiricalCases012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.empiricalCases012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.inferentialSpecification
#print axioms CoreReader.Adopted.inferentialSpecification
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.inferentialSpecification
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.inferentialSpecification " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.inferentialCases012
#print axioms CoreReader.Adopted.inferentialCases012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.inferentialCases012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.inferentialCases012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.valueSpecification
#print axioms CoreReader.Adopted.valueSpecification
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.valueSpecification
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.valueSpecification " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.valueCases012
#print axioms CoreReader.Adopted.valueCases012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.valueCases012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.valueCases012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.groundsLimits012
#print axioms CoreReader.Adopted.groundsLimits012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.groundsLimits012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.groundsLimits012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.scopeSpecification
#print axioms CoreReader.Adopted.scopeSpecification
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.scopeSpecification
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.scopeSpecification " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.scopeCases012
#print axioms CoreReader.Adopted.scopeCases012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.scopeCases012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.scopeCases012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.scopeLimits012
#print axioms CoreReader.Adopted.scopeLimits012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.scopeLimits012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.scopeLimits012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.capabilitySpecification
#print axioms CoreReader.Adopted.capabilitySpecification
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.capabilitySpecification
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.capabilitySpecification " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.capabilityCases012
#print axioms CoreReader.Adopted.capabilityCases012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.capabilityCases012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.capabilityCases012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.capabilityLimits012
#print axioms CoreReader.Adopted.capabilityLimits012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.capabilityLimits012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.capabilityLimits012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.choiceSpecification
#print axioms CoreReader.Adopted.choiceSpecification
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.choiceSpecification
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.choiceSpecification " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.choiceCases012
#print axioms CoreReader.Adopted.choiceCases012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.choiceCases012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.choiceCases012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Adopted.choiceLimits012
#print axioms CoreReader.Adopted.choiceLimits012
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Adopted.choiceLimits012
  Lean.logInfo ("ORGANON_TYPE CoreReader.Adopted.choiceLimits012 " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.inheritedMutualApplication
#print axioms CoreReader.Engineering.inheritedMutualApplication
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.inheritedMutualApplication
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.inheritedMutualApplication " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.inheritedMutualCases
#print axioms CoreReader.Engineering.inheritedMutualCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.inheritedMutualCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.inheritedMutualCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.ActivityScope
#print axioms CoreReader.Engineering.ActivityScope
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.ActivityScope
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.ActivityScope " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.subjectLifecycleCases
#print axioms CoreReader.Engineering.subjectLifecycleCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.subjectLifecycleCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.subjectLifecycleCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.subjectLimits
#print axioms CoreReader.Engineering.subjectLimits
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.subjectLimits
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.subjectLimits " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.EvolutionPriority
#print axioms CoreReader.Engineering.EvolutionPriority
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.EvolutionPriority
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.EvolutionPriority " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.priorityConditionsCases
#print axioms CoreReader.Engineering.priorityConditionsCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.priorityConditionsCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.priorityConditionsCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.priorityWhenApplicable
#print axioms CoreReader.Engineering.priorityWhenApplicable
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.priorityWhenApplicable
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.priorityWhenApplicable " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.priorityChoices
#print axioms CoreReader.Engineering.priorityChoices
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.priorityChoices
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.priorityChoices " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.CredibleDirection
#print axioms CoreReader.Engineering.CredibleDirection
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.CredibleDirection
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.CredibleDirection " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.credibilityCases
#print axioms CoreReader.Engineering.credibilityCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.credibilityCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.credibilityCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.credibilityLimits
#print axioms CoreReader.Engineering.credibilityLimits
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.credibilityLimits
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.credibilityLimits " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.JustifiedDeparture
#print axioms CoreReader.Engineering.JustifiedDeparture
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.JustifiedDeparture
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.JustifiedDeparture " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.costCases
#print axioms CoreReader.Engineering.costCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.costCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.costCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.EvolutionClaim
#print axioms CoreReader.Engineering.EvolutionClaim
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.EvolutionClaim
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.EvolutionClaim " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.evolutionKindsCases
#print axioms CoreReader.Engineering.evolutionKindsCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.evolutionKindsCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.evolutionKindsCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.evolutionDimensionsLimits
#print axioms CoreReader.Engineering.evolutionDimensionsLimits
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.evolutionDimensionsLimits
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.evolutionDimensionsLimits " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.StructuralAccount
#print axioms CoreReader.Engineering.StructuralAccount
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.StructuralAccount
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.StructuralAccount " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.structuralCases
#print axioms CoreReader.Engineering.structuralCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.structuralCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.structuralCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.structureNotCapability
#print axioms CoreReader.Engineering.structureNotCapability
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.structureNotCapability
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.structureNotCapability " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.ContractChangeAccount
#print axioms CoreReader.Engineering.ContractChangeAccount
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.ContractChangeAccount
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.ContractChangeAccount " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.contractCases
#print axioms CoreReader.Engineering.contractCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.contractCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.contractCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.contractPreservation
#print axioms CoreReader.Engineering.contractPreservation
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.contractPreservation
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.contractPreservation " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.contractDistinctions
#print axioms CoreReader.Engineering.contractDistinctions
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.contractDistinctions
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.contractDistinctions " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.RevisionAccount
#print axioms CoreReader.Engineering.RevisionAccount
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.RevisionAccount
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.RevisionAccount " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.revisionCases
#print axioms CoreReader.Engineering.revisionCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.revisionCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.revisionCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.revisionLimits
#print axioms CoreReader.Engineering.revisionLimits
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.revisionLimits
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.revisionLimits " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.priorityRemainsReflexive
#print axioms CoreReader.Engineering.priorityRemainsReflexive
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.priorityRemainsReflexive
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.priorityRemainsReflexive " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.priorityReflexiveCases
#print axioms CoreReader.Engineering.priorityReflexiveCases
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.priorityReflexiveCases
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.priorityReflexiveCases " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.jointWitness
#print axioms CoreReader.Engineering.jointWitness
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.jointWitness
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.jointWitness " ++ (Lean.Json.str (reprStr info.type)).compress)
#check CoreReader.Engineering.inheritedDoesNotEntailPriority
#print axioms CoreReader.Engineering.inheritedDoesNotEntailPriority
run_cmd do
  let info ← Lean.getConstInfo `CoreReader.Engineering.inheritedDoesNotEntailPriority
  Lean.logInfo ("ORGANON_TYPE CoreReader.Engineering.inheritedDoesNotEntailPriority " ++ (Lean.Json.str (reprStr info.type)).compress)
