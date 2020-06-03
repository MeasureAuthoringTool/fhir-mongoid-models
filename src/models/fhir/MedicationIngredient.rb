module FHIR
  class MedicationIngredient < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationIngredient'
    embeds_one :itemCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :itemReference, class_name: 'Reference'
    field :isActive, type:  # primitive
    embeds_one :_isActive, class_name: 'Extension'
    embeds_one :strength, class_name: 'Ratio'
  end
end
