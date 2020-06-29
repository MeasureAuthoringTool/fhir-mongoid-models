module FHIR
  # fhir/audit_event_outcome.rb
  class AuditEventOutcome < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventOutcome'
    field :value, type: String

    def self.transform_json(json_hash, target=AuditEventOutcome.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
