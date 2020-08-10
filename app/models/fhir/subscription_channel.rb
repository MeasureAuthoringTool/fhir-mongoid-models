module FHIR
  # fhir/subscription_channel.rb
  class SubscriptionChannel < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::SubscriptionChannelType'    
    embeds_one :endpoint, class_name: 'FHIR::PrimitiveUrl'    
    embeds_one :payload, class_name: 'FHIR::MimeType'    
    embeds_many :header, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.endpoint.nil? 
        result['endpoint'] = self.endpoint.value
        serialized = Extension.serializePrimitiveExtension(self.endpoint)            
        result['_endpoint'] = serialized unless serialized.nil?
      end
      unless self.payload.nil? 
        result['payload'] = self.payload.value
        serialized = Extension.serializePrimitiveExtension(self.payload)            
        result['_payload'] = serialized unless serialized.nil?
      end
      unless self.header.nil?  || !self.header.any? 
        result['header'] = self.header.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.header)                              
        result['_header'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubscriptionChannel.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = SubscriptionChannelType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['endpoint'] = PrimitiveUrl.transform_json(json_hash['endpoint'], json_hash['_endpoint']) unless json_hash['endpoint'].nil?
      result['payload'] = MimeType.transform_json(json_hash['payload'], json_hash['_payload']) unless json_hash['payload'].nil?
      result['header'] = json_hash['header'].each_with_index.map do |var, i|
        extension_hash = json_hash['_header'] && json_hash['_header'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['header'].nil?

      result
    end
  end
end
