module FHIR
  # fhir/value_set_compose_include_filter.rb
  class ValueSetComposeIncludeFilter < BackboneElement
    include Mongoid::Document
    embeds_one :property, class_name: 'FHIR::PrimitiveCode'
    embeds_one :op, class_name: 'FHIR::FilterOperator'
    embeds_one :value, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = ValueSetComposeIncludeFilter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['property'] = PrimitiveCode.transform_json(json_hash['property'], json_hash['_property']) unless json_hash['property'].nil?      
      result['op'] = FilterOperator.transform_json(json_hash['op']) unless json_hash['op'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      

      result
    end
  end
end
