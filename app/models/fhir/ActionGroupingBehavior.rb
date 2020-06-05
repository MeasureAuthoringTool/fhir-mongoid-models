module FHIR
  class ActionGroupingBehavior < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionGroupingBehavior'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
