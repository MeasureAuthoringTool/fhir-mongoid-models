module FHIR
  class MedicinalProductIngredientSpecifiedSubstanceStrength < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductIngredientSpecifiedSubstanceStrength'
    embeds_one :presentation, class_name: 'Ratio'
    embeds_one :presentationLowLimit, class_name: 'Ratio'
    embeds_one :concentration, class_name: 'Ratio'
    embeds_one :concentrationLowLimit, class_name: 'Ratio'
    field :measurementPoint, type:  # primitive
    embeds_one :_measurementPoint, class_name: 'Extension'
    embeds_many :country, class_name: 'CodeableConcept'
    embeds_many :referenceStrength, class_name: 'MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength'
  end
end
