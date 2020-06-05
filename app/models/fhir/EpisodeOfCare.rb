module FHIR
  class EpisodeOfCare < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'EpisodeOfCare'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'EpisodeOfCareStatus'
    embeds_many :statusHistory, class_name: 'EpisodeOfCareStatusHistory'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_many :diagnosis, class_name: 'EpisodeOfCareDiagnosis'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :managingOrganization, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_many :referralRequest, class_name: 'Reference'
    embeds_one :careManager, class_name: 'Reference'
    embeds_many :team, class_name: 'Reference'
    embeds_many :account, class_name: 'Reference'
  end
end
