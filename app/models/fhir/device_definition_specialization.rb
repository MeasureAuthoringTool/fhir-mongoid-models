module FHIR
  # fhir/device_definition_specialization.rb
  class DeviceDefinitionSpecialization < BackboneElement
    include Mongoid::Document
    embeds_one :systemType, class_name: 'FHIR::PrimitiveString'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.systemType.nil? 
        result['systemType'] = self.systemType.value
        serialized = Extension.serializePrimitiveExtension(self.systemType)            
        result['_systemType'] = serialized unless serialized.nil?
      end
      unless self.version.nil? 
        result['version'] = self.version.value
        serialized = Extension.serializePrimitiveExtension(self.version)            
        result['_version'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DeviceDefinitionSpecialization.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['systemType'] = PrimitiveString.transform_json(json_hash['systemType'], json_hash['_systemType']) unless json_hash['systemType'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?

      result
    end
  end
end
