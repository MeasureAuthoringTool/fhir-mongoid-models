module FHIR
  class Invoice < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Invoice'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'InvoiceStatus'
    field :cancelledReason, type:  # primitive
    embeds_one :_cancelledReason, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :recipient, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_many :participant, class_name: 'InvoiceParticipant'
    embeds_one :issuer, class_name: 'Reference'
    embeds_one :account, class_name: 'Reference'
    embeds_many :lineItem, class_name: 'InvoiceLineItem'
    embeds_many :totalPriceComponent, class_name: 'InvoiceLineItemPriceComponent'
    embeds_one :totalNet, class_name: 'Money'
    embeds_one :totalGross, class_name: 'Money'
    field :paymentTerms, type:  # primitive
    embeds_one :_paymentTerms, class_name: 'Extension'
    embeds_many :note, class_name: 'Annotation'
  end
end
