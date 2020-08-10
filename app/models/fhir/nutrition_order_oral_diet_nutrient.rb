module FHIR
  # fhir/nutrition_order_oral_diet_nutrient.rb
  class NutritionOrderOralDietNutrient < BackboneElement
    include Mongoid::Document
    embeds_one :modifier, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amount, class_name: 'FHIR::SimpleQuantity'    
    
    def as_json(*args)
      result = super      
      unless self.modifier.nil? 
        result['modifier'] = self.modifier.as_json(*args)
      end
      unless self.amount.nil? 
        result['amount'] = self.amount.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = NutritionOrderOralDietNutrient.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['modifier'] = CodeableConcept.transform_json(json_hash['modifier']) unless json_hash['modifier'].nil?
      result['amount'] = SimpleQuantity.transform_json(json_hash['amount']) unless json_hash['amount'].nil?

      result
    end
  end
end
