module FHIR
  class MedicationKnowledgeAdministrationGuidelines < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeAdministrationGuidelines'
    embeds_many :dosage, class_name: 'MedicationKnowledgeAdministrationGuidelinesDosage'
    embeds_one :indicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :indicationReference, class_name: 'Reference'
    embeds_many :patientCharacteristics, class_name: 'MedicationKnowledgeAdministrationGuidelinesPatientCharacteristics'
  end
end
