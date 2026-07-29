import DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.BifurcationAnalysis

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure HyperbolicityPackage (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) (B : BifurcationAnalysisPackage O P) where
  hyperbolicStructure : Prop
  stableUnstableManifolds : Prop
  invariantManifoldProperties : Prop

structure HyperbolicityEvidence (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) (B : BifurcationAnalysisPackage O P) (H : HyperbolicityPackage O P B) where
  hyperbolicStructureClosed : H.hyperbolicStructure
  stableUnstableManifoldsClosed : H.stableUnstableManifolds
  invariantManifoldPropertiesClosed : H.invariantManifoldProperties

def HyperbolicityClosed (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) (B : BifurcationAnalysisPackage O P) (H : HyperbolicityPackage O P B) : Prop :=
  H.hyperbolicStructure ∧ H.stableUnstableManifolds ∧ H.invariantManifoldProperties

theorem hyperbolicity_closed_from_evidence (O : AdmittedOneParameterObject) (P : ParameterEvolutionPackage O) (B : BifurcationAnalysisPackage O P) (H : HyperbolicityPackage O P B) (E : HyperbolicityEvidence O P B H) :
    HyperbolicityClosed O P B H := by
  exact And.intro E.hyperbolicStructureClosed (And.intro E.stableUnstableManifoldsClosed E.invariantManifoldPropertiesClosed)

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse
