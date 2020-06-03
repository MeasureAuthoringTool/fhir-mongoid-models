module FHIR
  class CompartmentDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CompartmentDefinition'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
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
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :useContext, class_name: 'UsageContext'
    field :purpose, type:  # primitive
    embeds_one :_purpose, class_name: 'Extension'
    embeds_one :code, class_name: 'CompartmentType'
    field :search, type:  # primitive
    embeds_one :_search, class_name: 'Extension'
    embeds_many :resource, class_name: 'CompartmentDefinitionResource'
  end
end
