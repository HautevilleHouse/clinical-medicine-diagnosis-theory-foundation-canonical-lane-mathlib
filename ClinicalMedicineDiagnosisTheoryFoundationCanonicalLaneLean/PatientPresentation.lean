import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure PatientPresentation where
  symptoms : List String
  signs : List String
  duration : Nat
  riskFactors : List String

structure PatientPresentationEvidence (P : PatientPresentation) where
  symptomsClosed : P.symptoms ≠ []
  signsClosed : P.signs ≠ []
  durationClosed : P.duration > 0

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse