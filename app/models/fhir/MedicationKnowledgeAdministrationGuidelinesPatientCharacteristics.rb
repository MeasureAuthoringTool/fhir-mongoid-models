module FHIR
  class MedicationKnowledgeAdministrationGuidelinesPatientCharacteristics < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeAdministrationGuidelinesPatientCharacteristics'
    embeds_one :characteristicCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :characteristicSimpleQuantity, class_name: 'SimpleQuantity'
    field :value, type: Array # primitive
    embeds_many :_value, class_name: 'Extension'
  end
end
