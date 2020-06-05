module FHIR
  class StructureDefinitionDifferential < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureDefinitionDifferential'
    embeds_many :element, class_name: 'ElementDefinition'
  end
end
