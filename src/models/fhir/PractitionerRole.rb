module FHIR
  class PractitionerRole < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'PractitionerRole'
    embeds_many :identifier, class_name: 'Identifier'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_one :period, class_name: 'Period'
    embeds_one :practitioner, class_name: 'Reference'
    embeds_one :organization, class_name: 'Reference'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_many :specialty, class_name: 'CodeableConcept'
    embeds_many :location, class_name: 'Reference'
    embeds_many :healthcareService, class_name: 'Reference'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_many :availableTime, class_name: 'PractitionerRoleAvailableTime'
    embeds_many :notAvailable, class_name: 'PractitionerRoleNotAvailable'
    field :availabilityExceptions, type:  # primitive
    embeds_one :_availabilityExceptions, class_name: 'Extension'
    embeds_many :endpoint, class_name: 'Reference'
  end
end
