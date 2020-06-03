module FHIR
  class MessageDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageDefinition'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_many :identifier, class_name: 'Identifier'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
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
    field :purpose, type:  # primitive
    embeds_one :_purpose, class_name: 'Extension'
    field :copyright, type:  # primitive
    embeds_one :_copyright, class_name: 'Extension'
    field :base, type:  # primitive
    embeds_one :_base, class_name: 'Extension'
    field :parent, type: Array # primitive
    embeds_many :_parent, class_name: 'Extension'
    embeds_one :eventCoding, class_name: 'Coding'
    field :eventPrimitiveUri, type:  # primitive
    embeds_one :_eventPrimitiveUri, class_name: 'Extension'
    embeds_one :category, class_name: 'MessageSignificanceCategory'
    embeds_many :focus, class_name: 'MessageDefinitionFocus'
    embeds_one :responseRequired, class_name: 'MessageheaderResponseRequest'
    embeds_many :allowedResponse, class_name: 'MessageDefinitionAllowedResponse'
    field :graph, type: Array # primitive
    embeds_many :_graph, class_name: 'Extension'
  end
end
