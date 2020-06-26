module FHIR
  # fhir/audit_event_action.rb
  class AuditEventAction < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventAction'
    field :value, type: String

    def self.transform_json(json_hash)
      result = AuditEventAction.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
