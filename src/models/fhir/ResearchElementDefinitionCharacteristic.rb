module FHIR
  class ResearchElementDefinitionCharacteristic < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchElementDefinitionCharacteristic'
    embeds_one :definitionCodeableConcept, class_name: 'CodeableConcept'
    field :definitionPrimitiveCanonical, type:  # primitive
    embeds_one :_definitionPrimitiveCanonical, class_name: 'Extension'
    embeds_one :definitionExpression, class_name: 'Expression'
    embeds_one :definitionDataRequirement, class_name: 'DataRequirement'
    embeds_many :usageContext, class_name: 'UsageContext'
    field :exclude, type:  # primitive
    embeds_one :_exclude, class_name: 'Extension'
    embeds_one :unitOfMeasure, class_name: 'CodeableConcept'
    field :studyEffectiveDescription, type:  # primitive
    embeds_one :_studyEffectiveDescription, class_name: 'Extension'
    field :studyEffectivePrimitiveDateTime, type:  # primitive
    embeds_one :_studyEffectivePrimitiveDateTime, class_name: 'Extension'
    embeds_one :studyEffectivePeriod, class_name: 'Period'
    embeds_one :studyEffectiveDuration, class_name: 'Duration'
    embeds_one :studyEffectiveTiming, class_name: 'Timing'
    embeds_one :studyEffectiveTimeFromStart, class_name: 'Duration'
    embeds_one :studyEffectiveGroupMeasure, class_name: 'GroupMeasure'
    field :participantEffectiveDescription, type:  # primitive
    embeds_one :_participantEffectiveDescription, class_name: 'Extension'
    field :participantEffectivePrimitiveDateTime, type:  # primitive
    embeds_one :_participantEffectivePrimitiveDateTime, class_name: 'Extension'
    embeds_one :participantEffectivePeriod, class_name: 'Period'
    embeds_one :participantEffectiveDuration, class_name: 'Duration'
    embeds_one :participantEffectiveTiming, class_name: 'Timing'
    embeds_one :participantEffectiveTimeFromStart, class_name: 'Duration'
    embeds_one :participantEffectiveGroupMeasure, class_name: 'GroupMeasure'
  end
end
