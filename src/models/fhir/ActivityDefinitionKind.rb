module FHIR
  class ActivityDefinitionKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActivityDefinitionKind'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
