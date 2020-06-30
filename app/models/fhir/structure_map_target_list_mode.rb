module FHIR
  # fhir/structure_map_target_list_mode.rb
  class StructureMapTargetListMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapTargetListMode'
    field :value, type: String

    def self.transform_json(json_hash, target=StructureMapTargetListMode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
