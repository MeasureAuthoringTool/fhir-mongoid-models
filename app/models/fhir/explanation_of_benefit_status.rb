module FHIR
  # fhir/explanation_of_benefit_status.rb
  class ExplanationOfBenefitStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ExplanationOfBenefitStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
