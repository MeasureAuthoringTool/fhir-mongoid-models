module FHIR
  # fhir/insurance_plan_plan_specific_cost_benefit.rb
  class InsurancePlanPlanSpecificCostBenefit < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :cost, class_name: 'FHIR::InsurancePlanPlanSpecificCostBenefitCost'    

    def self.transform_json(json_hash, target = InsurancePlanPlanSpecificCostBenefit.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['cost'] = json_hash['cost'].map { |var| InsurancePlanPlanSpecificCostBenefitCost.transform_json(var) } unless json_hash['cost'].nil?

      result
    end
  end
end
