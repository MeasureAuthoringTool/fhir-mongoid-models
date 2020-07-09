module FHIR
  # fhir/insurance_plan_coverage_benefit_limit.rb
  class InsurancePlanCoverageBenefitLimit < BackboneElement
    include Mongoid::Document
    embeds_one :value, class_name: 'FHIR::Quantity'
    embeds_one :code, class_name: 'FHIR::CodeableConcept'

    def self.transform_json(json_hash, target = InsurancePlanCoverageBenefitLimit.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = Quantity.transform_json(json_hash['value']) unless json_hash['value'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      

      result
    end
  end
end
