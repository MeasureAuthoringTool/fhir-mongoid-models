module FHIR
  # fhir/bundle_link.rb
  class BundleLink < BackboneElement
    include Mongoid::Document
    embeds_one :relation, class_name: 'FHIR::PrimitiveString'    
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    
    def as_json(*args)
      result = super      
      unless self.relation.nil? 
        result['relation'] = self.relation.value
        serialized = Extension.serializePrimitiveExtension(self.relation)            
        result['_relation'] = serialized unless serialized.nil?
      end
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BundleLink.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['relation'] = PrimitiveString.transform_json(json_hash['relation'], json_hash['_relation']) unless json_hash['relation'].nil?
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?

      result
    end
  end
end
