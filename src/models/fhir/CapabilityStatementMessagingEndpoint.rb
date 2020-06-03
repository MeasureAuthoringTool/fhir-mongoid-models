module FHIR
  class CapabilityStatementMessagingEndpoint < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementMessagingEndpoint'
    embeds_one :protocol, class_name: 'Coding'
    field :address, type:  # primitive
    embeds_one :_address, class_name: 'Extension'
  end
end
