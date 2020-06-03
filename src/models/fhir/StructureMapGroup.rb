module FHIR
  class StructureMapGroup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroup'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :extends, type:  # primitive
    embeds_one :_extends, class_name: 'Extension'
    embeds_one :typeMode, class_name: 'StructureMapGroupTypeMode'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
    embeds_many :input, class_name: 'StructureMapGroupInput'
    embeds_many :rule, class_name: 'StructureMapGroupRule'
  end
end
