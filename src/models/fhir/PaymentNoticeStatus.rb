module FHIR
  class PaymentNoticeStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PaymentNoticeStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
