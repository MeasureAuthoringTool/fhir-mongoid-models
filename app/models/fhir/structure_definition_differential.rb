module FHIR
  # fhir/structure_definition_differential.rb
  class StructureDefinitionDifferential < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureDefinitionDifferential'
    embeds_many :element, class_name: 'ElementDefinition'

    def self.transform_json(json_hash, target=StructureDefinitionDifferential.new)
      result = self.superclass.transform_json(json_hash, target)
      result['element'] = json_hash['element'].map { |var| ElementDefinition.transform_json(var) } unless json_hash['element'].nil?

      result
    end
  end
end
