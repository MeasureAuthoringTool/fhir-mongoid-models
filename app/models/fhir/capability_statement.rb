module FHIR
  # fhir/capability_statement.rb
  class CapabilityStatement < DomainResource
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
    embeds_one :purpose, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :copyright, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :kind, class_name: 'FHIR::CapabilityStatementKind'    
    embeds_many :instantiates, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :imports, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :software, class_name: 'FHIR::CapabilityStatementSoftware'    
    embeds_one :implementation, class_name: 'FHIR::CapabilityStatementImplementation'    
    embeds_one :fhirVersion, class_name: 'FHIR::FHIRVersion'    
    embeds_many :format, class_name: 'FHIR::MimeType'    
    embeds_many :patchFormat, class_name: 'FHIR::MimeType'    
    embeds_many :implementationGuide, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :rest, class_name: 'FHIR::CapabilityStatementRest'    
    embeds_many :messaging, class_name: 'FHIR::CapabilityStatementMessaging'    
    embeds_many :document, class_name: 'FHIR::CapabilityStatementDocument'    
    
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
      unless self.purpose.nil? 
        result['purpose'] = self.purpose.value
        serialized = Extension.serializePrimitiveExtension(self.purpose)            
        result['_purpose'] = serialized unless serialized.nil?
      end
      unless self.copyright.nil? 
        result['copyright'] = self.copyright.value
        serialized = Extension.serializePrimitiveExtension(self.copyright)            
        result['_copyright'] = serialized unless serialized.nil?
      end
      unless self.kind.nil? 
        result['kind'] = self.kind.value
        serialized = Extension.serializePrimitiveExtension(self.kind)            
        result['_kind'] = serialized unless serialized.nil?
      end
      unless self.instantiates.nil?  || !self.instantiates.any? 
        result['instantiates'] = self.instantiates.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.instantiates)                              
        result['_instantiates'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.imports.nil?  || !self.imports.any? 
        result['imports'] = self.imports.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.imports)                              
        result['_imports'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.software.nil? 
        result['software'] = self.software.as_json(*args)
      end
      unless self.implementation.nil? 
        result['implementation'] = self.implementation.as_json(*args)
      end
      unless self.fhirVersion.nil? 
        result['fhirVersion'] = self.fhirVersion.value
        serialized = Extension.serializePrimitiveExtension(self.fhirVersion)            
        result['_fhirVersion'] = serialized unless serialized.nil?
      end
      unless self.format.nil?  || !self.format.any? 
        result['format'] = self.format.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.format)                              
        result['_format'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.patchFormat.nil?  || !self.patchFormat.any? 
        result['patchFormat'] = self.patchFormat.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.patchFormat)                              
        result['_patchFormat'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.implementationGuide.nil?  || !self.implementationGuide.any? 
        result['implementationGuide'] = self.implementationGuide.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.implementationGuide)                              
        result['_implementationGuide'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.rest.nil?  || !self.rest.any? 
        result['rest'] = self.rest.map{ |x| x.as_json(*args) }
      end
      unless self.messaging.nil?  || !self.messaging.any? 
        result['messaging'] = self.messaging.map{ |x| x.as_json(*args) }
      end
      unless self.document.nil?  || !self.document.any? 
        result['document'] = self.document.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CapabilityStatement.new)
    
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
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?
      result['kind'] = CapabilityStatementKind.transform_json(json_hash['kind'], json_hash['_kind']) unless json_hash['kind'].nil?
      result['instantiates'] = json_hash['instantiates'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiates'] && json_hash['_instantiates'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiates'].nil?
      result['imports'] = json_hash['imports'].each_with_index.map do |var, i|
        extension_hash = json_hash['_imports'] && json_hash['_imports'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['imports'].nil?
      result['software'] = CapabilityStatementSoftware.transform_json(json_hash['software']) unless json_hash['software'].nil?
      result['implementation'] = CapabilityStatementImplementation.transform_json(json_hash['implementation']) unless json_hash['implementation'].nil?
      result['fhirVersion'] = FHIRVersion.transform_json(json_hash['fhirVersion'], json_hash['_fhirVersion']) unless json_hash['fhirVersion'].nil?
      result['format'] = json_hash['format'].each_with_index.map do |var, i|
        extension_hash = json_hash['_format'] && json_hash['_format'][i]
        MimeType.transform_json(var, extension_hash)
      end unless json_hash['format'].nil?
      result['patchFormat'] = json_hash['patchFormat'].each_with_index.map do |var, i|
        extension_hash = json_hash['_patchFormat'] && json_hash['_patchFormat'][i]
        MimeType.transform_json(var, extension_hash)
      end unless json_hash['patchFormat'].nil?
      result['implementationGuide'] = json_hash['implementationGuide'].each_with_index.map do |var, i|
        extension_hash = json_hash['_implementationGuide'] && json_hash['_implementationGuide'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['implementationGuide'].nil?
      result['rest'] = json_hash['rest'].map { |var| CapabilityStatementRest.transform_json(var) } unless json_hash['rest'].nil?
      result['messaging'] = json_hash['messaging'].map { |var| CapabilityStatementMessaging.transform_json(var) } unless json_hash['messaging'].nil?
      result['document'] = json_hash['document'].map { |var| CapabilityStatementDocument.transform_json(var) } unless json_hash['document'].nil?

      result
    end
  end
end
