module FHIR
  # fhir/questionnaire_item_enable_when.rb
  class QuestionnaireItemEnableWhen < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireItemEnableWhen'
    embeds_one :question, class_name: 'PrimitiveString'
    embeds_one :operator, class_name: 'QuestionnaireItemOperator'
    embeds_one :answerBoolean, class_name: 'PrimitiveBoolean'
    embeds_one :answerDecimal, class_name: 'PrimitiveDecimal'
    embeds_one :answerInteger, class_name: 'PrimitiveInteger'
    embeds_one :answerDate, class_name: 'PrimitiveDate'
    embeds_one :answerDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :answerTime, class_name: 'PrimitiveTime'
    embeds_one :answerString, class_name: 'PrimitiveString'
    embeds_one :answerCoding, class_name: 'Coding'
    embeds_one :answerQuantity, class_name: 'Quantity'
    embeds_one :answerReference, class_name: 'Reference'

    def self.transform_json(json_hash, target=QuestionnaireItemEnableWhen.new)
      result = self.superclass.transform_json(json_hash, target)
      result['question'] = PrimitiveString.transform_json(json_hash['question'], json_hash['_question']) unless json_hash['question'].nil?      
      result['operator'] = QuestionnaireItemOperator.transform_json(json_hash['operator']) unless json_hash['operator'].nil?      
      result['answerBoolean'] = PrimitiveBoolean.transform_json(json_hash['answerBoolean'], json_hash['_answerBoolean']) unless json_hash['answerBoolean'].nil?      
      result['answerDecimal'] = PrimitiveDecimal.transform_json(json_hash['answerDecimal'], json_hash['_answerDecimal']) unless json_hash['answerDecimal'].nil?      
      result['answerInteger'] = PrimitiveInteger.transform_json(json_hash['answerInteger'], json_hash['_answerInteger']) unless json_hash['answerInteger'].nil?      
      result['answerDate'] = PrimitiveDate.transform_json(json_hash['answerDate'], json_hash['_answerDate']) unless json_hash['answerDate'].nil?      
      result['answerDateTime'] = PrimitiveDateTime.transform_json(json_hash['answerDateTime'], json_hash['_answerDateTime']) unless json_hash['answerDateTime'].nil?      
      result['answerTime'] = PrimitiveTime.transform_json(json_hash['answerTime'], json_hash['_answerTime']) unless json_hash['answerTime'].nil?      
      result['answerString'] = PrimitiveString.transform_json(json_hash['answerString'], json_hash['_answerString']) unless json_hash['answerString'].nil?      
      result['answerCoding'] = Coding.transform_json(json_hash['answerCoding']) unless json_hash['answerCoding'].nil?      
      result['answerQuantity'] = Quantity.transform_json(json_hash['answerQuantity']) unless json_hash['answerQuantity'].nil?      
      result['answerReference'] = Reference.transform_json(json_hash['answerReference']) unless json_hash['answerReference'].nil?      

      result
    end
  end
end
