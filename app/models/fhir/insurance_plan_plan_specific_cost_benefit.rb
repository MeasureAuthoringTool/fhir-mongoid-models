module FHIR
  # fhir/insurance_plan_plan_specific_cost_benefit.rb
  class InsurancePlanPlanSpecificCostBenefit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanPlanSpecificCostBenefit'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :cost, class_name: 'InsurancePlanPlanSpecificCostBenefitCost'

    def self.transform_json(json_hash)
      result = InsurancePlanPlanSpecificCostBenefit.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['cost'] = json_hash['cost'].map { |var| InsurancePlanPlanSpecificCostBenefitCost.transform_json(var) } unless json_hash['cost'].nil?

      result
    end
  end
end
