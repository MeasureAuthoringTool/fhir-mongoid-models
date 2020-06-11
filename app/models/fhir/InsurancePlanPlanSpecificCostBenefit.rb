module FHIR
  class InsurancePlanPlanSpecificCostBenefit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanPlanSpecificCostBenefit'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :cost, class_name: 'InsurancePlanPlanSpecificCostBenefitCost'
  end
end
