module FHIR
  # fhir/structure_definition_kind.rb
  class StructureDefinitionKind < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = StructureDefinitionKind.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
