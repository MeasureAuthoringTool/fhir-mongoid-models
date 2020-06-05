module FHIR
  class InsurancePlanCoverageBenefit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanCoverageBenefit'
    embeds_one :type, class_name: 'CodeableConcept'
    field :requirement, type:  # primitive
    embeds_one :_requirement, class_name: 'Extension'
    embeds_many :limit, class_name: 'InsurancePlanCoverageBenefitLimit'
  end
end
