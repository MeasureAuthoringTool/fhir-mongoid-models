module FHIR
  class StructureMapTargetListMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapTargetListMode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
