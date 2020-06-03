module FHIR
  class MedicinalProductIndicationOtherTherapy < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductIndicationOtherTherapy'
    embeds_one :therapyRelationshipType, class_name: 'CodeableConcept'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'
  end
end
