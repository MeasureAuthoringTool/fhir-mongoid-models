module FHIR
  # fhir/structure_map_group_type_mode.rb
  class StructureMapGroupTypeMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupTypeMode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = StructureMapGroupTypeMode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
