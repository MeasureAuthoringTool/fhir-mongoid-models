module FHIR
  # fhir/explanation_of_benefit_total.rb
  class ExplanationOfBenefitTotal < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amount, class_name: 'FHIR::Money'    

    def self.transform_json(json_hash, target = ExplanationOfBenefitTotal.new)
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?

      result
    end
  end
end
