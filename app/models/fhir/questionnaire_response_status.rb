module FHIR
  # fhir/questionnaire_response_status.rb
  class QuestionnaireResponseStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireResponseStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = QuestionnaireResponseStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
