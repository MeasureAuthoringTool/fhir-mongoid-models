module FHIR
  # fhir/charge_item_definition.rb
  class ChargeItemDefinition < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :version, class_name: 'FHIR::PrimitiveString'
    embeds_one :title, class_name: 'FHIR::PrimitiveString'
    embeds_many :derivedFromUri, class_name: 'FHIR::PrimitiveUri'
    embeds_many :partOf, class_name: 'FHIR::PrimitiveCanonical'
    embeds_many :replaces, class_name: 'FHIR::PrimitiveCanonical'
    embeds_one :status, class_name: 'FHIR::PublicationStatus'
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'
    embeds_many :contact, class_name: 'FHIR::ContactDetail'
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_many :useContext, class_name: 'FHIR::UsageContext'
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'
    embeds_one :copyright, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :approvalDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :lastReviewDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :effectivePeriod, class_name: 'FHIR::Period'
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_many :instance, class_name: 'FHIR::Reference'
    embeds_many :applicability, class_name: 'FHIR::ChargeItemDefinitionApplicability'
    embeds_many :propertyGroup, class_name: 'FHIR::ChargeItemDefinitionPropertyGroup'

    def self.transform_json(json_hash, target = ChargeItemDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['derivedFromUri'] = json_hash['derivedFromUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_derivedFromUri'] && json_hash['_derivedFromUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['derivedFromUri'].nil?
      result['partOf'] = json_hash['partOf'].each_with_index.map do |var, i|
        extension_hash = json_hash['_partOf'] && json_hash['_partOf'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['partOf'].nil?
      result['replaces'] = json_hash['replaces'].each_with_index.map do |var, i|
        extension_hash = json_hash['_replaces'] && json_hash['_replaces'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['replaces'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?      
      result['approvalDate'] = PrimitiveDate.transform_json(json_hash['approvalDate'], json_hash['_approvalDate']) unless json_hash['approvalDate'].nil?      
      result['lastReviewDate'] = PrimitiveDate.transform_json(json_hash['lastReviewDate'], json_hash['_lastReviewDate']) unless json_hash['lastReviewDate'].nil?      
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['instance'] = json_hash['instance'].map { |var| Reference.transform_json(var) } unless json_hash['instance'].nil?
      result['applicability'] = json_hash['applicability'].map { |var| ChargeItemDefinitionApplicability.transform_json(var) } unless json_hash['applicability'].nil?
      result['propertyGroup'] = json_hash['propertyGroup'].map { |var| ChargeItemDefinitionPropertyGroup.transform_json(var) } unless json_hash['propertyGroup'].nil?

      result
    end
  end
end
