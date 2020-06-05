module FHIR
  class PlanDefinitionGoalTarget < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PlanDefinitionGoalTarget'
    embeds_one :measure, class_name: 'CodeableConcept'
    embeds_one :detailQuantity, class_name: 'Quantity'
    embeds_one :detailRange, class_name: 'Range'
    embeds_one :detailCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :due, class_name: 'Duration'
  end
end
