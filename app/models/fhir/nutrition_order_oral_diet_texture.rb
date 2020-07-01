module FHIR
  # fhir/nutrition_order_oral_diet_texture.rb
  class NutritionOrderOralDietTexture < BackboneElement
    include Mongoid::Document
    embeds_one :modifier, class_name: 'CodeableConcept'
    embeds_one :foodType, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = NutritionOrderOralDietTexture.new)
      result = self.superclass.transform_json(json_hash, target)
      result['modifier'] = CodeableConcept.transform_json(json_hash['modifier']) unless json_hash['modifier'].nil?      
      result['foodType'] = CodeableConcept.transform_json(json_hash['foodType']) unless json_hash['foodType'].nil?      

      result
    end
  end
end
