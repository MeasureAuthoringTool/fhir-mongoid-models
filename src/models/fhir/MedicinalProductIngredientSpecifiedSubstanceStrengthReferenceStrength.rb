module FHIR
  class MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength'
    embeds_one :substance, class_name: 'CodeableConcept'
    embeds_one :strength, class_name: 'Ratio'
    embeds_one :strengthLowLimit, class_name: 'Ratio'
    field :measurementPoint, type:  # primitive
    embeds_one :_measurementPoint, class_name: 'Extension'
    embeds_many :country, class_name: 'CodeableConcept'
  end
end
