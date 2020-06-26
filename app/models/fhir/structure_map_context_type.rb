module FHIR
  # fhir/structure_map_context_type.rb
  class StructureMapContextType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapContextType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = StructureMapContextType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
