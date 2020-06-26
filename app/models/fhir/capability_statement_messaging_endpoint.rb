module FHIR
  # fhir/capability_statement_messaging_endpoint.rb
  class CapabilityStatementMessagingEndpoint < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementMessagingEndpoint'
    embeds_one :protocol, class_name: 'Coding'
    embeds_one :address, class_name: 'PrimitiveUrl'

    def self.transform_json(json_hash)
      result = CapabilityStatementMessagingEndpoint.new
      result['protocol'] = Coding.transform_json(json_hash['protocol']) unless json_hash['protocol'].nil?      
      result['address'] = PrimitiveUrl.transform_json(json_hash['address'], json_hash['_address']) unless json_hash['address'].nil?      

      result
    end
  end
end
