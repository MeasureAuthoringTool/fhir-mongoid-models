module FHIR
  # fhir/nutrition_order_oral_diet_nutrient.rb
  class NutritionOrderOralDietNutrient < BackboneElement
    include Mongoid::Document
    embeds_one :modifier, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amount, class_name: 'FHIR::SimpleQuantity'    

    def self.transform_json(json_hash, target = NutritionOrderOralDietNutrient.new)
      result = self.superclass.transform_json(json_hash, target)
      result['modifier'] = CodeableConcept.transform_json(json_hash['modifier']) unless json_hash['modifier'].nil?
      result['amount'] = SimpleQuantity.transform_json(json_hash['amount']) unless json_hash['amount'].nil?

      result
    end
  end
end
