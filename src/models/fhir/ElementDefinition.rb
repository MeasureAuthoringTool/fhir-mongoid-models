module FHIR
  class ElementDefinition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinition'
    field :path, type:  # primitive
    embeds_one :_path, class_name: 'Extension'
    embeds_many :representation, class_name: 'PropertyRepresentation'
    field :sliceName, type:  # primitive
    embeds_one :_sliceName, class_name: 'Extension'
    field :sliceIsConstraining, type:  # primitive
    embeds_one :_sliceIsConstraining, class_name: 'Extension'
    field :label, type:  # primitive
    embeds_one :_label, class_name: 'Extension'
    embeds_many :code, class_name: 'Coding'
    embeds_one :slicing, class_name: 'ElementDefinitionSlicing'
    field :short, type:  # primitive
    embeds_one :_short, class_name: 'Extension'
    field :definition, type:  # primitive
    embeds_one :_definition, class_name: 'Extension'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
    field :requirements, type:  # primitive
    embeds_one :_requirements, class_name: 'Extension'
    field :alias, type: Array # primitive
    embeds_many :_alias, class_name: 'Extension'
    field :min, type:  # primitive
    embeds_one :_min, class_name: 'Extension'
    field :max, type:  # primitive
    embeds_one :_max, class_name: 'Extension'
    embeds_one :base, class_name: 'ElementDefinitionBase'
    field :contentReference, type:  # primitive
    embeds_one :_contentReference, class_name: 'Extension'
    embeds_many :type, class_name: 'ElementDefinitionType'
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
    field :meaningWhenMissing, type:  # primitive
    embeds_one :_meaningWhenMissing, class_name: 'Extension'
    field :orderMeaning, type:  # primitive
    embeds_one :_orderMeaning, class_name: 'Extension'
    field :fixedPrimitiveBase64Binary, type:  # primitive
    embeds_one :_fixedPrimitiveBase64Binary, class_name: 'Extension'
    field :fixedPrimitiveBoolean, type:  # primitive
    embeds_one :_fixedPrimitiveBoolean, class_name: 'Extension'
    field :fixedPrimitiveCanonical, type:  # primitive
    embeds_one :_fixedPrimitiveCanonical, class_name: 'Extension'
    field :fixedPrimitiveCode, type:  # primitive
    embeds_one :_fixedPrimitiveCode, class_name: 'Extension'
    field :fixedPrimitiveDate, type:  # primitive
    embeds_one :_fixedPrimitiveDate, class_name: 'Extension'
    field :fixedPrimitiveDateTime, type:  # primitive
    embeds_one :_fixedPrimitiveDateTime, class_name: 'Extension'
    field :fixedPrimitiveDecimal, type:  # primitive
    embeds_one :_fixedPrimitiveDecimal, class_name: 'Extension'
    field :fixedPrimitiveId, type:  # primitive
    embeds_one :_fixedPrimitiveId, class_name: 'Extension'
    field :fixedPrimitiveInstant, type:  # primitive
    embeds_one :_fixedPrimitiveInstant, class_name: 'Extension'
    field :fixedPrimitiveInteger, type:  # primitive
    embeds_one :_fixedPrimitiveInteger, class_name: 'Extension'
    field :fixedPrimitiveMarkdown, type:  # primitive
    embeds_one :_fixedPrimitiveMarkdown, class_name: 'Extension'
    field :fixedPrimitiveOid, type:  # primitive
    embeds_one :_fixedPrimitiveOid, class_name: 'Extension'
    field :fixedPrimitivePositiveInt, type:  # primitive
    embeds_one :_fixedPrimitivePositiveInt, class_name: 'Extension'
    field :fixedPrimitiveString, type:  # primitive
    embeds_one :_fixedPrimitiveString, class_name: 'Extension'
    field :fixedPrimitiveTime, type:  # primitive
    embeds_one :_fixedPrimitiveTime, class_name: 'Extension'
    field :fixedPrimitiveUnsignedInt, type:  # primitive
    embeds_one :_fixedPrimitiveUnsignedInt, class_name: 'Extension'
    field :fixedPrimitiveUri, type:  # primitive
    embeds_one :_fixedPrimitiveUri, class_name: 'Extension'
    field :fixedPrimitiveUrl, type:  # primitive
    embeds_one :_fixedPrimitiveUrl, class_name: 'Extension'
    field :fixedPrimitiveUuid, type:  # primitive
    embeds_one :_fixedPrimitiveUuid, class_name: 'Extension'
    embeds_one :fixedAddress, class_name: 'Address'
    embeds_one :fixedAge, class_name: 'Age'
    embeds_one :fixedAnnotation, class_name: 'Annotation'
    embeds_one :fixedAttachment, class_name: 'Attachment'
    embeds_one :fixedCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :fixedCoding, class_name: 'Coding'
    embeds_one :fixedContactPoint, class_name: 'ContactPoint'
    embeds_one :fixedCount, class_name: 'Count'
    embeds_one :fixedDistance, class_name: 'Distance'
    embeds_one :fixedDuration, class_name: 'Duration'
    embeds_one :fixedHumanName, class_name: 'HumanName'
    embeds_one :fixedIdentifier, class_name: 'Identifier'
    embeds_one :fixedMoney, class_name: 'Money'
    embeds_one :fixedPeriod, class_name: 'Period'
    embeds_one :fixedQuantity, class_name: 'Quantity'
    embeds_one :fixedRange, class_name: 'Range'
    embeds_one :fixedRatio, class_name: 'Ratio'
    embeds_one :fixedReference, class_name: 'Reference'
    embeds_one :fixedSampledData, class_name: 'SampledData'
    embeds_one :fixedSignature, class_name: 'Signature'
    embeds_one :fixedTiming, class_name: 'Timing'
    embeds_one :fixedContactDetail, class_name: 'ContactDetail'
    embeds_one :fixedContributor, class_name: 'Contributor'
    embeds_one :fixedDataRequirement, class_name: 'DataRequirement'
    embeds_one :fixedExpression, class_name: 'Expression'
    embeds_one :fixedParameterDefinition, class_name: 'ParameterDefinition'
    embeds_one :fixedRelatedArtifact, class_name: 'RelatedArtifact'
    embeds_one :fixedTriggerDefinition, class_name: 'TriggerDefinition'
    embeds_one :fixedUsageContext, class_name: 'UsageContext'
    embeds_one :fixedDosage, class_name: 'Dosage'
    embeds_one :fixedMeta, class_name: 'Meta'
    field :patternPrimitiveBase64Binary, type:  # primitive
    embeds_one :_patternPrimitiveBase64Binary, class_name: 'Extension'
    field :patternPrimitiveBoolean, type:  # primitive
    embeds_one :_patternPrimitiveBoolean, class_name: 'Extension'
    field :patternPrimitiveCanonical, type:  # primitive
    embeds_one :_patternPrimitiveCanonical, class_name: 'Extension'
    field :patternPrimitiveCode, type:  # primitive
    embeds_one :_patternPrimitiveCode, class_name: 'Extension'
    field :patternPrimitiveDate, type:  # primitive
    embeds_one :_patternPrimitiveDate, class_name: 'Extension'
    field :patternPrimitiveDateTime, type:  # primitive
    embeds_one :_patternPrimitiveDateTime, class_name: 'Extension'
    field :patternPrimitiveDecimal, type:  # primitive
    embeds_one :_patternPrimitiveDecimal, class_name: 'Extension'
    field :patternPrimitiveId, type:  # primitive
    embeds_one :_patternPrimitiveId, class_name: 'Extension'
    field :patternPrimitiveInstant, type:  # primitive
    embeds_one :_patternPrimitiveInstant, class_name: 'Extension'
    field :patternPrimitiveInteger, type:  # primitive
    embeds_one :_patternPrimitiveInteger, class_name: 'Extension'
    field :patternPrimitiveMarkdown, type:  # primitive
    embeds_one :_patternPrimitiveMarkdown, class_name: 'Extension'
    field :patternPrimitiveOid, type:  # primitive
    embeds_one :_patternPrimitiveOid, class_name: 'Extension'
    field :patternPrimitivePositiveInt, type:  # primitive
    embeds_one :_patternPrimitivePositiveInt, class_name: 'Extension'
    field :patternPrimitiveString, type:  # primitive
    embeds_one :_patternPrimitiveString, class_name: 'Extension'
    field :patternPrimitiveTime, type:  # primitive
    embeds_one :_patternPrimitiveTime, class_name: 'Extension'
    field :patternPrimitiveUnsignedInt, type:  # primitive
    embeds_one :_patternPrimitiveUnsignedInt, class_name: 'Extension'
    field :patternPrimitiveUri, type:  # primitive
    embeds_one :_patternPrimitiveUri, class_name: 'Extension'
    field :patternPrimitiveUrl, type:  # primitive
    embeds_one :_patternPrimitiveUrl, class_name: 'Extension'
    field :patternPrimitiveUuid, type:  # primitive
    embeds_one :_patternPrimitiveUuid, class_name: 'Extension'
    embeds_one :patternAddress, class_name: 'Address'
    embeds_one :patternAge, class_name: 'Age'
    embeds_one :patternAnnotation, class_name: 'Annotation'
    embeds_one :patternAttachment, class_name: 'Attachment'
    embeds_one :patternCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :patternCoding, class_name: 'Coding'
    embeds_one :patternContactPoint, class_name: 'ContactPoint'
    embeds_one :patternCount, class_name: 'Count'
    embeds_one :patternDistance, class_name: 'Distance'
    embeds_one :patternDuration, class_name: 'Duration'
    embeds_one :patternHumanName, class_name: 'HumanName'
    embeds_one :patternIdentifier, class_name: 'Identifier'
    embeds_one :patternMoney, class_name: 'Money'
    embeds_one :patternPeriod, class_name: 'Period'
    embeds_one :patternQuantity, class_name: 'Quantity'
    embeds_one :patternRange, class_name: 'Range'
    embeds_one :patternRatio, class_name: 'Ratio'
    embeds_one :patternReference, class_name: 'Reference'
    embeds_one :patternSampledData, class_name: 'SampledData'
    embeds_one :patternSignature, class_name: 'Signature'
    embeds_one :patternTiming, class_name: 'Timing'
    embeds_one :patternContactDetail, class_name: 'ContactDetail'
    embeds_one :patternContributor, class_name: 'Contributor'
    embeds_one :patternDataRequirement, class_name: 'DataRequirement'
    embeds_one :patternExpression, class_name: 'Expression'
    embeds_one :patternParameterDefinition, class_name: 'ParameterDefinition'
    embeds_one :patternRelatedArtifact, class_name: 'RelatedArtifact'
    embeds_one :patternTriggerDefinition, class_name: 'TriggerDefinition'
    embeds_one :patternUsageContext, class_name: 'UsageContext'
    embeds_one :patternDosage, class_name: 'Dosage'
    embeds_one :patternMeta, class_name: 'Meta'
    embeds_many :example, class_name: 'ElementDefinitionExample'
    field :minValuePrimitiveDate, type:  # primitive
    embeds_one :_minValuePrimitiveDate, class_name: 'Extension'
    field :minValuePrimitiveDateTime, type:  # primitive
    embeds_one :_minValuePrimitiveDateTime, class_name: 'Extension'
    field :minValuePrimitiveInstant, type:  # primitive
    embeds_one :_minValuePrimitiveInstant, class_name: 'Extension'
    field :minValuePrimitiveTime, type:  # primitive
    embeds_one :_minValuePrimitiveTime, class_name: 'Extension'
    field :minValuePrimitiveDecimal, type:  # primitive
    embeds_one :_minValuePrimitiveDecimal, class_name: 'Extension'
    field :minValuePrimitiveInteger, type:  # primitive
    embeds_one :_minValuePrimitiveInteger, class_name: 'Extension'
    field :minValuePrimitivePositiveInt, type:  # primitive
    embeds_one :_minValuePrimitivePositiveInt, class_name: 'Extension'
    field :minValuePrimitiveUnsignedInt, type:  # primitive
    embeds_one :_minValuePrimitiveUnsignedInt, class_name: 'Extension'
    embeds_one :minValueQuantity, class_name: 'Quantity'
    field :maxValuePrimitiveDate, type:  # primitive
    embeds_one :_maxValuePrimitiveDate, class_name: 'Extension'
    field :maxValuePrimitiveDateTime, type:  # primitive
    embeds_one :_maxValuePrimitiveDateTime, class_name: 'Extension'
    field :maxValuePrimitiveInstant, type:  # primitive
    embeds_one :_maxValuePrimitiveInstant, class_name: 'Extension'
    field :maxValuePrimitiveTime, type:  # primitive
    embeds_one :_maxValuePrimitiveTime, class_name: 'Extension'
    field :maxValuePrimitiveDecimal, type:  # primitive
    embeds_one :_maxValuePrimitiveDecimal, class_name: 'Extension'
    field :maxValuePrimitiveInteger, type:  # primitive
    embeds_one :_maxValuePrimitiveInteger, class_name: 'Extension'
    field :maxValuePrimitivePositiveInt, type:  # primitive
    embeds_one :_maxValuePrimitivePositiveInt, class_name: 'Extension'
    field :maxValuePrimitiveUnsignedInt, type:  # primitive
    embeds_one :_maxValuePrimitiveUnsignedInt, class_name: 'Extension'
    embeds_one :maxValueQuantity, class_name: 'Quantity'
    field :maxLength, type:  # primitive
    embeds_one :_maxLength, class_name: 'Extension'
    field :condition, type: Array # primitive
    embeds_many :_condition, class_name: 'Extension'
    embeds_many :constraint, class_name: 'ElementDefinitionConstraint'
    field :mustSupport, type:  # primitive
    embeds_one :_mustSupport, class_name: 'Extension'
    field :isModifier, type:  # primitive
    embeds_one :_isModifier, class_name: 'Extension'
    field :isModifierReason, type:  # primitive
    embeds_one :_isModifierReason, class_name: 'Extension'
    field :isSummary, type:  # primitive
    embeds_one :_isSummary, class_name: 'Extension'
    embeds_one :binding, class_name: 'ElementDefinitionBinding'
    embeds_many :mapping, class_name: 'ElementDefinitionMapping'
  end
end
