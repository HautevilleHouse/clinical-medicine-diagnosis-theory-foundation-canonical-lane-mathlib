import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure EvidenceSynthesisPackage where
  studyResults : Array (Array Float)
  metaAnalysisEffectSize : Float
  heterogeneityStatistic : Float
  randomEffectsModel : Prop
  heterogeneityAssessed : Prop
  randomEffectsModelTerm : randomEffectsModel
  heterogeneityAssessedTerm : heterogeneityAssessed

structure EvidenceSynthesisEvidence (E : EvidenceSynthesisPackage) where
  randomEffectsModelClosed : E.randomEffectsModel
  heterogeneityAssessedClosed : E.heterogeneityAssessed

def EvidenceSynthesisClosed (E : EvidenceSynthesisPackage) : Prop :=
  E.randomEffectsModel ∧ E.heterogeneityAssessed

theorem evidence_synthesis_closed_from_evidence (E : EvidenceSynthesisPackage) (Ev : EvidenceSynthesisEvidence E) :
    EvidenceSynthesisClosed E := by
  exact And.intro Ev.randomEffectsModelClosed Ev.heterogeneityAssessedClosed

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse