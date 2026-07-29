import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure PharmacokineticModel where
  absorptionRate : Float
  distributionVolume : Float
  eliminationRate : Float
  halfLife : Float
  drugConcentration : Float -> Float

def PharmacokineticModelClosed (P : PharmacokineticModel) : Prop :=
  P.absorptionRate > 0 ∧ P.distributionVolume > 0 ∧ P.eliminationRate > 0

theorem pharmacokinetic_model_from_admissible (A : AdmissibleClass) : PharmacokineticModelClosed A.object := by
  have h1 : A.object.absorptionRate > 0 := by
    have := AdmissibleClass.absorptionRatePositive A
    exact this
  have h2 : A.object.distributionVolume > 0 := by
    have := AdmissibleClass.distributionVolumePositive A
    exact this
  have h3 : A.object.eliminationRate > 0 := by
    have := AdmissibleClass.eliminationRatePositive A
    exact this
  unfold PharmacokineticModelClosed
  exact And.intro h1 (And.intro h2 h3)

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse