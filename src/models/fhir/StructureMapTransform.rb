module FHIR
  class StructureMapTransform < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapTransform'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
