module FHIR
  class Account < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Account'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'AccountStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_many :subject, class_name: 'Reference'
    embeds_one :servicePeriod, class_name: 'Period'
    embeds_many :coverage, class_name: 'AccountCoverage'
    embeds_one :owner, class_name: 'Reference'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :guarantor, class_name: 'AccountGuarantor'
    embeds_one :partOf, class_name: 'Reference'
  end
end
