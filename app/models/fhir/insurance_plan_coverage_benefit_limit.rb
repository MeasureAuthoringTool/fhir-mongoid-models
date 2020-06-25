module FHIR
  # fhir/insurance_plan_coverage_benefit_limit.rb
  class InsurancePlanCoverageBenefitLimit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanCoverageBenefitLimit'
    embeds_one :value, class_name: 'Quantity'
    embeds_one :code, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = InsurancePlanCoverageBenefitLimit.new
      result['value'] = Quantity.transform_json(json_hash['value']) unless json_hash['value'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      

      result
    end
  end
end
