module FHIR
  # fhir/appointment.rb
  class Appointment < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::AppointmentStatus'    
    embeds_one :cancelationReason, class_name: 'FHIR::CodeableConcept'    
    embeds_many :serviceCategory, class_name: 'FHIR::CodeableConcept'    
    embeds_many :serviceType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialty, class_name: 'FHIR::CodeableConcept'    
    embeds_one :appointmentType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_one :priority, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :supportingInformation, class_name: 'FHIR::Reference'    
    embeds_one :start, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :end, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :minutesDuration, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_many :slot, class_name: 'FHIR::Reference'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_one :patientInstruction, class_name: 'FHIR::PrimitiveString'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_many :participant, class_name: 'FHIR::AppointmentParticipant'    
    embeds_many :requestedPeriod, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.cancelationReason.nil? 
        result['cancelationReason'] = self.cancelationReason.as_json(*args)
      end
      unless self.serviceCategory.nil?  || !self.serviceCategory.any? 
        result['serviceCategory'] = self.serviceCategory.map{ |x| x.as_json(*args) }
      end
      unless self.serviceType.nil?  || !self.serviceType.any? 
        result['serviceType'] = self.serviceType.map{ |x| x.as_json(*args) }
      end
      unless self.specialty.nil?  || !self.specialty.any? 
        result['specialty'] = self.specialty.map{ |x| x.as_json(*args) }
      end
      unless self.appointmentType.nil? 
        result['appointmentType'] = self.appointmentType.as_json(*args)
      end
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.reasonReference.nil?  || !self.reasonReference.any? 
        result['reasonReference'] = self.reasonReference.map{ |x| x.as_json(*args) }
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.value
        serialized = Extension.serializePrimitiveExtension(self.priority)            
        result['_priority'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.supportingInformation.nil?  || !self.supportingInformation.any? 
        result['supportingInformation'] = self.supportingInformation.map{ |x| x.as_json(*args) }
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
      unless self.minutesDuration.nil? 
        result['minutesDuration'] = self.minutesDuration.value
        serialized = Extension.serializePrimitiveExtension(self.minutesDuration)            
        result['_minutesDuration'] = serialized unless serialized.nil?
      end
      unless self.slot.nil?  || !self.slot.any? 
        result['slot'] = self.slot.map{ |x| x.as_json(*args) }
      end
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      unless self.patientInstruction.nil? 
        result['patientInstruction'] = self.patientInstruction.value
        serialized = Extension.serializePrimitiveExtension(self.patientInstruction)            
        result['_patientInstruction'] = serialized unless serialized.nil?
      end
      unless self.basedOn.nil?  || !self.basedOn.any? 
        result['basedOn'] = self.basedOn.map{ |x| x.as_json(*args) }
      end
      unless self.participant.nil?  || !self.participant.any? 
        result['participant'] = self.participant.map{ |x| x.as_json(*args) }
      end
      unless self.requestedPeriod.nil?  || !self.requestedPeriod.any? 
        result['requestedPeriod'] = self.requestedPeriod.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Appointment.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = AppointmentStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['cancelationReason'] = CodeableConcept.transform_json(json_hash['cancelationReason']) unless json_hash['cancelationReason'].nil?
      result['serviceCategory'] = json_hash['serviceCategory'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['serviceCategory'].nil?
      result['serviceType'] = json_hash['serviceType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['serviceType'].nil?
      result['specialty'] = json_hash['specialty'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialty'].nil?
      result['appointmentType'] = CodeableConcept.transform_json(json_hash['appointmentType']) unless json_hash['appointmentType'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['priority'] = PrimitiveUnsignedInt.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['supportingInformation'] = json_hash['supportingInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInformation'].nil?
      result['start'] = PrimitiveInstant.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?
      result['end'] = PrimitiveInstant.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?
      result['minutesDuration'] = PrimitivePositiveInt.transform_json(json_hash['minutesDuration'], json_hash['_minutesDuration']) unless json_hash['minutesDuration'].nil?
      result['slot'] = json_hash['slot'].map { |var| Reference.transform_json(var) } unless json_hash['slot'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
      result['patientInstruction'] = PrimitiveString.transform_json(json_hash['patientInstruction'], json_hash['_patientInstruction']) unless json_hash['patientInstruction'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['participant'] = json_hash['participant'].map { |var| AppointmentParticipant.transform_json(var) } unless json_hash['participant'].nil?
      result['requestedPeriod'] = json_hash['requestedPeriod'].map { |var| Period.transform_json(var) } unless json_hash['requestedPeriod'].nil?

      result
    end
  end
end
