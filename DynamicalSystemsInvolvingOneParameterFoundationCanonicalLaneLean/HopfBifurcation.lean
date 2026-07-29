import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundation.ParameterizedFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundation

structure HopfBifurcationPackage {P : ParameterizedFlowPackage} where
  equilibriumPoint : P.stateSpace
  parameterValue : P.parameterSpace
  eigenvalueCrossing : Prop
  periodicOrbitEmerge : Prop

structure HopfBifurcationEvidence {P : ParameterizedFlowPackage}
    (H : HopfBifurcationPackage P) where
  eigenvalueCrossingClosed : H.eigenvalueCrossing
  periodicOrbitEmergeClosed : H.periodicOrbitEmerge

def HopfBifurcationClosed {P : ParameterizedFlowPackage}
    (H : HopfBifurcationPackage P) : Prop :=
  H.eigenvalueCrossing ∧ H.periodicOrbitEmerge

theorem hopf_bifurcation_closed_from_evidence
    {P : ParameterizedFlowPackage} (H : HopfBifurcationPackage P)
    (E : HopfBifurcationEvidence H) : HopfBifurcationClosed H := by
  exact And.intro E.eigenvalueCrossingClosed E.periodicOrbitEmergeClosed

end DynamicalSystemsInvolvingOneParameterFoundation
end HautevilleHouse
