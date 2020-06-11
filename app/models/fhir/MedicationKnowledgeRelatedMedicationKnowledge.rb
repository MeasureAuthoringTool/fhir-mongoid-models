module FHIR
  class MedicationKnowledgeRelatedMedicationKnowledge < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeRelatedMedicationKnowledge'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :reference, class_name: 'Reference'
  end
end
