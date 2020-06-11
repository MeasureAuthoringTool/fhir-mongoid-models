module FHIR
  class ExplanationOfBenefitItemAdjudication < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitItemAdjudication'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :reason, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'Money'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
