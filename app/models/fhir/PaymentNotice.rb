module FHIR
  class PaymentNotice < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'PaymentNotice'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'PaymentNoticeStatus'
    embeds_one :request, class_name: 'Reference'
    embeds_one :response, class_name: 'Reference'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :provider, class_name: 'Reference'
    embeds_one :payment, class_name: 'Reference'
    field :paymentDate, type:  # primitive
    embeds_one :_paymentDate, class_name: 'Extension'
    embeds_one :payee, class_name: 'Reference'
    embeds_one :recipient, class_name: 'Reference'
    embeds_one :amount, class_name: 'Money'
    embeds_one :paymentStatus, class_name: 'CodeableConcept'
  end
end
