module FHIR
  class StructureMapGroupRuleSource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupRuleSource'
    field :context, type:  # primitive
    embeds_one :_context, class_name: 'Extension'
    field :min, type:  # primitive
    embeds_one :_min, class_name: 'Extension'
    field :max, type:  # primitive
    embeds_one :_max, class_name: 'Extension'
    field :type, type:  # primitive
    embeds_one :_type, class_name: 'Extension'
    field :defaultValuePrimitiveBase64Binary, type:  # primitive
    embeds_one :_defaultValuePrimitiveBase64Binary, class_name: 'Extension'
    field :defaultValuePrimitiveBoolean, type:  # primitive
    embeds_one :_defaultValuePrimitiveBoolean, class_name: 'Extension'
    field :defaultValuePrimitiveCanonical, type:  # primitive
    embeds_one :_defaultValuePrimitiveCanonical, class_name: 'Extension'
    field :defaultValuePrimitiveCode, type:  # primitive
    embeds_one :_defaultValuePrimitiveCode, class_name: 'Extension'
    field :defaultValuePrimitiveDate, type:  # primitive
    embeds_one :_defaultValuePrimitiveDate, class_name: 'Extension'
    field :defaultValuePrimitiveDateTime, type:  # primitive
    embeds_one :_defaultValuePrimitiveDateTime, class_name: 'Extension'
    field :defaultValuePrimitiveDecimal, type:  # primitive
    embeds_one :_defaultValuePrimitiveDecimal, class_name: 'Extension'
    field :defaultValuePrimitiveId, type:  # primitive
    embeds_one :_defaultValuePrimitiveId, class_name: 'Extension'
    field :defaultValuePrimitiveInstant, type:  # primitive
    embeds_one :_defaultValuePrimitiveInstant, class_name: 'Extension'
    field :defaultValuePrimitiveInteger, type:  # primitive
    embeds_one :_defaultValuePrimitiveInteger, class_name: 'Extension'
    field :defaultValuePrimitiveMarkdown, type:  # primitive
    embeds_one :_defaultValuePrimitiveMarkdown, class_name: 'Extension'
    field :defaultValuePrimitiveOid, type:  # primitive
    embeds_one :_defaultValuePrimitiveOid, class_name: 'Extension'
    field :defaultValuePrimitivePositiveInt, type:  # primitive
    embeds_one :_defaultValuePrimitivePositiveInt, class_name: 'Extension'
    field :defaultValuePrimitiveString, type:  # primitive
    embeds_one :_defaultValuePrimitiveString, class_name: 'Extension'
    field :defaultValuePrimitiveTime, type:  # primitive
    embeds_one :_defaultValuePrimitiveTime, class_name: 'Extension'
    field :defaultValuePrimitiveUnsignedInt, type:  # primitive
    embeds_one :_defaultValuePrimitiveUnsignedInt, class_name: 'Extension'
    field :defaultValuePrimitiveUri, type:  # primitive
    embeds_one :_defaultValuePrimitiveUri, class_name: 'Extension'
    field :defaultValuePrimitiveUrl, type:  # primitive
    embeds_one :_defaultValuePrimitiveUrl, class_name: 'Extension'
    field :defaultValuePrimitiveUuid, type:  # primitive
    embeds_one :_defaultValuePrimitiveUuid, class_name: 'Extension'
    embeds_one :defaultValueAddress, class_name: 'Address'
    embeds_one :defaultValueAge, class_name: 'Age'
    embeds_one :defaultValueAnnotation, class_name: 'Annotation'
    embeds_one :defaultValueAttachment, class_name: 'Attachment'
    embeds_one :defaultValueCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :defaultValueCoding, class_name: 'Coding'
    embeds_one :defaultValueContactPoint, class_name: 'ContactPoint'
    embeds_one :defaultValueCount, class_name: 'Count'
    embeds_one :defaultValueDistance, class_name: 'Distance'
    embeds_one :defaultValueDuration, class_name: 'Duration'
    embeds_one :defaultValueHumanName, class_name: 'HumanName'
    embeds_one :defaultValueIdentifier, class_name: 'Identifier'
    embeds_one :defaultValueMoney, class_name: 'Money'
    embeds_one :defaultValuePeriod, class_name: 'Period'
    embeds_one :defaultValueQuantity, class_name: 'Quantity'
    embeds_one :defaultValueRange, class_name: 'Range'
    embeds_one :defaultValueRatio, class_name: 'Ratio'
    embeds_one :defaultValueReference, class_name: 'Reference'
    embeds_one :defaultValueSampledData, class_name: 'SampledData'
    embeds_one :defaultValueSignature, class_name: 'Signature'
    embeds_one :defaultValueTiming, class_name: 'Timing'
    embeds_one :defaultValueContactDetail, class_name: 'ContactDetail'
    embeds_one :defaultValueContributor, class_name: 'Contributor'
    embeds_one :defaultValueDataRequirement, class_name: 'DataRequirement'
    embeds_one :defaultValueExpression, class_name: 'Expression'
    embeds_one :defaultValueParameterDefinition, class_name: 'ParameterDefinition'
    embeds_one :defaultValueRelatedArtifact, class_name: 'RelatedArtifact'
    embeds_one :defaultValueTriggerDefinition, class_name: 'TriggerDefinition'
    embeds_one :defaultValueUsageContext, class_name: 'UsageContext'
    embeds_one :defaultValueDosage, class_name: 'Dosage'
    embeds_one :defaultValueMeta, class_name: 'Meta'
    field :element, type:  # primitive
    embeds_one :_element, class_name: 'Extension'
    embeds_one :listMode, class_name: 'StructureMapSourceListMode'
    field :variable, type:  # primitive
    embeds_one :_variable, class_name: 'Extension'
    field :condition, type:  # primitive
    embeds_one :_condition, class_name: 'Extension'
    field :check, type:  # primitive
    embeds_one :_check, class_name: 'Extension'
    field :logMessage, type:  # primitive
    embeds_one :_logMessage, class_name: 'Extension'
  end
end
