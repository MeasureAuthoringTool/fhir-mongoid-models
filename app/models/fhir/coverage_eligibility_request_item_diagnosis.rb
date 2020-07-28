module FHIR
  # fhir/coverage_eligibility_request_item_diagnosis.rb
  class CoverageEligibilityRequestItemDiagnosis < BackboneElement
    include Mongoid::Document
    embeds_one :diagnosisCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :diagnosisReference, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = CoverageEligibilityRequestItemDiagnosis.new)
      result = self.superclass.transform_json(json_hash, target)
      result['diagnosisCodeableConcept'] = CodeableConcept.transform_json(json_hash['diagnosisCodeableConcept']) unless json_hash['diagnosisCodeableConcept'].nil?
      result['diagnosisReference'] = Reference.transform_json(json_hash['diagnosisReference']) unless json_hash['diagnosisReference'].nil?

      result
    end
  end
end
