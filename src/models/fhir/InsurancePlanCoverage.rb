module FHIR
  class InsurancePlanCoverage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanCoverage'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :network, class_name: 'Reference'
    embeds_many :benefit, class_name: 'InsurancePlanCoverageBenefit'
  end
end
