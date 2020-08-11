module FHIR
  # fhir/specimen_definition_type_tested_container_additive.rb
  class SpecimenDefinitionTypeTestedContainerAdditive < BackboneElement
    include Mongoid::Document
    embeds_one :additiveCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :additiveReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.additiveCodeableConcept.nil?
        result['additiveCodeableConcept'] = self.additiveCodeableConcept.as_json(*args)                        
      end          
      unless self.additiveReference.nil?
        result['additiveReference'] = self.additiveReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SpecimenDefinitionTypeTestedContainerAdditive.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['additiveCodeableConcept'] = CodeableConcept.transform_json(json_hash['additiveCodeableConcept']) unless json_hash['additiveCodeableConcept'].nil?
      result['additiveReference'] = Reference.transform_json(json_hash['additiveReference']) unless json_hash['additiveReference'].nil?

      result
    end
  end
end
