module FHIR
  # fhir/coverage_eligibility_response_insurance.rb
  class CoverageEligibilityResponseInsurance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityResponseInsurance'
    embeds_one :coverage, class_name: 'Reference'
    embeds_one :inforce, class_name: 'PrimitiveBoolean'
    embeds_one :benefitPeriod, class_name: 'Period'
    embeds_many :item, class_name: 'CoverageEligibilityResponseInsuranceItem'

    def self.transform_json(json_hash, target=CoverageEligibilityResponseInsurance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?      
      result['inforce'] = PrimitiveBoolean.transform_json(json_hash['inforce'], json_hash['_inforce']) unless json_hash['inforce'].nil?      
      result['benefitPeriod'] = Period.transform_json(json_hash['benefitPeriod']) unless json_hash['benefitPeriod'].nil?      
      result['item'] = json_hash['item'].map { |var| CoverageEligibilityResponseInsuranceItem.transform_json(var) } unless json_hash['item'].nil?

      result
    end
  end
end
