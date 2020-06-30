module FHIR
  # fhir/insurance_plan_coverage_benefit.rb
  class InsurancePlanCoverageBenefit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanCoverageBenefit'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :requirement, class_name: 'PrimitiveString'
    embeds_many :limit, class_name: 'InsurancePlanCoverageBenefitLimit'

    def self.transform_json(json_hash, target=InsurancePlanCoverageBenefit.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['requirement'] = PrimitiveString.transform_json(json_hash['requirement'], json_hash['_requirement']) unless json_hash['requirement'].nil?      
      result['limit'] = json_hash['limit'].map { |var| InsurancePlanCoverageBenefitLimit.transform_json(var) } unless json_hash['limit'].nil?

      result
    end
  end
end
