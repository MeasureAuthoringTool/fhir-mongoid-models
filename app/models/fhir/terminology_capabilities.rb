module FHIR
  # fhir/terminology_capabilities.rb
  class TerminologyCapabilities < DomainResource
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
    embeds_one :software, class_name: 'FHIR::TerminologyCapabilitiesSoftware'    
    embeds_one :implementation, class_name: 'FHIR::TerminologyCapabilitiesImplementation'    
    embeds_one :lockedDate, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :codeSystem, class_name: 'FHIR::TerminologyCapabilitiesCodeSystem'    
    embeds_one :expansion, class_name: 'FHIR::TerminologyCapabilitiesExpansion'    
    embeds_one :codeSearch, class_name: 'FHIR::CodeSearchSupport'    
    embeds_one :validateCode, class_name: 'FHIR::TerminologyCapabilitiesValidateCode'    
    embeds_one :translation, class_name: 'FHIR::TerminologyCapabilitiesTranslation'    
    embeds_one :closure, class_name: 'FHIR::TerminologyCapabilitiesClosure'    
    
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
      unless self.software.nil? 
        result['software'] = self.software.as_json(*args)
      end
      unless self.implementation.nil? 
        result['implementation'] = self.implementation.as_json(*args)
      end
      unless self.lockedDate.nil? 
        result['lockedDate'] = self.lockedDate.value
        serialized = Extension.serializePrimitiveExtension(self.lockedDate)            
        result['_lockedDate'] = serialized unless serialized.nil?
      end
      unless self.codeSystem.nil?  || !self.codeSystem.any? 
        result['codeSystem'] = self.codeSystem.map{ |x| x.as_json(*args) }
      end
      unless self.expansion.nil? 
        result['expansion'] = self.expansion.as_json(*args)
      end
      unless self.codeSearch.nil? 
        result['codeSearch'] = self.codeSearch.value
        serialized = Extension.serializePrimitiveExtension(self.codeSearch)            
        result['_codeSearch'] = serialized unless serialized.nil?
      end
      unless self.validateCode.nil? 
        result['validateCode'] = self.validateCode.as_json(*args)
      end
      unless self.translation.nil? 
        result['translation'] = self.translation.as_json(*args)
      end
      unless self.closure.nil? 
        result['closure'] = self.closure.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TerminologyCapabilities.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?
      result['contact'] = json_hash['contact'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContactDetail.transform_json(var) 
        end
      } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['useContext'] = json_hash['useContext'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          UsageContext.transform_json(var) 
        end
      } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['jurisdiction'].nil?
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?
      result['kind'] = CapabilityStatementKind.transform_json(json_hash['kind'], json_hash['_kind']) unless json_hash['kind'].nil?
      result['software'] = TerminologyCapabilitiesSoftware.transform_json(json_hash['software']) unless json_hash['software'].nil?
      result['implementation'] = TerminologyCapabilitiesImplementation.transform_json(json_hash['implementation']) unless json_hash['implementation'].nil?
      result['lockedDate'] = PrimitiveBoolean.transform_json(json_hash['lockedDate'], json_hash['_lockedDate']) unless json_hash['lockedDate'].nil?
      result['codeSystem'] = json_hash['codeSystem'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          TerminologyCapabilitiesCodeSystem.transform_json(var) 
        end
      } unless json_hash['codeSystem'].nil?
      result['expansion'] = TerminologyCapabilitiesExpansion.transform_json(json_hash['expansion']) unless json_hash['expansion'].nil?
      result['codeSearch'] = CodeSearchSupport.transform_json(json_hash['codeSearch'], json_hash['_codeSearch']) unless json_hash['codeSearch'].nil?
      result['validateCode'] = TerminologyCapabilitiesValidateCode.transform_json(json_hash['validateCode']) unless json_hash['validateCode'].nil?
      result['translation'] = TerminologyCapabilitiesTranslation.transform_json(json_hash['translation']) unless json_hash['translation'].nil?
      result['closure'] = TerminologyCapabilitiesClosure.transform_json(json_hash['closure']) unless json_hash['closure'].nil?

      result
    end
  end
end
