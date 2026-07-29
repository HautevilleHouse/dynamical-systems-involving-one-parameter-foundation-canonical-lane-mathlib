import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.StabilityAnalysis

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure ErgodicTheoryPackage {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} {B : BifurcationAnalysisPackage I}
    {S : StabilityAnalysisPackage B} where
  invariantMeasure : Type u
  ergodicDecomposition : Prop
  mixingProperties : Prop
  entropyProperties : Prop
  ergodicDecompositionTerm : ergodicDecomposition
  mixingPropertiesTerm : mixingProperties
  entropyPropertiesTerm : entropyProperties

structure ErgodicTheoryEvidence {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} {B : BifurcationAnalysisPackage I}
    {S : StabilityAnalysisPackage B} (E : ErgodicTheoryPackage S) where
  ergodicDecompositionClosed : E.ergodicDecomposition
  mixingPropertiesClosed : E.mixingProperties
  entropyPropertiesClosed : E.entropyProperties

def ErgodicTheoryClosed {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} {B : BifurcationAnalysisPackage I}
    {S : StabilityAnalysisPackage B} (E : ErgodicTheoryPackage S) : Prop :=
  E.ergodicDecomposition ∧ E.mixingProperties ∧ E.entropyProperties

theorem ergodic_theory_closed_from_evidence {P : PhaseSpacePackage} {F : OneParameterFlowPackage P}
    {I : InvariantSetsPackage F} {B : BifurcationAnalysisPackage I}
    {S : StabilityAnalysisPackage B} (E : ErgodicTheoryPackage S)
    (Ev : ErgodicTheoryEvidence E) : ErgodicTheoryClosed E := by
  exact And.intro Ev.ergodicDecompositionClosed (And.intro Ev.mixingPropertiesClosed Ev.entropyPropertiesClosed)

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse