module FHIR
  class ChargeItemDefinitionPropertyGroupPriceComponent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemDefinitionPropertyGroupPriceComponent'
    embeds_one :type, class_name: 'ChargeItemDefinitionPriceComponentType'
    embeds_one :code, class_name: 'CodeableConcept'
    field :factor, type:  # primitive
    embeds_one :_factor, class_name: 'Extension'
    embeds_one :amount, class_name: 'Money'
  end
end
