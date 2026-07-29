import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure PharmacokineticModel where
  dosingRegimen : Nat → ℝ
  absorptionRate : ℝ
  eliminationRate : ℝ
  volumeOfDistribution : ℝ
  plasmaConcentration : Nat → ℝ
  delayOrdinaryDifferentialEquation : Prop
  linearTimeInvariant : Prop
  steadyStateConcentration : ℝ

def PharmacokineticModelEvidence (P : PharmacokineticModel) : Prop :=
  P.delayOrdinaryDifferentialEquation ∧ P.linearTimeInvariant ∧ P.steadyStateConcentration > 0

def PharmacokineticModelClosed (P : PharmacokineticModel) : Prop :=
  P.delayOrdinaryDifferentialEquation ∧ P.linearTimeInvariant ∧ P.steadyStateConcentration > 0

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticModelEvidence P) :
    PharmacokineticModelClosed P := by
  exact E

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse