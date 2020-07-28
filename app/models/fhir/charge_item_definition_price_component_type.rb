module FHIR
  # fhir/charge_item_definition_price_component_type.rb
  class ChargeItemDefinitionPriceComponentType < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = ChargeItemDefinitionPriceComponentType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
