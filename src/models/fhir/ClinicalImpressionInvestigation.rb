module FHIR
  class ClinicalImpressionInvestigation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClinicalImpressionInvestigation'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :item, class_name: 'Reference'
  end
end
