import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure AdmittedClinicalDiagnosisObject where
  patientCohort : Type u
  testResult : Type v
  diseaseState : Prop
  testPerformance : Prop
  diagnosticConclusion : Prop

structure AdmissibleClass where
  object : AdmittedClinicalDiagnosisObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def DiagnosisAdmittedClosure (A : AdmissibleClass) : Prop :=
  DiagnosisWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse