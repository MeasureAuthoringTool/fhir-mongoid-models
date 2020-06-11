module FHIR
  class SubstanceIngredient < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceIngredient'
    embeds_one :quantity, class_name: 'Ratio'
    embeds_one :substanceCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :substanceReference, class_name: 'Reference'
  end
end
