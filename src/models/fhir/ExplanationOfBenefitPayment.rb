module FHIR
  class ExplanationOfBenefitPayment < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitPayment'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :adjustment, class_name: 'Money'
    embeds_one :adjustmentReason, class_name: 'CodeableConcept'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :amount, class_name: 'Money'
    embeds_one :identifier, class_name: 'Identifier'
  end
end
