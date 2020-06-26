module FHIR
  # fhir/simple_quantity.rb
  class SimpleQuantity < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'SimpleQuantity'
    embeds_one :value, class_name: 'PrimitiveDecimal'
    embeds_one :unit, class_name: 'PrimitiveString'
    embeds_one :system, class_name: 'PrimitiveUri'
    embeds_one :code, class_name: 'PrimitiveCode'

    def self.transform_json(json_hash)
      result = SimpleQuantity.new
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      
      result['unit'] = PrimitiveString.transform_json(json_hash['unit'], json_hash['_unit']) unless json_hash['unit'].nil?      
      result['system'] = PrimitiveUri.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?      
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      

      result
    end
  end
end
