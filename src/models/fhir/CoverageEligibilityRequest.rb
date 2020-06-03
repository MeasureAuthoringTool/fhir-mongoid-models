module FHIR
  class CoverageEligibilityRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityRequest'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'EligibilityRequestStatus'
    embeds_one :priority, class_name: 'CodeableConcept'
    embeds_many :purpose, class_name: 'EligibilityRequestPurpose'
    embeds_one :patient, class_name: 'Reference'
    field :servicedPrimitiveDate, type:  # primitive
    embeds_one :_servicedPrimitiveDate, class_name: 'Extension'
    embeds_one :servicedPeriod, class_name: 'Period'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :enterer, class_name: 'Reference'
    embeds_one :provider, class_name: 'Reference'
    embeds_one :insurer, class_name: 'Reference'
    embeds_one :facility, class_name: 'Reference'
    embeds_many :supportingInfo, class_name: 'CoverageEligibilityRequestSupportingInfo'
    embeds_many :insurance, class_name: 'CoverageEligibilityRequestInsurance'
    embeds_many :item, class_name: 'CoverageEligibilityRequestItem'
  end
end
