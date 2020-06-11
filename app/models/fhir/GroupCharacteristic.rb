module FHIR
  class GroupCharacteristic < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'GroupCharacteristic'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    field :valuePrimitiveBoolean, type:  # primitive
    embeds_one :_valuePrimitiveBoolean, class_name: 'Extension'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueRange, class_name: 'Range'
    embeds_one :valueReference, class_name: 'Reference'
    field :exclude, type:  # primitive
    embeds_one :_exclude, class_name: 'Extension'
    embeds_one :period, class_name: 'Period'
  end
end
