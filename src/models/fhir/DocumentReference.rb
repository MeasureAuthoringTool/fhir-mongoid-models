module FHIR
  class DocumentReference < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentReference'
    embeds_one :masterIdentifier, class_name: 'Identifier'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'DocumentReferenceStatus'
    embeds_one :docStatus, class_name: 'ReferredDocumentStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_many :author, class_name: 'Reference'
    embeds_one :authenticator, class_name: 'Reference'
    embeds_one :custodian, class_name: 'Reference'
    embeds_many :relatesTo, class_name: 'DocumentReferenceRelatesTo'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :securityLabel, class_name: 'CodeableConcept'
    embeds_many :content, class_name: 'DocumentReferenceContent'
    embeds_one :context, class_name: 'DocumentReferenceContext'
  end
end
