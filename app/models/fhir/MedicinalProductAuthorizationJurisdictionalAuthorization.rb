module FHIR
  class MedicinalProductAuthorizationJurisdictionalAuthorization < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductAuthorizationJurisdictionalAuthorization'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :country, class_name: 'CodeableConcept'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :legalStatusOfSupply, class_name: 'CodeableConcept'
    embeds_one :validityPeriod, class_name: 'Period'
  end
end
