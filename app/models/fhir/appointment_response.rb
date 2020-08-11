module FHIR
  # fhir/appointment_response.rb
  class AppointmentResponse < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :appointment, class_name: 'FHIR::Reference'    
    embeds_one :start, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :end, class_name: 'FHIR::PrimitiveInstant'    
    embeds_many :participantType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :actor, class_name: 'FHIR::Reference'    
    embeds_one :participantStatus, class_name: 'FHIR::ParticipantStatus'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.appointment.nil? 
        result['appointment'] = self.appointment.as_json(*args)
      end
      unless self.start.nil? 
        result['start'] = self.start.value
        serialized = Extension.serializePrimitiveExtension(self.start)            
        result['_start'] = serialized unless serialized.nil?
      end
      unless self.end.nil? 
        result['end'] = self.end.value
        serialized = Extension.serializePrimitiveExtension(self.end)            
        result['_end'] = serialized unless serialized.nil?
      end
      unless self.participantType.nil?  || !self.participantType.any? 
        result['participantType'] = self.participantType.map{ |x| x.as_json(*args) }
      end
      unless self.actor.nil? 
        result['actor'] = self.actor.as_json(*args)
      end
      unless self.participantStatus.nil? 
        result['participantStatus'] = self.participantStatus.value
        serialized = Extension.serializePrimitiveExtension(self.participantStatus)            
        result['_participantStatus'] = serialized unless serialized.nil?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AppointmentResponse.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['appointment'] = Reference.transform_json(json_hash['appointment']) unless json_hash['appointment'].nil?
      result['start'] = PrimitiveInstant.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?
      result['end'] = PrimitiveInstant.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?
      result['participantType'] = json_hash['participantType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['participantType'].nil?
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?
      result['participantStatus'] = ParticipantStatus.transform_json(json_hash['participantStatus'], json_hash['_participantStatus']) unless json_hash['participantStatus'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?

      result
    end
  end
end
