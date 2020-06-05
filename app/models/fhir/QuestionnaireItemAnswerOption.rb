module FHIR
  class QuestionnaireItemAnswerOption < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireItemAnswerOption'
    field :valuePrimitiveInteger, type:  # primitive
    embeds_one :_valuePrimitiveInteger, class_name: 'Extension'
    field :valuePrimitiveDate, type:  # primitive
    embeds_one :_valuePrimitiveDate, class_name: 'Extension'
    field :valuePrimitiveTime, type:  # primitive
    embeds_one :_valuePrimitiveTime, class_name: 'Extension'
    field :valuePrimitiveString, type:  # primitive
    embeds_one :_valuePrimitiveString, class_name: 'Extension'
    embeds_one :valueCoding, class_name: 'Coding'
    embeds_one :valueReference, class_name: 'Reference'
    field :initialSelected, type:  # primitive
    embeds_one :_initialSelected, class_name: 'Extension'
  end
end
