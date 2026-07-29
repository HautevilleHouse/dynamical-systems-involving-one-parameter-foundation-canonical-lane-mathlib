import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.BifurcationAnalysis

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure StabilityAnalysisPackage {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} {B : BifurcationAnalysisPackage I} where
  fixedPoints : Set P.stateType
  periodicOrbits : Set P.stateType
  lyapunovFunctions : Type u
  stabilityTypesClassified : Prop
  parameterDependentStability : Prop
  stabilityTypesClassifiedTerm : stabilityTypesClassified
  parameterDependentStabilityTerm : parameterDependentStability

structure StabilityAnalysisEvidence {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} {B : BifurcationAnalysisPackage I}
    (S : StabilityAnalysisPackage B) where
  stabilityTypesClassifiedClosed : S.stabilityTypesClassified
  parameterDependentStabilityClosed : S.parameterDependentStability

def StabilityAnalysisClosed {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} {B : BifurcationAnalysisPackage I}
    (S : StabilityAnalysisPackage B) : Prop :=
  S.stabilityTypesClassified ∧ S.parameterDependentStability

theorem stability_analysis_closed_from_evidence {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} {B : BifurcationAnalysisPackage I}
    (S : StabilityAnalysisPackage B) (E : StabilityAnalysisEvidence S) :
    StabilityAnalysisClosed S := by
  exact And.intro E.stabilityTypesClassifiedClosed E.parameterDependentStabilityClosed

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse