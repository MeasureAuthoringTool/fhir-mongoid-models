module FHIR
  # fhir/structure_map_transform.rb
  class StructureMapTransform < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapTransform'
    field :value, type: String

    def self.transform_json(json_hash)
      result = StructureMapTransform.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
