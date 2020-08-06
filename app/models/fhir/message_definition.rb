module FHIR
  # fhir/message_definition.rb
  class MessageDefinition < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_many :replaces, class_name: 'FHIR::PrimitiveCanonical'    
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
    embeds_one :base, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :parent, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :eventCoding, class_name: 'FHIR::Coding'    
    embeds_one :eventUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :category, class_name: 'FHIR::MessageSignificanceCategory'    
    embeds_many :focus, class_name: 'FHIR::MessageDefinitionFocus'    
    embeds_one :responseRequired, class_name: 'FHIR::MessageheaderResponseRequest'    
    embeds_many :allowedResponse, class_name: 'FHIR::MessageDefinitionAllowedResponse'    
    embeds_many :graph, class_name: 'FHIR::PrimitiveCanonical'    
    
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
      unless self.replaces.nil?  || !self.replaces.any? 
        result['replaces'] = self.replaces.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.replaces)                              
        result['_replaces'] = serialized unless serialized.nil? || !serialized.any?
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
      unless self.base.nil? 
        result['base'] = self.base.value
        serialized = Extension.serializePrimitiveExtension(self.base)            
        result['_base'] = serialized unless serialized.nil?
      end
      unless self.parent.nil?  || !self.parent.any? 
        result['parent'] = self.parent.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.parent)                              
        result['_parent'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.eventCoding.nil?
        result['eventCoding'] = self.eventCoding.as_json(*args)                        
      end          
      unless self.eventUri.nil?
        result['eventUri'] = self.eventUri.value                        
        serialized = Extension.serializePrimitiveExtension(self.eventUri) 
        result['_eventUri'] = serialized unless serialized.nil?
      end          
      unless self.category.nil? 
        result['category'] = self.category.value
        serialized = Extension.serializePrimitiveExtension(self.category)            
        result['_category'] = serialized unless serialized.nil?
      end
      unless self.focus.nil?  || !self.focus.any? 
        result['focus'] = self.focus.map{ |x| x.as_json(*args) }
      end
      unless self.responseRequired.nil? 
        result['responseRequired'] = self.responseRequired.value
        serialized = Extension.serializePrimitiveExtension(self.responseRequired)            
        result['_responseRequired'] = serialized unless serialized.nil?
      end
      unless self.allowedResponse.nil?  || !self.allowedResponse.any? 
        result['allowedResponse'] = self.allowedResponse.map{ |x| x.as_json(*args) }
      end
      unless self.graph.nil?  || !self.graph.any? 
        result['graph'] = self.graph.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.graph)                              
        result['_graph'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MessageDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['replaces'] = json_hash['replaces'].each_with_index.map do |var, i|
        extension_hash = json_hash['_replaces'] && json_hash['_replaces'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['replaces'].nil?
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
      result['base'] = PrimitiveCanonical.transform_json(json_hash['base'], json_hash['_base']) unless json_hash['base'].nil?
      result['parent'] = json_hash['parent'].each_with_index.map do |var, i|
        extension_hash = json_hash['_parent'] && json_hash['_parent'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['parent'].nil?
      result['eventCoding'] = Coding.transform_json(json_hash['eventCoding']) unless json_hash['eventCoding'].nil?
      result['eventUri'] = PrimitiveUri.transform_json(json_hash['eventUri'], json_hash['_eventUri']) unless json_hash['eventUri'].nil?
      result['category'] = MessageSignificanceCategory.transform_json(json_hash['category'], json_hash['_category']) unless json_hash['category'].nil?
      result['focus'] = json_hash['focus'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MessageDefinitionFocus.transform_json(var) 
        end
      } unless json_hash['focus'].nil?
      result['responseRequired'] = MessageheaderResponseRequest.transform_json(json_hash['responseRequired'], json_hash['_responseRequired']) unless json_hash['responseRequired'].nil?
      result['allowedResponse'] = json_hash['allowedResponse'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MessageDefinitionAllowedResponse.transform_json(var) 
        end
      } unless json_hash['allowedResponse'].nil?
      result['graph'] = json_hash['graph'].each_with_index.map do |var, i|
        extension_hash = json_hash['_graph'] && json_hash['_graph'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['graph'].nil?

      result
    end
  end
end
