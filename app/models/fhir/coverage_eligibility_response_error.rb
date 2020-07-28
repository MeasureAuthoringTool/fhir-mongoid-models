module FHIR
  # fhir/coverage_eligibility_response_error.rb
  class CoverageEligibilityResponseError < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    

    def self.transform_json(json_hash, target = CoverageEligibilityResponseError.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?

      result
    end
  end
end
