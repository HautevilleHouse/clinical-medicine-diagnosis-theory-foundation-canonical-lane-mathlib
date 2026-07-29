import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean.CompartmentModel
import HautevilleHouse.ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean.PharmacokineticBridge
import HautevilleHouse.ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean.DiagnosticInference
import HautevilleHouse.ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean.SurvivalAnalysis
import HautevilleHouse.ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean.EvidenceSynthesis

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CompartmentModelClosed A.object ∧
  PharmacokineticBridgeClosed A.bridge ∧
  DiagnosticInferenceClosed A.inference ∧
  SurvivalAnalysisClosed A.survival ∧
  EvidenceSynthesisClosed A.synthesis

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  -- projection of evidence from A
  exact A.bridgeClosedEvidence

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedDiagnosisClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_diagnosis_endgame (A : AdmissibleClass) : ConstrainedDiagnosisClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse