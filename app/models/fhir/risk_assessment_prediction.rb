module FHIR
  # fhir/risk_assessment_prediction.rb
  class RiskAssessmentPrediction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskAssessmentPrediction'
    embeds_one :outcome, class_name: 'CodeableConcept'
    embeds_one :probabilityDecimal, class_name: 'PrimitiveDecimal'
    embeds_one :probabilityRange, class_name: 'Range'
    embeds_one :qualitativeRisk, class_name: 'CodeableConcept'
    embeds_one :relativeRisk, class_name: 'PrimitiveDecimal'
    embeds_one :whenPeriod, class_name: 'Period'
    embeds_one :whenRange, class_name: 'Range'
    embeds_one :rationale, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=RiskAssessmentPrediction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['outcome'] = CodeableConcept.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      
      result['probabilityDecimal'] = PrimitiveDecimal.transform_json(json_hash['probabilityDecimal'], json_hash['_probabilityDecimal']) unless json_hash['probabilityDecimal'].nil?      
      result['probabilityRange'] = Range.transform_json(json_hash['probabilityRange']) unless json_hash['probabilityRange'].nil?      
      result['qualitativeRisk'] = CodeableConcept.transform_json(json_hash['qualitativeRisk']) unless json_hash['qualitativeRisk'].nil?      
      result['relativeRisk'] = PrimitiveDecimal.transform_json(json_hash['relativeRisk'], json_hash['_relativeRisk']) unless json_hash['relativeRisk'].nil?      
      result['whenPeriod'] = Period.transform_json(json_hash['whenPeriod']) unless json_hash['whenPeriod'].nil?      
      result['whenRange'] = Range.transform_json(json_hash['whenRange']) unless json_hash['whenRange'].nil?      
      result['rationale'] = PrimitiveString.transform_json(json_hash['rationale'], json_hash['_rationale']) unless json_hash['rationale'].nil?      

      result
    end
  end
end
