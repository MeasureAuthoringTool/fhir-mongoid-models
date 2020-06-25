module FHIR
  # fhir/audit_event_agent_network_type.rb
  class AuditEventAgentNetworkType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventAgentNetworkType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = AuditEventAgentNetworkType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
