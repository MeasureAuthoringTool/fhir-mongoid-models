module FHIR
  # fhir/appointment_participant.rb
  class AppointmentParticipant < BackboneElement
    include Mongoid::Document
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :actor, class_name: 'FHIR::Reference'    
    embeds_one :required, class_name: 'FHIR::ParticipantRequired'    
    embeds_one :status, class_name: 'FHIR::ParticipationStatus'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.actor.nil? 
        result['actor'] = self.actor.as_json(*args)
      end
      unless self.required.nil? 
        result['required'] = self.required.value
        serialized = Extension.serializePrimitiveExtension(self.required)            
        result['_required'] = serialized unless serialized.nil?
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = AppointmentParticipant.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?
      result['required'] = ParticipantRequired.transform_json(json_hash['required'], json_hash['_required']) unless json_hash['required'].nil?
      result['status'] = ParticipationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
