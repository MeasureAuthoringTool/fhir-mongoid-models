module FHIR
  # fhir/capability_statement_messaging.rb
  class CapabilityStatementMessaging < BackboneElement
    include Mongoid::Document
    embeds_many :endpoint, class_name: 'CapabilityStatementMessagingEndpoint'
    embeds_one :reliableCache, class_name: 'PrimitiveUnsignedInt'
    embeds_one :documentation, class_name: 'PrimitiveMarkdown'
    embeds_many :supportedMessage, class_name: 'CapabilityStatementMessagingSupportedMessage'

    def self.transform_json(json_hash, target = CapabilityStatementMessaging.new)
      result = self.superclass.transform_json(json_hash, target)
      result['endpoint'] = json_hash['endpoint'].map { |var| CapabilityStatementMessagingEndpoint.transform_json(var) } unless json_hash['endpoint'].nil?
      result['reliableCache'] = PrimitiveUnsignedInt.transform_json(json_hash['reliableCache'], json_hash['_reliableCache']) unless json_hash['reliableCache'].nil?      
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      
      result['supportedMessage'] = json_hash['supportedMessage'].map { |var| CapabilityStatementMessagingSupportedMessage.transform_json(var) } unless json_hash['supportedMessage'].nil?

      result
    end
  end
end
