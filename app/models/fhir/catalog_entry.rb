module FHIR
  # fhir/catalog_entry.rb
  class CatalogEntry < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CatalogEntry'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :orderable, class_name: 'PrimitiveBoolean'
    embeds_one :referencedItem, class_name: 'Reference'
    embeds_many :additionalIdentifier, class_name: 'Identifier'
    embeds_many :classification, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :validityPeriod, class_name: 'Period'
    embeds_one :validTo, class_name: 'PrimitiveDateTime'
    embeds_one :lastUpdated, class_name: 'PrimitiveDateTime'
    embeds_many :additionalCharacteristic, class_name: 'CodeableConcept'
    embeds_many :additionalClassification, class_name: 'CodeableConcept'
    embeds_many :relatedEntry, class_name: 'CatalogEntryRelatedEntry'

    def self.transform_json(json_hash, target=CatalogEntry.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['orderable'] = PrimitiveBoolean.transform_json(json_hash['orderable'], json_hash['_orderable']) unless json_hash['orderable'].nil?      
      result['referencedItem'] = Reference.transform_json(json_hash['referencedItem']) unless json_hash['referencedItem'].nil?      
      result['additionalIdentifier'] = json_hash['additionalIdentifier'].map { |var| Identifier.transform_json(var) } unless json_hash['additionalIdentifier'].nil?
      result['classification'] = json_hash['classification'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['classification'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['validityPeriod'] = Period.transform_json(json_hash['validityPeriod']) unless json_hash['validityPeriod'].nil?      
      result['validTo'] = PrimitiveDateTime.transform_json(json_hash['validTo'], json_hash['_validTo']) unless json_hash['validTo'].nil?      
      result['lastUpdated'] = PrimitiveDateTime.transform_json(json_hash['lastUpdated'], json_hash['_lastUpdated']) unless json_hash['lastUpdated'].nil?      
      result['additionalCharacteristic'] = json_hash['additionalCharacteristic'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['additionalCharacteristic'].nil?
      result['additionalClassification'] = json_hash['additionalClassification'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['additionalClassification'].nil?
      result['relatedEntry'] = json_hash['relatedEntry'].map { |var| CatalogEntryRelatedEntry.transform_json(var) } unless json_hash['relatedEntry'].nil?

      result
    end
  end
end
