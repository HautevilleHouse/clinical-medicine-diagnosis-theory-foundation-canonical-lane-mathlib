import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure SurvivalAnalysisPackage where
  timeToEvent : Type
  survivalFunction : timeToEvent → ℝ
  hazardRate : timeToEvent → ℝ
  censorIndicator : timeToEvent → Bool
  proportionalHazardsAssumption : Prop
  kaplanMeierEstimatorConsistent : Prop
  coxModelValid : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  proportionalHazardsAssumptionClosed : S.proportionalHazardsAssumption
  kaplanMeierEstimatorConsistentClosed : S.kaplanMeierEstimatorConsistent
  coxModelValidClosed : S.coxModelValid

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.proportionalHazardsAssumption ∧ S.kaplanMeierEstimatorConsistent ∧ S.coxModelValid

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage) (E : SurvivalAnalysisEvidence S) :
    SurvivalAnalysisClosed S := by
  exact And.intro E.proportionalHazardsAssumptionClosed
    (And.intro E.kaplanMeierEstimatorConsistentClosed E.coxModelValidClosed)

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse