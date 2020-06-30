module FHIR
  # fhir/questionnaire_item_type.rb
  class QuestionnaireItemType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireItemType'
    field :value, type: String

    def self.transform_json(json_hash, target=QuestionnaireItemType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
