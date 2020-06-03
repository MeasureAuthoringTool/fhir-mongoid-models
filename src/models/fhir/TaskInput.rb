module FHIR
  class TaskInput < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TaskInput'
    embeds_one :type, class_name: 'CodeableConcept'
    field :valuePrimitiveBase64Binary, type:  # primitive
    embeds_one :_valuePrimitiveBase64Binary, class_name: 'Extension'
    field :valuePrimitiveBoolean, type:  # primitive
    embeds_one :_valuePrimitiveBoolean, class_name: 'Extension'
    field :valuePrimitiveCanonical, type:  # primitive
    embeds_one :_valuePrimitiveCanonical, class_name: 'Extension'
    field :valuePrimitiveCode, type:  # primitive
    embeds_one :_valuePrimitiveCode, class_name: 'Extension'
    field :valuePrimitiveDate, type:  # primitive
    embeds_one :_valuePrimitiveDate, class_name: 'Extension'
    field :valuePrimitiveDateTime, type:  # primitive
    embeds_one :_valuePrimitiveDateTime, class_name: 'Extension'
    field :valuePrimitiveDecimal, type:  # primitive
    embeds_one :_valuePrimitiveDecimal, class_name: 'Extension'
    field :valuePrimitiveId, type:  # primitive
    embeds_one :_valuePrimitiveId, class_name: 'Extension'
    field :valuePrimitiveInstant, type:  # primitive
    embeds_one :_valuePrimitiveInstant, class_name: 'Extension'
    field :valuePrimitiveInteger, type:  # primitive
    embeds_one :_valuePrimitiveInteger, class_name: 'Extension'
    field :valuePrimitiveMarkdown, type:  # primitive
    embeds_one :_valuePrimitiveMarkdown, class_name: 'Extension'
    field :valuePrimitiveOid, type:  # primitive
    embeds_one :_valuePrimitiveOid, class_name: 'Extension'
    field :valuePrimitivePositiveInt, type:  # primitive
    embeds_one :_valuePrimitivePositiveInt, class_name: 'Extension'
    field :valuePrimitiveString, type:  # primitive
    embeds_one :_valuePrimitiveString, class_name: 'Extension'
    field :valuePrimitiveTime, type:  # primitive
    embeds_one :_valuePrimitiveTime, class_name: 'Extension'
    field :valuePrimitiveUnsignedInt, type:  # primitive
    embeds_one :_valuePrimitiveUnsignedInt, class_name: 'Extension'
    field :valuePrimitiveUri, type:  # primitive
    embeds_one :_valuePrimitiveUri, class_name: 'Extension'
    field :valuePrimitiveUrl, type:  # primitive
    embeds_one :_valuePrimitiveUrl, class_name: 'Extension'
    field :valuePrimitiveUuid, type:  # primitive
    embeds_one :_valuePrimitiveUuid, class_name: 'Extension'
    embeds_one :valueAddress, class_name: 'Address'
    embeds_one :valueAge, class_name: 'Age'
    embeds_one :valueAnnotation, class_name: 'Annotation'
    embeds_one :valueAttachment, class_name: 'Attachment'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :valueCoding, class_name: 'Coding'
    embeds_one :valueContactPoint, class_name: 'ContactPoint'
    embeds_one :valueCount, class_name: 'Count'
    embeds_one :valueDistance, class_name: 'Distance'
    embeds_one :valueDuration, class_name: 'Duration'
    embeds_one :valueHumanName, class_name: 'HumanName'
    embeds_one :valueIdentifier, class_name: 'Identifier'
    embeds_one :valueMoney, class_name: 'Money'
    embeds_one :valuePeriod, class_name: 'Period'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueRange, class_name: 'Range'
    embeds_one :valueRatio, class_name: 'Ratio'
    embeds_one :valueReference, class_name: 'Reference'
    embeds_one :valueSampledData, class_name: 'SampledData'
    embeds_one :valueSignature, class_name: 'Signature'
    embeds_one :valueTiming, class_name: 'Timing'
    embeds_one :valueContactDetail, class_name: 'ContactDetail'
    embeds_one :valueContributor, class_name: 'Contributor'
    embeds_one :valueDataRequirement, class_name: 'DataRequirement'
    embeds_one :valueExpression, class_name: 'Expression'
    embeds_one :valueParameterDefinition, class_name: 'ParameterDefinition'
    embeds_one :valueRelatedArtifact, class_name: 'RelatedArtifact'
    embeds_one :valueTriggerDefinition, class_name: 'TriggerDefinition'
    embeds_one :valueUsageContext, class_name: 'UsageContext'
    embeds_one :valueDosage, class_name: 'Dosage'
    embeds_one :valueMeta, class_name: 'Meta'
  end
end
