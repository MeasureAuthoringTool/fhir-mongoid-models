module FHIR
  # fhir/payment_reconciliation.rb
  class PaymentReconciliation < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'PaymentReconciliation'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'PaymentReconciliationStatus'
    embeds_one :period, class_name: 'Period'
    embeds_one :created, class_name: 'PrimitiveDateTime'
    embeds_one :paymentIssuer, class_name: 'Reference'
    embeds_one :request, class_name: 'Reference'
    embeds_one :requestor, class_name: 'Reference'
    embeds_one :outcome, class_name: 'RemittanceOutcome'
    embeds_one :disposition, class_name: 'PrimitiveString'
    embeds_one :paymentDate, class_name: 'PrimitiveDate'
    embeds_one :paymentAmount, class_name: 'Money'
    embeds_one :paymentIdentifier, class_name: 'Identifier'
    embeds_many :detail, class_name: 'PaymentReconciliationDetail'
    embeds_one :formCode, class_name: 'CodeableConcept'
    embeds_many :processNote, class_name: 'PaymentReconciliationProcessNote'

    def self.transform_json(json_hash)
      result = PaymentReconciliation.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = PaymentReconciliationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?      
      result['paymentIssuer'] = Reference.transform_json(json_hash['paymentIssuer']) unless json_hash['paymentIssuer'].nil?      
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?      
      result['requestor'] = Reference.transform_json(json_hash['requestor']) unless json_hash['requestor'].nil?      
      result['outcome'] = RemittanceOutcome.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      
      result['disposition'] = PrimitiveString.transform_json(json_hash['disposition'], json_hash['_disposition']) unless json_hash['disposition'].nil?      
      result['paymentDate'] = PrimitiveDate.transform_json(json_hash['paymentDate'], json_hash['_paymentDate']) unless json_hash['paymentDate'].nil?      
      result['paymentAmount'] = Money.transform_json(json_hash['paymentAmount']) unless json_hash['paymentAmount'].nil?      
      result['paymentIdentifier'] = Identifier.transform_json(json_hash['paymentIdentifier']) unless json_hash['paymentIdentifier'].nil?      
      result['detail'] = json_hash['detail'].map { |var| PaymentReconciliationDetail.transform_json(var) } unless json_hash['detail'].nil?
      result['formCode'] = CodeableConcept.transform_json(json_hash['formCode']) unless json_hash['formCode'].nil?      
      result['processNote'] = json_hash['processNote'].map { |var| PaymentReconciliationProcessNote.transform_json(var) } unless json_hash['processNote'].nil?

      result
    end
  end
end
