module FHIR
  # fhir/explanation_of_benefit_item_adjudication.rb
  class ExplanationOfBenefitItemAdjudication < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :reason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amount, class_name: 'FHIR::Money'    
    embeds_one :value, class_name: 'FHIR::PrimitiveDecimal'    

    def self.transform_json(json_hash, target = ExplanationOfBenefitItemAdjudication.new)
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['reason'] = CodeableConcept.transform_json(json_hash['reason']) unless json_hash['reason'].nil?
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?

      result
    end
  end
end
