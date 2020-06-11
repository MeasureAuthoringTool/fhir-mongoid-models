module FHIR
  class StructureMapGroupTypeMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupTypeMode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
