module FHIR
  # fhir/message_definition_focus.rb
  class MessageDefinitionFocus < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::ResourceType'    
    embeds_one :profile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :min, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :max, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.profile.nil? 
        result['profile'] = self.profile.value
        serialized = Extension.serializePrimitiveExtension(self.profile)            
        result['_profile'] = serialized unless serialized.nil?
      end
      unless self.min.nil? 
        result['min'] = self.min.value
        serialized = Extension.serializePrimitiveExtension(self.min)            
        result['_min'] = serialized unless serialized.nil?
      end
      unless self.max.nil? 
        result['max'] = self.max.value
        serialized = Extension.serializePrimitiveExtension(self.max)            
        result['_max'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MessageDefinitionFocus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = ResourceType.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?
      result['min'] = PrimitiveUnsignedInt.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?

      result
    end
  end
end
