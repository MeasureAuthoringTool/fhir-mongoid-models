module FHIR
  # fhir/substance_source_material_organism_hybrid.rb
  class SubstanceSourceMaterialOrganismHybrid < BackboneElement
    include Mongoid::Document
    embeds_one :maternalOrganismId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :maternalOrganismName, class_name: 'FHIR::PrimitiveString'    
    embeds_one :paternalOrganismId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :paternalOrganismName, class_name: 'FHIR::PrimitiveString'    
    embeds_one :hybridType, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.maternalOrganismId.nil? 
        result['maternalOrganismId'] = self.maternalOrganismId.value
        serialized = Extension.serializePrimitiveExtension(self.maternalOrganismId)            
        result['_maternalOrganismId'] = serialized unless serialized.nil?
      end
      unless self.maternalOrganismName.nil? 
        result['maternalOrganismName'] = self.maternalOrganismName.value
        serialized = Extension.serializePrimitiveExtension(self.maternalOrganismName)            
        result['_maternalOrganismName'] = serialized unless serialized.nil?
      end
      unless self.paternalOrganismId.nil? 
        result['paternalOrganismId'] = self.paternalOrganismId.value
        serialized = Extension.serializePrimitiveExtension(self.paternalOrganismId)            
        result['_paternalOrganismId'] = serialized unless serialized.nil?
      end
      unless self.paternalOrganismName.nil? 
        result['paternalOrganismName'] = self.paternalOrganismName.value
        serialized = Extension.serializePrimitiveExtension(self.paternalOrganismName)            
        result['_paternalOrganismName'] = serialized unless serialized.nil?
      end
      unless self.hybridType.nil? 
        result['hybridType'] = self.hybridType.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSourceMaterialOrganismHybrid.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['maternalOrganismId'] = PrimitiveString.transform_json(json_hash['maternalOrganismId'], json_hash['_maternalOrganismId']) unless json_hash['maternalOrganismId'].nil?
      result['maternalOrganismName'] = PrimitiveString.transform_json(json_hash['maternalOrganismName'], json_hash['_maternalOrganismName']) unless json_hash['maternalOrganismName'].nil?
      result['paternalOrganismId'] = PrimitiveString.transform_json(json_hash['paternalOrganismId'], json_hash['_paternalOrganismId']) unless json_hash['paternalOrganismId'].nil?
      result['paternalOrganismName'] = PrimitiveString.transform_json(json_hash['paternalOrganismName'], json_hash['_paternalOrganismName']) unless json_hash['paternalOrganismName'].nil?
      result['hybridType'] = CodeableConcept.transform_json(json_hash['hybridType']) unless json_hash['hybridType'].nil?

      result
    end
  end
end
