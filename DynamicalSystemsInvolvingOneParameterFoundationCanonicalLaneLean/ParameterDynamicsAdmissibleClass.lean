import DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.ParameterDynamicsObjects

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedOneParameterObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DynamicalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse
