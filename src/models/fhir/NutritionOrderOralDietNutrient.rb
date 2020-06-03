module FHIR
  class NutritionOrderOralDietNutrient < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrderOralDietNutrient'
    embeds_one :modifier, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'SimpleQuantity'
  end
end
