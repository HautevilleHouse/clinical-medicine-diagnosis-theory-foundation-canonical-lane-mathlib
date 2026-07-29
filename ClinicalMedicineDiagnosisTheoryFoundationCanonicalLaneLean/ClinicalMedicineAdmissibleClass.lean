import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure ClinicalPatient where
  identifier : String
  features : List (String × Float)
  label : Bool

structure ClinicalAdmittedObject where
  patient : ClinicalPatient
  diagnosisValid : Prop
  treatmentOutcome : Prop
  conclusion : diagnosisValid ∧ treatmentOutcome

structure ClinicalAdmissibleClass where
  object : ClinicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : ClinicalAdmissibleClass) : Prop :=
  (A.object.diagnosisValid ∧ A.object.treatmentOutcome) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse