module FHIR
  class ContractTermAssetValuedItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermAssetValuedItem'
    embeds_one :entityCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :entityReference, class_name: 'Reference'
    embeds_one :identifier, class_name: 'Identifier'
    field :effectiveTime, type:  # primitive
    embeds_one :_effectiveTime, class_name: 'Extension'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :unitPrice, class_name: 'Money'
    field :factor, type:  # primitive
    embeds_one :_factor, class_name: 'Extension'
    field :points, type:  # primitive
    embeds_one :_points, class_name: 'Extension'
    embeds_one :net, class_name: 'Money'
    field :payment, type:  # primitive
    embeds_one :_payment, class_name: 'Extension'
    field :paymentDate, type:  # primitive
    embeds_one :_paymentDate, class_name: 'Extension'
    embeds_one :responsible, class_name: 'Reference'
    embeds_one :recipient, class_name: 'Reference'
    field :linkId, type: Array # primitive
    embeds_many :_linkId, class_name: 'Extension'
    field :securityLabelNumber, type: Array # primitive
    embeds_many :_securityLabelNumber, class_name: 'Extension'
  end
end
