module FHIR
  class QuestionnaireItemType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireItemType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
