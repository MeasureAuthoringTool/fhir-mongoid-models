module FHIR
  # fhir/substance_nucleic_acid_subunit_sugar.rb
  class SubstanceNucleicAcidSubunitSugar < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :residueSite, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.residueSite.nil? 
        result['residueSite'] = self.residueSite.value
        serialized = Extension.serializePrimitiveExtension(self.residueSite)            
        result['_residueSite'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceNucleicAcidSubunitSugar.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['residueSite'] = PrimitiveString.transform_json(json_hash['residueSite'], json_hash['_residueSite']) unless json_hash['residueSite'].nil?

      result
    end
  end
end
