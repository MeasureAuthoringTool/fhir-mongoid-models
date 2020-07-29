module FHIR
  # fhir/explanation_of_benefit_payment.rb
  class ExplanationOfBenefitPayment < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :adjustment, class_name: 'FHIR::Money'    
    embeds_one :adjustmentReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :amount, class_name: 'FHIR::Money'    
    embeds_one :identifier, class_name: 'FHIR::Identifier'    

    def self.transform_json(json_hash, target = ExplanationOfBenefitPayment.new)
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
