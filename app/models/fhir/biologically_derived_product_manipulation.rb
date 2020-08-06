module FHIR
  # fhir/biologically_derived_product_manipulation.rb
  class BiologicallyDerivedProductManipulation < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :timeDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :timePeriod, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.timeDateTime.nil?
        result['timeDateTime'] = self.timeDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.timeDateTime) 
        result['_timeDateTime'] = serialized unless serialized.nil?
      end          
      unless self.timePeriod.nil?
        result['timePeriod'] = self.timePeriod.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BiologicallyDerivedProductManipulation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['timeDateTime'] = PrimitiveDateTime.transform_json(json_hash['timeDateTime'], json_hash['_timeDateTime']) unless json_hash['timeDateTime'].nil?
      result['timePeriod'] = Period.transform_json(json_hash['timePeriod']) unless json_hash['timePeriod'].nil?

      result
    end
  end
end
