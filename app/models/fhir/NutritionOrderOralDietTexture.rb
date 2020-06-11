module FHIR
  class NutritionOrderOralDietTexture < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrderOralDietTexture'
    embeds_one :modifier, class_name: 'CodeableConcept'
    embeds_one :foodType, class_name: 'CodeableConcept'
  end
end
