module FHIR
  # fhir/search_parameter_component.rb
  class SearchParameterComponent < BackboneElement
    include Mongoid::Document
    embeds_one :definition, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :expression, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.definition.nil? 
        result['definition'] = self.definition.value
        serialized = Extension.serializePrimitiveExtension(self.definition)            
        result['_definition'] = serialized unless serialized.nil?
      end
      unless self.expression.nil? 
        result['expression'] = self.expression.value
        serialized = Extension.serializePrimitiveExtension(self.expression)            
        result['_expression'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SearchParameterComponent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['definition'] = PrimitiveCanonical.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?

      result
    end
  end
end
