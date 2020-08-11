module FHIR
  # fhir/communication_request_payload.rb
  class CommunicationRequestPayload < BackboneElement
    include Mongoid::Document
    embeds_one :contentString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :contentAttachment, class_name: 'FHIR::Attachment'    
    embeds_one :contentReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.contentString.nil?
        result['contentString'] = self.contentString.value                        
        serialized = Extension.serializePrimitiveExtension(self.contentString) 
        result['_contentString'] = serialized unless serialized.nil?
      end          
      unless self.contentAttachment.nil?
        result['contentAttachment'] = self.contentAttachment.as_json(*args)                        
      end          
      unless self.contentReference.nil?
        result['contentReference'] = self.contentReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CommunicationRequestPayload.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['contentString'] = PrimitiveString.transform_json(json_hash['contentString'], json_hash['_contentString']) unless json_hash['contentString'].nil?
      result['contentAttachment'] = Attachment.transform_json(json_hash['contentAttachment']) unless json_hash['contentAttachment'].nil?
      result['contentReference'] = Reference.transform_json(json_hash['contentReference']) unless json_hash['contentReference'].nil?

      result
    end
  end
end
