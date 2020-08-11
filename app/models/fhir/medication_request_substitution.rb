module FHIR
  # fhir/medication_request_substitution.rb
  class MedicationRequestSubstitution < BackboneElement
    include Mongoid::Document
    embeds_one :allowedBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :allowedCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :reason, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.allowedBoolean.nil?
        result['allowedBoolean'] = self.allowedBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.allowedBoolean) 
        result['_allowedBoolean'] = serialized unless serialized.nil?
      end          
      unless self.allowedCodeableConcept.nil?
        result['allowedCodeableConcept'] = self.allowedCodeableConcept.as_json(*args)                        
      end          
      unless self.reason.nil? 
        result['reason'] = self.reason.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationRequestSubstitution.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['allowedBoolean'] = PrimitiveBoolean.transform_json(json_hash['allowedBoolean'], json_hash['_allowedBoolean']) unless json_hash['allowedBoolean'].nil?
      result['allowedCodeableConcept'] = CodeableConcept.transform_json(json_hash['allowedCodeableConcept']) unless json_hash['allowedCodeableConcept'].nil?
      result['reason'] = CodeableConcept.transform_json(json_hash['reason']) unless json_hash['reason'].nil?

      result
    end
  end
end
