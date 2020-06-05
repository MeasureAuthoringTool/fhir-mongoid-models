module FHIR
  class ImplementationGuide < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuide'
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
    field :copyright, type:  # primitive
    embeds_one :_copyright, class_name: 'Extension'
    field :packageId, type:  # primitive
    embeds_one :_packageId, class_name: 'Extension'
    embeds_one :license, class_name: 'SPDXLicense'
    embeds_many :fhirVersion, class_name: 'FHIRVersion'
    embeds_many :dependsOn, class_name: 'ImplementationGuideDependsOn'
    embeds_many :global, class_name: 'ImplementationGuideGlobal'
    embeds_one :definition, class_name: 'ImplementationGuideDefinition'
    embeds_one :manifest, class_name: 'ImplementationGuideManifest'
  end
end
