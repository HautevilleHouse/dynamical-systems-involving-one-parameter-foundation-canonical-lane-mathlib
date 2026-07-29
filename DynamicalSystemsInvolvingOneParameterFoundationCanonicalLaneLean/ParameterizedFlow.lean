import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundation

structure ParameterizedFlowPackage where
  parameterSpace : Type u
  stateSpace : Type v
  initialState : stateSpace
  flowMap : parameterSpace → stateSpace → stateSpace
  continuityInParameter : Prop
  continuityInState : Prop
  groupLaw : Prop

structure ParameterizedFlowEvidence (P : ParameterizedFlowPackage) where
  continuityInParameterClosed : P.continuityInParameter
  continuityInStateClosed : P.continuityInState
  groupLawClosed : P.groupLaw

def ParameterizedFlowClosed (P : ParameterizedFlowPackage) : Prop :=
  P.continuityInParameter ∧ P.continuityInState ∧ P.groupLaw

theorem parameterized_flow_closed_from_evidence (P : ParameterizedFlowPackage)
    (E : ParameterizedFlowEvidence P) : ParameterizedFlowClosed P := by
  exact And.intro E.continuityInParameterClosed
    (And.intro E.continuityInStateClosed E.groupLawClosed)

end DynamicalSystemsInvolvingOneParameterFoundation
end HautevilleHouse
