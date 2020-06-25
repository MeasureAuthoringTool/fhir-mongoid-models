module FHIR
  # fhir/questionnaire_item_enable_when.rb
  class QuestionnaireItemEnableWhen < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireItemEnableWhen'
    embeds_one :question, class_name: 'PrimitiveString'
    embeds_one :operator, class_name: 'QuestionnaireItemOperator'
    embeds_one :answerboolean, class_name: 'PrimitiveBoolean'
    embeds_one :answerdecimal, class_name: 'PrimitiveDecimal'
    embeds_one :answerinteger, class_name: 'PrimitiveInteger'
    embeds_one :answerdate, class_name: 'PrimitiveDate'
    embeds_one :answerdateTime, class_name: 'PrimitiveDateTime'
    embeds_one :answertime, class_name: 'PrimitiveTime'
    embeds_one :answerstring, class_name: 'PrimitiveString'
    embeds_one :answerCoding, class_name: 'Coding'
    embeds_one :answerQuantity, class_name: 'Quantity'
    embeds_one :answerReference, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = QuestionnaireItemEnableWhen.new
      result['question'] = PrimitiveString.transform_json(json_hash['question'], json_hash['_question']) unless json_hash['question'].nil?      
      result['operator'] = QuestionnaireItemOperator.transform_json(json_hash['operator']) unless json_hash['operator'].nil?      
      result['answerboolean'] = PrimitiveBoolean.transform_json(json_hash['answerboolean'], json_hash['_answerboolean']) unless json_hash['answerboolean'].nil?      
      result['answerdecimal'] = PrimitiveDecimal.transform_json(json_hash['answerdecimal'], json_hash['_answerdecimal']) unless json_hash['answerdecimal'].nil?      
      result['answerinteger'] = PrimitiveInteger.transform_json(json_hash['answerinteger'], json_hash['_answerinteger']) unless json_hash['answerinteger'].nil?      
      result['answerdate'] = PrimitiveDate.transform_json(json_hash['answerdate'], json_hash['_answerdate']) unless json_hash['answerdate'].nil?      
      result['answerdateTime'] = PrimitiveDateTime.transform_json(json_hash['answerdateTime'], json_hash['_answerdateTime']) unless json_hash['answerdateTime'].nil?      
      result['answertime'] = PrimitiveTime.transform_json(json_hash['answertime'], json_hash['_answertime']) unless json_hash['answertime'].nil?      
      result['answerstring'] = PrimitiveString.transform_json(json_hash['answerstring'], json_hash['_answerstring']) unless json_hash['answerstring'].nil?      
      result['answerCoding'] = Coding.transform_json(json_hash['answerCoding']) unless json_hash['answerCoding'].nil?      
      result['answerQuantity'] = Quantity.transform_json(json_hash['answerQuantity']) unless json_hash['answerQuantity'].nil?      
      result['answerReference'] = Reference.transform_json(json_hash['answerReference']) unless json_hash['answerReference'].nil?      

      result
    end
  end
end
