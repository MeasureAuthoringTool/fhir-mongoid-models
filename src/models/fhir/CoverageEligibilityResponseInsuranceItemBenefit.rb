module FHIR
  class CoverageEligibilityResponseInsuranceItemBenefit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityResponseInsuranceItemBenefit'
    embeds_one :type, class_name: 'CodeableConcept'
    field :allowedPrimitiveUnsignedInt, type:  # primitive
    embeds_one :_allowedPrimitiveUnsignedInt, class_name: 'Extension'
    field :allowedPrimitiveString, type:  # primitive
    embeds_one :_allowedPrimitiveString, class_name: 'Extension'
    embeds_one :allowedMoney, class_name: 'Money'
    field :usedPrimitiveUnsignedInt, type:  # primitive
    embeds_one :_usedPrimitiveUnsignedInt, class_name: 'Extension'
    field :usedPrimitiveString, type:  # primitive
    embeds_one :_usedPrimitiveString, class_name: 'Extension'
    embeds_one :usedMoney, class_name: 'Money'
  end
end
