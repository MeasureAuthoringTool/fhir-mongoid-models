module FHIR
  # fhir/medicinal_product_packaged.rb
  class MedicinalProductPackaged < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_many :subject, class_name: 'FHIR::Reference'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_one :legalStatusOfSupply, class_name: 'FHIR::CodeableConcept'
    embeds_many :marketingStatus, class_name: 'FHIR::MarketingStatus'
    embeds_one :marketingAuthorization, class_name: 'FHIR::Reference'
    embeds_many :manufacturer, class_name: 'FHIR::Reference'
    embeds_many :batchIdentifier, class_name: 'FHIR::MedicinalProductPackagedBatchIdentifier'
    embeds_many :packageItem, class_name: 'FHIR::MedicinalProductPackagedPackageItem'

    def self.transform_json(json_hash, target = MedicinalProductPackaged.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['subject'] = json_hash['subject'].map { |var| Reference.transform_json(var) } unless json_hash['subject'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['legalStatusOfSupply'] = CodeableConcept.transform_json(json_hash['legalStatusOfSupply']) unless json_hash['legalStatusOfSupply'].nil?      
      result['marketingStatus'] = json_hash['marketingStatus'].map { |var| MarketingStatus.transform_json(var) } unless json_hash['marketingStatus'].nil?
      result['marketingAuthorization'] = Reference.transform_json(json_hash['marketingAuthorization']) unless json_hash['marketingAuthorization'].nil?      
      result['manufacturer'] = json_hash['manufacturer'].map { |var| Reference.transform_json(var) } unless json_hash['manufacturer'].nil?
      result['batchIdentifier'] = json_hash['batchIdentifier'].map { |var| MedicinalProductPackagedBatchIdentifier.transform_json(var) } unless json_hash['batchIdentifier'].nil?
      result['packageItem'] = json_hash['packageItem'].map { |var| MedicinalProductPackagedPackageItem.transform_json(var) } unless json_hash['packageItem'].nil?

      result
    end
  end
end
