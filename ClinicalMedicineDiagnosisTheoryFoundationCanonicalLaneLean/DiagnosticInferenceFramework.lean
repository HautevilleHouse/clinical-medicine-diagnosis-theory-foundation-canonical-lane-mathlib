import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure DiagnosticInferencePackage where
  symptoms : Type
  diseases : Type
  priorProbabilities : symptoms → ℝ
  likelihoodFunctions : diseases → symptoms → ℝ
  posteriorDistribution : symptoms → diseases → ℝ
  bayesTheoremApplied : Prop
  inferenceConsistent : Prop
  diagnosticThresholdReached : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  bayesTheoremAppliedClosed : D.bayesTheoremApplied
  inferenceConsistentClosed : D.inferenceConsistent
  diagnosticThresholdReachedClosed : D.diagnosticThresholdReached

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.bayesTheoremApplied ∧ D.inferenceConsistent ∧ D.diagnosticThresholdReached

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage) (E : DiagnosticInferenceEvidence D) :
    DiagnosticInferenceClosed D := by
  exact And.intro E.bayesTheoremAppliedClosed
    (And.intro E.inferenceConsistentClosed E.diagnosticThresholdReachedClosed)

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse