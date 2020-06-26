module FHIR
  # fhir/operation_kind.rb
  class OperationKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationKind'
    field :value, type: String

    def self.transform_json(json_hash)
      result = OperationKind.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
