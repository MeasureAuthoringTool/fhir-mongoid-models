module FHIR
  # fhir/nutrition_order_oral_diet_texture.rb
  class NutritionOrderOralDietTexture < BackboneElement
    include Mongoid::Document
    embeds_one :modifier, class_name: 'FHIR::CodeableConcept'    
    embeds_one :foodType, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.modifier.nil? 
        result['modifier'] = self.modifier.as_json(*args)
      end
      unless self.foodType.nil? 
        result['foodType'] = self.foodType.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = NutritionOrderOralDietTexture.new)
      result = self.superclass.transform_json(json_hash, target)
      result['modifier'] = CodeableConcept.transform_json(json_hash['modifier']) unless json_hash['modifier'].nil?
      result['foodType'] = CodeableConcept.transform_json(json_hash['foodType']) unless json_hash['foodType'].nil?

      result
    end
  end
end
