module FHIR
  class QuestionnaireItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireItem'
    field :linkId, type:  # primitive
    embeds_one :_linkId, class_name: 'Extension'
    field :definition, type:  # primitive
    embeds_one :_definition, class_name: 'Extension'
    embeds_many :code, class_name: 'Coding'
    field :prefix, type:  # primitive
    embeds_one :_prefix, class_name: 'Extension'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
    embeds_one :type, class_name: 'QuestionnaireItemType'
    embeds_many :enableWhen, class_name: 'QuestionnaireItemEnableWhen'
    embeds_one :enableBehavior, class_name: 'EnableWhenBehavior'
    field :required, type:  # primitive
    embeds_one :_required, class_name: 'Extension'
    field :repeats, type:  # primitive
    embeds_one :_repeats, class_name: 'Extension'
    field :readOnly, type:  # primitive
    embeds_one :_readOnly, class_name: 'Extension'
    field :maxLength, type:  # primitive
    embeds_one :_maxLength, class_name: 'Extension'
    field :answerValueSet, type:  # primitive
    embeds_one :_answerValueSet, class_name: 'Extension'
    embeds_many :answerOption, class_name: 'QuestionnaireItemAnswerOption'
    embeds_many :initial, class_name: 'QuestionnaireItemInitial'
    embeds_many :item, class_name: 'QuestionnaireItem'
  end
end
