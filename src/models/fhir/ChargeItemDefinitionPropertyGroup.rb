module FHIR
  class ChargeItemDefinitionPropertyGroup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemDefinitionPropertyGroup'
    embeds_many :applicability, class_name: 'ChargeItemDefinitionApplicability'
    embeds_many :priceComponent, class_name: 'ChargeItemDefinitionPropertyGroupPriceComponent'
  end
end
