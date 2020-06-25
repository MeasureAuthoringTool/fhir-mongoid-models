module FHIR
  # fhir/reference_version_rules.rb
  class ReferenceVersionRules < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ReferenceVersionRules'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ReferenceVersionRules.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
