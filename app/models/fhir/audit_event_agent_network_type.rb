module FHIR
  # fhir/audit_event_agent_network_type.rb
  class AuditEventAgentNetworkType < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = AuditEventAgentNetworkType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
