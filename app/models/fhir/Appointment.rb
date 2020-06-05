module FHIR
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
    field :priority, type:  # primitive
    embeds_one :_priority, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :supportingInformation, class_name: 'Reference'
    field :start, type:  # primitive
    embeds_one :_start, class_name: 'Extension'
    field :end, type:  # primitive
    embeds_one :_end, class_name: 'Extension'
    field :minutesDuration, type:  # primitive
    embeds_one :_minutesDuration, class_name: 'Extension'
    embeds_many :slot, class_name: 'Reference'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
    field :patientInstruction, type:  # primitive
    embeds_one :_patientInstruction, class_name: 'Extension'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :participant, class_name: 'AppointmentParticipant'
    embeds_many :requestedPeriod, class_name: 'Period'
  end
end
