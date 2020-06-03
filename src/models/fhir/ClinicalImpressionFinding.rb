module FHIR
  class ClinicalImpressionFinding < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClinicalImpressionFinding'
    embeds_one :itemCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :itemReference, class_name: 'Reference'
    field :basis, type:  # primitive
    embeds_one :_basis, class_name: 'Extension'
  end
end
