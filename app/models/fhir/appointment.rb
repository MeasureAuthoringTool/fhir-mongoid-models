module FHIR
  # fhir/appointment.rb
  class Appointment < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Appointment'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'AppointmentStatus'
    embeds_one :cancelationReason, class_name: 'CodeableConcept'
    embeds_many :serviceCategory, class_name: 'CodeableConcept'
    embeds_many :serviceType, class_name: 'CodeableConcept'
    embeds_many :specialty, class_name: 'CodeableConcept'
    embeds_one :appointmentType, class_name: 'CodeableConcept'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_one :priority, class_name: 'PrimitiveUnsignedInt'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :supportingInformation, class_name: 'Reference'
    embeds_one :start, class_name: 'PrimitiveInstant'
    embeds_one :end, class_name: 'PrimitiveInstant'
    embeds_one :minutesDuration, class_name: 'PrimitivePositiveInt'
    embeds_many :slot, class_name: 'Reference'
    embeds_one :created, class_name: 'PrimitiveDateTime'
    embeds_one :comment, class_name: 'PrimitiveString'
    embeds_one :patientInstruction, class_name: 'PrimitiveString'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :participant, class_name: 'AppointmentParticipant'
    embeds_many :requestedPeriod, class_name: 'Period'

    def self.transform_json(json_hash, target=Appointment.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = AppointmentStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
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
