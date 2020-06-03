module FHIR
  class Questionnaire < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Questionnaire'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_many :identifier, class_name: 'Identifier'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    field :derivedFrom, type: Array # primitive
    embeds_many :_derivedFrom, class_name: 'Extension'
    embeds_one :status, class_name: 'PublicationStatus'
    field :experimental, type:  # primitive
    embeds_one :_experimental, class_name: 'Extension'
    embeds_many :subjectType, class_name: 'ResourceType'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    field :publisher, type:  # primitive
    embeds_one :_publisher, class_name: 'Extension'
    embeds_many :contact, class_name: 'ContactDetail'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    field :purpose, type:  # primitive
    embeds_one :_purpose, class_name: 'Extension'
    field :copyright, type:  # primitive
    embeds_one :_copyright, class_name: 'Extension'
    field :approvalDate, type:  # primitive
    embeds_one :_approvalDate, class_name: 'Extension'
    field :lastReviewDate, type:  # primitive
    embeds_one :_lastReviewDate, class_name: 'Extension'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_many :code, class_name: 'Coding'
    embeds_many :item, class_name: 'QuestionnaireItem'
  end
end
