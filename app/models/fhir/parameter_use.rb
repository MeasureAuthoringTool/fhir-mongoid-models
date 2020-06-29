module FHIR
  # fhir/parameter_use.rb
  class ParameterUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ParameterUse'
    field :value, type: String

    def self.transform_json(json_hash, target=ParameterUse.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
