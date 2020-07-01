module FHIR
  # fhir/insurance_plan_coverage.rb
  class InsurancePlanCoverage < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :network, class_name: 'Reference'
    embeds_many :benefit, class_name: 'InsurancePlanCoverageBenefit'

    def self.transform_json(json_hash, target = InsurancePlanCoverage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['network'] = json_hash['network'].map { |var| Reference.transform_json(var) } unless json_hash['network'].nil?
      result['benefit'] = json_hash['benefit'].map { |var| InsurancePlanCoverageBenefit.transform_json(var) } unless json_hash['benefit'].nil?

      result
    end
  end
end
