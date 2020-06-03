module FHIR
  class MedicationKnowledgeKinetics < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeKinetics'
    embeds_many :areaUnderCurve, class_name: 'SimpleQuantity'
    embeds_many :lethalDose50, class_name: 'SimpleQuantity'
    embeds_one :halfLifePeriod, class_name: 'Duration'
  end
end
