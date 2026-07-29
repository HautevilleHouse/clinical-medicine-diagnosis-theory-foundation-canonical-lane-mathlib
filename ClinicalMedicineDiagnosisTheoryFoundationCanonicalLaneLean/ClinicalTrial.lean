import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure ClinicalTrial where
  treatmentArm : String
  controlArm : String
  outcomeMeasure : String
  sampleSize : Nat
  randomizationProper : Prop
  blindingProper : Prop
  statisticalSignificance : ℝ
  effectSize : ℝ
  conclusion : Prop

def ClinicalTrialEvidence (T : ClinicalTrial) : Prop :=
  T.randomizationProper ∧ T.blindingProper ∧ T.statisticalSignificance < 0.05

def ClinicalTrialClosed (T : ClinicalTrial) : Prop :=
  T.randomizationProper ∧ T.blindingProper ∧ T.statisticalSignificance < 0.05

theorem clinical_trial_closed_from_evidence (T : ClinicalTrial) (E : ClinicalTrialEvidence T) :
    ClinicalTrialClosed T := by
  exact E

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse