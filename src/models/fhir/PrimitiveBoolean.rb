module FHIR
  class PrimitiveBoolean < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveBoolean'
    field :value, type: Boolean # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
