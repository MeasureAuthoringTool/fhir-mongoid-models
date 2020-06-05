module FHIR
  class MedicationKnowledgeMonograph < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeMonograph'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :source, class_name: 'Reference'
  end
end
