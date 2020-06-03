module FHIR
  class NutritionOrderOralDiet < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrderOralDiet'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_many :schedule, class_name: 'Timing'
    embeds_many :nutrient, class_name: 'NutritionOrderOralDietNutrient'
    embeds_many :texture, class_name: 'NutritionOrderOralDietTexture'
    embeds_many :fluidConsistencyType, class_name: 'CodeableConcept'
    field :instruction, type:  # primitive
    embeds_one :_instruction, class_name: 'Extension'
  end
end
