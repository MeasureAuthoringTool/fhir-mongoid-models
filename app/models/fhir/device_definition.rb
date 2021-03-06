module FHIR
  # fhir/device_definition.rb
  class DeviceDefinition < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :udiDeviceIdentifier, class_name: 'FHIR::DeviceDefinitionUdiDeviceIdentifier'    
    embeds_one :manufacturerString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :manufacturerReference, class_name: 'FHIR::Reference'    
    embeds_many :deviceName, class_name: 'FHIR::DeviceDefinitionDeviceName'    
    embeds_one :modelNumber, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialization, class_name: 'FHIR::DeviceDefinitionSpecialization'    
    embeds_many :version, class_name: 'FHIR::PrimitiveString'    
    embeds_many :safety, class_name: 'FHIR::CodeableConcept'    
    embeds_many :shelfLifeStorage, class_name: 'FHIR::ProductShelfLife'    
    embeds_one :physicalCharacteristics, class_name: 'FHIR::ProdCharacteristic'    
    embeds_many :languageCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :capability, class_name: 'FHIR::DeviceDefinitionCapability'    
    embeds_many :property, class_name: 'FHIR::DeviceDefinitionProperty'    
    embeds_one :owner, class_name: 'FHIR::Reference'    
    embeds_many :contact, class_name: 'FHIR::ContactPoint'    
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :onlineInformation, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_one :quantity, class_name: 'FHIR::Quantity'    
    embeds_one :parentDevice, class_name: 'FHIR::Reference'    
    embeds_many :material, class_name: 'FHIR::DeviceDefinitionMaterial'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.udiDeviceIdentifier.nil?  || !self.udiDeviceIdentifier.any? 
        result['udiDeviceIdentifier'] = self.udiDeviceIdentifier.map{ |x| x.as_json(*args) }
      end
      unless self.manufacturerString.nil?
        result['manufacturerString'] = self.manufacturerString.value                        
        serialized = Extension.serializePrimitiveExtension(self.manufacturerString) 
        result['_manufacturerString'] = serialized unless serialized.nil?
      end          
      unless self.manufacturerReference.nil?
        result['manufacturerReference'] = self.manufacturerReference.as_json(*args)                        
      end          
      unless self.deviceName.nil?  || !self.deviceName.any? 
        result['deviceName'] = self.deviceName.map{ |x| x.as_json(*args) }
      end
      unless self.modelNumber.nil? 
        result['modelNumber'] = self.modelNumber.value
        serialized = Extension.serializePrimitiveExtension(self.modelNumber)            
        result['_modelNumber'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.specialization.nil?  || !self.specialization.any? 
        result['specialization'] = self.specialization.map{ |x| x.as_json(*args) }
      end
      unless self.version.nil?  || !self.version.any? 
        result['version'] = self.version.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.version)                              
        result['_version'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.safety.nil?  || !self.safety.any? 
        result['safety'] = self.safety.map{ |x| x.as_json(*args) }
      end
      unless self.shelfLifeStorage.nil?  || !self.shelfLifeStorage.any? 
        result['shelfLifeStorage'] = self.shelfLifeStorage.map{ |x| x.as_json(*args) }
      end
      unless self.physicalCharacteristics.nil? 
        result['physicalCharacteristics'] = self.physicalCharacteristics.as_json(*args)
      end
      unless self.languageCode.nil?  || !self.languageCode.any? 
        result['languageCode'] = self.languageCode.map{ |x| x.as_json(*args) }
      end
      unless self.capability.nil?  || !self.capability.any? 
        result['capability'] = self.capability.map{ |x| x.as_json(*args) }
      end
      unless self.property.nil?  || !self.property.any? 
        result['property'] = self.property.map{ |x| x.as_json(*args) }
      end
      unless self.owner.nil? 
        result['owner'] = self.owner.as_json(*args)
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.onlineInformation.nil? 
        result['onlineInformation'] = self.onlineInformation.value
        serialized = Extension.serializePrimitiveExtension(self.onlineInformation)            
        result['_onlineInformation'] = serialized unless serialized.nil?
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.parentDevice.nil? 
        result['parentDevice'] = self.parentDevice.as_json(*args)
      end
      unless self.material.nil?  || !self.material.any? 
        result['material'] = self.material.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DeviceDefinition.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['udiDeviceIdentifier'] = json_hash['udiDeviceIdentifier'].map { |var| DeviceDefinitionUdiDeviceIdentifier.transform_json(var) } unless json_hash['udiDeviceIdentifier'].nil?
      result['manufacturerString'] = PrimitiveString.transform_json(json_hash['manufacturerString'], json_hash['_manufacturerString']) unless json_hash['manufacturerString'].nil?
      result['manufacturerReference'] = Reference.transform_json(json_hash['manufacturerReference']) unless json_hash['manufacturerReference'].nil?
      result['deviceName'] = json_hash['deviceName'].map { |var| DeviceDefinitionDeviceName.transform_json(var) } unless json_hash['deviceName'].nil?
      result['modelNumber'] = PrimitiveString.transform_json(json_hash['modelNumber'], json_hash['_modelNumber']) unless json_hash['modelNumber'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['specialization'] = json_hash['specialization'].map { |var| DeviceDefinitionSpecialization.transform_json(var) } unless json_hash['specialization'].nil?
      result['version'] = json_hash['version'].each_with_index.map do |var, i|
        extension_hash = json_hash['_version'] && json_hash['_version'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['version'].nil?
      result['safety'] = json_hash['safety'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['safety'].nil?
      result['shelfLifeStorage'] = json_hash['shelfLifeStorage'].map { |var| ProductShelfLife.transform_json(var) } unless json_hash['shelfLifeStorage'].nil?
      result['physicalCharacteristics'] = ProdCharacteristic.transform_json(json_hash['physicalCharacteristics']) unless json_hash['physicalCharacteristics'].nil?
      result['languageCode'] = json_hash['languageCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['languageCode'].nil?
      result['capability'] = json_hash['capability'].map { |var| DeviceDefinitionCapability.transform_json(var) } unless json_hash['capability'].nil?
      result['property'] = json_hash['property'].map { |var| DeviceDefinitionProperty.transform_json(var) } unless json_hash['property'].nil?
      result['owner'] = Reference.transform_json(json_hash['owner']) unless json_hash['owner'].nil?
      result['contact'] = json_hash['contact'].map { |var| ContactPoint.transform_json(var) } unless json_hash['contact'].nil?
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['onlineInformation'] = PrimitiveUri.transform_json(json_hash['onlineInformation'], json_hash['_onlineInformation']) unless json_hash['onlineInformation'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['parentDevice'] = Reference.transform_json(json_hash['parentDevice']) unless json_hash['parentDevice'].nil?
      result['material'] = json_hash['material'].map { |var| DeviceDefinitionMaterial.transform_json(var) } unless json_hash['material'].nil?

      result
    end
  end
end
