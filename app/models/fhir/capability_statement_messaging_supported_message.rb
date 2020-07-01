module FHIR
  # fhir/capability_statement_messaging_supported_message.rb
  class CapabilityStatementMessagingSupportedMessage < BackboneElement
    include Mongoid::Document
    embeds_one :mode, class_name: 'EventCapabilityMode'
    embeds_one :definition, class_name: 'PrimitiveCanonical'

    def self.transform_json(json_hash, target = CapabilityStatementMessagingSupportedMessage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = EventCapabilityMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?      
      result['definition'] = PrimitiveCanonical.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?      

      result
    end
  end
end
