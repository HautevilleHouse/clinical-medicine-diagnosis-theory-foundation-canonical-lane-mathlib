import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure PharmacokineticBridgePackage (C : CompartmentModelPackage) where
  absorptionRate : Float
  eliminationRate : Float
  dosageRegimen : Float -> Float
  plasmaConcentration : Float -> Float
  bioavailability : Float
  steadyStateReached : Prop
  linearKinetics : Prop
  absorptionRatePositive : absorptionRate > 0
  eliminationRatePositive : eliminationRate > 0
  bioavailabilityInZeroOne : 0 ≤ bioavailability ∧ bioavailability ≤ 1
  steadyStateReachedTerm : steadyStateReached
  linearKineticsTerm : linearKinetics

structure PharmacokineticBridgeEvidence {C : CompartmentModelPackage} (P : PharmacokineticBridgePackage C) where
  steadyStateReachedClosed : P.steadyStateReached
  linearKineticsClosed : P.linearKinetics

def PharmacokineticBridgeClosed {C : CompartmentModelPackage} (P : PharmacokineticBridgePackage C) : Prop :=
  P.steadyStateReached ∧ P.linearKinetics

theorem pharmacokinetic_bridge_closed_from_evidence {C : CompartmentModelPackage} (P : PharmacokineticBridgePackage C) (E : PharmacokineticBridgeEvidence P) :
    PharmacokineticBridgeClosed P := by
  exact And.intro E.steadyStateReachedClosed E.linearKineticsClosed

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse