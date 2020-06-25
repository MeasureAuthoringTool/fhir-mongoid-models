module FHIR
  # fhir/resource_version_policy.rb
  class ResourceVersionPolicy < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResourceVersionPolicy'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ResourceVersionPolicy.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
