module FHIR
  class Slot < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Slot'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :serviceCategory, class_name: 'CodeableConcept'
    embeds_many :serviceType, class_name: 'CodeableConcept'
    embeds_many :specialty, class_name: 'CodeableConcept'
    embeds_one :appointmentType, class_name: 'CodeableConcept'
    embeds_one :schedule, class_name: 'Reference'
    embeds_one :status, class_name: 'SlotStatus'
    field :start, type:  # primitive
    embeds_one :_start, class_name: 'Extension'
    field :end, type:  # primitive
    embeds_one :_end, class_name: 'Extension'
    field :overbooked, type:  # primitive
    embeds_one :_overbooked, class_name: 'Extension'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
  end
end
