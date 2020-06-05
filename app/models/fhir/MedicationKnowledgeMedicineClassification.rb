module FHIR
  class MedicationKnowledgeMedicineClassification < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeMedicineClassification'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :classification, class_name: 'CodeableConcept'
  end
end
