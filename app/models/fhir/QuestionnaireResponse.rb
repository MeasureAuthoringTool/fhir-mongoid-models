module FHIR
  class QuestionnaireResponse < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireResponse'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    field :questionnaire, type:  # primitive
    embeds_one :_questionnaire, class_name: 'Extension'
    embeds_one :status, class_name: 'QuestionnaireResponseStatus'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :authored, type:  # primitive
    embeds_one :_authored, class_name: 'Extension'
    embeds_one :author, class_name: 'Reference'
    embeds_one :source, class_name: 'Reference'
    embeds_many :item, class_name: 'QuestionnaireResponseItem'
  end
end
