module FHIR
  class EvidenceVariableCharacteristic < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EvidenceVariableCharacteristic'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :definitionReference, class_name: 'Reference'
    field :definitionPrimitiveCanonical, type:  # primitive
    embeds_one :_definitionPrimitiveCanonical, class_name: 'Extension'
    embeds_one :definitionCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :definitionExpression, class_name: 'Expression'
    embeds_one :definitionDataRequirement, class_name: 'DataRequirement'
    embeds_one :definitionTriggerDefinition, class_name: 'TriggerDefinition'
    embeds_many :usageContext, class_name: 'UsageContext'
    field :exclude, type:  # primitive
    embeds_one :_exclude, class_name: 'Extension'
    field :participantEffectivePrimitiveDateTime, type:  # primitive
    embeds_one :_participantEffectivePrimitiveDateTime, class_name: 'Extension'
    embeds_one :participantEffectivePeriod, class_name: 'Period'
    embeds_one :participantEffectiveDuration, class_name: 'Duration'
    embeds_one :participantEffectiveTiming, class_name: 'Timing'
    embeds_one :timeFromStart, class_name: 'Duration'
    embeds_one :groupMeasure, class_name: 'GroupMeasure'
  end
end
