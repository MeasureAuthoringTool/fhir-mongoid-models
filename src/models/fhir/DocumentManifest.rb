module FHIR
  class DocumentManifest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentManifest'
    embeds_one :masterIdentifier, class_name: 'Identifier'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'DocumentReferenceStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_many :author, class_name: 'Reference'
    embeds_many :recipient, class_name: 'Reference'
    field :source, type:  # primitive
    embeds_one :_source, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :content, class_name: 'Reference'
    embeds_many :related, class_name: 'DocumentManifestRelated'
  end
end
