module FHIR
  class CapabilityStatement < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatement'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
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
    embeds_one :kind, class_name: 'CapabilityStatementKind'
    field :instantiates, type: Array # primitive
    embeds_many :_instantiates, class_name: 'Extension'
    field :imports, type: Array # primitive
    embeds_many :_imports, class_name: 'Extension'
    embeds_one :software, class_name: 'CapabilityStatementSoftware'
    embeds_one :implementation, class_name: 'CapabilityStatementImplementation'
    embeds_one :fhirVersion, class_name: 'FHIRVersion'
    embeds_many :format, class_name: 'MimeType'
    embeds_many :patchFormat, class_name: 'MimeType'
    field :implementationGuide, type: Array # primitive
    embeds_many :_implementationGuide, class_name: 'Extension'
    embeds_many :rest, class_name: 'CapabilityStatementRest'
    embeds_many :messaging, class_name: 'CapabilityStatementMessaging'
    embeds_many :document, class_name: 'CapabilityStatementDocument'
  end
end
