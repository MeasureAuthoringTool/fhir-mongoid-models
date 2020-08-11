module FHIR
  # fhir/biologically_derived_product_storage.rb
  class BiologicallyDerivedProductStorage < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :temperature, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :scale, class_name: 'FHIR::BiologicallyDerivedProductStorageScale'    
    embeds_one :duration, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.temperature.nil? 
        result['temperature'] = self.temperature.value
        serialized = Extension.serializePrimitiveExtension(self.temperature)            
        result['_temperature'] = serialized unless serialized.nil?
      end
      unless self.scale.nil? 
        result['scale'] = self.scale.value
        serialized = Extension.serializePrimitiveExtension(self.scale)            
        result['_scale'] = serialized unless serialized.nil?
      end
      unless self.duration.nil? 
        result['duration'] = self.duration.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BiologicallyDerivedProductStorage.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['temperature'] = PrimitiveDecimal.transform_json(json_hash['temperature'], json_hash['_temperature']) unless json_hash['temperature'].nil?
      result['scale'] = BiologicallyDerivedProductStorageScale.transform_json(json_hash['scale'], json_hash['_scale']) unless json_hash['scale'].nil?
      result['duration'] = Period.transform_json(json_hash['duration']) unless json_hash['duration'].nil?

      result
    end
  end
end
