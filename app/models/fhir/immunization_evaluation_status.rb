module FHIR
  # fhir/immunization_evaluation_status.rb
  class ImmunizationEvaluationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationEvaluationStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ImmunizationEvaluationStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
