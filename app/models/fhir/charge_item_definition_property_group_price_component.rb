module FHIR
  # fhir/charge_item_definition_property_group_price_component.rb
  class ChargeItemDefinitionPropertyGroupPriceComponent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemDefinitionPropertyGroupPriceComponent'
    embeds_one :type, class_name: 'ChargeItemDefinitionPriceComponentType'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :factor, class_name: 'PrimitiveDecimal'
    embeds_one :amount, class_name: 'Money'

    def self.transform_json(json_hash, target=ChargeItemDefinitionPropertyGroupPriceComponent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ChargeItemDefinitionPriceComponentType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?      
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      

      result
    end
  end
end
