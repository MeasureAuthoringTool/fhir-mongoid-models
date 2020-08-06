module FHIR
  # fhir/bundle_entry_response.rb
  class BundleEntryResponse < BackboneElement
    include Mongoid::Document
    embeds_one :status, class_name: 'FHIR::PrimitiveString'    
    embeds_one :location, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :etag, class_name: 'FHIR::PrimitiveString'    
    embeds_one :lastModified, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :outcome, class_name: 'FHIR::Resource'    
    
    def as_json(*args)
      result = super      
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.location.nil? 
        result['location'] = self.location.value
        serialized = Extension.serializePrimitiveExtension(self.location)            
        result['_location'] = serialized unless serialized.nil?
      end
      unless self.etag.nil? 
        result['etag'] = self.etag.value
        serialized = Extension.serializePrimitiveExtension(self.etag)            
        result['_etag'] = serialized unless serialized.nil?
      end
      unless self.lastModified.nil? 
        result['lastModified'] = self.lastModified.value
        serialized = Extension.serializePrimitiveExtension(self.lastModified)            
        result['_lastModified'] = serialized unless serialized.nil?
      end
      unless self.outcome.nil? 
        result['outcome'] = self.outcome.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BundleEntryResponse.new)
      result = self.superclass.transform_json(json_hash, target)
      result['status'] = PrimitiveString.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['location'] = PrimitiveUri.transform_json(json_hash['location'], json_hash['_location']) unless json_hash['location'].nil?
      result['etag'] = PrimitiveString.transform_json(json_hash['etag'], json_hash['_etag']) unless json_hash['etag'].nil?
      result['lastModified'] = PrimitiveInstant.transform_json(json_hash['lastModified'], json_hash['_lastModified']) unless json_hash['lastModified'].nil?
      result['outcome'] = Resource.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?

      result
    end
  end
end
