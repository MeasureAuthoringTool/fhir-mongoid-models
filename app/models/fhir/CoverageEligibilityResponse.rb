module FHIR
  class CoverageEligibilityResponse < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityResponse'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'EligibilityResponseStatus'
    embeds_many :purpose, class_name: 'EligibilityResponsePurpose'
    embeds_one :patient, class_name: 'Reference'
    field :servicedPrimitiveDate, type:  # primitive
    embeds_one :_servicedPrimitiveDate, class_name: 'Extension'
    embeds_one :servicedPeriod, class_name: 'Period'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :requestor, class_name: 'Reference'
    embeds_one :request, class_name: 'Reference'
    embeds_one :outcome, class_name: 'RemittanceOutcome'
    field :disposition, type:  # primitive
    embeds_one :_disposition, class_name: 'Extension'
    embeds_one :insurer, class_name: 'Reference'
    embeds_many :insurance, class_name: 'CoverageEligibilityResponseInsurance'
    field :preAuthRef, type:  # primitive
    embeds_one :_preAuthRef, class_name: 'Extension'
    embeds_one :form, class_name: 'CodeableConcept'
    embeds_many :error, class_name: 'CoverageEligibilityResponseError'
  end
end
