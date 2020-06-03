module FHIR
  class MedicinalProductIngredient < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductIngredient'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :role, class_name: 'CodeableConcept'
    field :allergenicIndicator, type:  # primitive
    embeds_one :_allergenicIndicator, class_name: 'Extension'
    embeds_many :manufacturer, class_name: 'Reference'
    embeds_many :specifiedSubstance, class_name: 'MedicinalProductIngredientSpecifiedSubstance'
    embeds_one :substance, class_name: 'MedicinalProductIngredientSubstance'
  end
end
