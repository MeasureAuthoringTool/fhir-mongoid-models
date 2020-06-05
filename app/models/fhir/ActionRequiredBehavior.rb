module FHIR
  class ActionRequiredBehavior < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionRequiredBehavior'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
