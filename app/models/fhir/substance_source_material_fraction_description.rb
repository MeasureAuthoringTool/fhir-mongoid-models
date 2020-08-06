module FHIR
  # fhir/substance_source_material_fraction_description.rb
  class SubstanceSourceMaterialFractionDescription < BackboneElement
    include Mongoid::Document
    embeds_one :fraction, class_name: 'FHIR::PrimitiveString'    
    embeds_one :materialType, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.fraction.nil? 
        result['fraction'] = self.fraction.value
        serialized = Extension.serializePrimitiveExtension(self.fraction)            
        result['_fraction'] = serialized unless serialized.nil?
      end
      unless self.materialType.nil? 
        result['materialType'] = self.materialType.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSourceMaterialFractionDescription.new)
      result = self.superclass.transform_json(json_hash, target)
      result['fraction'] = PrimitiveString.transform_json(json_hash['fraction'], json_hash['_fraction']) unless json_hash['fraction'].nil?
      result['materialType'] = CodeableConcept.transform_json(json_hash['materialType']) unless json_hash['materialType'].nil?

      result
    end
  end
end
