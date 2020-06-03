module FHIR
  class ValueSetExpansionParameter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ValueSetExpansionParameter'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :valuePrimitiveString, type:  # primitive
    embeds_one :_valuePrimitiveString, class_name: 'Extension'
    field :valuePrimitiveBoolean, type:  # primitive
    embeds_one :_valuePrimitiveBoolean, class_name: 'Extension'
    field :valuePrimitiveInteger, type:  # primitive
    embeds_one :_valuePrimitiveInteger, class_name: 'Extension'
    field :valuePrimitiveDecimal, type:  # primitive
    embeds_one :_valuePrimitiveDecimal, class_name: 'Extension'
    field :valuePrimitiveUri, type:  # primitive
    embeds_one :_valuePrimitiveUri, class_name: 'Extension'
    field :valuePrimitiveCode, type:  # primitive
    embeds_one :_valuePrimitiveCode, class_name: 'Extension'
    field :valuePrimitiveDateTime, type:  # primitive
    embeds_one :_valuePrimitiveDateTime, class_name: 'Extension'
  end
end
