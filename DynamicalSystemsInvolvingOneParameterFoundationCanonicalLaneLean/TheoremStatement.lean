import DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  oneParameterConstraint : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

end DynamicalSystemsInvolvingOneParameterFoundationCanonicalLaneLean
end HautevilleHouse