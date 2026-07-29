import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure OneParameterFlow (A : AdmissibleClass) where
  parameterDomain : Type u
  initialCondition : A.object
  evolutionMap : parameterDomain → A.object
  groupAction : Prop
  continuityProperty : Prop
  initialConditionConsistent : evolutionMap 0 = initialCondition
  semigroupProperty : ∀ t s, evolutionMap (t + s) = evolutionMap t (evolutionMap s)

def eraClosed (A : AdmissibleClass) : Prop :=
  let flow := (∀ (t : ℕ), A.endpointSatisfied) ∨ (∀ (t : ℕ), A.remainderRecorded)
  flow

structure FixedPoint (A : AdmissibleClass) where
  point : A.object
  invariantUnderFlow : (t : ℕ) → evolutionMap t point = point

theorem fixed_point_invariant (A : AdmissibleClass) (fp : FixedPoint A) :
  (t : ℕ) → evolutionMap t fp.point = fp.point := fp.invariantUnderFlow

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse