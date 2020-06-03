module FHIR
  class AllergyIntoleranceReaction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AllergyIntoleranceReaction'
    embeds_one :substance, class_name: 'CodeableConcept'
    embeds_many :manifestation, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :onset, type:  # primitive
    embeds_one :_onset, class_name: 'Extension'
    embeds_one :severity, class_name: 'AllergyIntoleranceSeverity'
    embeds_one :exposureRoute, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
  end
end
