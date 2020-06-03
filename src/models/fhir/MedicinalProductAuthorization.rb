module FHIR
  class MedicinalProductAuthorization < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductAuthorization'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :subject, class_name: 'Reference'
    embeds_many :country, class_name: 'CodeableConcept'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'
    field :statusDate, type:  # primitive
    embeds_one :_statusDate, class_name: 'Extension'
    field :restoreDate, type:  # primitive
    embeds_one :_restoreDate, class_name: 'Extension'
    embeds_one :validityPeriod, class_name: 'Period'
    embeds_one :dataExclusivityPeriod, class_name: 'Period'
    field :dateOfFirstAuthorization, type:  # primitive
    embeds_one :_dateOfFirstAuthorization, class_name: 'Extension'
    field :internationalBirthDate, type:  # primitive
    embeds_one :_internationalBirthDate, class_name: 'Extension'
    embeds_one :legalBasis, class_name: 'CodeableConcept'
    embeds_many :jurisdictionalAuthorization, class_name: 'MedicinalProductAuthorizationJurisdictionalAuthorization'
    embeds_one :holder, class_name: 'Reference'
    embeds_one :regulator, class_name: 'Reference'
    embeds_one :procedure, class_name: 'MedicinalProductAuthorizationProcedure'
  end
end
