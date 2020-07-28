module FHIR
  # fhir/immunization_evaluation_status.rb
  class ImmunizationEvaluationStatus < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = ImmunizationEvaluationStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
