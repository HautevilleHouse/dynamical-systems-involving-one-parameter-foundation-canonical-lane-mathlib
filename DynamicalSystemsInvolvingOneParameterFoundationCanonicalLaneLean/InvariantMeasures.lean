import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundation.OneParameterFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundation

structure InvariantMeasurePackage {X : Type u} [TopologicalSpace X] (F : OneParameterFlow X) where
  measure : Set X → ℝ
  nonnegative : ∀ s, measure s ≥ 0
  countablyAdditive : ∀ (s : ℕ → Set X), (∀ i j, i ≠ j → s i ∩ s j = ∅) → measure (⋃ i, s i) = ∑' i, measure (s i)
  invariant : ∀ (t : F.time) (s : Set X), measure (F.flowMap t '' s) = measure s

structure InvariantMeasureEvidence {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X} (M : InvariantMeasurePackage F) where
  nonnegativeClosed : M.nonnegative = M.nonnegative
  countablyAdditiveClosed : M.countablyAdditive = M.countablyAdditive
  invariantClosed : M.invariant = M.invariant

def InvariantMeasureClosed {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X} (M : InvariantMeasurePackage F) : Prop :=
  (∀ s : Set X, M.measure s ≥ 0) ∧
  (∀ (s : ℕ → Set X), (∀ i j, i ≠ j → s i ∩ s j = ∅) → M.measure (⋃ i, s i) = ∑' i, M.measure (s i)) ∧
  (∀ (t : F.time) (s : Set X), M.measure (F.flowMap t '' s) = M.measure s)

theorem invariant_measure_closed_from_evidence {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X} (M : InvariantMeasurePackage F) (E : InvariantMeasureEvidence M) : InvariantMeasureClosed M := by
  exact And.intro (by simpa using E.nonnegativeClosed) (And.intro (by simpa using E.countablyAdditiveClosed) (by simpa using E.invariantClosed))

end DynamicalSystemsInvolvingOneParameterFoundation
end HautevilleHouse