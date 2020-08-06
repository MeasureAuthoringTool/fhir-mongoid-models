module FHIR
  # fhir/implementation_guide_definition_template.rb
  class ImplementationGuideDefinitionTemplate < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :source, class_name: 'FHIR::PrimitiveString'    
    embeds_one :scope, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.source.nil? 
        result['source'] = self.source.value
        serialized = Extension.serializePrimitiveExtension(self.source)            
        result['_source'] = serialized unless serialized.nil?
      end
      unless self.scope.nil? 
        result['scope'] = self.scope.value
        serialized = Extension.serializePrimitiveExtension(self.scope)            
        result['_scope'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImplementationGuideDefinitionTemplate.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['source'] = PrimitiveString.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?
      result['scope'] = PrimitiveString.transform_json(json_hash['scope'], json_hash['_scope']) unless json_hash['scope'].nil?

      result
    end
  end
end
