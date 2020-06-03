module FHIR
  class ExplanationOfBenefitBenefitBalanceFinancial < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitBenefitBalanceFinancial'
    embeds_one :type, class_name: 'CodeableConcept'
    field :allowedPrimitiveUnsignedInt, type:  # primitive
    embeds_one :_allowedPrimitiveUnsignedInt, class_name: 'Extension'
    field :allowedPrimitiveString, type:  # primitive
    embeds_one :_allowedPrimitiveString, class_name: 'Extension'
    embeds_one :allowedMoney, class_name: 'Money'
    field :usedPrimitiveUnsignedInt, type:  # primitive
    embeds_one :_usedPrimitiveUnsignedInt, class_name: 'Extension'
    embeds_one :usedMoney, class_name: 'Money'
  end
end
