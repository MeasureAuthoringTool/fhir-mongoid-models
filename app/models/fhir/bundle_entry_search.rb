module FHIR
  # fhir/bundle_entry_search.rb
  class BundleEntrySearch < BackboneElement
    include Mongoid::Document
    embeds_one :mode, class_name: 'FHIR::SearchEntryMode'    
    embeds_one :score, class_name: 'FHIR::PrimitiveDecimal'    
    
    def as_json(*args)
      result = super      
      unless self.mode.nil? 
        result['mode'] = self.mode.value
        serialized = Extension.serializePrimitiveExtension(self.mode)            
        result['_mode'] = serialized unless serialized.nil?
      end
      unless self.score.nil? 
        result['score'] = self.score.value
        serialized = Extension.serializePrimitiveExtension(self.score)            
        result['_score'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BundleEntrySearch.new)
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = SearchEntryMode.transform_json(json_hash['mode'], json_hash['_mode']) unless json_hash['mode'].nil?
      result['score'] = PrimitiveDecimal.transform_json(json_hash['score'], json_hash['_score']) unless json_hash['score'].nil?

      result
    end
  end
end
