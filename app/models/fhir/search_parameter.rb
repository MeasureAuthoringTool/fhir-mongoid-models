module FHIR
  # fhir/search_parameter.rb
  class SearchParameter < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :derivedFrom, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :status, class_name: 'FHIR::PublicationStatus'    
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'    
    embeds_many :contact, class_name: 'FHIR::ContactDetail'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :useContext, class_name: 'FHIR::UsageContext'    
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :purpose, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_many :base, class_name: 'FHIR::ResourceType'    
    embeds_one :type, class_name: 'FHIR::SearchParamType'    
    embeds_one :expression, class_name: 'FHIR::PrimitiveString'    
    embeds_one :xpath, class_name: 'FHIR::PrimitiveString'    
    embeds_one :xpathUsage, class_name: 'FHIR::XPathUsageType'    
    embeds_many :target, class_name: 'FHIR::ResourceType'    
    embeds_one :multipleOr, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :multipleAnd, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :comparator, class_name: 'FHIR::SearchComparator'    
    embeds_many :modifier, class_name: 'FHIR::SearchModifierCode'    
    embeds_many :chain, class_name: 'FHIR::PrimitiveString'    
    embeds_many :component, class_name: 'FHIR::SearchParameterComponent'    
    
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
      unless self.derivedFrom.nil? 
        result['derivedFrom'] = self.derivedFrom.value
        serialized = Extension.serializePrimitiveExtension(self.derivedFrom)            
        result['_derivedFrom'] = serialized unless serialized.nil?
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
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.base.nil?  || !self.base.any? 
        result['base'] = self.base.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.base)                              
        result['_base'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.expression.nil? 
        result['expression'] = self.expression.value
        serialized = Extension.serializePrimitiveExtension(self.expression)            
        result['_expression'] = serialized unless serialized.nil?
      end
      unless self.xpath.nil? 
        result['xpath'] = self.xpath.value
        serialized = Extension.serializePrimitiveExtension(self.xpath)            
        result['_xpath'] = serialized unless serialized.nil?
      end
      unless self.xpathUsage.nil? 
        result['xpathUsage'] = self.xpathUsage.value
        serialized = Extension.serializePrimitiveExtension(self.xpathUsage)            
        result['_xpathUsage'] = serialized unless serialized.nil?
      end
      unless self.target.nil?  || !self.target.any? 
        result['target'] = self.target.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.target)                              
        result['_target'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.multipleOr.nil? 
        result['multipleOr'] = self.multipleOr.value
        serialized = Extension.serializePrimitiveExtension(self.multipleOr)            
        result['_multipleOr'] = serialized unless serialized.nil?
      end
      unless self.multipleAnd.nil? 
        result['multipleAnd'] = self.multipleAnd.value
        serialized = Extension.serializePrimitiveExtension(self.multipleAnd)            
        result['_multipleAnd'] = serialized unless serialized.nil?
      end
      unless self.comparator.nil?  || !self.comparator.any? 
        result['comparator'] = self.comparator.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.comparator)                              
        result['_comparator'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.modifier.nil?  || !self.modifier.any? 
        result['modifier'] = self.modifier.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.modifier)                              
        result['_modifier'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.chain.nil?  || !self.chain.any? 
        result['chain'] = self.chain.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.chain)                              
        result['_chain'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.component.nil?  || !self.component.any? 
        result['component'] = self.component.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SearchParameter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['derivedFrom'] = PrimitiveCanonical.transform_json(json_hash['derivedFrom'], json_hash['_derivedFrom']) unless json_hash['derivedFrom'].nil?
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
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['base'] = json_hash['base'].each_with_index.map do |var, i|
        extension_hash = json_hash['_base'] && json_hash['_base'][i]
        ResourceType.transform_json(var, extension_hash)
      end unless json_hash['base'].nil?
      result['type'] = SearchParamType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?
      result['xpath'] = PrimitiveString.transform_json(json_hash['xpath'], json_hash['_xpath']) unless json_hash['xpath'].nil?
      result['xpathUsage'] = XPathUsageType.transform_json(json_hash['xpathUsage'], json_hash['_xpathUsage']) unless json_hash['xpathUsage'].nil?
      result['target'] = json_hash['target'].each_with_index.map do |var, i|
        extension_hash = json_hash['_target'] && json_hash['_target'][i]
        ResourceType.transform_json(var, extension_hash)
      end unless json_hash['target'].nil?
      result['multipleOr'] = PrimitiveBoolean.transform_json(json_hash['multipleOr'], json_hash['_multipleOr']) unless json_hash['multipleOr'].nil?
      result['multipleAnd'] = PrimitiveBoolean.transform_json(json_hash['multipleAnd'], json_hash['_multipleAnd']) unless json_hash['multipleAnd'].nil?
      result['comparator'] = json_hash['comparator'].each_with_index.map do |var, i|
        extension_hash = json_hash['_comparator'] && json_hash['_comparator'][i]
        SearchComparator.transform_json(var, extension_hash)
      end unless json_hash['comparator'].nil?
      result['modifier'] = json_hash['modifier'].each_with_index.map do |var, i|
        extension_hash = json_hash['_modifier'] && json_hash['_modifier'][i]
        SearchModifierCode.transform_json(var, extension_hash)
      end unless json_hash['modifier'].nil?
      result['chain'] = json_hash['chain'].each_with_index.map do |var, i|
        extension_hash = json_hash['_chain'] && json_hash['_chain'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['chain'].nil?
      result['component'] = json_hash['component'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SearchParameterComponent.transform_json(var) 
        end
      } unless json_hash['component'].nil?

      result
    end
  end
end
