module FHIR
  class PlanDefinitionActionParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PlanDefinitionActionParticipant'
    embeds_one :type, class_name: 'ActionParticipantType'
    embeds_one :role, class_name: 'CodeableConcept'
  end
end
