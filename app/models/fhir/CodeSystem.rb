module FHIR
  class CodeSystem < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystem'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_many :identifier, class_name: 'Identifier'
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
    field :caseSensitive, type:  # primitive
    embeds_one :_caseSensitive, class_name: 'Extension'
    field :valueSet, type:  # primitive
    embeds_one :_valueSet, class_name: 'Extension'
    embeds_one :hierarchyMeaning, class_name: 'CodeSystemHierarchyMeaning'
    field :compositional, type:  # primitive
    embeds_one :_compositional, class_name: 'Extension'
    field :versionNeeded, type:  # primitive
    embeds_one :_versionNeeded, class_name: 'Extension'
    embeds_one :content, class_name: 'CodeSystemContentMode'
    field :supplements, type:  # primitive
    embeds_one :_supplements, class_name: 'Extension'
    field :count, type:  # primitive
    embeds_one :_count, class_name: 'Extension'
    embeds_many :filter, class_name: 'CodeSystemFilter'
    embeds_many :property, class_name: 'CodeSystemProperty'
    embeds_many :concept, class_name: 'CodeSystemConcept'
  end
end
