module FHIR
  # fhir/reference_handling_policy.rb
  class ReferenceHandlingPolicy < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ReferenceHandlingPolicy'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ReferenceHandlingPolicy.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
