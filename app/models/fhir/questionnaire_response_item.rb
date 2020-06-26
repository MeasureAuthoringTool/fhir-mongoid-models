module FHIR
  # fhir/questionnaire_response_item.rb
  class QuestionnaireResponseItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireResponseItem'
    embeds_one :linkId, class_name: 'PrimitiveString'
    embeds_one :definition, class_name: 'PrimitiveUri'
    embeds_one :text, class_name: 'PrimitiveString'
    embeds_many :answer, class_name: 'QuestionnaireResponseItemAnswer'
    embeds_many :item, class_name: 'QuestionnaireResponseItem'

    def self.transform_json(json_hash)
      result = QuestionnaireResponseItem.new
      result['linkId'] = PrimitiveString.transform_json(json_hash['linkId'], json_hash['_linkId']) unless json_hash['linkId'].nil?      
      result['definition'] = PrimitiveUri.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['answer'] = json_hash['answer'].map { |var| QuestionnaireResponseItemAnswer.transform_json(var) } unless json_hash['answer'].nil?
      result['item'] = json_hash['item'].map { |var| QuestionnaireResponseItem.transform_json(var) } unless json_hash['item'].nil?

      result
    end
  end
end
