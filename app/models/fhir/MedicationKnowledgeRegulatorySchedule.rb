module FHIR
  class MedicationKnowledgeRegulatorySchedule < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeRegulatorySchedule'
    embeds_one :schedule, class_name: 'CodeableConcept'
  end
end
