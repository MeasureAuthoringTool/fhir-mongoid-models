module FHIR
  class StructureMapStructure < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapStructure'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_one :mode, class_name: 'StructureMapModelMode'
    field :alias, type:  # primitive
    embeds_one :_alias, class_name: 'Extension'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
  end
end
