import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.InvariantSets

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure BifurcationAnalysisPackage {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    (I : InvariantSetsPackage F) where
  bifurcationParameter : Type u
  criticalValues : Set bifurcationParameter
  structuralStabilityRegions : Prop
  bifurcationPointsClassified : Prop
  structuralStabilityRegionsTerm : structuralStabilityRegions
  bifurcationPointsClassifiedTerm : bifurcationPointsClassified

structure BifurcationAnalysisEvidence {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} (B : BifurcationAnalysisPackage I) where
  structuralStabilityRegionsClosed : B.structuralStabilityRegions
  bifurcationPointsClassifiedClosed : B.bifurcationPointsClassified

def BifurcationAnalysisClosed {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} (B : BifurcationAnalysisPackage I) : Prop :=
  B.structuralStabilityRegions ∧ B.bifurcationPointsClassified

theorem bifurcation_analysis_closed_from_evidence {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} (B : BifurcationAnalysisPackage I)
    (E : BifurcationAnalysisEvidence B) : BifurcationAnalysisClosed B := by
  exact And.intro E.structuralStabilityRegionsClosed E.bifurcationPointsClassifiedClosed

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse