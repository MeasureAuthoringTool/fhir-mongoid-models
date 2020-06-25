module FHIR
  # fhir/structure_map_model_mode.rb
  class StructureMapModelMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapModelMode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = StructureMapModelMode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
