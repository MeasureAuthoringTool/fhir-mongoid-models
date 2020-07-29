module FHIR
  # fhir/explanation_of_benefit_benefit_balance.rb
  class ExplanationOfBenefitBenefitBalance < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :excluded, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :network, class_name: 'FHIR::CodeableConcept'    
    embeds_one :unit, class_name: 'FHIR::CodeableConcept'    
    embeds_one :term, class_name: 'FHIR::CodeableConcept'    
    embeds_many :financial, class_name: 'FHIR::ExplanationOfBenefitBenefitBalanceFinancial'    

    def self.transform_json(json_hash, target = ExplanationOfBenefitBenefitBalance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['excluded'] = PrimitiveBoolean.transform_json(json_hash['excluded'], json_hash['_excluded']) unless json_hash['excluded'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['network'] = CodeableConcept.transform_json(json_hash['network']) unless json_hash['network'].nil?
      result['unit'] = CodeableConcept.transform_json(json_hash['unit']) unless json_hash['unit'].nil?
      result['term'] = CodeableConcept.transform_json(json_hash['term']) unless json_hash['term'].nil?
      result['financial'] = json_hash['financial'].map { |var| ExplanationOfBenefitBenefitBalanceFinancial.transform_json(var) } unless json_hash['financial'].nil?

      result
    end
  end
end
