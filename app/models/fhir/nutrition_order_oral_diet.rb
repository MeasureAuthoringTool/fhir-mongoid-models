module FHIR
  # fhir/nutrition_order_oral_diet.rb
  class NutritionOrderOralDiet < BackboneElement
    include Mongoid::Document
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :schedule, class_name: 'FHIR::Timing'    
    embeds_many :nutrient, class_name: 'FHIR::NutritionOrderOralDietNutrient'    
    embeds_many :texture, class_name: 'FHIR::NutritionOrderOralDietTexture'    
    embeds_many :fluidConsistencyType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :instruction, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.schedule.nil?  || !self.schedule.any? 
        result['schedule'] = self.schedule.map{ |x| x.as_json(*args) }
      end
      unless self.nutrient.nil?  || !self.nutrient.any? 
        result['nutrient'] = self.nutrient.map{ |x| x.as_json(*args) }
      end
      unless self.texture.nil?  || !self.texture.any? 
        result['texture'] = self.texture.map{ |x| x.as_json(*args) }
      end
      unless self.fluidConsistencyType.nil?  || !self.fluidConsistencyType.any? 
        result['fluidConsistencyType'] = self.fluidConsistencyType.map{ |x| x.as_json(*args) }
      end
      unless self.instruction.nil? 
        result['instruction'] = self.instruction.value
        serialized = Extension.serializePrimitiveExtension(self.instruction)            
        result['_instruction'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = NutritionOrderOralDiet.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = json_hash['type'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['type'].nil?
      result['schedule'] = json_hash['schedule'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Timing.transform_json(var) 
        end
      } unless json_hash['schedule'].nil?
      result['nutrient'] = json_hash['nutrient'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          NutritionOrderOralDietNutrient.transform_json(var) 
        end
      } unless json_hash['nutrient'].nil?
      result['texture'] = json_hash['texture'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          NutritionOrderOralDietTexture.transform_json(var) 
        end
      } unless json_hash['texture'].nil?
      result['fluidConsistencyType'] = json_hash['fluidConsistencyType'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['fluidConsistencyType'].nil?
      result['instruction'] = PrimitiveString.transform_json(json_hash['instruction'], json_hash['_instruction']) unless json_hash['instruction'].nil?

      result
    end
  end
end
