module FHIR
  class ExplanationOfBenefitSupportingInfo < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitSupportingInfo'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    field :timingPrimitiveDate, type:  # primitive
    embeds_one :_timingPrimitiveDate, class_name: 'Extension'
    embeds_one :timingPeriod, class_name: 'Period'
    field :valuePrimitiveBoolean, type:  # primitive
    embeds_one :_valuePrimitiveBoolean, class_name: 'Extension'
    field :valuePrimitiveString, type:  # primitive
    embeds_one :_valuePrimitiveString, class_name: 'Extension'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueAttachment, class_name: 'Attachment'
    embeds_one :valueReference, class_name: 'Reference'
    embeds_one :reason, class_name: 'Coding'
  end
end
