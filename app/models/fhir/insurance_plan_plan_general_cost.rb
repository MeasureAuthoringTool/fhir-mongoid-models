module FHIR
  # fhir/insurance_plan_plan_general_cost.rb
  class InsurancePlanPlanGeneralCost < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanPlanGeneralCost'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :groupSize, class_name: 'PrimitivePositiveInt'
    embeds_one :cost, class_name: 'Money'
    embeds_one :comment, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=InsurancePlanPlanGeneralCost.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['groupSize'] = PrimitivePositiveInt.transform_json(json_hash['groupSize'], json_hash['_groupSize']) unless json_hash['groupSize'].nil?      
      result['cost'] = Money.transform_json(json_hash['cost']) unless json_hash['cost'].nil?      
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      

      result
    end
  end
end
