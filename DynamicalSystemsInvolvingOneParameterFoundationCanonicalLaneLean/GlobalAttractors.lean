import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure GlobalAttractorPackage (F : OneParameterFlowPackage) where
  attractorSet : Set F.stateSpace
  attractorCompact : Prop
  forwardInvariant : Prop
  attractsAllTrajectories : Prop
  basinOfAttraction : Set F.stateSpace
  attractorCompactTerm : attractorCompact
  forwardInvariantTerm : forwardInvariant
  attractsAllTrajectoriesTerm : attractsAllTrajectories

structure GlobalAttractorEvidence {F : OneParameterFlowPackage} (G : GlobalAttractorPackage F) where
  attractorCompactClosed : G.attractorCompact
  forwardInvariantClosed : G.forwardInvariant
  attractsAllTrajectoriesClosed : G.attractsAllTrajectories

def GlobalAttractorClosed {F : OneParameterFlowPackage} (G : GlobalAttractorPackage F) : Prop :=
  G.attractorCompact ∧ G.forwardInvariant ∧ G.attractsAllTrajectories

theorem global_attractor_closed_from_evidence
    {F : OneParameterFlowPackage} (G : GlobalAttractorPackage F) (E : GlobalAttractorEvidence G) : GlobalAttractorClosed G := by
  exact And.intro E.attractorCompactClosed (And.intro E.forwardInvariantClosed E.attractsAllTrajectoriesClosed)

end HautevilleHouse
end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean