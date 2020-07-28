module FHIR
  # fhir/plan_definition_action_dynamic_value.rb
  class PlanDefinitionActionDynamicValue < BackboneElement
    include Mongoid::Document
    embeds_one :path, class_name: 'FHIR::PrimitiveString'    
    embeds_one :expression, class_name: 'FHIR::Expression'    

    def self.transform_json(json_hash, target = PlanDefinitionActionDynamicValue.new)
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?
      result['expression'] = Expression.transform_json(json_hash['expression']) unless json_hash['expression'].nil?

      result
    end
  end
end
