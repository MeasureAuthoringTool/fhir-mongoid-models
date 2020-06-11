module FHIR
  class InsurancePlanPlanSpecificCost < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanPlanSpecificCost'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_many :benefit, class_name: 'InsurancePlanPlanSpecificCostBenefit'
  end
end
