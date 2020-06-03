module FHIR
  class MedicationKnowledgeStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
