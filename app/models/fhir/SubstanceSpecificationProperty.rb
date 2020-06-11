module FHIR
  class SubstanceSpecificationProperty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationProperty'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    field :parameters, type:  # primitive
    embeds_one :_parameters, class_name: 'Extension'
    embeds_one :definingSubstanceReference, class_name: 'Reference'
    embeds_one :definingSubstanceCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :amountQuantity, class_name: 'Quantity'
    field :amountPrimitiveString, type:  # primitive
    embeds_one :_amountPrimitiveString, class_name: 'Extension'
  end
end
