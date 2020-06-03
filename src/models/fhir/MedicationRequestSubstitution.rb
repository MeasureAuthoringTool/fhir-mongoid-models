module FHIR
  class MedicationRequestSubstitution < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestSubstitution'
    field :allowedPrimitiveBoolean, type:  # primitive
    embeds_one :_allowedPrimitiveBoolean, class_name: 'Extension'
    embeds_one :allowedCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :reason, class_name: 'CodeableConcept'
  end
end
