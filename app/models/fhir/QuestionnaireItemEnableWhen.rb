module FHIR
  class QuestionnaireItemEnableWhen < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireItemEnableWhen'
    field :question, type:  # primitive
    embeds_one :_question, class_name: 'Extension'
    embeds_one :operator, class_name: 'QuestionnaireItemOperator'
    field :answerPrimitiveBoolean, type:  # primitive
    embeds_one :_answerPrimitiveBoolean, class_name: 'Extension'
    field :answerPrimitiveDecimal, type:  # primitive
    embeds_one :_answerPrimitiveDecimal, class_name: 'Extension'
    field :answerPrimitiveInteger, type:  # primitive
    embeds_one :_answerPrimitiveInteger, class_name: 'Extension'
    field :answerPrimitiveDate, type:  # primitive
    embeds_one :_answerPrimitiveDate, class_name: 'Extension'
    field :answerPrimitiveDateTime, type:  # primitive
    embeds_one :_answerPrimitiveDateTime, class_name: 'Extension'
    field :answerPrimitiveTime, type:  # primitive
    embeds_one :_answerPrimitiveTime, class_name: 'Extension'
    field :answerPrimitiveString, type:  # primitive
    embeds_one :_answerPrimitiveString, class_name: 'Extension'
    embeds_one :answerCoding, class_name: 'Coding'
    embeds_one :answerQuantity, class_name: 'Quantity'
    embeds_one :answerReference, class_name: 'Reference'
  end
end
