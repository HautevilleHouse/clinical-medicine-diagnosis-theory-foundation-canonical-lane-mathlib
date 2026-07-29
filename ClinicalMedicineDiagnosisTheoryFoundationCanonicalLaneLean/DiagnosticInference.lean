import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure DiagnosticInference (A : ClinicalAdmissibleClass) where
  priorProbability : Float
  likelihoodRatio : Float
  posteriorProbability : Float
  bayesRuleApplied : Prop
  inferenceConsistent : Prop

structure DiagnosticInferenceEvidence {A : ClinicalAdmissibleClass} (D : DiagnosticInference A) where
  bayesRuleAppliedClosed : D.bayesRuleApplied
  inferenceConsistentClosed : D.inferenceConsistent

def DiagnosticInferenceClosed {A : ClinicalAdmissibleClass} (D : DiagnosticInference A) : Prop :=
  D.bayesRuleApplied ∧ D.inferenceConsistent

theorem diagnostic_inference_closed_from_evidence {A : ClinicalAdmissibleClass} (D : DiagnosticInference A) (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.bayesRuleAppliedClosed E.inferenceConsistentClosed

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse