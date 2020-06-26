module FHIR
  # fhir/capability_statement_kind.rb
  class CapabilityStatementKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementKind'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CapabilityStatementKind.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
