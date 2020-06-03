module FHIR
  class ActionPrecheckBehavior < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionPrecheckBehavior'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
