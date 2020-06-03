module FHIR
  class SupplyDeliverySuppliedItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SupplyDeliverySuppliedItem'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :itemCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :itemReference, class_name: 'Reference'
  end
end
