module FHIR
  # fhir/device_definition_udi_device_identifier.rb
  class DeviceDefinitionUdiDeviceIdentifier < BackboneElement
    include Mongoid::Document
    embeds_one :deviceIdentifier, class_name: 'FHIR::PrimitiveString'    
    embeds_one :issuer, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :jurisdiction, class_name: 'FHIR::PrimitiveUri'    
    
    def as_json(*args)
      result = super      
      unless self.deviceIdentifier.nil? 
        result['deviceIdentifier'] = self.deviceIdentifier.value
        serialized = Extension.serializePrimitiveExtension(self.deviceIdentifier)            
        result['_deviceIdentifier'] = serialized unless serialized.nil?
      end
      unless self.issuer.nil? 
        result['issuer'] = self.issuer.value
        serialized = Extension.serializePrimitiveExtension(self.issuer)            
        result['_issuer'] = serialized unless serialized.nil?
      end
      unless self.jurisdiction.nil? 
        result['jurisdiction'] = self.jurisdiction.value
        serialized = Extension.serializePrimitiveExtension(self.jurisdiction)            
        result['_jurisdiction'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DeviceDefinitionUdiDeviceIdentifier.new)
      result = self.superclass.transform_json(json_hash, target)
      result['deviceIdentifier'] = PrimitiveString.transform_json(json_hash['deviceIdentifier'], json_hash['_deviceIdentifier']) unless json_hash['deviceIdentifier'].nil?
      result['issuer'] = PrimitiveUri.transform_json(json_hash['issuer'], json_hash['_issuer']) unless json_hash['issuer'].nil?
      result['jurisdiction'] = PrimitiveUri.transform_json(json_hash['jurisdiction'], json_hash['_jurisdiction']) unless json_hash['jurisdiction'].nil?

      result
    end
  end
end
