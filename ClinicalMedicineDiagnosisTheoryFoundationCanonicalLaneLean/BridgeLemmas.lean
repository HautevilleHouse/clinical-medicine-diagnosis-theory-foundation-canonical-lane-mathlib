import ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

def DiagnosisWitnessClosed (O : AdmittedClinicalDiagnosisObject) : Prop :=
  O.diagnosticConclusion

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiagnosisWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.diagnosticConclusion

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse