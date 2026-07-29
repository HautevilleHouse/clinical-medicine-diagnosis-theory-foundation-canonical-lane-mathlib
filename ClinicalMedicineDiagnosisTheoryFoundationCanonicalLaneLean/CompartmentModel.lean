import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure CompartmentModel (A : ClinicalAdmissibleClass) where
  compartments : Nat
  transferMatrix : Matrix (Fin compartments) (Fin compartments) Float
  initialConcentration : Vector Float compartments
  equilibriumConcentration : Vector Float compartments
  concentrationCurveValid : Prop
  equilibriumReached : Prop

structure CompartmentModelEvidence {A : ClinicalAdmissibleClass} (M : CompartmentModel A) where
  concentrationCurveValidClosed : M.concentrationCurveValid
  equilibriumReachedClosed : M.equilibriumReached

def CompartmentModelClosed {A : ClinicalAdmissibleClass} (M : CompartmentModel A) : Prop :=
  M.concentrationCurveValid ∧ M.equilibriumReached

theorem compartment_model_closed_from_evidence {A : ClinicalAdmissibleClass} (M : CompartmentModel A) (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.concentrationCurveValidClosed E.equilibriumReachedClosed

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse