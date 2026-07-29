import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundation.OneParameterFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundation

structure HyperbolicStructure {X : Type u} [TopologicalSpace X] [MetricSpace X] (F : OneParameterFlow X) where
  hyperbolicSet : Set X
  splitting : (x : hyperbolicSet) → (tangentSpaceAt x : Type v) × (tangentSpaceAt x : Type v)
  contracted : (x : hyperbolicSet) → tangentSpaceAt (F.flowMap 1 x) → tangentSpaceAt x
  expanded : (x : hyperbolicSet) → tangentSpaceAt (F.flowMap 1 x) → tangentSpaceAt x
  contractionBounds : Prop
  expansionBounds : Prop

structure HyperbolicStructureEvidence {X : Type u} [TopologicalSpace X] [MetricSpace X] {F : OneParameterFlow X} (H : HyperbolicStructure F) where
  contractionBoundsClosed : H.contractionBounds
  expansionBoundsClosed : H.expansionBounds

def HyperbolicStructureClosed {X : Type u} [TopologicalSpace X] [MetricSpace X] {F : OneParameterFlow X} (H : HyperbolicStructure F) : Prop :=
  H.contractionBounds ∧ H.expansionBounds

theorem hyperbolic_structure_closed_from_evidence {X : Type u} [TopologicalSpace X] [MetricSpace X] {F : OneParameterFlow X} (H : HyperbolicStructure F) (E : HyperbolicStructureEvidence H) : HyperbolicStructureClosed H := by
  exact And.intro E.contractionBoundsClosed E.expansionBoundsClosed

end DynamicalSystemsInvolvingOneParameterFoundation
end HautevilleHouse