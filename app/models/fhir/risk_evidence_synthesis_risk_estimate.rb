module FHIR
  # fhir/risk_evidence_synthesis_risk_estimate.rb
  class RiskEvidenceSynthesisRiskEstimate < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskEvidenceSynthesisRiskEstimate'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :value, class_name: 'PrimitiveDecimal'
    embeds_one :unitOfMeasure, class_name: 'CodeableConcept'
    embeds_one :denominatorCount, class_name: 'PrimitiveInteger'
    embeds_one :numeratorCount, class_name: 'PrimitiveInteger'
    embeds_many :precisionEstimate, class_name: 'RiskEvidenceSynthesisRiskEstimatePrecisionEstimate'

    def self.transform_json(json_hash)
      result = RiskEvidenceSynthesisRiskEstimate.new
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      
      result['unitOfMeasure'] = CodeableConcept.transform_json(json_hash['unitOfMeasure']) unless json_hash['unitOfMeasure'].nil?      
      result['denominatorCount'] = PrimitiveInteger.transform_json(json_hash['denominatorCount'], json_hash['_denominatorCount']) unless json_hash['denominatorCount'].nil?      
      result['numeratorCount'] = PrimitiveInteger.transform_json(json_hash['numeratorCount'], json_hash['_numeratorCount']) unless json_hash['numeratorCount'].nil?      
      result['precisionEstimate'] = json_hash['precisionEstimate'].map { |var| RiskEvidenceSynthesisRiskEstimatePrecisionEstimate.transform_json(var) } unless json_hash['precisionEstimate'].nil?

      result
    end
  end
end
