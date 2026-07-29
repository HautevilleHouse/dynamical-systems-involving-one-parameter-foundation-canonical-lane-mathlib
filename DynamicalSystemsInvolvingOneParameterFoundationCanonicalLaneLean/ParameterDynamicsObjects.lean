import DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure ParametricDynamicsObject where
  carrier : Type
  topology : TopologicalSpace carrier

structure ParameterEvolution where
  timeDomain : Type
  parameterSpace : Type
  evolutionLaw : ParametricDynamicsObject → ParametricDynamicsObject → Prop
  wellposed : Prop
  continuity : Prop

structure AdmittedOneParameterObject where
  dynamicObject : ParametricDynamicsObject
  parameterFamily : ParameterEvolution
  convergenceProperty : Prop
  conclusion : convergenceProperty

def DynamicalWitnessClosed (O : AdmittedOneParameterObject) : Prop :=
  O.convergenceProperty

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse
