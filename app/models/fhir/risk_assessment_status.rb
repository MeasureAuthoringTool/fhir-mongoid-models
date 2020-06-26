module FHIR
  # fhir/risk_assessment_status.rb
  class RiskAssessmentStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskAssessmentStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = RiskAssessmentStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
