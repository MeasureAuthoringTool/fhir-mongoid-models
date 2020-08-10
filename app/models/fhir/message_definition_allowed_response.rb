module FHIR
  # fhir/message_definition_allowed_response.rb
  class MessageDefinitionAllowedResponse < BackboneElement
    include Mongoid::Document
    embeds_one :message, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :situation, class_name: 'FHIR::PrimitiveMarkdown'    
    
    def as_json(*args)
      result = super      
      unless self.message.nil? 
        result['message'] = self.message.value
        serialized = Extension.serializePrimitiveExtension(self.message)            
        result['_message'] = serialized unless serialized.nil?
      end
      unless self.situation.nil? 
        result['situation'] = self.situation.value
        serialized = Extension.serializePrimitiveExtension(self.situation)            
        result['_situation'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MessageDefinitionAllowedResponse.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['message'] = PrimitiveCanonical.transform_json(json_hash['message'], json_hash['_message']) unless json_hash['message'].nil?
      result['situation'] = PrimitiveMarkdown.transform_json(json_hash['situation'], json_hash['_situation']) unless json_hash['situation'].nil?

      result
    end
  end
end
