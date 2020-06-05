module FHIR
  class MedicationKnowledgePackaging < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgePackaging'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'SimpleQuantity'
  end
end
