module FHIR
  class CatalogEntry < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CatalogEntry'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    field :orderable, type:  # primitive
    embeds_one :_orderable, class_name: 'Extension'
    embeds_one :referencedItem, class_name: 'Reference'
    embeds_many :additionalIdentifier, class_name: 'Identifier'
    embeds_many :classification, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :validityPeriod, class_name: 'Period'
    field :validTo, type:  # primitive
    embeds_one :_validTo, class_name: 'Extension'
    field :lastUpdated, type:  # primitive
    embeds_one :_lastUpdated, class_name: 'Extension'
    embeds_many :additionalCharacteristic, class_name: 'CodeableConcept'
    embeds_many :additionalClassification, class_name: 'CodeableConcept'
    embeds_many :relatedEntry, class_name: 'CatalogEntryRelatedEntry'
  end
end
