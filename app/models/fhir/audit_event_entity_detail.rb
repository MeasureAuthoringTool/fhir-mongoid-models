module FHIR
  # fhir/audit_event_entity_detail.rb
  class AuditEventEntityDetail < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueBase64Binary, class_name: 'FHIR::PrimitiveBase64Binary'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.valueString.nil?
        result['valueString'] = self.valueString.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueString) 
        result['_valueString'] = serialized unless serialized.nil?
      end          
      unless self.valueBase64Binary.nil?
        result['valueBase64Binary'] = self.valueBase64Binary.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueBase64Binary) 
        result['_valueBase64Binary'] = serialized unless serialized.nil?
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AuditEventEntityDetail.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = PrimitiveString.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?
      result['valueBase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['valueBase64Binary'], json_hash['_valueBase64Binary']) unless json_hash['valueBase64Binary'].nil?

      result
    end
  end
end
