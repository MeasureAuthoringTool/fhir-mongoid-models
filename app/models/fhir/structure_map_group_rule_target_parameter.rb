module FHIR
  # fhir/structure_map_group_rule_target_parameter.rb
  class StructureMapGroupRuleTargetParameter < BackboneElement
    include Mongoid::Document
    embeds_one :valueId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :valueInteger, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :valueDecimal, class_name: 'FHIR::PrimitiveDecimal'    
    
    def as_json(*args)
      result = super      
      unless self.valueId.nil?
        result['valueId'] = self.valueId.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueId) 
        result['_valueId'] = serialized unless serialized.nil?
      end          
      unless self.valueString.nil?
        result['valueString'] = self.valueString.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueString) 
        result['_valueString'] = serialized unless serialized.nil?
      end          
      unless self.valueBoolean.nil?
        result['valueBoolean'] = self.valueBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueBoolean) 
        result['_valueBoolean'] = serialized unless serialized.nil?
      end          
      unless self.valueInteger.nil?
        result['valueInteger'] = self.valueInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueInteger) 
        result['_valueInteger'] = serialized unless serialized.nil?
      end          
      unless self.valueDecimal.nil?
        result['valueDecimal'] = self.valueDecimal.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueDecimal) 
        result['_valueDecimal'] = serialized unless serialized.nil?
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = StructureMapGroupRuleTargetParameter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['valueId'] = PrimitiveId.transform_json(json_hash['valueId'], json_hash['_valueId']) unless json_hash['valueId'].nil?
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?
      result['valueDecimal'] = PrimitiveDecimal.transform_json(json_hash['valueDecimal'], json_hash['_valueDecimal']) unless json_hash['valueDecimal'].nil?

      result
    end
  end
end
