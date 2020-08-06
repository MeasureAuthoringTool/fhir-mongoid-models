module FHIR
  # fhir/element_definition_slicing_discriminator.rb
  class ElementDefinitionSlicingDiscriminator < Element
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::DiscriminatorType'    
    embeds_one :path, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.path.nil? 
        result['path'] = self.path.value
        serialized = Extension.serializePrimitiveExtension(self.path)            
        result['_path'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ElementDefinitionSlicingDiscriminator.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = DiscriminatorType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?

      result
    end
  end
end
