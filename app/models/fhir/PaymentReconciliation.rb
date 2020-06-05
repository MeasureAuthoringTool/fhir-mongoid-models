module FHIR
  class PaymentReconciliation < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'PaymentReconciliation'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'PaymentReconciliationStatus'
    embeds_one :period, class_name: 'Period'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :paymentIssuer, class_name: 'Reference'
    embeds_one :request, class_name: 'Reference'
    embeds_one :requestor, class_name: 'Reference'
    embeds_one :outcome, class_name: 'RemittanceOutcome'
    field :disposition, type:  # primitive
    embeds_one :_disposition, class_name: 'Extension'
    field :paymentDate, type:  # primitive
    embeds_one :_paymentDate, class_name: 'Extension'
    embeds_one :paymentAmount, class_name: 'Money'
    embeds_one :paymentIdentifier, class_name: 'Identifier'
    embeds_many :detail, class_name: 'PaymentReconciliationDetail'
    embeds_one :formCode, class_name: 'CodeableConcept'
    embeds_many :processNote, class_name: 'PaymentReconciliationProcessNote'
  end
end
