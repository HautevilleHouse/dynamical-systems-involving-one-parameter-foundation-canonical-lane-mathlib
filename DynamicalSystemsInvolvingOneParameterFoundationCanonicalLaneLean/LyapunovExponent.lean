import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterFoundation.ParameterizedFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundation

structure LyapunovExponentPackage {P : ParameterizedFlowPackage} where
  growthRate : Type
  exponent : P.parameterSpace → ℝ
  exponentialGrowth : Prop
  subexponentialGrowth : Prop

structure LyapunovExponentEvidence {P : ParameterizedFlowPackage}
    (L : LyapunovExponentPackage P) where
  exponentialGrowthClosed : L.exponentialGrowth
  subexponentialGrowthClosed : L.subexponentialGrowth

def LyapunovExponentClosed {P : ParameterizedFlowPackage}
    (L : LyapunovExponentPackage P) : Prop :=
  L.exponentialGrowth ∧ L.subexponentialGrowth

theorem lyapunov_exponent_closed_from_evidence
    {P : ParameterizedFlowPackage} (L : LyapunovExponentPackage P)
    (E : LyapunovExponentEvidence L) : LyapunovExponentClosed L := by
  exact And.intro E.exponentialGrowthClosed E.subexponentialGrowthClosed

end DynamicalSystemsInvolvingOneParameterFoundation
end HautevilleHouse
