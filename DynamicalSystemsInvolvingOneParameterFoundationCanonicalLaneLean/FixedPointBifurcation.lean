import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundation.ParameterizedFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundation

structure FixedPointBifurcationPackage {P : ParameterizedFlowPackage} where
  fixedPointEquation : P.stateSpace → Prop
  bifurcationParameter : P.parameterSpace
  stabilityChange : Prop
  bifurcationType : String

structure FixedPointBifurcationEvidence {P : ParameterizedFlowPackage}
    (F : FixedPointBifurcationPackage P) where
  fixedPointEquationClosed : F.fixedPointEquation (P.initialState)
  stabilityChangeClosed : F.stabilityChange

def FixedPointBifurcationClosed {P : ParameterizedFlowPackage}
    (F : FixedPointBifurcationPackage P) : Prop :=
  (F.fixedPointEquation (P.initialState)) ∧ F.stabilityChange

theorem fixed_point_bifurcation_closed_from_evidence
    {P : ParameterizedFlowPackage} (F : FixedPointBifurcationPackage P)
    (E : FixedPointBifurcationEvidence F) : FixedPointBifurcationClosed F := by
  exact And.intro E.fixedPointEquationClosed E.stabilityChangeClosed

end DynamicalSystemsInvolvingOneParameterFoundation
end HautevilleHouse
