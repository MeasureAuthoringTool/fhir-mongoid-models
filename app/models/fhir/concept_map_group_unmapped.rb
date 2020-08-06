module FHIR
  # fhir/concept_map_group_unmapped.rb
  class ConceptMapGroupUnmapped < BackboneElement
    include Mongoid::Document
    embeds_one :mode, class_name: 'FHIR::ConceptMapGroupUnmappedMode'    
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :display, class_name: 'FHIR::PrimitiveString'    
    embeds_one :url, class_name: 'FHIR::PrimitiveCanonical'    
    
    def as_json(*args)
      result = super      
      unless self.mode.nil? 
        result['mode'] = self.mode.value
        serialized = Extension.serializePrimitiveExtension(self.mode)            
        result['_mode'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.display.nil? 
        result['display'] = self.display.value
        serialized = Extension.serializePrimitiveExtension(self.display)            
        result['_display'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = ConceptMapGroupUnmapped.new)
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = ConceptMapGroupUnmappedMode.transform_json(json_hash['mode'], json_hash['_mode']) unless json_hash['mode'].nil?
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?
      result['url'] = PrimitiveCanonical.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?

      result
    end
  end
end
