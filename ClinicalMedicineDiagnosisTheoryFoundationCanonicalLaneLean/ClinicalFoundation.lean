import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure ClinicalFoundationPackage where
  compartmentModelClosed : CompartmentModelPackage
  pharmacokineticClosed : PharmacokineticPackage
  diagnosticInferenceClosed : DiagnosticInferencePackage
  survivalAnalysisClosed : SurvivalAnalysisPackage
  foundationIntegrated : Prop

structure ClinicalFoundationEvidence (C : ClinicalFoundationPackage) where
  compartmentModelEvidence : CompartmentModelEvidence C.compartmentModelClosed
  pharmacokineticEvidence : PharmacokineticEvidence C.pharmacokineticClosed
  diagnosticInferenceEvidence : DiagnosticInferenceEvidence C.diagnosticInferenceClosed
  survivalAnalysisEvidence : SurvivalAnalysisEvidence C.survivalAnalysisClosed
  foundationIntegratedClosed : C.foundationIntegrated

def ClinicalFoundationClosed (C : ClinicalFoundationPackage) : Prop :=
  CompartmentModelClosed C.compartmentModelClosed ∧
  PharmacokineticClosed C.pharmacokineticClosed ∧
  DiagnosticInferenceClosed C.diagnosticInferenceClosed ∧
  SurvivalAnalysisClosed C.survivalAnalysisClosed ∧
  C.foundationIntegrated

theorem clinical_foundation_closed_from_evidence (C : ClinicalFoundationPackage)
    (E : ClinicalFoundationEvidence C) : ClinicalFoundationClosed C := by
  have h1 : CompartmentModelClosed C.compartmentModelClosed :=
    compartment_model_closed_from_evidence C.compartmentModelClosed E.compartmentModelEvidence
  have h2 : PharmacokineticClosed C.pharmacokineticClosed :=
    pharmacokinetic_closed_from_evidence C.pharmacokineticClosed E.pharmacokineticEvidence
  have h3 : DiagnosticInferenceClosed C.diagnosticInferenceClosed :=
    diagnostic_inference_closed_from_evidence C.diagnosticInferenceClosed E.diagnosticInferenceEvidence
  have h4 : SurvivalAnalysisClosed C.survivalAnalysisClosed :=
    survival_analysis_closed_from_evidence C.survivalAnalysisClosed E.survivalAnalysisEvidence
  exact And.intro h1 (And.intro h2 (And.intro h3 (And.intro h4 E.foundationIntegratedClosed)))

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse