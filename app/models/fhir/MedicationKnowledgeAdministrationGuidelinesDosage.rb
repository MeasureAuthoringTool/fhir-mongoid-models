module FHIR
  class MedicationKnowledgeAdministrationGuidelinesDosage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeAdministrationGuidelinesDosage'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :dosage, class_name: 'Dosage'
  end
end
