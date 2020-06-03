module FHIR
  class PlanDefinitionActionDynamicValue < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PlanDefinitionActionDynamicValue'
    field :path, type:  # primitive
    embeds_one :_path, class_name: 'Extension'
    embeds_one :expression, class_name: 'Expression'
  end
end
