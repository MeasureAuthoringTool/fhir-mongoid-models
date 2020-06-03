module FHIR
  class NutritionOrderEnteralFormulaAdministration < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrderEnteralFormulaAdministration'
    embeds_one :schedule, class_name: 'Timing'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :rateSimpleQuantity, class_name: 'SimpleQuantity'
    embeds_one :rateRatio, class_name: 'Ratio'
  end
end
