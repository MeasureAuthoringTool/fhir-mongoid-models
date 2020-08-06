module FHIR
  # fhir/operation_definition.rb
  class OperationDefinition < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :status, class_name: 'FHIR::PublicationStatus'    
    embeds_one :kind, class_name: 'FHIR::OperationKind'    
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'    
    embeds_many :contact, class_name: 'FHIR::ContactDetail'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :useContext, class_name: 'FHIR::UsageContext'    
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :purpose, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :affectsState, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :base, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :resource, class_name: 'FHIR::ResourceType'    
    embeds_one :system, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :type, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :instance, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :inputProfile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :outputProfile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :parameter, class_name: 'FHIR::OperationDefinitionParameter'    
    embeds_many :overload, class_name: 'FHIR::OperationDefinitionOverload'    
    
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
      unless self.kind.nil? 
        result['kind'] = self.kind.value
        serialized = Extension.serializePrimitiveExtension(self.kind)            
        result['_kind'] = serialized unless serialized.nil?
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
      unless self.affectsState.nil? 
        result['affectsState'] = self.affectsState.value
        serialized = Extension.serializePrimitiveExtension(self.affectsState)            
        result['_affectsState'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      unless self.base.nil? 
        result['base'] = self.base.value
        serialized = Extension.serializePrimitiveExtension(self.base)            
        result['_base'] = serialized unless serialized.nil?
      end
      unless self.resource.nil?  || !self.resource.any? 
        result['resource'] = self.resource.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.resource)                              
        result['_resource'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.system.nil? 
        result['system'] = self.system.value
        serialized = Extension.serializePrimitiveExtension(self.system)            
        result['_system'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.instance.nil? 
        result['instance'] = self.instance.value
        serialized = Extension.serializePrimitiveExtension(self.instance)            
        result['_instance'] = serialized unless serialized.nil?
      end
      unless self.inputProfile.nil? 
        result['inputProfile'] = self.inputProfile.value
        serialized = Extension.serializePrimitiveExtension(self.inputProfile)            
        result['_inputProfile'] = serialized unless serialized.nil?
      end
      unless self.outputProfile.nil? 
        result['outputProfile'] = self.outputProfile.value
        serialized = Extension.serializePrimitiveExtension(self.outputProfile)            
        result['_outputProfile'] = serialized unless serialized.nil?
      end
      unless self.parameter.nil?  || !self.parameter.any? 
        result['parameter'] = self.parameter.map{ |x| x.as_json(*args) }
      end
      unless self.overload.nil?  || !self.overload.any? 
        result['overload'] = self.overload.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = OperationDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['kind'] = OperationKind.transform_json(json_hash['kind'], json_hash['_kind']) unless json_hash['kind'].nil?
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
      result['affectsState'] = PrimitiveBoolean.transform_json(json_hash['affectsState'], json_hash['_affectsState']) unless json_hash['affectsState'].nil?
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['comment'] = PrimitiveMarkdown.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
      result['base'] = PrimitiveCanonical.transform_json(json_hash['base'], json_hash['_base']) unless json_hash['base'].nil?
      result['resource'] = json_hash['resource'].each_with_index.map do |var, i|
        extension_hash = json_hash['_resource'] && json_hash['_resource'][i]
        ResourceType.transform_json(var, extension_hash)
      end unless json_hash['resource'].nil?
      result['system'] = PrimitiveBoolean.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?
      result['type'] = PrimitiveBoolean.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['instance'] = PrimitiveBoolean.transform_json(json_hash['instance'], json_hash['_instance']) unless json_hash['instance'].nil?
      result['inputProfile'] = PrimitiveCanonical.transform_json(json_hash['inputProfile'], json_hash['_inputProfile']) unless json_hash['inputProfile'].nil?
      result['outputProfile'] = PrimitiveCanonical.transform_json(json_hash['outputProfile'], json_hash['_outputProfile']) unless json_hash['outputProfile'].nil?
      result['parameter'] = json_hash['parameter'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          OperationDefinitionParameter.transform_json(var) 
        end
      } unless json_hash['parameter'].nil?
      result['overload'] = json_hash['overload'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          OperationDefinitionOverload.transform_json(var) 
        end
      } unless json_hash['overload'].nil?

      result
    end
  end
end
