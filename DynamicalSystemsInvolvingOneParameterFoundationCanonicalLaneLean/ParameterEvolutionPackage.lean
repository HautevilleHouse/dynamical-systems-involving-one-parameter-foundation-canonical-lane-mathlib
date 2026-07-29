import DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.ParameterDynamicsObjects

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure ParameterEvolutionPackage (O : AdmittedOneParameterObject) where
  timeSet : Type
  parameterSet : Type
  evolutionMap : O.dynamicObject.carrier → parameterSet → O.dynamicObject.carrier
  initialCondition : Prop
  semigroupProperty : Prop
  continuityInParameter : Prop

structure ParameterEvolutionEvidence (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) where
  initialConditionClosed : P.initialCondition
  semigroupPropertyClosed : P.semigroupProperty
  continuityInParameterClosed : P.continuityInParameter

def ParameterEvolutionClosed (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) : Prop :=
  P.initialCondition ∧ P.semigroupProperty ∧ P.continuityInParameter

theorem parameter_evolution_closed_from_evidence (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) (E : ParameterEvolutionEvidence O P) :
    ParameterEvolutionClosed O P := by
  exact And.intro E.initialConditionClosed (And.intro E.semigroupPropertyClosed E.continuityInParameterClosed)

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse
