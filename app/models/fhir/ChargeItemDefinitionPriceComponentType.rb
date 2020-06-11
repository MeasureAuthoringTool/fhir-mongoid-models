module FHIR
  class ChargeItemDefinitionPriceComponentType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemDefinitionPriceComponentType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
