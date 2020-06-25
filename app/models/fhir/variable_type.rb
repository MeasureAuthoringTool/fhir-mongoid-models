module FHIR
  # fhir/variable_type.rb
  class VariableType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'VariableType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = VariableType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
