module FHIR
  class ConceptMap < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMap'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_one :identifier, class_name: 'Identifier'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
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
    field :purpose, type:  # primitive
    embeds_one :_purpose, class_name: 'Extension'
    field :copyright, type:  # primitive
    embeds_one :_copyright, class_name: 'Extension'
    field :sourcePrimitiveUri, type:  # primitive
    embeds_one :_sourcePrimitiveUri, class_name: 'Extension'
    field :sourcePrimitiveCanonical, type:  # primitive
    embeds_one :_sourcePrimitiveCanonical, class_name: 'Extension'
    field :targetPrimitiveUri, type:  # primitive
    embeds_one :_targetPrimitiveUri, class_name: 'Extension'
    field :targetPrimitiveCanonical, type:  # primitive
    embeds_one :_targetPrimitiveCanonical, class_name: 'Extension'
    embeds_many :group, class_name: 'ConceptMapGroup'
  end
end
