module FHIR
  # fhir/message_header_response.rb
  class MessageHeaderResponse < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::PrimitiveId'    
    embeds_one :code, class_name: 'FHIR::ResponseType'    
    embeds_one :details, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.value
        serialized = Extension.serializePrimitiveExtension(self.identifier)            
        result['_identifier'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.details.nil? 
        result['details'] = self.details.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MessageHeaderResponse.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = PrimitiveId.transform_json(json_hash['identifier'], json_hash['_identifier']) unless json_hash['identifier'].nil?
      result['code'] = ResponseType.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['details'] = Reference.transform_json(json_hash['details']) unless json_hash['details'].nil?

      result
    end
  end
end
