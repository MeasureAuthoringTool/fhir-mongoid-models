module FHIR
  # fhir/bundle_entry.rb
  class BundleEntry < BackboneElement
    include Mongoid::Document
    embeds_many :link, class_name: 'FHIR::BundleLink'    
    embeds_one :fullUrl, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :resource, class_name: 'FHIR::Resource'    
    embeds_one :search, class_name: 'FHIR::BundleEntrySearch'    
    embeds_one :request, class_name: 'FHIR::BundleEntryRequest'    
    embeds_one :response, class_name: 'FHIR::BundleEntryResponse'    
    
    def as_json(*args)
      result = super      
      unless self.link.nil?  || !self.link.any? 
        result['link'] = self.link.map{ |x| x.as_json(*args) }
      end
      unless self.fullUrl.nil? 
        result['fullUrl'] = self.fullUrl.value
        serialized = Extension.serializePrimitiveExtension(self.fullUrl)            
        result['_fullUrl'] = serialized unless serialized.nil?
      end
      unless self.resource.nil? 
        result['resource'] = self.resource.as_json(*args)
      end
      unless self.search.nil? 
        result['search'] = self.search.as_json(*args)
      end
      unless self.request.nil? 
        result['request'] = self.request.as_json(*args)
      end
      unless self.response.nil? 
        result['response'] = self.response.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BundleEntry.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['link'] = json_hash['link'].map { |var| BundleLink.transform_json(var) } unless json_hash['link'].nil?
      result['fullUrl'] = PrimitiveUri.transform_json(json_hash['fullUrl'], json_hash['_fullUrl']) unless json_hash['fullUrl'].nil?
      result['resource'] = Resource.transform_json(json_hash['resource']) unless json_hash['resource'].nil?
      result['search'] = BundleEntrySearch.transform_json(json_hash['search']) unless json_hash['search'].nil?
      result['request'] = BundleEntryRequest.transform_json(json_hash['request']) unless json_hash['request'].nil?
      result['response'] = BundleEntryResponse.transform_json(json_hash['response']) unless json_hash['response'].nil?

      result
    end
  end
end
