import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.ErgodicTheory

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure DynamicalAdmissibleObject where
  phaseSpace : PhaseSpacePackage
  flow : OneParameterFlowPackage phaseSpace
  invariantSets : InvariantSetsPackage flow
  bifurcation : BifurcationAnalysisPackage invariantSets
  stability : StabilityAnalysisPackage bifurcation
  ergodic : ErgodicTheoryPackage stability
  conclusion : Prop

structure AdmissibleClass where
  object : DynamicalAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse