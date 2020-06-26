module FHIR
  # fhir/structure_map_input_mode.rb
  class StructureMapInputMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapInputMode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = StructureMapInputMode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
