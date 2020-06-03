module FHIR
  class EncounterParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterParticipant'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
    embeds_one :individual, class_name: 'Reference'
  end
end
