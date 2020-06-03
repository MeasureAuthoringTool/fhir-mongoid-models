module FHIR
  class CapabilityStatementMessaging < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementMessaging'
    embeds_many :endpoint, class_name: 'CapabilityStatementMessagingEndpoint'
    field :reliableCache, type:  # primitive
    embeds_one :_reliableCache, class_name: 'Extension'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
    embeds_many :supportedMessage, class_name: 'CapabilityStatementMessagingSupportedMessage'
  end
end
