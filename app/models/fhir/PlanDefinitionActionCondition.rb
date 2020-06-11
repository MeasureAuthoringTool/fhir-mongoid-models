module FHIR
  class PlanDefinitionActionCondition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PlanDefinitionActionCondition'
    embeds_one :kind, class_name: 'ActionConditionKind'
    embeds_one :expression, class_name: 'Expression'
  end
end
