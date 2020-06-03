module FHIR
  class MedicinalProductInteractionInteractant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductInteractionInteractant'
    embeds_one :itemReference, class_name: 'Reference'
    embeds_one :itemCodeableConcept, class_name: 'CodeableConcept'
  end
end
