module FHIR
  # fhir/element_definition.rb
  class ElementDefinition < BackboneElement
    include Mongoid::Document
    embeds_one :path, class_name: 'FHIR::PrimitiveString'
    embeds_many :representation, class_name: 'FHIR::PropertyRepresentation'
    embeds_one :sliceName, class_name: 'FHIR::PrimitiveString'
    embeds_one :sliceIsConstraining, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :label, class_name: 'FHIR::PrimitiveString'
    embeds_many :code, class_name: 'FHIR::Coding'
    embeds_one :slicing, class_name: 'FHIR::ElementDefinitionSlicing'
    embeds_one :short, class_name: 'FHIR::PrimitiveString'
    embeds_one :definition, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :comment, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :requirements, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_many :alias, class_name: 'FHIR::PrimitiveString'
    embeds_one :min, class_name: 'FHIR::PrimitiveUnsignedInt'
    embeds_one :max, class_name: 'FHIR::PrimitiveString'
    embeds_one :base, class_name: 'FHIR::ElementDefinitionBase'
    embeds_one :contentReference, class_name: 'FHIR::PrimitiveUri'
    embeds_many :type, class_name: 'FHIR::ElementDefinitionType'
    embeds_one :defaultValueBase64Binary, class_name: 'FHIR::PrimitiveBase64Binary'
    embeds_one :defaultValueBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :defaultValueCanonical, class_name: 'FHIR::PrimitiveCanonical'
    embeds_one :defaultValueCode, class_name: 'FHIR::PrimitiveCode'
    embeds_one :defaultValueDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :defaultValueDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :defaultValueDecimal, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :defaultValueId, class_name: 'FHIR::PrimitiveId'
    embeds_one :defaultValueInstant, class_name: 'FHIR::PrimitiveInstant'
    embeds_one :defaultValueInteger, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :defaultValueMarkdown, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :defaultValueOid, class_name: 'FHIR::PrimitiveOid'
    embeds_one :defaultValuePositiveInt, class_name: 'FHIR::PrimitivePositiveInt'
    embeds_one :defaultValueString, class_name: 'FHIR::PrimitiveString'
    embeds_one :defaultValueTime, class_name: 'FHIR::PrimitiveTime'
    embeds_one :defaultValueUnsignedInt, class_name: 'FHIR::PrimitiveUnsignedInt'
    embeds_one :defaultValueUri, class_name: 'FHIR::PrimitiveUri'
    embeds_one :defaultValueUrl, class_name: 'FHIR::PrimitiveUrl'
    embeds_one :defaultValueUuid, class_name: 'FHIR::PrimitiveUuid'
    embeds_one :defaultValueAddress, class_name: 'FHIR::Address'
    embeds_one :defaultValueAge, class_name: 'FHIR::Age'
    embeds_one :defaultValueAnnotation, class_name: 'FHIR::Annotation'
    embeds_one :defaultValueAttachment, class_name: 'FHIR::Attachment'
    embeds_one :defaultValueCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :defaultValueCoding, class_name: 'FHIR::Coding'
    embeds_one :defaultValueContactPoint, class_name: 'FHIR::ContactPoint'
    embeds_one :defaultValueCount, class_name: 'FHIR::Count'
    embeds_one :defaultValueDistance, class_name: 'FHIR::Distance'
    embeds_one :defaultValueDuration, class_name: 'FHIR::Duration'
    embeds_one :defaultValueHumanName, class_name: 'FHIR::HumanName'
    embeds_one :defaultValueIdentifier, class_name: 'FHIR::Identifier'
    embeds_one :defaultValueMoney, class_name: 'FHIR::Money'
    embeds_one :defaultValuePeriod, class_name: 'FHIR::Period'
    embeds_one :defaultValueQuantity, class_name: 'FHIR::Quantity'
    embeds_one :defaultValueRange, class_name: 'FHIR::Range'
    embeds_one :defaultValueRatio, class_name: 'FHIR::Ratio'
    embeds_one :defaultValueReference, class_name: 'FHIR::Reference'
    embeds_one :defaultValueSampledData, class_name: 'FHIR::SampledData'
    embeds_one :defaultValueSignature, class_name: 'FHIR::Signature'
    embeds_one :defaultValueTiming, class_name: 'FHIR::Timing'
    embeds_one :defaultValueContactDetail, class_name: 'FHIR::ContactDetail'
    embeds_one :defaultValueContributor, class_name: 'FHIR::Contributor'
    embeds_one :defaultValueDataRequirement, class_name: 'FHIR::DataRequirement'
    embeds_one :defaultValueExpression, class_name: 'FHIR::Expression'
    embeds_one :defaultValueParameterDefinition, class_name: 'FHIR::ParameterDefinition'
    embeds_one :defaultValueRelatedArtifact, class_name: 'FHIR::RelatedArtifact'
    embeds_one :defaultValueTriggerDefinition, class_name: 'FHIR::TriggerDefinition'
    embeds_one :defaultValueUsageContext, class_name: 'FHIR::UsageContext'
    embeds_one :defaultValueDosage, class_name: 'FHIR::Dosage'
    embeds_one :defaultValueMeta, class_name: 'FHIR::Meta'
    embeds_one :meaningWhenMissing, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :orderMeaning, class_name: 'FHIR::PrimitiveString'
    embeds_one :fixedBase64Binary, class_name: 'FHIR::PrimitiveBase64Binary'
    embeds_one :fixedBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :fixedCanonical, class_name: 'FHIR::PrimitiveCanonical'
    embeds_one :fixedCode, class_name: 'FHIR::PrimitiveCode'
    embeds_one :fixedDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :fixedDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :fixedDecimal, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :fixedId, class_name: 'FHIR::PrimitiveId'
    embeds_one :fixedInstant, class_name: 'FHIR::PrimitiveInstant'
    embeds_one :fixedInteger, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :fixedMarkdown, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :fixedOid, class_name: 'FHIR::PrimitiveOid'
    embeds_one :fixedPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'
    embeds_one :fixedString, class_name: 'FHIR::PrimitiveString'
    embeds_one :fixedTime, class_name: 'FHIR::PrimitiveTime'
    embeds_one :fixedUnsignedInt, class_name: 'FHIR::PrimitiveUnsignedInt'
    embeds_one :fixedUri, class_name: 'FHIR::PrimitiveUri'
    embeds_one :fixedUrl, class_name: 'FHIR::PrimitiveUrl'
    embeds_one :fixedUuid, class_name: 'FHIR::PrimitiveUuid'
    embeds_one :fixedAddress, class_name: 'FHIR::Address'
    embeds_one :fixedAge, class_name: 'FHIR::Age'
    embeds_one :fixedAnnotation, class_name: 'FHIR::Annotation'
    embeds_one :fixedAttachment, class_name: 'FHIR::Attachment'
    embeds_one :fixedCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :fixedCoding, class_name: 'FHIR::Coding'
    embeds_one :fixedContactPoint, class_name: 'FHIR::ContactPoint'
    embeds_one :fixedCount, class_name: 'FHIR::Count'
    embeds_one :fixedDistance, class_name: 'FHIR::Distance'
    embeds_one :fixedDuration, class_name: 'FHIR::Duration'
    embeds_one :fixedHumanName, class_name: 'FHIR::HumanName'
    embeds_one :fixedIdentifier, class_name: 'FHIR::Identifier'
    embeds_one :fixedMoney, class_name: 'FHIR::Money'
    embeds_one :fixedPeriod, class_name: 'FHIR::Period'
    embeds_one :fixedQuantity, class_name: 'FHIR::Quantity'
    embeds_one :fixedRange, class_name: 'FHIR::Range'
    embeds_one :fixedRatio, class_name: 'FHIR::Ratio'
    embeds_one :fixedReference, class_name: 'FHIR::Reference'
    embeds_one :fixedSampledData, class_name: 'FHIR::SampledData'
    embeds_one :fixedSignature, class_name: 'FHIR::Signature'
    embeds_one :fixedTiming, class_name: 'FHIR::Timing'
    embeds_one :fixedContactDetail, class_name: 'FHIR::ContactDetail'
    embeds_one :fixedContributor, class_name: 'FHIR::Contributor'
    embeds_one :fixedDataRequirement, class_name: 'FHIR::DataRequirement'
    embeds_one :fixedExpression, class_name: 'FHIR::Expression'
    embeds_one :fixedParameterDefinition, class_name: 'FHIR::ParameterDefinition'
    embeds_one :fixedRelatedArtifact, class_name: 'FHIR::RelatedArtifact'
    embeds_one :fixedTriggerDefinition, class_name: 'FHIR::TriggerDefinition'
    embeds_one :fixedUsageContext, class_name: 'FHIR::UsageContext'
    embeds_one :fixedDosage, class_name: 'FHIR::Dosage'
    embeds_one :fixedMeta, class_name: 'FHIR::Meta'
    embeds_one :patternBase64Binary, class_name: 'FHIR::PrimitiveBase64Binary'
    embeds_one :patternBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :patternCanonical, class_name: 'FHIR::PrimitiveCanonical'
    embeds_one :patternCode, class_name: 'FHIR::PrimitiveCode'
    embeds_one :patternDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :patternDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :patternDecimal, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :patternId, class_name: 'FHIR::PrimitiveId'
    embeds_one :patternInstant, class_name: 'FHIR::PrimitiveInstant'
    embeds_one :patternInteger, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :patternMarkdown, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_one :patternOid, class_name: 'FHIR::PrimitiveOid'
    embeds_one :patternPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'
    embeds_one :patternString, class_name: 'FHIR::PrimitiveString'
    embeds_one :patternTime, class_name: 'FHIR::PrimitiveTime'
    embeds_one :patternUnsignedInt, class_name: 'FHIR::PrimitiveUnsignedInt'
    embeds_one :patternUri, class_name: 'FHIR::PrimitiveUri'
    embeds_one :patternUrl, class_name: 'FHIR::PrimitiveUrl'
    embeds_one :patternUuid, class_name: 'FHIR::PrimitiveUuid'
    embeds_one :patternAddress, class_name: 'FHIR::Address'
    embeds_one :patternAge, class_name: 'FHIR::Age'
    embeds_one :patternAnnotation, class_name: 'FHIR::Annotation'
    embeds_one :patternAttachment, class_name: 'FHIR::Attachment'
    embeds_one :patternCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :patternCoding, class_name: 'FHIR::Coding'
    embeds_one :patternContactPoint, class_name: 'FHIR::ContactPoint'
    embeds_one :patternCount, class_name: 'FHIR::Count'
    embeds_one :patternDistance, class_name: 'FHIR::Distance'
    embeds_one :patternDuration, class_name: 'FHIR::Duration'
    embeds_one :patternHumanName, class_name: 'FHIR::HumanName'
    embeds_one :patternIdentifier, class_name: 'FHIR::Identifier'
    embeds_one :patternMoney, class_name: 'FHIR::Money'
    embeds_one :patternPeriod, class_name: 'FHIR::Period'
    embeds_one :patternQuantity, class_name: 'FHIR::Quantity'
    embeds_one :patternRange, class_name: 'FHIR::Range'
    embeds_one :patternRatio, class_name: 'FHIR::Ratio'
    embeds_one :patternReference, class_name: 'FHIR::Reference'
    embeds_one :patternSampledData, class_name: 'FHIR::SampledData'
    embeds_one :patternSignature, class_name: 'FHIR::Signature'
    embeds_one :patternTiming, class_name: 'FHIR::Timing'
    embeds_one :patternContactDetail, class_name: 'FHIR::ContactDetail'
    embeds_one :patternContributor, class_name: 'FHIR::Contributor'
    embeds_one :patternDataRequirement, class_name: 'FHIR::DataRequirement'
    embeds_one :patternExpression, class_name: 'FHIR::Expression'
    embeds_one :patternParameterDefinition, class_name: 'FHIR::ParameterDefinition'
    embeds_one :patternRelatedArtifact, class_name: 'FHIR::RelatedArtifact'
    embeds_one :patternTriggerDefinition, class_name: 'FHIR::TriggerDefinition'
    embeds_one :patternUsageContext, class_name: 'FHIR::UsageContext'
    embeds_one :patternDosage, class_name: 'FHIR::Dosage'
    embeds_one :patternMeta, class_name: 'FHIR::Meta'
    embeds_many :example, class_name: 'FHIR::ElementDefinitionExample'
    embeds_one :minValueDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :minValueDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :minValueInstant, class_name: 'FHIR::PrimitiveInstant'
    embeds_one :minValueTime, class_name: 'FHIR::PrimitiveTime'
    embeds_one :minValueDecimal, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :minValueInteger, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :minValuePositiveInt, class_name: 'FHIR::PrimitivePositiveInt'
    embeds_one :minValueUnsignedInt, class_name: 'FHIR::PrimitiveUnsignedInt'
    embeds_one :minValueQuantity, class_name: 'FHIR::Quantity'
    embeds_one :maxValueDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :maxValueDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :maxValueInstant, class_name: 'FHIR::PrimitiveInstant'
    embeds_one :maxValueTime, class_name: 'FHIR::PrimitiveTime'
    embeds_one :maxValueDecimal, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :maxValueInteger, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :maxValuePositiveInt, class_name: 'FHIR::PrimitivePositiveInt'
    embeds_one :maxValueUnsignedInt, class_name: 'FHIR::PrimitiveUnsignedInt'
    embeds_one :maxValueQuantity, class_name: 'FHIR::Quantity'
    embeds_one :maxLength, class_name: 'FHIR::PrimitiveInteger'
    embeds_many :condition, class_name: 'FHIR::PrimitiveId'
    embeds_many :constraint, class_name: 'FHIR::ElementDefinitionConstraint'
    embeds_one :mustSupport, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :isModifier, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :isModifierReason, class_name: 'FHIR::PrimitiveString'
    embeds_one :isSummary, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :binding, class_name: 'FHIR::ElementDefinitionBinding'
    embeds_many :mapping, class_name: 'FHIR::ElementDefinitionMapping'

    def self.transform_json(json_hash, target = ElementDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?      
      result['representation'] = json_hash['representation'].map { |var| PropertyRepresentation.transform_json(var) } unless json_hash['representation'].nil?
      result['sliceName'] = PrimitiveString.transform_json(json_hash['sliceName'], json_hash['_sliceName']) unless json_hash['sliceName'].nil?      
      result['sliceIsConstraining'] = PrimitiveBoolean.transform_json(json_hash['sliceIsConstraining'], json_hash['_sliceIsConstraining']) unless json_hash['sliceIsConstraining'].nil?      
      result['label'] = PrimitiveString.transform_json(json_hash['label'], json_hash['_label']) unless json_hash['label'].nil?      
      result['code'] = json_hash['code'].map { |var| Coding.transform_json(var) } unless json_hash['code'].nil?
      result['slicing'] = ElementDefinitionSlicing.transform_json(json_hash['slicing']) unless json_hash['slicing'].nil?      
      result['short'] = PrimitiveString.transform_json(json_hash['short'], json_hash['_short']) unless json_hash['short'].nil?      
      result['definition'] = PrimitiveMarkdown.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?      
      result['comment'] = PrimitiveMarkdown.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      
      result['requirements'] = PrimitiveMarkdown.transform_json(json_hash['requirements'], json_hash['_requirements']) unless json_hash['requirements'].nil?      
      result['alias'] = json_hash['alias'].each_with_index.map do |var, i|
        extension_hash = json_hash['_alias'] && json_hash['_alias'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['alias'].nil?
      result['min'] = PrimitiveUnsignedInt.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?      
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?      
      result['base'] = ElementDefinitionBase.transform_json(json_hash['base']) unless json_hash['base'].nil?      
      result['contentReference'] = PrimitiveUri.transform_json(json_hash['contentReference'], json_hash['_contentReference']) unless json_hash['contentReference'].nil?      
      result['type'] = json_hash['type'].map { |var| ElementDefinitionType.transform_json(var) } unless json_hash['type'].nil?
      result['defaultValueBase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['defaultValueBase64Binary'], json_hash['_defaultValueBase64Binary']) unless json_hash['defaultValueBase64Binary'].nil?      
      result['defaultValueBoolean'] = PrimitiveBoolean.transform_json(json_hash['defaultValueBoolean'], json_hash['_defaultValueBoolean']) unless json_hash['defaultValueBoolean'].nil?      
      result['defaultValueCanonical'] = PrimitiveCanonical.transform_json(json_hash['defaultValueCanonical'], json_hash['_defaultValueCanonical']) unless json_hash['defaultValueCanonical'].nil?      
      result['defaultValueCode'] = PrimitiveCode.transform_json(json_hash['defaultValueCode'], json_hash['_defaultValueCode']) unless json_hash['defaultValueCode'].nil?      
      result['defaultValueDate'] = PrimitiveDate.transform_json(json_hash['defaultValueDate'], json_hash['_defaultValueDate']) unless json_hash['defaultValueDate'].nil?      
      result['defaultValueDateTime'] = PrimitiveDateTime.transform_json(json_hash['defaultValueDateTime'], json_hash['_defaultValueDateTime']) unless json_hash['defaultValueDateTime'].nil?      
      result['defaultValueDecimal'] = PrimitiveDecimal.transform_json(json_hash['defaultValueDecimal'], json_hash['_defaultValueDecimal']) unless json_hash['defaultValueDecimal'].nil?      
      result['defaultValueId'] = PrimitiveId.transform_json(json_hash['defaultValueId'], json_hash['_defaultValueId']) unless json_hash['defaultValueId'].nil?      
      result['defaultValueInstant'] = PrimitiveInstant.transform_json(json_hash['defaultValueInstant'], json_hash['_defaultValueInstant']) unless json_hash['defaultValueInstant'].nil?      
      result['defaultValueInteger'] = PrimitiveInteger.transform_json(json_hash['defaultValueInteger'], json_hash['_defaultValueInteger']) unless json_hash['defaultValueInteger'].nil?      
      result['defaultValueMarkdown'] = PrimitiveMarkdown.transform_json(json_hash['defaultValueMarkdown'], json_hash['_defaultValueMarkdown']) unless json_hash['defaultValueMarkdown'].nil?      
      result['defaultValueOid'] = PrimitiveOid.transform_json(json_hash['defaultValueOid'], json_hash['_defaultValueOid']) unless json_hash['defaultValueOid'].nil?      
      result['defaultValuePositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['defaultValuePositiveInt'], json_hash['_defaultValuePositiveInt']) unless json_hash['defaultValuePositiveInt'].nil?      
      result['defaultValueString'] = PrimitiveString.transform_json(json_hash['defaultValueString'], json_hash['_defaultValueString']) unless json_hash['defaultValueString'].nil?      
      result['defaultValueTime'] = PrimitiveTime.transform_json(json_hash['defaultValueTime'], json_hash['_defaultValueTime']) unless json_hash['defaultValueTime'].nil?      
      result['defaultValueUnsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['defaultValueUnsignedInt'], json_hash['_defaultValueUnsignedInt']) unless json_hash['defaultValueUnsignedInt'].nil?      
      result['defaultValueUri'] = PrimitiveUri.transform_json(json_hash['defaultValueUri'], json_hash['_defaultValueUri']) unless json_hash['defaultValueUri'].nil?      
      result['defaultValueUrl'] = PrimitiveUrl.transform_json(json_hash['defaultValueUrl'], json_hash['_defaultValueUrl']) unless json_hash['defaultValueUrl'].nil?      
      result['defaultValueUuid'] = PrimitiveUuid.transform_json(json_hash['defaultValueUuid'], json_hash['_defaultValueUuid']) unless json_hash['defaultValueUuid'].nil?      
      result['defaultValueAddress'] = Address.transform_json(json_hash['defaultValueAddress']) unless json_hash['defaultValueAddress'].nil?      
      result['defaultValueAge'] = Age.transform_json(json_hash['defaultValueAge']) unless json_hash['defaultValueAge'].nil?      
      result['defaultValueAnnotation'] = Annotation.transform_json(json_hash['defaultValueAnnotation']) unless json_hash['defaultValueAnnotation'].nil?      
      result['defaultValueAttachment'] = Attachment.transform_json(json_hash['defaultValueAttachment']) unless json_hash['defaultValueAttachment'].nil?      
      result['defaultValueCodeableConcept'] = CodeableConcept.transform_json(json_hash['defaultValueCodeableConcept']) unless json_hash['defaultValueCodeableConcept'].nil?      
      result['defaultValueCoding'] = Coding.transform_json(json_hash['defaultValueCoding']) unless json_hash['defaultValueCoding'].nil?      
      result['defaultValueContactPoint'] = ContactPoint.transform_json(json_hash['defaultValueContactPoint']) unless json_hash['defaultValueContactPoint'].nil?      
      result['defaultValueCount'] = Count.transform_json(json_hash['defaultValueCount']) unless json_hash['defaultValueCount'].nil?      
      result['defaultValueDistance'] = Distance.transform_json(json_hash['defaultValueDistance']) unless json_hash['defaultValueDistance'].nil?      
      result['defaultValueDuration'] = Duration.transform_json(json_hash['defaultValueDuration']) unless json_hash['defaultValueDuration'].nil?      
      result['defaultValueHumanName'] = HumanName.transform_json(json_hash['defaultValueHumanName']) unless json_hash['defaultValueHumanName'].nil?      
      result['defaultValueIdentifier'] = Identifier.transform_json(json_hash['defaultValueIdentifier']) unless json_hash['defaultValueIdentifier'].nil?      
      result['defaultValueMoney'] = Money.transform_json(json_hash['defaultValueMoney']) unless json_hash['defaultValueMoney'].nil?      
      result['defaultValuePeriod'] = Period.transform_json(json_hash['defaultValuePeriod']) unless json_hash['defaultValuePeriod'].nil?      
      result['defaultValueQuantity'] = Quantity.transform_json(json_hash['defaultValueQuantity']) unless json_hash['defaultValueQuantity'].nil?      
      result['defaultValueRange'] = Range.transform_json(json_hash['defaultValueRange']) unless json_hash['defaultValueRange'].nil?      
      result['defaultValueRatio'] = Ratio.transform_json(json_hash['defaultValueRatio']) unless json_hash['defaultValueRatio'].nil?      
      result['defaultValueReference'] = Reference.transform_json(json_hash['defaultValueReference']) unless json_hash['defaultValueReference'].nil?      
      result['defaultValueSampledData'] = SampledData.transform_json(json_hash['defaultValueSampledData']) unless json_hash['defaultValueSampledData'].nil?      
      result['defaultValueSignature'] = Signature.transform_json(json_hash['defaultValueSignature']) unless json_hash['defaultValueSignature'].nil?      
      result['defaultValueTiming'] = Timing.transform_json(json_hash['defaultValueTiming']) unless json_hash['defaultValueTiming'].nil?      
      result['defaultValueContactDetail'] = ContactDetail.transform_json(json_hash['defaultValueContactDetail']) unless json_hash['defaultValueContactDetail'].nil?      
      result['defaultValueContributor'] = Contributor.transform_json(json_hash['defaultValueContributor']) unless json_hash['defaultValueContributor'].nil?      
      result['defaultValueDataRequirement'] = DataRequirement.transform_json(json_hash['defaultValueDataRequirement']) unless json_hash['defaultValueDataRequirement'].nil?      
      result['defaultValueExpression'] = Expression.transform_json(json_hash['defaultValueExpression']) unless json_hash['defaultValueExpression'].nil?      
      result['defaultValueParameterDefinition'] = ParameterDefinition.transform_json(json_hash['defaultValueParameterDefinition']) unless json_hash['defaultValueParameterDefinition'].nil?      
      result['defaultValueRelatedArtifact'] = RelatedArtifact.transform_json(json_hash['defaultValueRelatedArtifact']) unless json_hash['defaultValueRelatedArtifact'].nil?      
      result['defaultValueTriggerDefinition'] = TriggerDefinition.transform_json(json_hash['defaultValueTriggerDefinition']) unless json_hash['defaultValueTriggerDefinition'].nil?      
      result['defaultValueUsageContext'] = UsageContext.transform_json(json_hash['defaultValueUsageContext']) unless json_hash['defaultValueUsageContext'].nil?      
      result['defaultValueDosage'] = Dosage.transform_json(json_hash['defaultValueDosage']) unless json_hash['defaultValueDosage'].nil?      
      result['defaultValueMeta'] = Meta.transform_json(json_hash['defaultValueMeta']) unless json_hash['defaultValueMeta'].nil?      
      result['meaningWhenMissing'] = PrimitiveMarkdown.transform_json(json_hash['meaningWhenMissing'], json_hash['_meaningWhenMissing']) unless json_hash['meaningWhenMissing'].nil?      
      result['orderMeaning'] = PrimitiveString.transform_json(json_hash['orderMeaning'], json_hash['_orderMeaning']) unless json_hash['orderMeaning'].nil?      
      result['fixedBase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['fixedBase64Binary'], json_hash['_fixedBase64Binary']) unless json_hash['fixedBase64Binary'].nil?      
      result['fixedBoolean'] = PrimitiveBoolean.transform_json(json_hash['fixedBoolean'], json_hash['_fixedBoolean']) unless json_hash['fixedBoolean'].nil?      
      result['fixedCanonical'] = PrimitiveCanonical.transform_json(json_hash['fixedCanonical'], json_hash['_fixedCanonical']) unless json_hash['fixedCanonical'].nil?      
      result['fixedCode'] = PrimitiveCode.transform_json(json_hash['fixedCode'], json_hash['_fixedCode']) unless json_hash['fixedCode'].nil?      
      result['fixedDate'] = PrimitiveDate.transform_json(json_hash['fixedDate'], json_hash['_fixedDate']) unless json_hash['fixedDate'].nil?      
      result['fixedDateTime'] = PrimitiveDateTime.transform_json(json_hash['fixedDateTime'], json_hash['_fixedDateTime']) unless json_hash['fixedDateTime'].nil?      
      result['fixedDecimal'] = PrimitiveDecimal.transform_json(json_hash['fixedDecimal'], json_hash['_fixedDecimal']) unless json_hash['fixedDecimal'].nil?      
      result['fixedId'] = PrimitiveId.transform_json(json_hash['fixedId'], json_hash['_fixedId']) unless json_hash['fixedId'].nil?      
      result['fixedInstant'] = PrimitiveInstant.transform_json(json_hash['fixedInstant'], json_hash['_fixedInstant']) unless json_hash['fixedInstant'].nil?      
      result['fixedInteger'] = PrimitiveInteger.transform_json(json_hash['fixedInteger'], json_hash['_fixedInteger']) unless json_hash['fixedInteger'].nil?      
      result['fixedMarkdown'] = PrimitiveMarkdown.transform_json(json_hash['fixedMarkdown'], json_hash['_fixedMarkdown']) unless json_hash['fixedMarkdown'].nil?      
      result['fixedOid'] = PrimitiveOid.transform_json(json_hash['fixedOid'], json_hash['_fixedOid']) unless json_hash['fixedOid'].nil?      
      result['fixedPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['fixedPositiveInt'], json_hash['_fixedPositiveInt']) unless json_hash['fixedPositiveInt'].nil?      
      result['fixedString'] = PrimitiveString.transform_json(json_hash['fixedString'], json_hash['_fixedString']) unless json_hash['fixedString'].nil?      
      result['fixedTime'] = PrimitiveTime.transform_json(json_hash['fixedTime'], json_hash['_fixedTime']) unless json_hash['fixedTime'].nil?      
      result['fixedUnsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['fixedUnsignedInt'], json_hash['_fixedUnsignedInt']) unless json_hash['fixedUnsignedInt'].nil?      
      result['fixedUri'] = PrimitiveUri.transform_json(json_hash['fixedUri'], json_hash['_fixedUri']) unless json_hash['fixedUri'].nil?      
      result['fixedUrl'] = PrimitiveUrl.transform_json(json_hash['fixedUrl'], json_hash['_fixedUrl']) unless json_hash['fixedUrl'].nil?      
      result['fixedUuid'] = PrimitiveUuid.transform_json(json_hash['fixedUuid'], json_hash['_fixedUuid']) unless json_hash['fixedUuid'].nil?      
      result['fixedAddress'] = Address.transform_json(json_hash['fixedAddress']) unless json_hash['fixedAddress'].nil?      
      result['fixedAge'] = Age.transform_json(json_hash['fixedAge']) unless json_hash['fixedAge'].nil?      
      result['fixedAnnotation'] = Annotation.transform_json(json_hash['fixedAnnotation']) unless json_hash['fixedAnnotation'].nil?      
      result['fixedAttachment'] = Attachment.transform_json(json_hash['fixedAttachment']) unless json_hash['fixedAttachment'].nil?      
      result['fixedCodeableConcept'] = CodeableConcept.transform_json(json_hash['fixedCodeableConcept']) unless json_hash['fixedCodeableConcept'].nil?      
      result['fixedCoding'] = Coding.transform_json(json_hash['fixedCoding']) unless json_hash['fixedCoding'].nil?      
      result['fixedContactPoint'] = ContactPoint.transform_json(json_hash['fixedContactPoint']) unless json_hash['fixedContactPoint'].nil?      
      result['fixedCount'] = Count.transform_json(json_hash['fixedCount']) unless json_hash['fixedCount'].nil?      
      result['fixedDistance'] = Distance.transform_json(json_hash['fixedDistance']) unless json_hash['fixedDistance'].nil?      
      result['fixedDuration'] = Duration.transform_json(json_hash['fixedDuration']) unless json_hash['fixedDuration'].nil?      
      result['fixedHumanName'] = HumanName.transform_json(json_hash['fixedHumanName']) unless json_hash['fixedHumanName'].nil?      
      result['fixedIdentifier'] = Identifier.transform_json(json_hash['fixedIdentifier']) unless json_hash['fixedIdentifier'].nil?      
      result['fixedMoney'] = Money.transform_json(json_hash['fixedMoney']) unless json_hash['fixedMoney'].nil?      
      result['fixedPeriod'] = Period.transform_json(json_hash['fixedPeriod']) unless json_hash['fixedPeriod'].nil?      
      result['fixedQuantity'] = Quantity.transform_json(json_hash['fixedQuantity']) unless json_hash['fixedQuantity'].nil?      
      result['fixedRange'] = Range.transform_json(json_hash['fixedRange']) unless json_hash['fixedRange'].nil?      
      result['fixedRatio'] = Ratio.transform_json(json_hash['fixedRatio']) unless json_hash['fixedRatio'].nil?      
      result['fixedReference'] = Reference.transform_json(json_hash['fixedReference']) unless json_hash['fixedReference'].nil?      
      result['fixedSampledData'] = SampledData.transform_json(json_hash['fixedSampledData']) unless json_hash['fixedSampledData'].nil?      
      result['fixedSignature'] = Signature.transform_json(json_hash['fixedSignature']) unless json_hash['fixedSignature'].nil?      
      result['fixedTiming'] = Timing.transform_json(json_hash['fixedTiming']) unless json_hash['fixedTiming'].nil?      
      result['fixedContactDetail'] = ContactDetail.transform_json(json_hash['fixedContactDetail']) unless json_hash['fixedContactDetail'].nil?      
      result['fixedContributor'] = Contributor.transform_json(json_hash['fixedContributor']) unless json_hash['fixedContributor'].nil?      
      result['fixedDataRequirement'] = DataRequirement.transform_json(json_hash['fixedDataRequirement']) unless json_hash['fixedDataRequirement'].nil?      
      result['fixedExpression'] = Expression.transform_json(json_hash['fixedExpression']) unless json_hash['fixedExpression'].nil?      
      result['fixedParameterDefinition'] = ParameterDefinition.transform_json(json_hash['fixedParameterDefinition']) unless json_hash['fixedParameterDefinition'].nil?      
      result['fixedRelatedArtifact'] = RelatedArtifact.transform_json(json_hash['fixedRelatedArtifact']) unless json_hash['fixedRelatedArtifact'].nil?      
      result['fixedTriggerDefinition'] = TriggerDefinition.transform_json(json_hash['fixedTriggerDefinition']) unless json_hash['fixedTriggerDefinition'].nil?      
      result['fixedUsageContext'] = UsageContext.transform_json(json_hash['fixedUsageContext']) unless json_hash['fixedUsageContext'].nil?      
      result['fixedDosage'] = Dosage.transform_json(json_hash['fixedDosage']) unless json_hash['fixedDosage'].nil?      
      result['fixedMeta'] = Meta.transform_json(json_hash['fixedMeta']) unless json_hash['fixedMeta'].nil?      
      result['patternBase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['patternBase64Binary'], json_hash['_patternBase64Binary']) unless json_hash['patternBase64Binary'].nil?      
      result['patternBoolean'] = PrimitiveBoolean.transform_json(json_hash['patternBoolean'], json_hash['_patternBoolean']) unless json_hash['patternBoolean'].nil?      
      result['patternCanonical'] = PrimitiveCanonical.transform_json(json_hash['patternCanonical'], json_hash['_patternCanonical']) unless json_hash['patternCanonical'].nil?      
      result['patternCode'] = PrimitiveCode.transform_json(json_hash['patternCode'], json_hash['_patternCode']) unless json_hash['patternCode'].nil?      
      result['patternDate'] = PrimitiveDate.transform_json(json_hash['patternDate'], json_hash['_patternDate']) unless json_hash['patternDate'].nil?      
      result['patternDateTime'] = PrimitiveDateTime.transform_json(json_hash['patternDateTime'], json_hash['_patternDateTime']) unless json_hash['patternDateTime'].nil?      
      result['patternDecimal'] = PrimitiveDecimal.transform_json(json_hash['patternDecimal'], json_hash['_patternDecimal']) unless json_hash['patternDecimal'].nil?      
      result['patternId'] = PrimitiveId.transform_json(json_hash['patternId'], json_hash['_patternId']) unless json_hash['patternId'].nil?      
      result['patternInstant'] = PrimitiveInstant.transform_json(json_hash['patternInstant'], json_hash['_patternInstant']) unless json_hash['patternInstant'].nil?      
      result['patternInteger'] = PrimitiveInteger.transform_json(json_hash['patternInteger'], json_hash['_patternInteger']) unless json_hash['patternInteger'].nil?      
      result['patternMarkdown'] = PrimitiveMarkdown.transform_json(json_hash['patternMarkdown'], json_hash['_patternMarkdown']) unless json_hash['patternMarkdown'].nil?      
      result['patternOid'] = PrimitiveOid.transform_json(json_hash['patternOid'], json_hash['_patternOid']) unless json_hash['patternOid'].nil?      
      result['patternPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['patternPositiveInt'], json_hash['_patternPositiveInt']) unless json_hash['patternPositiveInt'].nil?      
      result['patternString'] = PrimitiveString.transform_json(json_hash['patternString'], json_hash['_patternString']) unless json_hash['patternString'].nil?      
      result['patternTime'] = PrimitiveTime.transform_json(json_hash['patternTime'], json_hash['_patternTime']) unless json_hash['patternTime'].nil?      
      result['patternUnsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['patternUnsignedInt'], json_hash['_patternUnsignedInt']) unless json_hash['patternUnsignedInt'].nil?      
      result['patternUri'] = PrimitiveUri.transform_json(json_hash['patternUri'], json_hash['_patternUri']) unless json_hash['patternUri'].nil?      
      result['patternUrl'] = PrimitiveUrl.transform_json(json_hash['patternUrl'], json_hash['_patternUrl']) unless json_hash['patternUrl'].nil?      
      result['patternUuid'] = PrimitiveUuid.transform_json(json_hash['patternUuid'], json_hash['_patternUuid']) unless json_hash['patternUuid'].nil?      
      result['patternAddress'] = Address.transform_json(json_hash['patternAddress']) unless json_hash['patternAddress'].nil?      
      result['patternAge'] = Age.transform_json(json_hash['patternAge']) unless json_hash['patternAge'].nil?      
      result['patternAnnotation'] = Annotation.transform_json(json_hash['patternAnnotation']) unless json_hash['patternAnnotation'].nil?      
      result['patternAttachment'] = Attachment.transform_json(json_hash['patternAttachment']) unless json_hash['patternAttachment'].nil?      
      result['patternCodeableConcept'] = CodeableConcept.transform_json(json_hash['patternCodeableConcept']) unless json_hash['patternCodeableConcept'].nil?      
      result['patternCoding'] = Coding.transform_json(json_hash['patternCoding']) unless json_hash['patternCoding'].nil?      
      result['patternContactPoint'] = ContactPoint.transform_json(json_hash['patternContactPoint']) unless json_hash['patternContactPoint'].nil?      
      result['patternCount'] = Count.transform_json(json_hash['patternCount']) unless json_hash['patternCount'].nil?      
      result['patternDistance'] = Distance.transform_json(json_hash['patternDistance']) unless json_hash['patternDistance'].nil?      
      result['patternDuration'] = Duration.transform_json(json_hash['patternDuration']) unless json_hash['patternDuration'].nil?      
      result['patternHumanName'] = HumanName.transform_json(json_hash['patternHumanName']) unless json_hash['patternHumanName'].nil?      
      result['patternIdentifier'] = Identifier.transform_json(json_hash['patternIdentifier']) unless json_hash['patternIdentifier'].nil?      
      result['patternMoney'] = Money.transform_json(json_hash['patternMoney']) unless json_hash['patternMoney'].nil?      
      result['patternPeriod'] = Period.transform_json(json_hash['patternPeriod']) unless json_hash['patternPeriod'].nil?      
      result['patternQuantity'] = Quantity.transform_json(json_hash['patternQuantity']) unless json_hash['patternQuantity'].nil?      
      result['patternRange'] = Range.transform_json(json_hash['patternRange']) unless json_hash['patternRange'].nil?      
      result['patternRatio'] = Ratio.transform_json(json_hash['patternRatio']) unless json_hash['patternRatio'].nil?      
      result['patternReference'] = Reference.transform_json(json_hash['patternReference']) unless json_hash['patternReference'].nil?      
      result['patternSampledData'] = SampledData.transform_json(json_hash['patternSampledData']) unless json_hash['patternSampledData'].nil?      
      result['patternSignature'] = Signature.transform_json(json_hash['patternSignature']) unless json_hash['patternSignature'].nil?      
      result['patternTiming'] = Timing.transform_json(json_hash['patternTiming']) unless json_hash['patternTiming'].nil?      
      result['patternContactDetail'] = ContactDetail.transform_json(json_hash['patternContactDetail']) unless json_hash['patternContactDetail'].nil?      
      result['patternContributor'] = Contributor.transform_json(json_hash['patternContributor']) unless json_hash['patternContributor'].nil?      
      result['patternDataRequirement'] = DataRequirement.transform_json(json_hash['patternDataRequirement']) unless json_hash['patternDataRequirement'].nil?      
      result['patternExpression'] = Expression.transform_json(json_hash['patternExpression']) unless json_hash['patternExpression'].nil?      
      result['patternParameterDefinition'] = ParameterDefinition.transform_json(json_hash['patternParameterDefinition']) unless json_hash['patternParameterDefinition'].nil?      
      result['patternRelatedArtifact'] = RelatedArtifact.transform_json(json_hash['patternRelatedArtifact']) unless json_hash['patternRelatedArtifact'].nil?      
      result['patternTriggerDefinition'] = TriggerDefinition.transform_json(json_hash['patternTriggerDefinition']) unless json_hash['patternTriggerDefinition'].nil?      
      result['patternUsageContext'] = UsageContext.transform_json(json_hash['patternUsageContext']) unless json_hash['patternUsageContext'].nil?      
      result['patternDosage'] = Dosage.transform_json(json_hash['patternDosage']) unless json_hash['patternDosage'].nil?      
      result['patternMeta'] = Meta.transform_json(json_hash['patternMeta']) unless json_hash['patternMeta'].nil?      
      result['example'] = json_hash['example'].map { |var| ElementDefinitionExample.transform_json(var) } unless json_hash['example'].nil?
      result['minValueDate'] = PrimitiveDate.transform_json(json_hash['minValueDate'], json_hash['_minValueDate']) unless json_hash['minValueDate'].nil?      
      result['minValueDateTime'] = PrimitiveDateTime.transform_json(json_hash['minValueDateTime'], json_hash['_minValueDateTime']) unless json_hash['minValueDateTime'].nil?      
      result['minValueInstant'] = PrimitiveInstant.transform_json(json_hash['minValueInstant'], json_hash['_minValueInstant']) unless json_hash['minValueInstant'].nil?      
      result['minValueTime'] = PrimitiveTime.transform_json(json_hash['minValueTime'], json_hash['_minValueTime']) unless json_hash['minValueTime'].nil?      
      result['minValueDecimal'] = PrimitiveDecimal.transform_json(json_hash['minValueDecimal'], json_hash['_minValueDecimal']) unless json_hash['minValueDecimal'].nil?      
      result['minValueInteger'] = PrimitiveInteger.transform_json(json_hash['minValueInteger'], json_hash['_minValueInteger']) unless json_hash['minValueInteger'].nil?      
      result['minValuePositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['minValuePositiveInt'], json_hash['_minValuePositiveInt']) unless json_hash['minValuePositiveInt'].nil?      
      result['minValueUnsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['minValueUnsignedInt'], json_hash['_minValueUnsignedInt']) unless json_hash['minValueUnsignedInt'].nil?      
      result['minValueQuantity'] = Quantity.transform_json(json_hash['minValueQuantity']) unless json_hash['minValueQuantity'].nil?      
      result['maxValueDate'] = PrimitiveDate.transform_json(json_hash['maxValueDate'], json_hash['_maxValueDate']) unless json_hash['maxValueDate'].nil?      
      result['maxValueDateTime'] = PrimitiveDateTime.transform_json(json_hash['maxValueDateTime'], json_hash['_maxValueDateTime']) unless json_hash['maxValueDateTime'].nil?      
      result['maxValueInstant'] = PrimitiveInstant.transform_json(json_hash['maxValueInstant'], json_hash['_maxValueInstant']) unless json_hash['maxValueInstant'].nil?      
      result['maxValueTime'] = PrimitiveTime.transform_json(json_hash['maxValueTime'], json_hash['_maxValueTime']) unless json_hash['maxValueTime'].nil?      
      result['maxValueDecimal'] = PrimitiveDecimal.transform_json(json_hash['maxValueDecimal'], json_hash['_maxValueDecimal']) unless json_hash['maxValueDecimal'].nil?      
      result['maxValueInteger'] = PrimitiveInteger.transform_json(json_hash['maxValueInteger'], json_hash['_maxValueInteger']) unless json_hash['maxValueInteger'].nil?      
      result['maxValuePositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['maxValuePositiveInt'], json_hash['_maxValuePositiveInt']) unless json_hash['maxValuePositiveInt'].nil?      
      result['maxValueUnsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['maxValueUnsignedInt'], json_hash['_maxValueUnsignedInt']) unless json_hash['maxValueUnsignedInt'].nil?      
      result['maxValueQuantity'] = Quantity.transform_json(json_hash['maxValueQuantity']) unless json_hash['maxValueQuantity'].nil?      
      result['maxLength'] = PrimitiveInteger.transform_json(json_hash['maxLength'], json_hash['_maxLength']) unless json_hash['maxLength'].nil?      
      result['condition'] = json_hash['condition'].each_with_index.map do |var, i|
        extension_hash = json_hash['_condition'] && json_hash['_condition'][i]
        PrimitiveId.transform_json(var, extension_hash)
      end unless json_hash['condition'].nil?
      result['constraint'] = json_hash['constraint'].map { |var| ElementDefinitionConstraint.transform_json(var) } unless json_hash['constraint'].nil?
      result['mustSupport'] = PrimitiveBoolean.transform_json(json_hash['mustSupport'], json_hash['_mustSupport']) unless json_hash['mustSupport'].nil?      
      result['isModifier'] = PrimitiveBoolean.transform_json(json_hash['isModifier'], json_hash['_isModifier']) unless json_hash['isModifier'].nil?      
      result['isModifierReason'] = PrimitiveString.transform_json(json_hash['isModifierReason'], json_hash['_isModifierReason']) unless json_hash['isModifierReason'].nil?      
      result['isSummary'] = PrimitiveBoolean.transform_json(json_hash['isSummary'], json_hash['_isSummary']) unless json_hash['isSummary'].nil?      
      result['binding'] = ElementDefinitionBinding.transform_json(json_hash['binding']) unless json_hash['binding'].nil?      
      result['mapping'] = json_hash['mapping'].map { |var| ElementDefinitionMapping.transform_json(var) } unless json_hash['mapping'].nil?

      result
    end
  end
end
