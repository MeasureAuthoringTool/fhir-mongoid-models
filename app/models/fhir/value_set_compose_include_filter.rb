module FHIR
  # fhir/value_set_compose_include_filter.rb
  class ValueSetComposeIncludeFilter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetComposeIncludeFilter'
    embeds_one :property, class_name: 'PrimitiveCode'
    embeds_one :op, class_name: 'FilterOperator'
    embeds_one :value, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = ValueSetComposeIncludeFilter.new
      result['property'] = PrimitiveCode.transform_json(json_hash['property'], json_hash['_property']) unless json_hash['property'].nil?      
      result['op'] = FilterOperator.transform_json(json_hash['op']) unless json_hash['op'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      

      result
    end
  end
end
