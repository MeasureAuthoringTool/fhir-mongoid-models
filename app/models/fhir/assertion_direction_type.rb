module FHIR
  # fhir/assertion_direction_type.rb
  class AssertionDirectionType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AssertionDirectionType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = AssertionDirectionType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
