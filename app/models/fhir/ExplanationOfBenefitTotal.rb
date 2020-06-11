module FHIR
  class ExplanationOfBenefitTotal < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitTotal'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'Money'
  end
end
