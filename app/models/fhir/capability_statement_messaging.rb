module FHIR
  # fhir/capability_statement_messaging.rb
  class CapabilityStatementMessaging < BackboneElement
    include Mongoid::Document
    embeds_many :endpoint, class_name: 'FHIR::CapabilityStatementMessagingEndpoint'    
    embeds_one :reliableCache, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :supportedMessage, class_name: 'FHIR::CapabilityStatementMessagingSupportedMessage'    
    
    def as_json(*args)
      result = super      
      unless self.endpoint.nil?  || !self.endpoint.any? 
        result['endpoint'] = self.endpoint.map{ |x| x.as_json(*args) }
      end
      unless self.reliableCache.nil? 
        result['reliableCache'] = self.reliableCache.value
        serialized = Extension.serializePrimitiveExtension(self.reliableCache)            
        result['_reliableCache'] = serialized unless serialized.nil?
      end
      unless self.documentation.nil? 
        result['documentation'] = self.documentation.value
        serialized = Extension.serializePrimitiveExtension(self.documentation)            
        result['_documentation'] = serialized unless serialized.nil?
      end
      unless self.supportedMessage.nil?  || !self.supportedMessage.any? 
        result['supportedMessage'] = self.supportedMessage.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CapabilityStatementMessaging.new)
      result = self.superclass.transform_json(json_hash, target)
      result['endpoint'] = json_hash['endpoint'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CapabilityStatementMessagingEndpoint.transform_json(var) 
        end
      } unless json_hash['endpoint'].nil?
      result['reliableCache'] = PrimitiveUnsignedInt.transform_json(json_hash['reliableCache'], json_hash['_reliableCache']) unless json_hash['reliableCache'].nil?
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?
      result['supportedMessage'] = json_hash['supportedMessage'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CapabilityStatementMessagingSupportedMessage.transform_json(var) 
        end
      } unless json_hash['supportedMessage'].nil?

      result
    end
  end
end
