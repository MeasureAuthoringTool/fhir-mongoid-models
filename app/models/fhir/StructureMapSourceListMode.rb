module FHIR
  class StructureMapSourceListMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapSourceListMode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
