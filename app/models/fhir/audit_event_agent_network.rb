module FHIR
  # fhir/audit_event_agent_network.rb
  class AuditEventAgentNetwork < BackboneElement
    include Mongoid::Document
    embeds_one :address, class_name: 'FHIR::PrimitiveString'
    embeds_one :type, class_name: 'FHIR::AuditEventAgentNetworkType'

    def self.transform_json(json_hash, target = AuditEventAgentNetwork.new)
      result = self.superclass.transform_json(json_hash, target)
      result['address'] = PrimitiveString.transform_json(json_hash['address'], json_hash['_address']) unless json_hash['address'].nil?      
      result['type'] = AuditEventAgentNetworkType.transform_json(json_hash['type']) unless json_hash['type'].nil?      

      result
    end
  end
end
