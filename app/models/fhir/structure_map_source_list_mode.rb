module FHIR
  # fhir/structure_map_source_list_mode.rb
  class StructureMapSourceListMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapSourceListMode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = StructureMapSourceListMode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
