module FHIR
  # fhir/subscription.rb
  class Subscription < DomainResource
    include Mongoid::Document
    embeds_one :status, class_name: 'FHIR::SubscriptionStatus'    
    embeds_many :contact, class_name: 'FHIR::ContactPoint'    
    embeds_one :end, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :reason, class_name: 'FHIR::PrimitiveString'    
    embeds_one :criteria, class_name: 'FHIR::PrimitiveString'    
    embeds_one :error, class_name: 'FHIR::PrimitiveString'    
    embeds_one :channel, class_name: 'FHIR::SubscriptionChannel'    
    
    def as_json(*args)
      result = super      
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.end.nil? 
        result['end'] = self.end.value
        serialized = Extension.serializePrimitiveExtension(self.end)            
        result['_end'] = serialized unless serialized.nil?
      end
      unless self.reason.nil? 
        result['reason'] = self.reason.value
        serialized = Extension.serializePrimitiveExtension(self.reason)            
        result['_reason'] = serialized unless serialized.nil?
      end
      unless self.criteria.nil? 
        result['criteria'] = self.criteria.value
        serialized = Extension.serializePrimitiveExtension(self.criteria)            
        result['_criteria'] = serialized unless serialized.nil?
      end
      unless self.error.nil? 
        result['error'] = self.error.value
        serialized = Extension.serializePrimitiveExtension(self.error)            
        result['_error'] = serialized unless serialized.nil?
      end
      unless self.channel.nil? 
        result['channel'] = self.channel.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Subscription.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['status'] = SubscriptionStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['contact'] = json_hash['contact'].map { |var| ContactPoint.transform_json(var) } unless json_hash['contact'].nil?
      result['end'] = PrimitiveInstant.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?
      result['reason'] = PrimitiveString.transform_json(json_hash['reason'], json_hash['_reason']) unless json_hash['reason'].nil?
      result['criteria'] = PrimitiveString.transform_json(json_hash['criteria'], json_hash['_criteria']) unless json_hash['criteria'].nil?
      result['error'] = PrimitiveString.transform_json(json_hash['error'], json_hash['_error']) unless json_hash['error'].nil?
      result['channel'] = SubscriptionChannel.transform_json(json_hash['channel']) unless json_hash['channel'].nil?

      result
    end
  end
end
