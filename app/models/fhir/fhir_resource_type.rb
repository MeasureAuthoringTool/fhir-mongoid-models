module FHIR
  # fhir/fhir_resource_type.rb
  class FHIRResourceType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FHIRResourceType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = FHIRResourceType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
