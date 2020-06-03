module FHIR
  class MessageDefinitionAllowedResponse < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageDefinitionAllowedResponse'
    field :message, type:  # primitive
    embeds_one :_message, class_name: 'Extension'
    field :situation, type:  # primitive
    embeds_one :_situation, class_name: 'Extension'
  end
end
