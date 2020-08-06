module FHIR
  # fhir/test_script_setup_action_operation_request_header.rb
  class TestScriptSetupActionOperationRequestHeader < BackboneElement
    include Mongoid::Document
    embeds_one :field, class_name: 'FHIR::PrimitiveString'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.field.nil? 
        result['field'] = self.field.value
        serialized = Extension.serializePrimitiveExtension(self.field)            
        result['_field'] = serialized unless serialized.nil?
      end
      unless self.value.nil? 
        result['value'] = self.value.value
        serialized = Extension.serializePrimitiveExtension(self.value)            
        result['_value'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestScriptSetupActionOperationRequestHeader.new)
      result = self.superclass.transform_json(json_hash, target)
      result['field'] = PrimitiveString.transform_json(json_hash['field'], json_hash['_field']) unless json_hash['field'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?

      result
    end
  end
end
