module FHIR
  class ActivityDefinitionParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ActivityDefinitionParticipant'
    embeds_one :type, class_name: 'ActivityParticipantType'
    embeds_one :role, class_name: 'CodeableConcept'
  end
end
