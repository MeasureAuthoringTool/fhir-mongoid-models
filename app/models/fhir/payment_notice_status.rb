module FHIR
  # fhir/payment_notice_status.rb
  class PaymentNoticeStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PaymentNoticeStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = PaymentNoticeStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
