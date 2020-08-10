module FHIR
  # fhir/capability_statement_messaging_supported_message.rb
  class CapabilityStatementMessagingSupportedMessage < BackboneElement
    include Mongoid::Document
    embeds_one :mode, class_name: 'FHIR::EventCapabilityMode'    
    embeds_one :definition, class_name: 'FHIR::PrimitiveCanonical'    
    
    def as_json(*args)
      result = super      
      unless self.mode.nil? 
        result['mode'] = self.mode.value
        serialized = Extension.serializePrimitiveExtension(self.mode)            
        result['_mode'] = serialized unless serialized.nil?
      end
      unless self.definition.nil? 
        result['definition'] = self.definition.value
        serialized = Extension.serializePrimitiveExtension(self.definition)            
        result['_definition'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CapabilityStatementMessagingSupportedMessage.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = EventCapabilityMode.transform_json(json_hash['mode'], json_hash['_mode']) unless json_hash['mode'].nil?
      result['definition'] = PrimitiveCanonical.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?

      result
    end
  end
end
