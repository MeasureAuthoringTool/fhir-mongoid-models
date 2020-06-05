module FHIR
  class CareTeam < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CareTeam'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'CareTeamStatus'
    embeds_many :category, class_name: 'CodeableConcept'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_many :participant, class_name: 'CareTeamParticipant'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :managingOrganization, class_name: 'Reference'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_many :note, class_name: 'Annotation'
  end
end
