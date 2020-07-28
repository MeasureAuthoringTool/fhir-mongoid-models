module FHIR
  # fhir/plan_definition_action_condition.rb
  class PlanDefinitionActionCondition < BackboneElement
    include Mongoid::Document
    embeds_one :kind, class_name: 'FHIR::ActionConditionKind'    
    embeds_one :expression, class_name: 'FHIR::Expression'    

    def self.transform_json(json_hash, target = PlanDefinitionActionCondition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['kind'] = ActionConditionKind.transform_json(json_hash['kind']) unless json_hash['kind'].nil?
      result['expression'] = Expression.transform_json(json_hash['expression']) unless json_hash['expression'].nil?

      result
    end
  end
end
