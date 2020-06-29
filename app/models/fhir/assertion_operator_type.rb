module FHIR
  # fhir/assertion_operator_type.rb
  class AssertionOperatorType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AssertionOperatorType'
    field :value, type: String

    def self.transform_json(json_hash, target=AssertionOperatorType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
