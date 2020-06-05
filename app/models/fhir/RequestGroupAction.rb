module FHIR
  class RequestGroupAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestGroupAction'
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
    embeds_many :documentation, class_name: 'RelatedArtifact'
    embeds_many :condition, class_name: 'RequestGroupActionCondition'
    embeds_many :relatedAction, class_name: 'RequestGroupActionRelatedAction'
    field :timingPrimitiveDateTime, type:  # primitive
    embeds_one :_timingPrimitiveDateTime, class_name: 'Extension'
    embeds_one :timingAge, class_name: 'Age'
    embeds_one :timingPeriod, class_name: 'Period'
    embeds_one :timingDuration, class_name: 'Duration'
    embeds_one :timingRange, class_name: 'Range'
    embeds_one :timingTiming, class_name: 'Timing'
    embeds_many :participant, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :groupingBehavior, class_name: 'ActionGroupingBehavior'
    embeds_one :selectionBehavior, class_name: 'ActionSelectionBehavior'
    embeds_one :requiredBehavior, class_name: 'ActionRequiredBehavior'
    embeds_one :precheckBehavior, class_name: 'ActionPrecheckBehavior'
    embeds_one :cardinalityBehavior, class_name: 'ActionCardinalityBehavior'
    embeds_one :resource, class_name: 'Reference'
    embeds_many :action, class_name: 'RequestGroupAction'
  end
end
