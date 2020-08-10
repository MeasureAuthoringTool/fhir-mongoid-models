module FHIR
  # fhir/substance_source_material_part_description.rb
  class SubstanceSourceMaterialPartDescription < BackboneElement
    include Mongoid::Document
    embeds_one :part, class_name: 'FHIR::CodeableConcept'    
    embeds_one :partLocation, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.part.nil? 
        result['part'] = self.part.as_json(*args)
      end
      unless self.partLocation.nil? 
        result['partLocation'] = self.partLocation.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSourceMaterialPartDescription.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['part'] = CodeableConcept.transform_json(json_hash['part']) unless json_hash['part'].nil?
      result['partLocation'] = CodeableConcept.transform_json(json_hash['partLocation']) unless json_hash['partLocation'].nil?

      result
    end
  end
end
