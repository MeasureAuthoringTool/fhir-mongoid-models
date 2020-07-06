module FHIR
  # fhir/claim_response_payment.rb
  class ClaimResponsePayment < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :adjustment, class_name: 'Money'
    embeds_one :adjustmentReason, class_name: 'CodeableConcept'
    embeds_one :date, class_name: 'PrimitiveDate'
    embeds_one :amount, class_name: 'Money'
    embeds_one :identifier, class_name: 'Identifier'

    def self.transform_json(json_hash, target = ClaimResponsePayment.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['adjustment'] = Money.transform_json(json_hash['adjustment']) unless json_hash['adjustment'].nil?      
      result['adjustmentReason'] = CodeableConcept.transform_json(json_hash['adjustmentReason']) unless json_hash['adjustmentReason'].nil?      
      result['date'] = PrimitiveDate.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      

      result
    end
  end
end
