module FHIR
  class AppointmentParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AppointmentParticipant'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'
    embeds_one :required, class_name: 'ParticipantRequired'
    embeds_one :status, class_name: 'ParticipationStatus'
    embeds_one :period, class_name: 'Period'
  end
end
