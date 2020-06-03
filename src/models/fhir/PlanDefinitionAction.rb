module FHIR
  class PlanDefinitionAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PlanDefinitionAction'
    field :prefix, type:  # primitive
    embeds_one :_prefix, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :textEquivalent, type:  # primitive
    embeds_one :_textEquivalent, class_name: 'Extension'
    embeds_one :priority, class_name: 'RequestPriority'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_many :reason, class_name: 'CodeableConcept'
    embeds_many :documentation, class_name: 'RelatedArtifact'
    field :goalId, type: Array # primitive
    embeds_many :_goalId, class_name: 'Extension'
    embeds_one :subjectCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :subjectReference, class_name: 'Reference'
    embeds_many :trigger, class_name: 'TriggerDefinition'
    embeds_many :condition, class_name: 'PlanDefinitionActionCondition'
    embeds_many :input, class_name: 'DataRequirement'
    embeds_many :output, class_name: 'DataRequirement'
    embeds_many :relatedAction, class_name: 'PlanDefinitionActionRelatedAction'
    field :timingPrimitiveDateTime, type:  # primitive
    embeds_one :_timingPrimitiveDateTime, class_name: 'Extension'
    embeds_one :timingAge, class_name: 'Age'
    embeds_one :timingPeriod, class_name: 'Period'
    embeds_one :timingDuration, class_name: 'Duration'
    embeds_one :timingRange, class_name: 'Range'
    embeds_one :timingTiming, class_name: 'Timing'
    embeds_many :participant, class_name: 'PlanDefinitionActionParticipant'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :groupingBehavior, class_name: 'ActionGroupingBehavior'
    embeds_one :selectionBehavior, class_name: 'ActionSelectionBehavior'
    embeds_one :requiredBehavior, class_name: 'ActionRequiredBehavior'
    embeds_one :precheckBehavior, class_name: 'ActionPrecheckBehavior'
    embeds_one :cardinalityBehavior, class_name: 'ActionCardinalityBehavior'
    field :definitionPrimitiveCanonical, type:  # primitive
    embeds_one :_definitionPrimitiveCanonical, class_name: 'Extension'
    field :definitionPrimitiveUri, type:  # primitive
    embeds_one :_definitionPrimitiveUri, class_name: 'Extension'
    field :transform, type:  # primitive
    embeds_one :_transform, class_name: 'Extension'
    embeds_many :dynamicValue, class_name: 'PlanDefinitionActionDynamicValue'
    embeds_many :action, class_name: 'PlanDefinitionAction'
  end
end
