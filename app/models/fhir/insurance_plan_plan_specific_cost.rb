module FHIR
  # fhir/insurance_plan_plan_specific_cost.rb
  class InsurancePlanPlanSpecificCost < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_many :benefit, class_name: 'InsurancePlanPlanSpecificCostBenefit'

    def self.transform_json(json_hash, target = InsurancePlanPlanSpecificCost.new)
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['benefit'] = json_hash['benefit'].map { |var| InsurancePlanPlanSpecificCostBenefit.transform_json(var) } unless json_hash['benefit'].nil?

      result
    end
  end
end
