module FHIR
  # fhir/payment_notice.rb
  class PaymentNotice < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::PaymentNoticeStatus'    
    embeds_one :request, class_name: 'FHIR::Reference'    
    embeds_one :response, class_name: 'FHIR::Reference'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :provider, class_name: 'FHIR::Reference'    
    embeds_one :payment, class_name: 'FHIR::Reference'    
    embeds_one :paymentDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :payee, class_name: 'FHIR::Reference'    
    embeds_one :recipient, class_name: 'FHIR::Reference'    
    embeds_one :amount, class_name: 'FHIR::Money'    
    embeds_one :paymentStatus, class_name: 'FHIR::CodeableConcept'    

    def self.transform_json(json_hash, target = PaymentNotice.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = PaymentNoticeStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?
      result['response'] = Reference.transform_json(json_hash['response']) unless json_hash['response'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?
      result['payment'] = Reference.transform_json(json_hash['payment']) unless json_hash['payment'].nil?
      result['paymentDate'] = PrimitiveDate.transform_json(json_hash['paymentDate'], json_hash['_paymentDate']) unless json_hash['paymentDate'].nil?
      result['payee'] = Reference.transform_json(json_hash['payee']) unless json_hash['payee'].nil?
      result['recipient'] = Reference.transform_json(json_hash['recipient']) unless json_hash['recipient'].nil?
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?
      result['paymentStatus'] = CodeableConcept.transform_json(json_hash['paymentStatus']) unless json_hash['paymentStatus'].nil?

      result
    end
  end
end
