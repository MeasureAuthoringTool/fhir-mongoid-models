module FHIR
  class MedicationKnowledgeRegulatoryMaxDispense < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeRegulatoryMaxDispense'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :period, class_name: 'Duration'
  end
end
