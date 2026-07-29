import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure DiagnosticTestPackage where
  sensitivity : Float
  specificity : Float
  positivePredictiveValue : Float
  negativePredictiveValue : Float

structure DiagnosticTestEvidence (D : DiagnosticTestPackage) where
  sensitivityInRange : 0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1
  specificityInRange : 0 ≤ D.specificity ∧ D.specificity ≤ 1
  ppvComputed : D.positivePredictiveValue = (D.sensitivity * 0.1) / (D.sensitivity * 0.1 + (1 - D.specificity) * 0.9)
  npvComputed : D.negativePredictiveValue = (D.specificity * 0.9) / (D.specificity * 0.9 + (1 - D.sensitivity) * 0.1)

def DiagnosticTestClosed (D : DiagnosticTestPackage) : Prop :=
  0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1 ∧ 0 ≤ D.specificity ∧ D.specificity ≤ 1

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestPackage) (E : DiagnosticTestEvidence D) :
    DiagnosticTestClosed D := by
  exact And.intro E.sensitivityInRange.1 (And.intro E.sensitivityInRange.2 (And.intro E.specificityInRange.1 E.specificityInRange.2))

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse