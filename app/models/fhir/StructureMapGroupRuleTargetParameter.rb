module FHIR
  class StructureMapGroupRuleTargetParameter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupRuleTargetParameter'
    field :valuePrimitiveId, type:  # primitive
    embeds_one :_valuePrimitiveId, class_name: 'Extension'
    field :valuePrimitiveString, type:  # primitive
    embeds_one :_valuePrimitiveString, class_name: 'Extension'
    field :valuePrimitiveBoolean, type:  # primitive
    embeds_one :_valuePrimitiveBoolean, class_name: 'Extension'
    field :valuePrimitiveInteger, type:  # primitive
    embeds_one :_valuePrimitiveInteger, class_name: 'Extension'
    field :valuePrimitiveDecimal, type:  # primitive
    embeds_one :_valuePrimitiveDecimal, class_name: 'Extension'
  end
end
