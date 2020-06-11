module FHIR
  class StructureDefinitionSnapshot < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureDefinitionSnapshot'
    embeds_many :element, class_name: 'ElementDefinition'
  end
end
