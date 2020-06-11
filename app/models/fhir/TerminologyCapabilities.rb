module FHIR
  class TerminologyCapabilities < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilities'
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
    embeds_one :software, class_name: 'TerminologyCapabilitiesSoftware'
    embeds_one :implementation, class_name: 'TerminologyCapabilitiesImplementation'
    field :lockedDate, type:  # primitive
    embeds_one :_lockedDate, class_name: 'Extension'
    embeds_many :codeSystem, class_name: 'TerminologyCapabilitiesCodeSystem'
    embeds_one :expansion, class_name: 'TerminologyCapabilitiesExpansion'
    embeds_one :codeSearch, class_name: 'CodeSearchSupport'
    embeds_one :validateCode, class_name: 'TerminologyCapabilitiesValidateCode'
    embeds_one :translation, class_name: 'TerminologyCapabilitiesTranslation'
    embeds_one :closure, class_name: 'TerminologyCapabilitiesClosure'
  end
end
