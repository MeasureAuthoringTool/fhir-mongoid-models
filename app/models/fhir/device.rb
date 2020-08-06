module FHIR
  # fhir/device.rb
  class Device < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :definition, class_name: 'FHIR::Reference'    
    embeds_many :udiCarrier, class_name: 'FHIR::DeviceUdiCarrier'    
    embeds_one :status, class_name: 'FHIR::FHIRDeviceStatus'    
    embeds_many :statusReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :distinctIdentifier, class_name: 'FHIR::PrimitiveString'    
    embeds_one :manufacturer, class_name: 'FHIR::PrimitiveString'    
    embeds_one :manufactureDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :expirationDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :lotNumber, class_name: 'FHIR::PrimitiveString'    
    embeds_one :serialNumber, class_name: 'FHIR::PrimitiveString'    
    embeds_many :deviceName, class_name: 'FHIR::DeviceDeviceName'    
    embeds_one :modelNumber, class_name: 'FHIR::PrimitiveString'    
    embeds_one :partNumber, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialization, class_name: 'FHIR::DeviceSpecialization'    
    embeds_many :version, class_name: 'FHIR::DeviceVersion'    
    embeds_many :property, class_name: 'FHIR::DeviceProperty'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :owner, class_name: 'FHIR::Reference'    
    embeds_many :contact, class_name: 'FHIR::ContactPoint'    
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :safety, class_name: 'FHIR::CodeableConcept'    
    embeds_one :parent, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.definition.nil? 
        result['definition'] = self.definition.as_json(*args)
      end
      unless self.udiCarrier.nil?  || !self.udiCarrier.any? 
        result['udiCarrier'] = self.udiCarrier.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.statusReason.nil?  || !self.statusReason.any? 
        result['statusReason'] = self.statusReason.map{ |x| x.as_json(*args) }
      end
      unless self.distinctIdentifier.nil? 
        result['distinctIdentifier'] = self.distinctIdentifier.value
        serialized = Extension.serializePrimitiveExtension(self.distinctIdentifier)            
        result['_distinctIdentifier'] = serialized unless serialized.nil?
      end
      unless self.manufacturer.nil? 
        result['manufacturer'] = self.manufacturer.value
        serialized = Extension.serializePrimitiveExtension(self.manufacturer)            
        result['_manufacturer'] = serialized unless serialized.nil?
      end
      unless self.manufactureDate.nil? 
        result['manufactureDate'] = self.manufactureDate.value
        serialized = Extension.serializePrimitiveExtension(self.manufactureDate)            
        result['_manufactureDate'] = serialized unless serialized.nil?
      end
      unless self.expirationDate.nil? 
        result['expirationDate'] = self.expirationDate.value
        serialized = Extension.serializePrimitiveExtension(self.expirationDate)            
        result['_expirationDate'] = serialized unless serialized.nil?
      end
      unless self.lotNumber.nil? 
        result['lotNumber'] = self.lotNumber.value
        serialized = Extension.serializePrimitiveExtension(self.lotNumber)            
        result['_lotNumber'] = serialized unless serialized.nil?
      end
      unless self.serialNumber.nil? 
        result['serialNumber'] = self.serialNumber.value
        serialized = Extension.serializePrimitiveExtension(self.serialNumber)            
        result['_serialNumber'] = serialized unless serialized.nil?
      end
      unless self.deviceName.nil?  || !self.deviceName.any? 
        result['deviceName'] = self.deviceName.map{ |x| x.as_json(*args) }
      end
      unless self.modelNumber.nil? 
        result['modelNumber'] = self.modelNumber.value
        serialized = Extension.serializePrimitiveExtension(self.modelNumber)            
        result['_modelNumber'] = serialized unless serialized.nil?
      end
      unless self.partNumber.nil? 
        result['partNumber'] = self.partNumber.value
        serialized = Extension.serializePrimitiveExtension(self.partNumber)            
        result['_partNumber'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.specialization.nil?  || !self.specialization.any? 
        result['specialization'] = self.specialization.map{ |x| x.as_json(*args) }
      end
      unless self.version.nil?  || !self.version.any? 
        result['version'] = self.version.map{ |x| x.as_json(*args) }
      end
      unless self.property.nil?  || !self.property.any? 
        result['property'] = self.property.map{ |x| x.as_json(*args) }
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.owner.nil? 
        result['owner'] = self.owner.as_json(*args)
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.safety.nil?  || !self.safety.any? 
        result['safety'] = self.safety.map{ |x| x.as_json(*args) }
      end
      unless self.parent.nil? 
        result['parent'] = self.parent.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Device.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['definition'] = Reference.transform_json(json_hash['definition']) unless json_hash['definition'].nil?
      result['udiCarrier'] = json_hash['udiCarrier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DeviceUdiCarrier.transform_json(var) 
        end
      } unless json_hash['udiCarrier'].nil?
      result['status'] = FHIRDeviceStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusReason'] = json_hash['statusReason'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['statusReason'].nil?
      result['distinctIdentifier'] = PrimitiveString.transform_json(json_hash['distinctIdentifier'], json_hash['_distinctIdentifier']) unless json_hash['distinctIdentifier'].nil?
      result['manufacturer'] = PrimitiveString.transform_json(json_hash['manufacturer'], json_hash['_manufacturer']) unless json_hash['manufacturer'].nil?
      result['manufactureDate'] = PrimitiveDateTime.transform_json(json_hash['manufactureDate'], json_hash['_manufactureDate']) unless json_hash['manufactureDate'].nil?
      result['expirationDate'] = PrimitiveDateTime.transform_json(json_hash['expirationDate'], json_hash['_expirationDate']) unless json_hash['expirationDate'].nil?
      result['lotNumber'] = PrimitiveString.transform_json(json_hash['lotNumber'], json_hash['_lotNumber']) unless json_hash['lotNumber'].nil?
      result['serialNumber'] = PrimitiveString.transform_json(json_hash['serialNumber'], json_hash['_serialNumber']) unless json_hash['serialNumber'].nil?
      result['deviceName'] = json_hash['deviceName'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DeviceDeviceName.transform_json(var) 
        end
      } unless json_hash['deviceName'].nil?
      result['modelNumber'] = PrimitiveString.transform_json(json_hash['modelNumber'], json_hash['_modelNumber']) unless json_hash['modelNumber'].nil?
      result['partNumber'] = PrimitiveString.transform_json(json_hash['partNumber'], json_hash['_partNumber']) unless json_hash['partNumber'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['specialization'] = json_hash['specialization'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DeviceSpecialization.transform_json(var) 
        end
      } unless json_hash['specialization'].nil?
      result['version'] = json_hash['version'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DeviceVersion.transform_json(var) 
        end
      } unless json_hash['version'].nil?
      result['property'] = json_hash['property'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DeviceProperty.transform_json(var) 
        end
      } unless json_hash['property'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['owner'] = Reference.transform_json(json_hash['owner']) unless json_hash['owner'].nil?
      result['contact'] = json_hash['contact'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContactPoint.transform_json(var) 
        end
      } unless json_hash['contact'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?
      result['safety'] = json_hash['safety'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['safety'].nil?
      result['parent'] = Reference.transform_json(json_hash['parent']) unless json_hash['parent'].nil?

      result
    end
  end
end
