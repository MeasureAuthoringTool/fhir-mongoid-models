module FHIR
  # fhir/coverage_eligibility_request_insurance.rb
  class CoverageEligibilityRequestInsurance < BackboneElement
    include Mongoid::Document
    embeds_one :focal, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :coverage, class_name: 'FHIR::Reference'
    embeds_one :businessArrangement, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = CoverageEligibilityRequestInsurance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['focal'] = PrimitiveBoolean.transform_json(json_hash['focal'], json_hash['_focal']) unless json_hash['focal'].nil?      
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?      
      result['businessArrangement'] = PrimitiveString.transform_json(json_hash['businessArrangement'], json_hash['_businessArrangement']) unless json_hash['businessArrangement'].nil?      

      result
    end
  end
end
