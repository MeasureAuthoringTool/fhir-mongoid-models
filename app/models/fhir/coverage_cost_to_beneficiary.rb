module FHIR
  # fhir/coverage_cost_to_beneficiary.rb
  class CoverageCostToBeneficiary < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageCostToBeneficiary'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :valueSimpleQuantity, class_name: 'SimpleQuantity'
    embeds_one :valueMoney, class_name: 'Money'
    embeds_many :exception, class_name: 'CoverageCostToBeneficiaryException'

    def self.transform_json(json_hash)
      result = CoverageCostToBeneficiary.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['valueSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['valueSimpleQuantity']) unless json_hash['valueSimpleQuantity'].nil?      
      result['valueMoney'] = Money.transform_json(json_hash['valueMoney']) unless json_hash['valueMoney'].nil?      
      result['exception'] = json_hash['exception'].map { |var| CoverageCostToBeneficiaryException.transform_json(var) } unless json_hash['exception'].nil?

      result
    end
  end
end
