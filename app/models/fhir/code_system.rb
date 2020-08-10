module FHIR
  # fhir/code_system.rb
  class CodeSystem < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
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
    embeds_one :caseSensitive, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :valueSet, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :hierarchyMeaning, class_name: 'FHIR::CodeSystemHierarchyMeaning'    
    embeds_one :compositional, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :versionNeeded, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :content, class_name: 'FHIR::CodeSystemContentMode'    
    embeds_one :supplements, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :count, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_many :filter, class_name: 'FHIR::CodeSystemFilter'    
    embeds_many :property, class_name: 'FHIR::CodeSystemProperty'    
    embeds_many :concept, class_name: 'FHIR::CodeSystemConcept'    
    
    def as_json(*args)
      result = super      
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
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
      unless self.caseSensitive.nil? 
        result['caseSensitive'] = self.caseSensitive.value
        serialized = Extension.serializePrimitiveExtension(self.caseSensitive)            
        result['_caseSensitive'] = serialized unless serialized.nil?
      end
      unless self.valueSet.nil? 
        result['valueSet'] = self.valueSet.value
        serialized = Extension.serializePrimitiveExtension(self.valueSet)            
        result['_valueSet'] = serialized unless serialized.nil?
      end
      unless self.hierarchyMeaning.nil? 
        result['hierarchyMeaning'] = self.hierarchyMeaning.value
        serialized = Extension.serializePrimitiveExtension(self.hierarchyMeaning)            
        result['_hierarchyMeaning'] = serialized unless serialized.nil?
      end
      unless self.compositional.nil? 
        result['compositional'] = self.compositional.value
        serialized = Extension.serializePrimitiveExtension(self.compositional)            
        result['_compositional'] = serialized unless serialized.nil?
      end
      unless self.versionNeeded.nil? 
        result['versionNeeded'] = self.versionNeeded.value
        serialized = Extension.serializePrimitiveExtension(self.versionNeeded)            
        result['_versionNeeded'] = serialized unless serialized.nil?
      end
      unless self.content.nil? 
        result['content'] = self.content.value
        serialized = Extension.serializePrimitiveExtension(self.content)            
        result['_content'] = serialized unless serialized.nil?
      end
      unless self.supplements.nil? 
        result['supplements'] = self.supplements.value
        serialized = Extension.serializePrimitiveExtension(self.supplements)            
        result['_supplements'] = serialized unless serialized.nil?
      end
      unless self.count.nil? 
        result['count'] = self.count.value
        serialized = Extension.serializePrimitiveExtension(self.count)            
        result['_count'] = serialized unless serialized.nil?
      end
      unless self.filter.nil?  || !self.filter.any? 
        result['filter'] = self.filter.map{ |x| x.as_json(*args) }
      end
      unless self.property.nil?  || !self.property.any? 
        result['property'] = self.property.map{ |x| x.as_json(*args) }
      end
      unless self.concept.nil?  || !self.concept.any? 
        result['concept'] = self.concept.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CodeSystem.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
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
      result['caseSensitive'] = PrimitiveBoolean.transform_json(json_hash['caseSensitive'], json_hash['_caseSensitive']) unless json_hash['caseSensitive'].nil?
      result['valueSet'] = PrimitiveCanonical.transform_json(json_hash['valueSet'], json_hash['_valueSet']) unless json_hash['valueSet'].nil?
      result['hierarchyMeaning'] = CodeSystemHierarchyMeaning.transform_json(json_hash['hierarchyMeaning'], json_hash['_hierarchyMeaning']) unless json_hash['hierarchyMeaning'].nil?
      result['compositional'] = PrimitiveBoolean.transform_json(json_hash['compositional'], json_hash['_compositional']) unless json_hash['compositional'].nil?
      result['versionNeeded'] = PrimitiveBoolean.transform_json(json_hash['versionNeeded'], json_hash['_versionNeeded']) unless json_hash['versionNeeded'].nil?
      result['content'] = CodeSystemContentMode.transform_json(json_hash['content'], json_hash['_content']) unless json_hash['content'].nil?
      result['supplements'] = PrimitiveCanonical.transform_json(json_hash['supplements'], json_hash['_supplements']) unless json_hash['supplements'].nil?
      result['count'] = PrimitiveUnsignedInt.transform_json(json_hash['count'], json_hash['_count']) unless json_hash['count'].nil?
      result['filter'] = json_hash['filter'].map { |var| CodeSystemFilter.transform_json(var) } unless json_hash['filter'].nil?
      result['property'] = json_hash['property'].map { |var| CodeSystemProperty.transform_json(var) } unless json_hash['property'].nil?
      result['concept'] = json_hash['concept'].map { |var| CodeSystemConcept.transform_json(var) } unless json_hash['concept'].nil?

      result
    end
  end
end
