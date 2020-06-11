module FHIR
  class ContractTermOfferAnswer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermOfferAnswer'
    field :valuePrimitiveBoolean, type:  # primitive
    embeds_one :_valuePrimitiveBoolean, class_name: 'Extension'
    field :valuePrimitiveDecimal, type:  # primitive
    embeds_one :_valuePrimitiveDecimal, class_name: 'Extension'
    field :valuePrimitiveInteger, type:  # primitive
    embeds_one :_valuePrimitiveInteger, class_name: 'Extension'
    field :valuePrimitiveDate, type:  # primitive
    embeds_one :_valuePrimitiveDate, class_name: 'Extension'
    field :valuePrimitiveDateTime, type:  # primitive
    embeds_one :_valuePrimitiveDateTime, class_name: 'Extension'
    field :valuePrimitiveTime, type:  # primitive
    embeds_one :_valuePrimitiveTime, class_name: 'Extension'
    field :valuePrimitiveString, type:  # primitive
    embeds_one :_valuePrimitiveString, class_name: 'Extension'
    field :valuePrimitiveUri, type:  # primitive
    embeds_one :_valuePrimitiveUri, class_name: 'Extension'
    embeds_one :valueAttachment, class_name: 'Attachment'
    embeds_one :valueCoding, class_name: 'Coding'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueReference, class_name: 'Reference'
  end
end
