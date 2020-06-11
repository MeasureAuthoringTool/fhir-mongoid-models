module FHIR
  class PlanDefinitionGoal < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PlanDefinitionGoal'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'CodeableConcept'
    embeds_one :start, class_name: 'CodeableConcept'
    embeds_many :addresses, class_name: 'CodeableConcept'
    embeds_many :documentation, class_name: 'RelatedArtifact'
    embeds_many :target, class_name: 'PlanDefinitionGoalTarget'
  end
end
