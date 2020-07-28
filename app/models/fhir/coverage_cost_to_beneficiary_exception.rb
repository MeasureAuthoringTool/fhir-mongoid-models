module FHIR
  # fhir/coverage_cost_to_beneficiary_exception.rb
  class CoverageCostToBeneficiaryException < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :period, class_name: 'FHIR::Period'    

    def self.transform_json(json_hash, target = CoverageCostToBeneficiaryException.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
