module FHIR
  # fhir/device_definition_material.rb
  class DeviceDefinitionMaterial < BackboneElement
    include Mongoid::Document
    embeds_one :substance, class_name: 'FHIR::CodeableConcept'    
    embeds_one :alternate, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :allergenicIndicator, class_name: 'FHIR::PrimitiveBoolean'    
    
    def as_json(*args)
      result = super      
      unless self.substance.nil? 
        result['substance'] = self.substance.as_json(*args)
      end
      unless self.alternate.nil? 
        result['alternate'] = self.alternate.value
        serialized = Extension.serializePrimitiveExtension(self.alternate)            
        result['_alternate'] = serialized unless serialized.nil?
      end
      unless self.allergenicIndicator.nil? 
        result['allergenicIndicator'] = self.allergenicIndicator.value
        serialized = Extension.serializePrimitiveExtension(self.allergenicIndicator)            
        result['_allergenicIndicator'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DeviceDefinitionMaterial.new)
      result = self.superclass.transform_json(json_hash, target)
      result['substance'] = CodeableConcept.transform_json(json_hash['substance']) unless json_hash['substance'].nil?
      result['alternate'] = PrimitiveBoolean.transform_json(json_hash['alternate'], json_hash['_alternate']) unless json_hash['alternate'].nil?
      result['allergenicIndicator'] = PrimitiveBoolean.transform_json(json_hash['allergenicIndicator'], json_hash['_allergenicIndicator']) unless json_hash['allergenicIndicator'].nil?

      result
    end
  end
end
