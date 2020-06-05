module FHIR
  class AppointmentResponse < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'AppointmentResponse'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :appointment, class_name: 'Reference'
    field :start, type:  # primitive
    embeds_one :_start, class_name: 'Extension'
    field :end, type:  # primitive
    embeds_one :_end, class_name: 'Extension'
    embeds_many :participantType, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'
    embeds_one :participantStatus, class_name: 'ParticipantStatus'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
  end
end
