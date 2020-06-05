module FHIR
  class CapabilityStatementMessagingSupportedMessage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementMessagingSupportedMessage'
    embeds_one :mode, class_name: 'EventCapabilityMode'
    field :definition, type:  # primitive
    embeds_one :_definition, class_name: 'Extension'
  end
end
