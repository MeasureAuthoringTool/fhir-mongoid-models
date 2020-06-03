module FHIR
  class StructureDefinitionKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureDefinitionKind'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
