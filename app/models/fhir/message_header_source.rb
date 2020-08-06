module FHIR
  # fhir/message_header_source.rb
  class MessageHeaderSource < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :software, class_name: 'FHIR::PrimitiveString'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_one :contact, class_name: 'FHIR::ContactPoint'    
    embeds_one :endpoint, class_name: 'FHIR::PrimitiveUrl'    
    
    def as_json(*args)
      result = super      
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.software.nil? 
        result['software'] = self.software.value
        serialized = Extension.serializePrimitiveExtension(self.software)            
        result['_software'] = serialized unless serialized.nil?
      end
      unless self.version.nil? 
        result['version'] = self.version.value
        serialized = Extension.serializePrimitiveExtension(self.version)            
        result['_version'] = serialized unless serialized.nil?
      end
      unless self.contact.nil? 
        result['contact'] = self.contact.as_json(*args)
      end
      unless self.endpoint.nil? 
        result['endpoint'] = self.endpoint.value
        serialized = Extension.serializePrimitiveExtension(self.endpoint)            
        result['_endpoint'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MessageHeaderSource.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['software'] = PrimitiveString.transform_json(json_hash['software'], json_hash['_software']) unless json_hash['software'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['contact'] = ContactPoint.transform_json(json_hash['contact']) unless json_hash['contact'].nil?
      result['endpoint'] = PrimitiveUrl.transform_json(json_hash['endpoint'], json_hash['_endpoint']) unless json_hash['endpoint'].nil?

      result
    end
  end
end
