module FHIR
  # fhir/operation_parameter_use.rb
  class OperationParameterUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationParameterUse'
    field :value, type: String

    def self.transform_json(json_hash, target=OperationParameterUse.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
