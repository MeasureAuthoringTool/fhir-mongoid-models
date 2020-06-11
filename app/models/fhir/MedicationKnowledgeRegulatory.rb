module FHIR
  class MedicationKnowledgeRegulatory < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeRegulatory'
    embeds_one :regulatoryAuthority, class_name: 'Reference'
    embeds_many :substitution, class_name: 'MedicationKnowledgeRegulatorySubstitution'
    embeds_many :schedule, class_name: 'MedicationKnowledgeRegulatorySchedule'
    embeds_one :maxDispense, class_name: 'MedicationKnowledgeRegulatoryMaxDispense'
  end
end
