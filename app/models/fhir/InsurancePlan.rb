module FHIR
  class InsurancePlan < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlan'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_many :type, class_name: 'CodeableConcept'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :alias, type: Array # primitive
    embeds_many :_alias, class_name: 'Extension'
    embeds_one :period, class_name: 'Period'
    embeds_one :ownedBy, class_name: 'Reference'
    embeds_one :administeredBy, class_name: 'Reference'
    embeds_many :coverageArea, class_name: 'Reference'
    embeds_many :contact, class_name: 'InsurancePlanContact'
    embeds_many :endpoint, class_name: 'Reference'
    embeds_many :network, class_name: 'Reference'
    embeds_many :coverage, class_name: 'InsurancePlanCoverage'
    embeds_many :plan, class_name: 'InsurancePlanPlan'
  end
end
