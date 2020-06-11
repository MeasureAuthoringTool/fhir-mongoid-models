module FHIR
  class MedicinalProductPharmaceuticalCharacteristics < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPharmaceuticalCharacteristics'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'
  end
end
