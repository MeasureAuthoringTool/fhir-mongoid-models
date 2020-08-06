module FHIR
  # fhir/code_system_property.rb
  class CodeSystemProperty < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :uri, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::PropertyType'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.uri.nil? 
        result['uri'] = self.uri.value
        serialized = Extension.serializePrimitiveExtension(self.uri)            
        result['_uri'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CodeSystemProperty.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['uri'] = PrimitiveUri.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['type'] = PropertyType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?

      result
    end
  end
end
