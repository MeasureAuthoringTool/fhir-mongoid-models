module FHIR
  class CoverageEligibilityRequestItemDiagnosis < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityRequestItemDiagnosis'
    embeds_one :diagnosisCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :diagnosisReference, class_name: 'Reference'
  end
end
