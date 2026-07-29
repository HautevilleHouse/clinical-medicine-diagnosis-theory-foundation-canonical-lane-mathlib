import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

open HautevilleHouse.ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

def bridgeClosed (A : ClinicalAdmissibleClass) : Prop :=
  A.object.diagnosisValid ∧ A.object.treatmentOutcome

def gateClosed (A : ClinicalAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : ClinicalAdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

theorem gate_from_admissible_class (A : ClinicalAdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedDiagnosisClosure (A : ClinicalAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_diagnosis_endgame (A : ClinicalAdmissibleClass) : ConstrainedDiagnosisClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse