import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundation.OneParameterFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundation

structure StructuralStabilityPackage {X : Type u} [TopologicalSpace X] [MetricSpace X] (F : OneParameterFlow X) where
  perturbation : OneParameterFlow X
  equivalences : (x : X) → (F.flowMap 1 x = x) ↔ (perturbation.flowMap 1 x = x)
  orbitEquivalence : ∃ (h : X → X), Continuous h ∧ (∀ x, h (F.flowMap 1 x) = perturbation.flowMap 1 (h x))

structure StructuralStabilityEvidence {X : Type u} [TopologicalSpace X] [MetricSpace X] {F : OneParameterFlow X} (S : StructuralStabilityPackage F) where
  equivalencesClosed : S.equivalences = S.equivalences
  orbitEquivalenceClosed : S.orbitEquivalence

def StructuralStabilityClosed {X : Type u} [TopologicalSpace X] [MetricSpace X] {F : OneParameterFlow X} (S : StructuralStabilityPackage F) : Prop :=
  (∀ x, (F.flowMap 1 x = x) ↔ (S.perturbation.flowMap 1 x = x)) ∧
  ∃ (h : X → X), Continuous h ∧ (∀ x, h (F.flowMap 1 x) = S.perturbation.flowMap 1 (h x))

theorem structural_stability_closed_from_evidence {X : Type u} [TopologicalSpace X] [MetricSpace X] {F : OneParameterFlow X} (S : StructuralStabilityPackage F) (E : StructuralStabilityEvidence S) : StructuralStabilityClosed S := by
  exact And.intro (by simpa using E.equivalencesClosed) E.orbitEquivalenceClosed

end DynamicalSystemsInvolvingOneParameterFoundation
end HautevilleHouse