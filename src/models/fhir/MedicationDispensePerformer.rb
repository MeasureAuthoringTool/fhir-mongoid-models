module FHIR
  class MedicationDispensePerformer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationDispensePerformer'
    embeds_one :function, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'
  end
end
