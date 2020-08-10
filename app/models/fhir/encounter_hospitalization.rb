module FHIR
  # fhir/encounter_hospitalization.rb
  class EncounterHospitalization < BackboneElement
    include Mongoid::Document
    embeds_one :preAdmissionIdentifier, class_name: 'FHIR::Identifier'    
    embeds_one :origin, class_name: 'FHIR::Reference'    
    embeds_one :admitSource, class_name: 'FHIR::CodeableConcept'    
    embeds_one :reAdmission, class_name: 'FHIR::CodeableConcept'    
    embeds_many :dietPreference, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialCourtesy, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialArrangement, class_name: 'FHIR::CodeableConcept'    
    embeds_one :destination, class_name: 'FHIR::Reference'    
    embeds_one :dischargeDisposition, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.preAdmissionIdentifier.nil? 
        result['preAdmissionIdentifier'] = self.preAdmissionIdentifier.as_json(*args)
      end
      unless self.origin.nil? 
        result['origin'] = self.origin.as_json(*args)
      end
      unless self.admitSource.nil? 
        result['admitSource'] = self.admitSource.as_json(*args)
      end
      unless self.reAdmission.nil? 
        result['reAdmission'] = self.reAdmission.as_json(*args)
      end
      unless self.dietPreference.nil?  || !self.dietPreference.any? 
        result['dietPreference'] = self.dietPreference.map{ |x| x.as_json(*args) }
      end
      unless self.specialCourtesy.nil?  || !self.specialCourtesy.any? 
        result['specialCourtesy'] = self.specialCourtesy.map{ |x| x.as_json(*args) }
      end
      unless self.specialArrangement.nil?  || !self.specialArrangement.any? 
        result['specialArrangement'] = self.specialArrangement.map{ |x| x.as_json(*args) }
      end
      unless self.destination.nil? 
        result['destination'] = self.destination.as_json(*args)
      end
      unless self.dischargeDisposition.nil? 
        result['dischargeDisposition'] = self.dischargeDisposition.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EncounterHospitalization.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['preAdmissionIdentifier'] = Identifier.transform_json(json_hash['preAdmissionIdentifier']) unless json_hash['preAdmissionIdentifier'].nil?
      result['origin'] = Reference.transform_json(json_hash['origin']) unless json_hash['origin'].nil?
      result['admitSource'] = CodeableConcept.transform_json(json_hash['admitSource']) unless json_hash['admitSource'].nil?
      result['reAdmission'] = CodeableConcept.transform_json(json_hash['reAdmission']) unless json_hash['reAdmission'].nil?
      result['dietPreference'] = json_hash['dietPreference'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['dietPreference'].nil?
      result['specialCourtesy'] = json_hash['specialCourtesy'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialCourtesy'].nil?
      result['specialArrangement'] = json_hash['specialArrangement'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialArrangement'].nil?
      result['destination'] = Reference.transform_json(json_hash['destination']) unless json_hash['destination'].nil?
      result['dischargeDisposition'] = CodeableConcept.transform_json(json_hash['dischargeDisposition']) unless json_hash['dischargeDisposition'].nil?

      result
    end
  end
end
