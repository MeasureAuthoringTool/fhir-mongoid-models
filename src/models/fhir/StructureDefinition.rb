module FHIR
  class StructureDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureDefinition'
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
    embeds_many :keyword, class_name: 'Coding'
    embeds_one :fhirVersion, class_name: 'FHIRVersion'
    embeds_many :mapping, class_name: 'StructureDefinitionMapping'
    embeds_one :kind, class_name: 'StructureDefinitionKind'
    field :abstract, type:  # primitive
    embeds_one :_abstract, class_name: 'Extension'
    embeds_many :context, class_name: 'StructureDefinitionContext'
    field :contextInvariant, type: Array # primitive
    embeds_many :_contextInvariant, class_name: 'Extension'
    field :type, type:  # primitive
    embeds_one :_type, class_name: 'Extension'
    field :baseDefinition, type:  # primitive
    embeds_one :_baseDefinition, class_name: 'Extension'
    embeds_one :derivation, class_name: 'TypeDerivationRule'
    embeds_one :snapshot, class_name: 'StructureDefinitionSnapshot'
    embeds_one :differential, class_name: 'StructureDefinitionDifferential'
  end
end
