module FHIR
  # fhir/risk_evidence_synthesis_risk_estimate_precision_estimate.rb
  class RiskEvidenceSynthesisRiskEstimatePrecisionEstimate < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :level, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :from, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :to, class_name: 'FHIR::PrimitiveDecimal'    

    def self.transform_json(json_hash, target = RiskEvidenceSynthesisRiskEstimatePrecisionEstimate.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['level'] = PrimitiveDecimal.transform_json(json_hash['level'], json_hash['_level']) unless json_hash['level'].nil?
      result['from'] = PrimitiveDecimal.transform_json(json_hash['from'], json_hash['_from']) unless json_hash['from'].nil?
      result['to'] = PrimitiveDecimal.transform_json(json_hash['to'], json_hash['_to']) unless json_hash['to'].nil?

      result
    end
  end
end
