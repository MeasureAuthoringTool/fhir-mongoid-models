module FHIR
  # fhir/encounter_location.rb
  class EncounterLocation < BackboneElement
    include Mongoid::Document
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::EncounterLocationStatus'    
    embeds_one :physicalType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.physicalType.nil? 
        result['physicalType'] = self.physicalType.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EncounterLocation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['status'] = EncounterLocationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['physicalType'] = CodeableConcept.transform_json(json_hash['physicalType']) unless json_hash['physicalType'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
