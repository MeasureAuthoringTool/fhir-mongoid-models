module FHIR
  # fhir/structure_map_structure.rb
  class StructureMapStructure < BackboneElement
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :mode, class_name: 'FHIR::StructureMapModelMode'    
    embeds_one :alias, class_name: 'FHIR::PrimitiveString'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.mode.nil? 
        result['mode'] = self.mode.value
        serialized = Extension.serializePrimitiveExtension(self.mode)            
        result['_mode'] = serialized unless serialized.nil?
      end
      unless self.alias.nil? 
        result['alias'] = self.alias.value
        serialized = Extension.serializePrimitiveExtension(self.alias)            
        result['_alias'] = serialized unless serialized.nil?
      end
      unless self.documentation.nil? 
        result['documentation'] = self.documentation.value
        serialized = Extension.serializePrimitiveExtension(self.documentation)            
        result['_documentation'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = StructureMapStructure.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveCanonical.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['mode'] = StructureMapModelMode.transform_json(json_hash['mode'], json_hash['_mode']) unless json_hash['mode'].nil?
      result['alias'] = PrimitiveString.transform_json(json_hash['alias'], json_hash['_alias']) unless json_hash['alias'].nil?
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?

      result
    end
  end
end
