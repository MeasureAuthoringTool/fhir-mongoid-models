module FHIR
  class ChargeItemDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemDefinition'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_many :identifier, class_name: 'Identifier'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    field :derivedFromUri, type: Array # primitive
    embeds_many :_derivedFromUri, class_name: 'Extension'
    field :partOf, type: Array # primitive
    embeds_many :_partOf, class_name: 'Extension'
    field :replaces, type: Array # primitive
    embeds_many :_replaces, class_name: 'Extension'
    embeds_one :status, class_name: 'PublicationStatus'
    field :experimental, type:  # primitive
    embeds_one :_experimental, class_name: 'Extension'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    field :publisher, type:  # primitive
    embeds_one :_publisher, class_name: 'Extension'
    embeds_many :contact, class_name: 'ContactDetail'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    field :copyright, type:  # primitive
    embeds_one :_copyright, class_name: 'Extension'
    field :approvalDate, type:  # primitive
    embeds_one :_approvalDate, class_name: 'Extension'
    field :lastReviewDate, type:  # primitive
    embeds_one :_lastReviewDate, class_name: 'Extension'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :instance, class_name: 'Reference'
    embeds_many :applicability, class_name: 'ChargeItemDefinitionApplicability'
    embeds_many :propertyGroup, class_name: 'ChargeItemDefinitionPropertyGroup'
  end
end
