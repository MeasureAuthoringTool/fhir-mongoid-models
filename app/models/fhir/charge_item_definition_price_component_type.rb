module FHIR
  # fhir/charge_item_definition_price_component_type.rb
  class ChargeItemDefinitionPriceComponentType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemDefinitionPriceComponentType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ChargeItemDefinitionPriceComponentType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
