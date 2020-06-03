module FHIR
  class MedicationKnowledgeMonitoringProgram < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeMonitoringProgram'
    embeds_one :type, class_name: 'CodeableConcept'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
  end
end
