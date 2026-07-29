import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundation.ParameterizedFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundation

structure InvariantManifoldPackage {P : ParameterizedFlowPackage} where
  manifoldType : String
  tangentSpace : Type
  invariantUnderFlow : Prop
  persistUnderParameterChange : Prop

structure InvariantManifoldEvidence {P : ParameterizedFlowPackage}
    (M : InvariantManifoldPackage P) where
  invariantUnderFlowClosed : M.invariantUnderFlow
  persistUnderParameterChangeClosed : M.persistUnderParameterChange

def InvariantManifoldClosed {P : ParameterizedFlowPackage}
    (M : InvariantManifoldPackage P) : Prop :=
  M.invariantUnderFlow ∧ M.persistUnderParameterChange

theorem invariant_manifold_closed_from_evidence
    {P : ParameterizedFlowPackage} (M : InvariantManifoldPackage P)
    (E : InvariantManifoldEvidence M) : InvariantManifoldClosed M := by
  exact And.intro E.invariantUnderFlowClosed E.persistUnderParameterChangeClosed

end DynamicalSystemsInvolvingOneParameterFoundation
end HautevilleHouse
