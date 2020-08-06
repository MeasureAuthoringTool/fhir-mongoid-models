module FHIR
  # fhir/binary.rb
  class Binary < Resource
    include Mongoid::Document
    embeds_one :contentType, class_name: 'FHIR::MimeType'    
    embeds_one :securityContext, class_name: 'FHIR::Reference'    
    embeds_one :data, class_name: 'FHIR::PrimitiveBase64Binary'    
    
    def as_json(*args)
      result = super      
      unless self.contentType.nil? 
        result['contentType'] = self.contentType.value
        serialized = Extension.serializePrimitiveExtension(self.contentType)            
        result['_contentType'] = serialized unless serialized.nil?
      end
      unless self.securityContext.nil? 
        result['securityContext'] = self.securityContext.as_json(*args)
      end
      unless self.data.nil? 
        result['data'] = self.data.value
        serialized = Extension.serializePrimitiveExtension(self.data)            
        result['_data'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Binary.new)
      result = self.superclass.transform_json(json_hash, target)
      result['contentType'] = MimeType.transform_json(json_hash['contentType'], json_hash['_contentType']) unless json_hash['contentType'].nil?
      result['securityContext'] = Reference.transform_json(json_hash['securityContext']) unless json_hash['securityContext'].nil?
      result['data'] = PrimitiveBase64Binary.transform_json(json_hash['data'], json_hash['_data']) unless json_hash['data'].nil?

      result
    end
  end
end
