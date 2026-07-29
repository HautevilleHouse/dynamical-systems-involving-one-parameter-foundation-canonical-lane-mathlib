import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundation

def bridgeClosed (A : AdmissibleClass) : Prop :=
  (admittedClosure A).1

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact (admittedClosure A).1

end DynamicalSystemsInvolvingOneParameterFoundation
end HautevilleHouse
