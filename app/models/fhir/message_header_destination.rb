module FHIR
  # fhir/message_header_destination.rb
  class MessageHeaderDestination < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :target, class_name: 'FHIR::Reference'    
    embeds_one :endpoint, class_name: 'FHIR::PrimitiveUrl'    
    embeds_one :receiver, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.target.nil? 
        result['target'] = self.target.as_json(*args)
      end
      unless self.endpoint.nil? 
        result['endpoint'] = self.endpoint.value
        serialized = Extension.serializePrimitiveExtension(self.endpoint)            
        result['_endpoint'] = serialized unless serialized.nil?
      end
      unless self.receiver.nil? 
        result['receiver'] = self.receiver.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MessageHeaderDestination.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['target'] = Reference.transform_json(json_hash['target']) unless json_hash['target'].nil?
      result['endpoint'] = PrimitiveUrl.transform_json(json_hash['endpoint'], json_hash['_endpoint']) unless json_hash['endpoint'].nil?
      result['receiver'] = Reference.transform_json(json_hash['receiver']) unless json_hash['receiver'].nil?

      result
    end
  end
end
