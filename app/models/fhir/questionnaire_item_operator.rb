module FHIR
  # fhir/questionnaire_item_operator.rb
  class QuestionnaireItemOperator < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireItemOperator'
    field :value, type: String

    def self.transform_json(json_hash)
      result = QuestionnaireItemOperator.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
