module FHIR
  # fhir/capability_statement_messaging_endpoint.rb
  class CapabilityStatementMessagingEndpoint < BackboneElement
    include Mongoid::Document
    embeds_one :protocol, class_name: 'FHIR::Coding'    
    embeds_one :address, class_name: 'FHIR::PrimitiveUrl'    
    
    def as_json(*args)
      result = super      
      unless self.protocol.nil? 
        result['protocol'] = self.protocol.as_json(*args)
      end
      unless self.address.nil? 
        result['address'] = self.address.value
        serialized = Extension.serializePrimitiveExtension(self.address)            
        result['_address'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CapabilityStatementMessagingEndpoint.new)
      result = self.superclass.transform_json(json_hash, target)
      result['protocol'] = Coding.transform_json(json_hash['protocol']) unless json_hash['protocol'].nil?
      result['address'] = PrimitiveUrl.transform_json(json_hash['address'], json_hash['_address']) unless json_hash['address'].nil?

      result
    end
  end
end
