module FHIR
  # fhir/implementation_guide_definition_parameter.rb
  class ImplementationGuideDefinitionParameter < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::GuideParameterCode'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = ImplementationGuideDefinitionParameter.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = GuideParameterCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?

      result
    end
  end
end
