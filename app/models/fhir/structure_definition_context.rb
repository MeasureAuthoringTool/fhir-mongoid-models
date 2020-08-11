module FHIR
  # fhir/structure_definition_context.rb
  class StructureDefinitionContext < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ExtensionContextType'    
    embeds_one :expression, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = StructureDefinitionContext.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ExtensionContextType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?

      result
    end
  end
end
