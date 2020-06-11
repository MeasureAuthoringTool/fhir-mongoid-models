module FHIR
  class QuestionnaireResponseItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireResponseItem'
    field :linkId, type:  # primitive
    embeds_one :_linkId, class_name: 'Extension'
    field :definition, type:  # primitive
    embeds_one :_definition, class_name: 'Extension'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
    embeds_many :answer, class_name: 'QuestionnaireResponseItemAnswer'
    embeds_many :item, class_name: 'QuestionnaireResponseItem'
  end
end
