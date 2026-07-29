import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure DiagnosisRouteObligations where
  patientPresentation : Prop
  bayesianInference : Prop
  compartmentModel : Prop
  survivalAnalysis : Prop
  diagnosticTest : Prop

structure DiagnosisRouteEvidence (R : DiagnosisRouteObligations) where
  patientPresentationClosed : R.patientPresentation
  bayesianInferenceClosed : R.bayesianInference
  compartmentModelClosed : R.compartmentModel
  survivalAnalysisClosed : R.survivalAnalysis
  diagnosticTestClosed : R.diagnosticTest

def DiagnosisRouteClosed (R : DiagnosisRouteObligations) : Prop :=
  R.patientPresentation ∧ R.bayesianInference ∧ R.compartmentModel ∧ R.survivalAnalysis ∧ R.diagnosticTest

theorem diagnosis_route_closed_from_evidence (R : DiagnosisRouteObligations) (E : DiagnosisRouteEvidence R) :
    DiagnosisRouteClosed R := by
  exact And.intro E.patientPresentationClosed
    (And.intro E.bayesianInferenceClosed
      (And.intro E.compartmentModelClosed
        (And.intro E.survivalAnalysisClosed E.diagnosticTestClosed)))

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse