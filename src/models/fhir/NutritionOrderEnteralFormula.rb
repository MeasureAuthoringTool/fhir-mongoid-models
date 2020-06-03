module FHIR
  class NutritionOrderEnteralFormula < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrderEnteralFormula'
    embeds_one :baseFormulaType, class_name: 'CodeableConcept'
    field :baseFormulaProductName, type:  # primitive
    embeds_one :_baseFormulaProductName, class_name: 'Extension'
    embeds_one :additiveType, class_name: 'CodeableConcept'
    field :additiveProductName, type:  # primitive
    embeds_one :_additiveProductName, class_name: 'Extension'
    embeds_one :caloricDensity, class_name: 'SimpleQuantity'
    embeds_one :routeofAdministration, class_name: 'CodeableConcept'
    embeds_many :administration, class_name: 'NutritionOrderEnteralFormulaAdministration'
    embeds_one :maxVolumeToDeliver, class_name: 'SimpleQuantity'
    field :administrationInstruction, type:  # primitive
    embeds_one :_administrationInstruction, class_name: 'Extension'
  end
end
