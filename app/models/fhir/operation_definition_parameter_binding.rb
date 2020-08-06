module FHIR
  # fhir/operation_definition_parameter_binding.rb
  class OperationDefinitionParameterBinding < BackboneElement
    include Mongoid::Document
    embeds_one :strength, class_name: 'FHIR::BindingStrength'    
    embeds_one :valueSet, class_name: 'FHIR::PrimitiveCanonical'    
    
    def as_json(*args)
      result = super      
      unless self.strength.nil? 
        result['strength'] = self.strength.value
        serialized = Extension.serializePrimitiveExtension(self.strength)            
        result['_strength'] = serialized unless serialized.nil?
      end
      unless self.valueSet.nil? 
        result['valueSet'] = self.valueSet.value
        serialized = Extension.serializePrimitiveExtension(self.valueSet)            
        result['_valueSet'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = OperationDefinitionParameterBinding.new)
      result = self.superclass.transform_json(json_hash, target)
      result['strength'] = BindingStrength.transform_json(json_hash['strength'], json_hash['_strength']) unless json_hash['strength'].nil?
      result['valueSet'] = PrimitiveCanonical.transform_json(json_hash['valueSet'], json_hash['_valueSet']) unless json_hash['valueSet'].nil?

      result
    end
  end
end
