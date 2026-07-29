import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure HyperbolicDynamicsPackage (F : OneParameterFlowPackage) where
  hyperbolicEquilibrium : F.stateSpace
  linearizationSplitting : Prop
  stableBundle : Type w
  unstableBundle : Type x
  exponentialEstimates : Prop
  structuralStability : Prop
  linearizationSplittingTerm : linearizationSplitting
  exponentialEstimatesTerm : exponentialEstimates
  structuralStabilityTerm : structuralStability

structure HyperbolicDynamicsEvidence {F : OneParameterFlowPackage} (H : HyperbolicDynamicsPackage F) where
  linearizationSplittingClosed : H.linearizationSplitting
  exponentialEstimatesClosed : H.exponentialEstimates
  structuralStabilityClosed : H.structuralStability

def HyperbolicDynamicsClosed {F : OneParameterFlowPackage} (H : HyperbolicDynamicsPackage F) : Prop :=
  H.linearizationSplitting ∧ H.exponentialEstimates ∧ H.structuralStability

theorem hyperbolic_dynamics_closed_from_evidence
    {F : OneParameterFlowPackage} (H : HyperbolicDynamicsPackage F) (E : HyperbolicDynamicsEvidence H) : HyperbolicDynamicsClosed H := by
  exact And.intro E.linearizationSplittingClosed (And.intro E.exponentialEstimatesClosed E.structuralStabilityClosed)

end HautevilleHouse
end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean