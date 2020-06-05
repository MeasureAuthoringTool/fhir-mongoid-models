module FHIR
  class HealthcareService < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'HealthcareService'
    embeds_many :identifier, class_name: 'Identifier'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_one :providedBy, class_name: 'Reference'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_many :specialty, class_name: 'CodeableConcept'
    embeds_many :location, class_name: 'Reference'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
    field :extraDetails, type:  # primitive
    embeds_one :_extraDetails, class_name: 'Extension'
    embeds_one :photo, class_name: 'Attachment'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_many :coverageArea, class_name: 'Reference'
    embeds_many :serviceProvisionCode, class_name: 'CodeableConcept'
    embeds_many :eligibility, class_name: 'HealthcareServiceEligibility'
    embeds_many :program, class_name: 'CodeableConcept'
    embeds_many :characteristic, class_name: 'CodeableConcept'
    embeds_many :communication, class_name: 'CodeableConcept'
    embeds_many :referralMethod, class_name: 'CodeableConcept'
    field :appointmentRequired, type:  # primitive
    embeds_one :_appointmentRequired, class_name: 'Extension'
    embeds_many :availableTime, class_name: 'HealthcareServiceAvailableTime'
    embeds_many :notAvailable, class_name: 'HealthcareServiceNotAvailable'
    field :availabilityExceptions, type:  # primitive
    embeds_one :_availabilityExceptions, class_name: 'Extension'
    embeds_many :endpoint, class_name: 'Reference'
  end
end
