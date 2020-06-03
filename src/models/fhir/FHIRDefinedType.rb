module FHIR
  class FHIRDefinedType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FHIRDefinedType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
