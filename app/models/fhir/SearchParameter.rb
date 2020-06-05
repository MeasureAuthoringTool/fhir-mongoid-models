module FHIR
  class SearchParameter < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SearchParameter'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :derivedFrom, type:  # primitive
    embeds_one :_derivedFrom, class_name: 'Extension'
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
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    embeds_many :base, class_name: 'ResourceType'
    embeds_one :type, class_name: 'SearchParamType'
    field :expression, type:  # primitive
    embeds_one :_expression, class_name: 'Extension'
    field :xpath, type:  # primitive
    embeds_one :_xpath, class_name: 'Extension'
    embeds_one :xpathUsage, class_name: 'XPathUsageType'
    embeds_many :target, class_name: 'ResourceType'
    field :multipleOr, type:  # primitive
    embeds_one :_multipleOr, class_name: 'Extension'
    field :multipleAnd, type:  # primitive
    embeds_one :_multipleAnd, class_name: 'Extension'
    embeds_many :comparator, class_name: 'SearchComparator'
    embeds_many :modifier, class_name: 'SearchModifierCode'
    field :chain, type: Array # primitive
    embeds_many :_chain, class_name: 'Extension'
    embeds_many :component, class_name: 'SearchParameterComponent'
  end
end
