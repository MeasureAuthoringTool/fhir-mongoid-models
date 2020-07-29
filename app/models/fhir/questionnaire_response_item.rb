module FHIR
  # fhir/questionnaire_response_item.rb
  class QuestionnaireResponseItem < BackboneElement
    include Mongoid::Document
    embeds_one :linkId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :definition, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    embeds_many :answer, class_name: 'FHIR::QuestionnaireResponseItemAnswer'    
    embeds_many :item, class_name: 'FHIR::QuestionnaireResponseItem'    

    def self.transform_json(json_hash, target = QuestionnaireResponseItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['linkId'] = PrimitiveString.transform_json(json_hash['linkId'], json_hash['_linkId']) unless json_hash['linkId'].nil?
      result['definition'] = PrimitiveUri.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?
      result['answer'] = json_hash['answer'].map { |var| QuestionnaireResponseItemAnswer.transform_json(var) } unless json_hash['answer'].nil?
      result['item'] = json_hash['item'].map { |var| QuestionnaireResponseItem.transform_json(var) } unless json_hash['item'].nil?

      result
    end
  end
end
