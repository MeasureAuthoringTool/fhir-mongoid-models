module FHIR
  # fhir/coverage_cost_to_beneficiary_exception.rb
  class CoverageCostToBeneficiaryException < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageCostToBeneficiaryException'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'

    def self.transform_json(json_hash, target=CoverageCostToBeneficiaryException.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
