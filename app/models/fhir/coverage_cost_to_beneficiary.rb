module FHIR
  # fhir/coverage_cost_to_beneficiary.rb
  class CoverageCostToBeneficiary < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueSimpleQuantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :valueMoney, class_name: 'FHIR::Money'    
    embeds_many :exception, class_name: 'FHIR::CoverageCostToBeneficiaryException'    

    def self.transform_json(json_hash, target = CoverageCostToBeneficiary.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['valueSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['valueSimpleQuantity']) unless json_hash['valueSimpleQuantity'].nil?
      result['valueMoney'] = Money.transform_json(json_hash['valueMoney']) unless json_hash['valueMoney'].nil?
      result['exception'] = json_hash['exception'].map { |var| CoverageCostToBeneficiaryException.transform_json(var) } unless json_hash['exception'].nil?

      result
    end
  end
end
