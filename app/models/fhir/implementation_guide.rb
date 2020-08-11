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
    
    def as_json(*args)
      result = super      
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.version.nil? 
        result['version'] = self.version.value
        serialized = Extension.serializePrimitiveExtension(self.version)            
        result['_version'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.experimental.nil? 
        result['experimental'] = self.experimental.value
        serialized = Extension.serializePrimitiveExtension(self.experimental)            
        result['_experimental'] = serialized unless serialized.nil?
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.publisher.nil? 
        result['publisher'] = self.publisher.value
        serialized = Extension.serializePrimitiveExtension(self.publisher)            
        result['_publisher'] = serialized unless serialized.nil?
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.useContext.nil?  || !self.useContext.any? 
        result['useContext'] = self.useContext.map{ |x| x.as_json(*args) }
      end
      unless self.jurisdiction.nil?  || !self.jurisdiction.any? 
        result['jurisdiction'] = self.jurisdiction.map{ |x| x.as_json(*args) }
      end
      unless self.copyright.nil? 
        result['copyright'] = self.copyright.value
        serialized = Extension.serializePrimitiveExtension(self.copyright)            
        result['_copyright'] = serialized unless serialized.nil?
      end
      unless self.packageId.nil? 
        result['packageId'] = self.packageId.value
        serialized = Extension.serializePrimitiveExtension(self.packageId)            
        result['_packageId'] = serialized unless serialized.nil?
      end
      unless self.license.nil? 
        result['license'] = self.license.value
        serialized = Extension.serializePrimitiveExtension(self.license)            
        result['_license'] = serialized unless serialized.nil?
      end
      unless self.fhirVersion.nil?  || !self.fhirVersion.any? 
        result['fhirVersion'] = self.fhirVersion.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.fhirVersion)                              
        result['_fhirVersion'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.dependsOn.nil?  || !self.dependsOn.any? 
        result['dependsOn'] = self.dependsOn.map{ |x| x.as_json(*args) }
      end
      unless self.global.nil?  || !self.global.any? 
        result['global'] = self.global.map{ |x| x.as_json(*args) }
      end
      unless self.definition.nil? 
        result['definition'] = self.definition.as_json(*args)
      end
      unless self.manifest.nil? 
        result['manifest'] = self.manifest.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImplementationGuide.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?
      result['packageId'] = PrimitiveId.transform_json(json_hash['packageId'], json_hash['_packageId']) unless json_hash['packageId'].nil?
      result['license'] = SPDXLicense.transform_json(json_hash['license'], json_hash['_license']) unless json_hash['license'].nil?
      result['fhirVersion'] = json_hash['fhirVersion'].each_with_index.map do |var, i|
        extension_hash = json_hash['_fhirVersion'] && json_hash['_fhirVersion'][i]
        FHIRVersion.transform_json(var, extension_hash)
      end unless json_hash['fhirVersion'].nil?
      result['dependsOn'] = json_hash['dependsOn'].map { |var| ImplementationGuideDependsOn.transform_json(var) } unless json_hash['dependsOn'].nil?
      result['global'] = json_hash['global'].map { |var| ImplementationGuideGlobal.transform_json(var) } unless json_hash['global'].nil?
      result['definition'] = ImplementationGuideDefinition.transform_json(json_hash['definition']) unless json_hash['definition'].nil?
      result['manifest'] = ImplementationGuideManifest.transform_json(json_hash['manifest']) unless json_hash['manifest'].nil?

      result
    end
  end
end
