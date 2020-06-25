module FHIR
  # fhir/audit_event_agent_network.rb
  class AuditEventAgentNetwork < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventAgentNetwork'
    embeds_one :address, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'AuditEventAgentNetworkType'

    def self.transform_json(json_hash)
      result = AuditEventAgentNetwork.new
      result['address'] = PrimitiveString.transform_json(json_hash['address'], json_hash['_address']) unless json_hash['address'].nil?      
      result['type'] = AuditEventAgentNetworkType.transform_json(json_hash['type']) unless json_hash['type'].nil?      

      result
    end
  end
end
