module FHIR
  class NamingSystem < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'NamingSystem'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :kind, class_name: 'NamingSystemType'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    field :publisher, type:  # primitive
    embeds_one :_publisher, class_name: 'Extension'
    embeds_many :contact, class_name: 'ContactDetail'
    field :responsible, type:  # primitive
    embeds_one :_responsible, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    field :usage, type:  # primitive
    embeds_one :_usage, class_name: 'Extension'
    embeds_many :uniqueId, class_name: 'NamingSystemUniqueId'
  end
end
