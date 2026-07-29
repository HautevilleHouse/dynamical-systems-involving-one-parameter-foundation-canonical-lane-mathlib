import DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.HyperbolicityPackage

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure ChaosTheoryPackage (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) (B : BifurcationAnalysisPackage O P) (H : HyperbolicityPackage O P B) where
  sensitiveDependence : Prop
  topologicalTransitivity : Prop
  densePeriodicOrbits : Prop

structure ChaosTheoryEvidence (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) (B : BifurcationAnalysisPackage O P) (H : HyperbolicityPackage O P B) (C : ChaosTheoryPackage O P B H) where
  sensitiveDependenceClosed : C.sensitiveDependence
  topologicalTransitivityClosed : C.topologicalTransitivity
  densePeriodicOrbitsClosed : C.densePeriodicOrbits

def ChaosTheoryClosed (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) (B : BifurcationAnalysisPackage O P) (H : HyperbolicityPackage O P B) (C : ChaosTheoryPackage O P B H) : Prop :=
  C.sensitiveDependence ∧ C.topologicalTransitivity ∧ C.densePeriodicOrbits

theorem chaos_theory_closed_from_evidence (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) (B : BifurcationAnalysisPackage O P) (H : HyperbolicityPackage O P B) (C : ChaosTheoryPackage O P B H) (E : ChaosTheoryEvidence O P B H C) :
    ChaosTheoryClosed O P B H C := by
  exact And.intro E.sensitiveDependenceClosed (And.intro E.topologicalTransitivityClosed E.densePeriodicOrbitsClosed)

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse
