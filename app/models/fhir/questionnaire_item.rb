module FHIR
  # fhir/questionnaire_item.rb
  class QuestionnaireItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireItem'
    embeds_one :linkId, class_name: 'PrimitiveString'
    embeds_one :definition, class_name: 'PrimitiveUri'
    embeds_many :code, class_name: 'Coding'
    embeds_one :prefix, class_name: 'PrimitiveString'
    embeds_one :text, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'QuestionnaireItemType'
    embeds_many :enableWhen, class_name: 'QuestionnaireItemEnableWhen'
    embeds_one :enableBehavior, class_name: 'EnableWhenBehavior'
    embeds_one :required, class_name: 'PrimitiveBoolean'
    embeds_one :repeats, class_name: 'PrimitiveBoolean'
    embeds_one :readOnly, class_name: 'PrimitiveBoolean'
    embeds_one :maxLength, class_name: 'PrimitiveInteger'
    embeds_one :answerValueSet, class_name: 'PrimitiveCanonical'
    embeds_many :answerOption, class_name: 'QuestionnaireItemAnswerOption'
    embeds_many :initial, class_name: 'QuestionnaireItemInitial'
    embeds_many :item, class_name: 'QuestionnaireItem'

    def self.transform_json(json_hash)
      result = QuestionnaireItem.new
      result['linkId'] = PrimitiveString.transform_json(json_hash['linkId'], json_hash['_linkId']) unless json_hash['linkId'].nil?      
      result['definition'] = PrimitiveUri.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?      
      result['code'] = json_hash['code'].map { |var| Coding.transform_json(var) } unless json_hash['code'].nil?
      result['prefix'] = PrimitiveString.transform_json(json_hash['prefix'], json_hash['_prefix']) unless json_hash['prefix'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['type'] = QuestionnaireItemType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['enableWhen'] = json_hash['enableWhen'].map { |var| QuestionnaireItemEnableWhen.transform_json(var) } unless json_hash['enableWhen'].nil?
      result['enableBehavior'] = EnableWhenBehavior.transform_json(json_hash['enableBehavior']) unless json_hash['enableBehavior'].nil?      
      result['required'] = PrimitiveBoolean.transform_json(json_hash['required'], json_hash['_required']) unless json_hash['required'].nil?      
      result['repeats'] = PrimitiveBoolean.transform_json(json_hash['repeats'], json_hash['_repeats']) unless json_hash['repeats'].nil?      
      result['readOnly'] = PrimitiveBoolean.transform_json(json_hash['readOnly'], json_hash['_readOnly']) unless json_hash['readOnly'].nil?      
      result['maxLength'] = PrimitiveInteger.transform_json(json_hash['maxLength'], json_hash['_maxLength']) unless json_hash['maxLength'].nil?      
      result['answerValueSet'] = PrimitiveCanonical.transform_json(json_hash['answerValueSet'], json_hash['_answerValueSet']) unless json_hash['answerValueSet'].nil?      
      result['answerOption'] = json_hash['answerOption'].map { |var| QuestionnaireItemAnswerOption.transform_json(var) } unless json_hash['answerOption'].nil?
      result['initial'] = json_hash['initial'].map { |var| QuestionnaireItemInitial.transform_json(var) } unless json_hash['initial'].nil?
      result['item'] = json_hash['item'].map { |var| QuestionnaireItem.transform_json(var) } unless json_hash['item'].nil?

      result
    end
  end
end
