module FHIR
  # fhir/structure_definition_mapping.rb
  class StructureDefinitionMapping < BackboneElement
    include Mongoid::Document
    embeds_one :identity, class_name: 'FHIR::PrimitiveId'    
    embeds_one :uri, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.identity.nil? 
        result['identity'] = self.identity.value
        serialized = Extension.serializePrimitiveExtension(self.identity)            
        result['_identity'] = serialized unless serialized.nil?
      end
      unless self.uri.nil? 
        result['uri'] = self.uri.value
        serialized = Extension.serializePrimitiveExtension(self.uri)            
        result['_uri'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = StructureDefinitionMapping.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identity'] = PrimitiveId.transform_json(json_hash['identity'], json_hash['_identity']) unless json_hash['identity'].nil?
      result['uri'] = PrimitiveUri.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?

      result
    end
  end
end
