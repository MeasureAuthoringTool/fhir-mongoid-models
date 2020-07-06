module FHIR
  # fhir/device_udi_carrier.rb
  class DeviceUdiCarrier < BackboneElement
    include Mongoid::Document
    embeds_one :deviceIdentifier, class_name: 'PrimitiveString'
    embeds_one :issuer, class_name: 'PrimitiveUri'
    embeds_one :jurisdiction, class_name: 'PrimitiveUri'
    embeds_one :carrierAIDC, class_name: 'PrimitiveBase64Binary'
    embeds_one :carrierHRF, class_name: 'PrimitiveString'
    embeds_one :entryType, class_name: 'UDIEntryType'

    def self.transform_json(json_hash, target = DeviceUdiCarrier.new)
      result = self.superclass.transform_json(json_hash, target)
      result['deviceIdentifier'] = PrimitiveString.transform_json(json_hash['deviceIdentifier'], json_hash['_deviceIdentifier']) unless json_hash['deviceIdentifier'].nil?      
      result['issuer'] = PrimitiveUri.transform_json(json_hash['issuer'], json_hash['_issuer']) unless json_hash['issuer'].nil?      
      result['jurisdiction'] = PrimitiveUri.transform_json(json_hash['jurisdiction'], json_hash['_jurisdiction']) unless json_hash['jurisdiction'].nil?      
      result['carrierAIDC'] = PrimitiveBase64Binary.transform_json(json_hash['carrierAIDC'], json_hash['_carrierAIDC']) unless json_hash['carrierAIDC'].nil?      
      result['carrierHRF'] = PrimitiveString.transform_json(json_hash['carrierHRF'], json_hash['_carrierHRF']) unless json_hash['carrierHRF'].nil?      
      result['entryType'] = UDIEntryType.transform_json(json_hash['entryType']) unless json_hash['entryType'].nil?      

      result
    end
  end
end
