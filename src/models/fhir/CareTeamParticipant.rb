module FHIR
  class CareTeamParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CareTeamParticipant'
    embeds_many :role, class_name: 'CodeableConcept'
    embeds_one :member, class_name: 'Reference'
    embeds_one :onBehalfOf, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
  end
end
