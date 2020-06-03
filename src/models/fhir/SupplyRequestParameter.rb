module FHIR
  class SupplyRequestParameter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SupplyRequestParameter'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueRange, class_name: 'Range'
    field :valuePrimitiveBoolean, type:  # primitive
    embeds_one :_valuePrimitiveBoolean, class_name: 'Extension'
  end
end
