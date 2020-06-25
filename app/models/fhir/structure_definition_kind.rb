module FHIR
  # fhir/structure_definition_kind.rb
  class StructureDefinitionKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureDefinitionKind'
    field :value, type: String

    def self.transform_json(json_hash)
      result = StructureDefinitionKind.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
