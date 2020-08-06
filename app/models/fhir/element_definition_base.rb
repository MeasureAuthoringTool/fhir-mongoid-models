module FHIR
  # fhir/element_definition_base.rb
  class ElementDefinitionBase < Element
    include Mongoid::Document
    embeds_one :path, class_name: 'FHIR::PrimitiveString'    
    embeds_one :min, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :max, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.path.nil? 
        result['path'] = self.path.value
        serialized = Extension.serializePrimitiveExtension(self.path)            
        result['_path'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = ElementDefinitionBase.new)
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?
      result['min'] = PrimitiveUnsignedInt.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?

      result
    end
  end
end
