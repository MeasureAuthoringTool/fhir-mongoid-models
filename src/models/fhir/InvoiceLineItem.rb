module FHIR
  class InvoiceLineItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InvoiceLineItem'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    embeds_one :chargeItemReference, class_name: 'Reference'
    embeds_one :chargeItemCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :priceComponent, class_name: 'InvoiceLineItemPriceComponent'
  end
end
