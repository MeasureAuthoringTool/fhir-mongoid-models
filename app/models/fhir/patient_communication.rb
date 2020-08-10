module FHIR
  # fhir/patient_communication.rb
  class PatientCommunication < BackboneElement
    include Mongoid::Document
    embeds_one :language, class_name: 'FHIR::CodeableConcept'    
    embeds_one :preferred, class_name: 'FHIR::PrimitiveBoolean'    
    
    def as_json(*args)
      result = super      
      unless self.language.nil? 
        result['language'] = self.language.as_json(*args)
      end
      unless self.preferred.nil? 
        result['preferred'] = self.preferred.value
        serialized = Extension.serializePrimitiveExtension(self.preferred)            
        result['_preferred'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PatientCommunication.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['language'] = CodeableConcept.transform_json(json_hash['language']) unless json_hash['language'].nil?
      result['preferred'] = PrimitiveBoolean.transform_json(json_hash['preferred'], json_hash['_preferred']) unless json_hash['preferred'].nil?

      result
    end
  end
end
