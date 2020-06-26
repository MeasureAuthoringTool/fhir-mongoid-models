module FHIR
  # fhir/resource_type.rb
  class ResourceType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResourceType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ResourceType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
