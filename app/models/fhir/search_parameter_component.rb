module FHIR
  # fhir/search_parameter_component.rb
  class SearchParameterComponent < BackboneElement
    include Mongoid::Document
    embeds_one :definition, class_name: 'PrimitiveCanonical'
    embeds_one :expression, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = SearchParameterComponent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['definition'] = PrimitiveCanonical.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?      
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?      

      result
    end
  end
end
