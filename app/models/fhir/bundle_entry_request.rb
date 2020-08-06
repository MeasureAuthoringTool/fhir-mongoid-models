module FHIR
  # fhir/bundle_entry_request.rb
  class BundleEntryRequest < BackboneElement
    include Mongoid::Document
    embeds_one :method, class_name: 'FHIR::HTTPVerb'    
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :ifNoneMatch, class_name: 'FHIR::PrimitiveString'    
    embeds_one :ifModifiedSince, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :ifMatch, class_name: 'FHIR::PrimitiveString'    
    embeds_one :ifNoneExist, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.method.nil? 
        result['method'] = self.method.value
        serialized = Extension.serializePrimitiveExtension(self.method)            
        result['_method'] = serialized unless serialized.nil?
      end
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.ifNoneMatch.nil? 
        result['ifNoneMatch'] = self.ifNoneMatch.value
        serialized = Extension.serializePrimitiveExtension(self.ifNoneMatch)            
        result['_ifNoneMatch'] = serialized unless serialized.nil?
      end
      unless self.ifModifiedSince.nil? 
        result['ifModifiedSince'] = self.ifModifiedSince.value
        serialized = Extension.serializePrimitiveExtension(self.ifModifiedSince)            
        result['_ifModifiedSince'] = serialized unless serialized.nil?
      end
      unless self.ifMatch.nil? 
        result['ifMatch'] = self.ifMatch.value
        serialized = Extension.serializePrimitiveExtension(self.ifMatch)            
        result['_ifMatch'] = serialized unless serialized.nil?
      end
      unless self.ifNoneExist.nil? 
        result['ifNoneExist'] = self.ifNoneExist.value
        serialized = Extension.serializePrimitiveExtension(self.ifNoneExist)            
        result['_ifNoneExist'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BundleEntryRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['method'] = HTTPVerb.transform_json(json_hash['method'], json_hash['_method']) unless json_hash['method'].nil?
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['ifNoneMatch'] = PrimitiveString.transform_json(json_hash['ifNoneMatch'], json_hash['_ifNoneMatch']) unless json_hash['ifNoneMatch'].nil?
      result['ifModifiedSince'] = PrimitiveInstant.transform_json(json_hash['ifModifiedSince'], json_hash['_ifModifiedSince']) unless json_hash['ifModifiedSince'].nil?
      result['ifMatch'] = PrimitiveString.transform_json(json_hash['ifMatch'], json_hash['_ifMatch']) unless json_hash['ifMatch'].nil?
      result['ifNoneExist'] = PrimitiveString.transform_json(json_hash['ifNoneExist'], json_hash['_ifNoneExist']) unless json_hash['ifNoneExist'].nil?

      result
    end
  end
end
