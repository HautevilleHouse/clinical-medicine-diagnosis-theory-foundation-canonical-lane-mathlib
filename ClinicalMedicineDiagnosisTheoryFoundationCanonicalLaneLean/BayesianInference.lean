import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure BayesianInferencePackage where
  priorProbability : Float
  likelihoodRatio : Float
  posteriorProbability : Float
  evidenceStrength : Float

structure BayesianInferenceEvidence (B : BayesianInferencePackage) where
  priorNonnegative : B.priorProbability ≥ 0
  priorLeOne : B.priorProbability ≤ 1
  likelihoodRatioNonnegative : B.likelihoodRatio ≥ 0
  posteriorComputed : B.posteriorProbability = (B.priorProbability * B.likelihoodRatio) / ((B.priorProbability * B.likelihoodRatio) + (1 - B.priorProbability))

def BayesianInferenceClosed (B : BayesianInferencePackage) : Prop :=
  B.priorProbability ≥ 0 ∧ B.priorProbability ≤ 1 ∧ B.likelihoodRatio ≥ 0

theorem bayesian_inference_closed_from_evidence (B : BayesianInferencePackage) (E : BayesianInferenceEvidence B) :
    BayesianInferenceClosed B := by
  exact And.intro E.priorNonnegative (And.intro E.priorLeOne E.likelihoodRatioNonnegative)

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse