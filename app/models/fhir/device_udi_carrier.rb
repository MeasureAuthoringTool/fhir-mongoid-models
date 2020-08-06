module FHIR
  # fhir/device_udi_carrier.rb
  class DeviceUdiCarrier < BackboneElement
    include Mongoid::Document
    embeds_one :deviceIdentifier, class_name: 'FHIR::PrimitiveString'    
    embeds_one :issuer, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :jurisdiction, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :carrierAIDC, class_name: 'FHIR::PrimitiveBase64Binary'    
    embeds_one :carrierHRF, class_name: 'FHIR::PrimitiveString'    
    embeds_one :entryType, class_name: 'FHIR::UDIEntryType'    
    
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
      unless self.carrierAIDC.nil? 
        result['carrierAIDC'] = self.carrierAIDC.value
        serialized = Extension.serializePrimitiveExtension(self.carrierAIDC)            
        result['_carrierAIDC'] = serialized unless serialized.nil?
      end
      unless self.carrierHRF.nil? 
        result['carrierHRF'] = self.carrierHRF.value
        serialized = Extension.serializePrimitiveExtension(self.carrierHRF)            
        result['_carrierHRF'] = serialized unless serialized.nil?
      end
      unless self.entryType.nil? 
        result['entryType'] = self.entryType.value
        serialized = Extension.serializePrimitiveExtension(self.entryType)            
        result['_entryType'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DeviceUdiCarrier.new)
      result = self.superclass.transform_json(json_hash, target)
      result['deviceIdentifier'] = PrimitiveString.transform_json(json_hash['deviceIdentifier'], json_hash['_deviceIdentifier']) unless json_hash['deviceIdentifier'].nil?
      result['issuer'] = PrimitiveUri.transform_json(json_hash['issuer'], json_hash['_issuer']) unless json_hash['issuer'].nil?
      result['jurisdiction'] = PrimitiveUri.transform_json(json_hash['jurisdiction'], json_hash['_jurisdiction']) unless json_hash['jurisdiction'].nil?
      result['carrierAIDC'] = PrimitiveBase64Binary.transform_json(json_hash['carrierAIDC'], json_hash['_carrierAIDC']) unless json_hash['carrierAIDC'].nil?
      result['carrierHRF'] = PrimitiveString.transform_json(json_hash['carrierHRF'], json_hash['_carrierHRF']) unless json_hash['carrierHRF'].nil?
      result['entryType'] = UDIEntryType.transform_json(json_hash['entryType'], json_hash['_entryType']) unless json_hash['entryType'].nil?

      result
    end
  end
end
