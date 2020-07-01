module FHIR
  # fhir/questionnaire_item_answer_option.rb
  class QuestionnaireItemAnswerOption < BackboneElement
    include Mongoid::Document
    embeds_one :valueInteger, class_name: 'PrimitiveInteger'
    embeds_one :valueDate, class_name: 'PrimitiveDate'
    embeds_one :valueTime, class_name: 'PrimitiveTime'
    embeds_one :valueString, class_name: 'PrimitiveString'
    embeds_one :valueCoding, class_name: 'Coding'
    embeds_one :valueReference, class_name: 'Reference'
    embeds_one :initialSelected, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash, target = QuestionnaireItemAnswerOption.new)
      result = self.superclass.transform_json(json_hash, target)
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?      
      result['valueDate'] = PrimitiveDate.transform_json(json_hash['valueDate'], json_hash['_valueDate']) unless json_hash['valueDate'].nil?      
      result['valueTime'] = PrimitiveTime.transform_json(json_hash['valueTime'], json_hash['_valueTime']) unless json_hash['valueTime'].nil?      
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?      
      result['valueCoding'] = Coding.transform_json(json_hash['valueCoding']) unless json_hash['valueCoding'].nil?      
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?      
      result['initialSelected'] = PrimitiveBoolean.transform_json(json_hash['initialSelected'], json_hash['_initialSelected']) unless json_hash['initialSelected'].nil?      

      result
    end
  end
end
