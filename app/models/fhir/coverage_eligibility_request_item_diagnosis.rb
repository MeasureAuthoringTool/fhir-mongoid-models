module FHIR
  # fhir/coverage_eligibility_request_item_diagnosis.rb
  class CoverageEligibilityRequestItemDiagnosis < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityRequestItemDiagnosis'
    embeds_one :diagnosisCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :diagnosisReference, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = CoverageEligibilityRequestItemDiagnosis.new
      result['diagnosisCodeableConcept'] = CodeableConcept.transform_json(json_hash['diagnosisCodeableConcept']) unless json_hash['diagnosisCodeableConcept'].nil?      
      result['diagnosisReference'] = Reference.transform_json(json_hash['diagnosisReference']) unless json_hash['diagnosisReference'].nil?      

      result
    end
  end
end
