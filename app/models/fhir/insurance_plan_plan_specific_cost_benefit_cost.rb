module FHIR
  # fhir/insurance_plan_plan_specific_cost_benefit_cost.rb
  class InsurancePlanPlanSpecificCostBenefitCost < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :applicability, class_name: 'FHIR::CodeableConcept'
    embeds_many :qualifiers, class_name: 'FHIR::CodeableConcept'
    embeds_one :value, class_name: 'FHIR::Quantity'

    def self.transform_json(json_hash, target = InsurancePlanPlanSpecificCostBenefitCost.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['applicability'] = CodeableConcept.transform_json(json_hash['applicability']) unless json_hash['applicability'].nil?      
      result['qualifiers'] = json_hash['qualifiers'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['qualifiers'].nil?
      result['value'] = Quantity.transform_json(json_hash['value']) unless json_hash['value'].nil?      

      result
    end
  end
end
