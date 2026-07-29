import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Nat
  flowRates : List (List ℝ)
  initialConditions : List ℝ
  solutionExists : Prop
  solutionUnique : Prop
  solutionStable : Prop
  steadyStateReachable : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  solutionExistsClosed : C.solutionExists
  solutionUniqueClosed : C.solutionUnique
  solutionStableClosed : C.solutionStable
  steadyStateReachableClosed : C.steadyStateReachable

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.solutionExists ∧ C.solutionUnique ∧ C.solutionStable ∧ C.steadyStateReachable

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.solutionExistsClosed
    (And.intro E.solutionUniqueClosed
      (And.intro E.solutionStableClosed E.steadyStateReachableClosed))

end ClinicalMedicineDiagnosisTheoryFoundationCanonicalLaneLean
end HautevilleHouse