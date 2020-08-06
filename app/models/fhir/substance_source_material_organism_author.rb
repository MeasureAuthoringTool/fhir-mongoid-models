module FHIR
  # fhir/substance_source_material_organism_author.rb
  class SubstanceSourceMaterialOrganismAuthor < BackboneElement
    include Mongoid::Document
    embeds_one :authorType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :authorDescription, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.authorType.nil? 
        result['authorType'] = self.authorType.as_json(*args)
      end
      unless self.authorDescription.nil? 
        result['authorDescription'] = self.authorDescription.value
        serialized = Extension.serializePrimitiveExtension(self.authorDescription)            
        result['_authorDescription'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSourceMaterialOrganismAuthor.new)
      result = self.superclass.transform_json(json_hash, target)
      result['authorType'] = CodeableConcept.transform_json(json_hash['authorType']) unless json_hash['authorType'].nil?
      result['authorDescription'] = PrimitiveString.transform_json(json_hash['authorDescription'], json_hash['_authorDescription']) unless json_hash['authorDescription'].nil?

      result
    end
  end
end
