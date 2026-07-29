import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure DiseaseProgressionModel where
  states : (String → ℝ)
  transitionRates : String → String → ℝ
  initialState : String
  markovProperty : Prop
  stationaryDistribution : Prop
  absorbingStates : Finset String
  absorptionProbability : String → ℝ
  expectedTimeToAbsorption : String → ℝ

def DiseaseProgressionModelEvidence (D : DiseaseProgressionModel) : Prop :=
  D.markovProperty ∧ D.stationaryDistribution ∧ (∀ s, D.absorptionProbability s ≥ 0)

def DiseaseProgressionModelClosed (D : DiseaseProgressionModel) : Prop :=
  D.markovProperty ∧ D.stationaryDistribution ∧ (∀ s, D.absorptionProbability s ≥ 0)

theorem disease_progression_model_closed_from_evidence (D : DiseaseProgressionModel) (E : DiseaseProgressionModelEvidence D) :
    DiseaseProgressionModelClosed D := by
  exact E

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse