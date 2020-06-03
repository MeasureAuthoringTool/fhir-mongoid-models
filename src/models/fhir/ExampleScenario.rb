module FHIR
  class ExampleScenario < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenario'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_many :identifier, class_name: 'Identifier'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :status, class_name: 'PublicationStatus'
    field :experimental, type:  # primitive
    embeds_one :_experimental, class_name: 'Extension'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    field :publisher, type:  # primitive
    embeds_one :_publisher, class_name: 'Extension'
    embeds_many :contact, class_name: 'ContactDetail'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    field :copyright, type:  # primitive
    embeds_one :_copyright, class_name: 'Extension'
    field :purpose, type:  # primitive
    embeds_one :_purpose, class_name: 'Extension'
    embeds_many :actor, class_name: 'ExampleScenarioActor'
    embeds_many :instance, class_name: 'ExampleScenarioInstance'
    embeds_many :process, class_name: 'ExampleScenarioProcess'
    field :workflow, type: Array # primitive
    embeds_many :_workflow, class_name: 'Extension'
  end
end
