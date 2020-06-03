module FHIR
  class InsurancePlanPlanSpecificCostBenefitCost < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanPlanSpecificCostBenefitCost'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :applicability, class_name: 'CodeableConcept'
    embeds_many :qualifiers, class_name: 'CodeableConcept'
    embeds_one :value, class_name: 'Quantity'
  end
end
