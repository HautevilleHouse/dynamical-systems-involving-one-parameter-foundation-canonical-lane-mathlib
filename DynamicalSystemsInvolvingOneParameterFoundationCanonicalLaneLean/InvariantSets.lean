import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.OneParameterFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure InvariantSetsPackage {P : PhaseSpacePackage} (F : OneParameterFlowPackage P) where
  invariantSet : Set P.stateType
  forwardInvariant : Prop
  backwardInvariant : Prop
  parameterInvariant : Prop
  forwardInvariantTerm : forwardInvariant
  backwardInvariantTerm : backwardInvariant
  parameterInvariantTerm : parameterInvariant

structure InvariantSetsEvidence {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    (I : InvariantSetsPackage F) where
  forwardInvariantClosed : I.forwardInvariant
  backwardInvariantClosed : I.backwardInvariant
  parameterInvariantClosed : I.parameterInvariant

def InvariantSetsClosed {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    (I : InvariantSetsPackage F) : Prop :=
  I.forwardInvariant ∧ I.backwardInvariant ∧ I.parameterInvariant

theorem invariant_sets_closed_from_evidence {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    (I : InvariantSetsPackage F) (E : InvariantSetsEvidence I) : InvariantSetsClosed I := by
  exact And.intro E.forwardInvariantClosed (And.intro E.backwardInvariantClosed E.parameterInvariantClosed)

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse