module FHIR
  class ActionConditionKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionConditionKind'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
