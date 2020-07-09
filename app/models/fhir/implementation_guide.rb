module FHIR
  # fhir/implementation_guide.rb
  class ImplementationGuide < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'
    embeds_one :version, class_name: 'FHIR::PrimitiveString'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :title, class_name: 'FHIR::PrimitiveString'
    embeds_one :status, class_name: 'FHIR::PublicationStatus'
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'
    embeds_many :contact, class_name: 'FHIR::ContactDetail'
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_many :useContext, class_name: 'FHIR::UsageContext'
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'
    embeds_one :copyright, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :packageId, class_name: 'FHIR::PrimitiveId'
    embeds_one :license, class_name: 'FHIR::SPDXLicense'
    embeds_many :fhirVersion, class_name: 'FHIR::FHIRVersion'
    embeds_many :dependsOn, class_name: 'FHIR::ImplementationGuideDependsOn'
    embeds_many :global, class_name: 'FHIR::ImplementationGuideGlobal'
    embeds_one :definition, class_name: 'FHIR::ImplementationGuideDefinition'
    embeds_one :manifest, class_name: 'FHIR::ImplementationGuideManifest'

    def self.transform_json(json_hash, target = ImplementationGuide.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?      
      result['packageId'] = PrimitiveId.transform_json(json_hash['packageId'], json_hash['_packageId']) unless json_hash['packageId'].nil?      
      result['license'] = SPDXLicense.transform_json(json_hash['license']) unless json_hash['license'].nil?      
      result['fhirVersion'] = json_hash['fhirVersion'].map { |var| FHIRVersion.transform_json(var) } unless json_hash['fhirVersion'].nil?
      result['dependsOn'] = json_hash['dependsOn'].map { |var| ImplementationGuideDependsOn.transform_json(var) } unless json_hash['dependsOn'].nil?
      result['global'] = json_hash['global'].map { |var| ImplementationGuideGlobal.transform_json(var) } unless json_hash['global'].nil?
      result['definition'] = ImplementationGuideDefinition.transform_json(json_hash['definition']) unless json_hash['definition'].nil?      
      result['manifest'] = ImplementationGuideManifest.transform_json(json_hash['manifest']) unless json_hash['manifest'].nil?      

      result
    end
  end
end
