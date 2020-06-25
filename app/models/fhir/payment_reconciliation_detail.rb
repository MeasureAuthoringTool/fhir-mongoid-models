module FHIR
  # fhir/payment_reconciliation_detail.rb
  class PaymentReconciliationDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PaymentReconciliationDetail'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :predecessor, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :request, class_name: 'Reference'
    embeds_one :submitter, class_name: 'Reference'
    embeds_one :response, class_name: 'Reference'
    embeds_one :date, class_name: 'PrimitiveDate'
    embeds_one :responsible, class_name: 'Reference'
    embeds_one :payee, class_name: 'Reference'
    embeds_one :amount, class_name: 'Money'

    def self.transform_json(json_hash)
      result = PaymentReconciliationDetail.new
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['predecessor'] = Identifier.transform_json(json_hash['predecessor']) unless json_hash['predecessor'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?      
      result['submitter'] = Reference.transform_json(json_hash['submitter']) unless json_hash['submitter'].nil?      
      result['response'] = Reference.transform_json(json_hash['response']) unless json_hash['response'].nil?      
      result['date'] = PrimitiveDate.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['responsible'] = Reference.transform_json(json_hash['responsible']) unless json_hash['responsible'].nil?      
      result['payee'] = Reference.transform_json(json_hash['payee']) unless json_hash['payee'].nil?      
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      

      result
    end
  end
end
