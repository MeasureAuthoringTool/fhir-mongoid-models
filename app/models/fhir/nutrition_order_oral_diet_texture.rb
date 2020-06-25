module FHIR
  # fhir/nutrition_order_oral_diet_texture.rb
  class NutritionOrderOralDietTexture < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrderOralDietTexture'
    embeds_one :modifier, class_name: 'CodeableConcept'
    embeds_one :foodType, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = NutritionOrderOralDietTexture.new
      result['modifier'] = CodeableConcept.transform_json(json_hash['modifier']) unless json_hash['modifier'].nil?      
      result['foodType'] = CodeableConcept.transform_json(json_hash['foodType']) unless json_hash['foodType'].nil?      

      result
    end
  end
end
