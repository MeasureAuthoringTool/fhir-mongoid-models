module FHIR
  # fhir/structure_map_context_type.rb
  class StructureMapContextType < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = StructureMapContextType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
