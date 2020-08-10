module FHIR
  # fhir/audit_event_agent_network.rb
  class AuditEventAgentNetwork < BackboneElement
    include Mongoid::Document
    embeds_one :address, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::AuditEventAgentNetworkType'    
    
    def as_json(*args)
      result = super      
      unless self.address.nil? 
        result['address'] = self.address.value
        serialized = Extension.serializePrimitiveExtension(self.address)            
        result['_address'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = AuditEventAgentNetwork.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['address'] = PrimitiveString.transform_json(json_hash['address'], json_hash['_address']) unless json_hash['address'].nil?
      result['type'] = AuditEventAgentNetworkType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?

      result
    end
  end
end
