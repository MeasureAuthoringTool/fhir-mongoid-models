module FHIR
  # fhir/endpoint.rb
  class Endpoint < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::EndpointStatus'    
    embeds_one :connectionType, class_name: 'FHIR::Coding'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :managingOrganization, class_name: 'FHIR::Reference'    
    embeds_many :contact, class_name: 'FHIR::ContactPoint'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_many :payloadType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :payloadMimeType, class_name: 'FHIR::MimeType'    
    embeds_one :address, class_name: 'FHIR::PrimitiveUrl'    
    embeds_many :header, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.connectionType.nil? 
        result['connectionType'] = self.connectionType.as_json(*args)
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.managingOrganization.nil? 
        result['managingOrganization'] = self.managingOrganization.as_json(*args)
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.payloadType.nil?  || !self.payloadType.any? 
        result['payloadType'] = self.payloadType.map{ |x| x.as_json(*args) }
      end
      unless self.payloadMimeType.nil?  || !self.payloadMimeType.any? 
        result['payloadMimeType'] = self.payloadMimeType.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.payloadMimeType)                              
        result['_payloadMimeType'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.address.nil? 
        result['address'] = self.address.value
        serialized = Extension.serializePrimitiveExtension(self.address)            
        result['_address'] = serialized unless serialized.nil?
      end
      unless self.header.nil?  || !self.header.any? 
        result['header'] = self.header.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.header)                              
        result['_header'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Endpoint.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = EndpointStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['connectionType'] = Coding.transform_json(json_hash['connectionType']) unless json_hash['connectionType'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['managingOrganization'] = Reference.transform_json(json_hash['managingOrganization']) unless json_hash['managingOrganization'].nil?
      result['contact'] = json_hash['contact'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContactPoint.transform_json(var) 
        end
      } unless json_hash['contact'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['payloadType'] = json_hash['payloadType'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['payloadType'].nil?
      result['payloadMimeType'] = json_hash['payloadMimeType'].each_with_index.map do |var, i|
        extension_hash = json_hash['_payloadMimeType'] && json_hash['_payloadMimeType'][i]
        MimeType.transform_json(var, extension_hash)
      end unless json_hash['payloadMimeType'].nil?
      result['address'] = PrimitiveUrl.transform_json(json_hash['address'], json_hash['_address']) unless json_hash['address'].nil?
      result['header'] = json_hash['header'].each_with_index.map do |var, i|
        extension_hash = json_hash['_header'] && json_hash['_header'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['header'].nil?

      result
    end
  end
end
