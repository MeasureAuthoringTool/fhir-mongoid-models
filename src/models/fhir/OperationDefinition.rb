module FHIR
  class OperationDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationDefinition'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :kind, class_name: 'OperationKind'
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
    field :affectsState, type:  # primitive
    embeds_one :_affectsState, class_name: 'Extension'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
    field :base, type:  # primitive
    embeds_one :_base, class_name: 'Extension'
    embeds_many :resource, class_name: 'ResourceType'
    field :system, type:  # primitive
    embeds_one :_system, class_name: 'Extension'
    field :type, type:  # primitive
    embeds_one :_type, class_name: 'Extension'
    field :instance, type:  # primitive
    embeds_one :_instance, class_name: 'Extension'
    field :inputProfile, type:  # primitive
    embeds_one :_inputProfile, class_name: 'Extension'
    field :outputProfile, type:  # primitive
    embeds_one :_outputProfile, class_name: 'Extension'
    embeds_many :parameter, class_name: 'OperationDefinitionParameter'
    embeds_many :overload, class_name: 'OperationDefinitionOverload'
  end
end
