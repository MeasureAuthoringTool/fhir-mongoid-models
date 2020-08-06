module FHIR
  # fhir/element_definition_mapping.rb
  class ElementDefinitionMapping < Element
    include Mongoid::Document
    embeds_one :identity, class_name: 'FHIR::PrimitiveId'    
    embeds_one :language, class_name: 'FHIR::MimeType'    
    embeds_one :map, class_name: 'FHIR::PrimitiveString'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.identity.nil? 
        result['identity'] = self.identity.value
        serialized = Extension.serializePrimitiveExtension(self.identity)            
        result['_identity'] = serialized unless serialized.nil?
      end
      unless self.language.nil? 
        result['language'] = self.language.value
        serialized = Extension.serializePrimitiveExtension(self.language)            
        result['_language'] = serialized unless serialized.nil?
      end
      unless self.map.nil? 
        result['map'] = self.map.value
        serialized = Extension.serializePrimitiveExtension(self.map)            
        result['_map'] = serialized unless serialized.nil?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ElementDefinitionMapping.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identity'] = PrimitiveId.transform_json(json_hash['identity'], json_hash['_identity']) unless json_hash['identity'].nil?
      result['language'] = MimeType.transform_json(json_hash['language'], json_hash['_language']) unless json_hash['language'].nil?
      result['map'] = PrimitiveString.transform_json(json_hash['map'], json_hash['_map']) unless json_hash['map'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?

      result
    end
  end
end
