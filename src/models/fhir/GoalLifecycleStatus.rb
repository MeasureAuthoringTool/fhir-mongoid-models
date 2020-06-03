module FHIR
  class GoalLifecycleStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GoalLifecycleStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
