import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure DiagnosticSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DiagnosticAdmittedObject where
  space : DiagnosticSpace
  compartmentModel : Prop
  diagnosticInference : Prop
  survivalAnalysis : Prop
  pharmacokinetics : Prop
  conclusion : diagnosticInference

structure DiagnosticEndgameState where
  object : DiagnosticAdmittedObject

def DiagnosticWitnessClosed (O : DiagnosticAdmittedObject) : Prop :=
  O.diagnosticInference

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse