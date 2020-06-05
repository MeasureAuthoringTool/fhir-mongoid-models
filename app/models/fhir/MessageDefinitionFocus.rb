module FHIR
  class MessageDefinitionFocus < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageDefinitionFocus'
    embeds_one :code, class_name: 'ResourceType'
    field :profile, type:  # primitive
    embeds_one :_profile, class_name: 'Extension'
    field :min, type:  # primitive
    embeds_one :_min, class_name: 'Extension'
    field :max, type:  # primitive
    embeds_one :_max, class_name: 'Extension'
  end
end
