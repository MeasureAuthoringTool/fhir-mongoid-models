module FHIR
  class StructureDefinitionMapping < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureDefinitionMapping'
    field :identity, type:  # primitive
    embeds_one :_identity, class_name: 'Extension'
    field :uri, type:  # primitive
    embeds_one :_uri, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
  end
end
