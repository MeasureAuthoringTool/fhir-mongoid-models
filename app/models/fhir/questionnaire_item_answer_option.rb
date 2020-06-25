module FHIR
  # fhir/questionnaire_item_answer_option.rb
  class QuestionnaireItemAnswerOption < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireItemAnswerOption'
    embeds_one :valueinteger, class_name: 'PrimitiveInteger'
    embeds_one :valuedate, class_name: 'PrimitiveDate'
    embeds_one :valuetime, class_name: 'PrimitiveTime'
    embeds_one :valuestring, class_name: 'PrimitiveString'
    embeds_one :valueCoding, class_name: 'Coding'
    embeds_one :valueReference, class_name: 'Reference'
    embeds_one :initialSelected, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash)
      result = QuestionnaireItemAnswerOption.new
      result['valueinteger'] = PrimitiveInteger.transform_json(json_hash['valueinteger'], json_hash['_valueinteger']) unless json_hash['valueinteger'].nil?      
      result['valuedate'] = PrimitiveDate.transform_json(json_hash['valuedate'], json_hash['_valuedate']) unless json_hash['valuedate'].nil?      
      result['valuetime'] = PrimitiveTime.transform_json(json_hash['valuetime'], json_hash['_valuetime']) unless json_hash['valuetime'].nil?      
      result['valuestring'] = PrimitiveString.transform_json(json_hash['valuestring'], json_hash['_valuestring']) unless json_hash['valuestring'].nil?      
      result['valueCoding'] = Coding.transform_json(json_hash['valueCoding']) unless json_hash['valueCoding'].nil?      
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?      
      result['initialSelected'] = PrimitiveBoolean.transform_json(json_hash['initialSelected'], json_hash['_initialSelected']) unless json_hash['initialSelected'].nil?      

      result
    end
  end
end
