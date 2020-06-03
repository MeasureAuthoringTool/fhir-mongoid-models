module FHIR
  class StructureMapGroupInput < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupInput'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :type, type:  # primitive
    embeds_one :_type, class_name: 'Extension'
    embeds_one :mode, class_name: 'StructureMapInputMode'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
  end
end
