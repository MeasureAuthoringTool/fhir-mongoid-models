module FHIR
  # fhir/assertion_response_types.rb
  class AssertionResponseTypes < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AssertionResponseTypes'
    field :value, type: String

    def self.transform_json(json_hash, target=AssertionResponseTypes.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
