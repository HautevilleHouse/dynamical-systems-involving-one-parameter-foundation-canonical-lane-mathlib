import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure InvariantManifoldPackage (F : OneParameterFlowPackage) where
  manifold : Set (F.parameterSpace × F.stateSpace)
  invariantUnderFlow : Prop
  stableManifold : Prop
  unstableManifold : Prop
  centerManifold : Prop
  smoothness : Nat
  invariantUnderFlowTerm : invariantUnderFlow
  stableManifoldTerm : stableManifold
  unstableManifoldTerm : unstableManifold
  centerManifoldTerm : centerManifold

structure InvariantManifoldEvidence {F : OneParameterFlowPackage} (M : InvariantManifoldPackage F) where
  invariantUnderFlowClosed : M.invariantUnderFlow
  stableManifoldClosed : M.stableManifold
  unstableManifoldClosed : M.unstableManifold
  centerManifoldClosed : M.centerManifold

def InvariantManifoldClosed {F : OneParameterFlowPackage} (M : InvariantManifoldPackage F) : Prop :=
  M.invariantUnderFlow ∧ M.stableManifold ∧ M.unstableManifold ∧ M.centerManifold

theorem invariant_manifold_closed_from_evidence
    {F : OneParameterFlowPackage} (M : InvariantManifoldPackage F) (E : InvariantManifoldEvidence M) : InvariantManifoldClosed M := by
  exact And.intro E.invariantUnderFlowClosed (And.intro E.stableManifoldClosed (And.intro E.unstableManifoldClosed E.centerManifoldClosed))

end HautevilleHouse
end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean