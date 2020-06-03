module FHIR
  class CoverageEligibilityResponseInsurance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityResponseInsurance'
    embeds_one :coverage, class_name: 'Reference'
    field :inforce, type:  # primitive
    embeds_one :_inforce, class_name: 'Extension'
    embeds_one :benefitPeriod, class_name: 'Period'
    embeds_many :item, class_name: 'CoverageEligibilityResponseInsuranceItem'
  end
end
