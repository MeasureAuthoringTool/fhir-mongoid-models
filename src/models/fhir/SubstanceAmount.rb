module FHIR
  class SubstanceAmount < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceAmount'
    embeds_one :amountQuantity, class_name: 'Quantity'
    embeds_one :amountRange, class_name: 'Range'
    field :amountPrimitiveString, type:  # primitive
    embeds_one :_amountPrimitiveString, class_name: 'Extension'
    embeds_one :amountType, class_name: 'CodeableConcept'
    field :amountText, type:  # primitive
    embeds_one :_amountText, class_name: 'Extension'
    embeds_one :referenceRange, class_name: 'SubstanceAmountReferenceRange'
  end
end
