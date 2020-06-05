module FHIR
  class MedicinalProductIngredientSpecifiedSubstance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductIngredientSpecifiedSubstance'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :group, class_name: 'CodeableConcept'
    embeds_one :confidentiality, class_name: 'CodeableConcept'
    embeds_many :strength, class_name: 'MedicinalProductIngredientSpecifiedSubstanceStrength'
  end
end
