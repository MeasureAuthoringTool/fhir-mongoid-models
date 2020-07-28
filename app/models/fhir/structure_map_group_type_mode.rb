module FHIR
  # fhir/structure_map_group_type_mode.rb
  class StructureMapGroupTypeMode < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = StructureMapGroupTypeMode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
