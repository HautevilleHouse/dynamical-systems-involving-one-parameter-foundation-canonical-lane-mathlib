import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure PhaseSpacePackage where
  stateType : Type u
  topology : TopologicalSpace stateType
  smoothStructure : Prop
  dimensionOne : Prop
  smoothStructureTerm : smoothStructure
  dimensionOneTerm : dimensionOne

structure PhaseSpaceEvidence (P : PhaseSpacePackage) where
  smoothStructureClosed : P.smoothStructure
  dimensionOneClosed : P.dimensionOne

def PhaseSpaceClosed (P : PhaseSpacePackage) : Prop :=
  P.smoothStructure ∧ P.dimensionOne

theorem phase_space_closed_from_evidence (P : PhaseSpacePackage) (E : PhaseSpaceEvidence P) :
    PhaseSpaceClosed P := by
  exact And.intro E.smoothStructureClosed E.dimensionOneClosed

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse