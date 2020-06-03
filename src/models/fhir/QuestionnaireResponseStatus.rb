module FHIR
  class QuestionnaireResponseStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireResponseStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
