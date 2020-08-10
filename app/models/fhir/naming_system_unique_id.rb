module FHIR
  # fhir/naming_system_unique_id.rb
  class NamingSystemUniqueId < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::NamingSystemIdentifierType'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    embeds_one :preferred, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.value.nil? 
        result['value'] = self.value.value
        serialized = Extension.serializePrimitiveExtension(self.value)            
        result['_value'] = serialized unless serialized.nil?
      end
      unless self.preferred.nil? 
        result['preferred'] = self.preferred.value
        serialized = Extension.serializePrimitiveExtension(self.preferred)            
        result['_preferred'] = serialized unless serialized.nil?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = NamingSystemUniqueId.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = NamingSystemIdentifierType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?
      result['preferred'] = PrimitiveBoolean.transform_json(json_hash['preferred'], json_hash['_preferred']) unless json_hash['preferred'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
