module FHIR
  class MedicinalProductIngredientSubstance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductIngredientSubstance'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :strength, class_name: 'MedicinalProductIngredientSpecifiedSubstanceStrength'
  end
end
