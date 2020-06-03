module FHIR
  class MedicinalProductContraindicationOtherTherapy < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductContraindicationOtherTherapy'
    embeds_one :therapyRelationshipType, class_name: 'CodeableConcept'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'
  end
end
