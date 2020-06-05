module FHIR
  class PaymentReconciliationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PaymentReconciliationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
