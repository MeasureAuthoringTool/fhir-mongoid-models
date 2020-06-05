module FHIR
  class PaymentReconciliationDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PaymentReconciliationDetail'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :predecessor, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :request, class_name: 'Reference'
    embeds_one :submitter, class_name: 'Reference'
    embeds_one :response, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :responsible, class_name: 'Reference'
    embeds_one :payee, class_name: 'Reference'
    embeds_one :amount, class_name: 'Money'
  end
end
