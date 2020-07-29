module FHIR
  # fhir/element_definition_example.rb
  class ElementDefinitionExample < Element
    include Mongoid::Document
    embeds_one :label, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueBase64Binary, class_name: 'FHIR::PrimitiveBase64Binary'    
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :valueCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :valueCode, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :valueDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :valueDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :valueDecimal, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :valueId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :valueInstant, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :valueInteger, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :valueMarkdown, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :valueOid, class_name: 'FHIR::PrimitiveOid'    
    embeds_one :valuePositiveInt, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueTime, class_name: 'FHIR::PrimitiveTime'    
    embeds_one :valueUnsignedInt, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :valueUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :valueUrl, class_name: 'FHIR::PrimitiveUrl'    
    embeds_one :valueUuid, class_name: 'FHIR::PrimitiveUuid'    
    embeds_one :valueAddress, class_name: 'FHIR::Address'    
    embeds_one :valueAge, class_name: 'FHIR::Age'    
    embeds_one :valueAnnotation, class_name: 'FHIR::Annotation'    
    embeds_one :valueAttachment, class_name: 'FHIR::Attachment'    
    embeds_one :valueCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueCoding, class_name: 'FHIR::Coding'    
    embeds_one :valueContactPoint, class_name: 'FHIR::ContactPoint'    
    embeds_one :valueCount, class_name: 'FHIR::Count'    
    embeds_one :valueDistance, class_name: 'FHIR::Distance'    
    embeds_one :valueDuration, class_name: 'FHIR::Duration'    
    embeds_one :valueHumanName, class_name: 'FHIR::HumanName'    
    embeds_one :valueIdentifier, class_name: 'FHIR::Identifier'    
    embeds_one :valueMoney, class_name: 'FHIR::Money'    
    embeds_one :valuePeriod, class_name: 'FHIR::Period'    
    embeds_one :valueQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :valueRange, class_name: 'FHIR::Range'    
    embeds_one :valueRatio, class_name: 'FHIR::Ratio'    
    embeds_one :valueReference, class_name: 'FHIR::Reference'    
    embeds_one :valueSampledData, class_name: 'FHIR::SampledData'    
    embeds_one :valueSignature, class_name: 'FHIR::Signature'    
    embeds_one :valueTiming, class_name: 'FHIR::Timing'    
    embeds_one :valueContactDetail, class_name: 'FHIR::ContactDetail'    
    embeds_one :valueContributor, class_name: 'FHIR::Contributor'    
    embeds_one :valueDataRequirement, class_name: 'FHIR::DataRequirement'    
    embeds_one :valueExpression, class_name: 'FHIR::Expression'    
    embeds_one :valueParameterDefinition, class_name: 'FHIR::ParameterDefinition'    
    embeds_one :valueRelatedArtifact, class_name: 'FHIR::RelatedArtifact'    
    embeds_one :valueTriggerDefinition, class_name: 'FHIR::TriggerDefinition'    
    embeds_one :valueUsageContext, class_name: 'FHIR::UsageContext'    
    embeds_one :valueDosage, class_name: 'FHIR::Dosage'    
    embeds_one :valueMeta, class_name: 'FHIR::Meta'    

    def self.transform_json(json_hash, target = ElementDefinitionExample.new)
      result = self.superclass.transform_json(json_hash, target)
      result['label'] = PrimitiveString.transform_json(json_hash['label'], json_hash['_label']) unless json_hash['label'].nil?
      result['valueBase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['valueBase64Binary'], json_hash['_valueBase64Binary']) unless json_hash['valueBase64Binary'].nil?
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?
      result['valueCanonical'] = PrimitiveCanonical.transform_json(json_hash['valueCanonical'], json_hash['_valueCanonical']) unless json_hash['valueCanonical'].nil?
      result['valueCode'] = PrimitiveCode.transform_json(json_hash['valueCode'], json_hash['_valueCode']) unless json_hash['valueCode'].nil?
      result['valueDate'] = PrimitiveDate.transform_json(json_hash['valueDate'], json_hash['_valueDate']) unless json_hash['valueDate'].nil?
      result['valueDateTime'] = PrimitiveDateTime.transform_json(json_hash['valueDateTime'], json_hash['_valueDateTime']) unless json_hash['valueDateTime'].nil?
      result['valueDecimal'] = PrimitiveDecimal.transform_json(json_hash['valueDecimal'], json_hash['_valueDecimal']) unless json_hash['valueDecimal'].nil?
      result['valueId'] = PrimitiveId.transform_json(json_hash['valueId'], json_hash['_valueId']) unless json_hash['valueId'].nil?
      result['valueInstant'] = PrimitiveInstant.transform_json(json_hash['valueInstant'], json_hash['_valueInstant']) unless json_hash['valueInstant'].nil?
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?
      result['valueMarkdown'] = PrimitiveMarkdown.transform_json(json_hash['valueMarkdown'], json_hash['_valueMarkdown']) unless json_hash['valueMarkdown'].nil?
      result['valueOid'] = PrimitiveOid.transform_json(json_hash['valueOid'], json_hash['_valueOid']) unless json_hash['valueOid'].nil?
      result['valuePositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['valuePositiveInt'], json_hash['_valuePositiveInt']) unless json_hash['valuePositiveInt'].nil?
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?
      result['valueTime'] = PrimitiveTime.transform_json(json_hash['valueTime'], json_hash['_valueTime']) unless json_hash['valueTime'].nil?
      result['valueUnsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['valueUnsignedInt'], json_hash['_valueUnsignedInt']) unless json_hash['valueUnsignedInt'].nil?
      result['valueUri'] = PrimitiveUri.transform_json(json_hash['valueUri'], json_hash['_valueUri']) unless json_hash['valueUri'].nil?
      result['valueUrl'] = PrimitiveUrl.transform_json(json_hash['valueUrl'], json_hash['_valueUrl']) unless json_hash['valueUrl'].nil?
      result['valueUuid'] = PrimitiveUuid.transform_json(json_hash['valueUuid'], json_hash['_valueUuid']) unless json_hash['valueUuid'].nil?
      result['valueAddress'] = Address.transform_json(json_hash['valueAddress']) unless json_hash['valueAddress'].nil?
      result['valueAge'] = Age.transform_json(json_hash['valueAge']) unless json_hash['valueAge'].nil?
      result['valueAnnotation'] = Annotation.transform_json(json_hash['valueAnnotation']) unless json_hash['valueAnnotation'].nil?
      result['valueAttachment'] = Attachment.transform_json(json_hash['valueAttachment']) unless json_hash['valueAttachment'].nil?
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?
      result['valueCoding'] = Coding.transform_json(json_hash['valueCoding']) unless json_hash['valueCoding'].nil?
      result['valueContactPoint'] = ContactPoint.transform_json(json_hash['valueContactPoint']) unless json_hash['valueContactPoint'].nil?
      result['valueCount'] = Count.transform_json(json_hash['valueCount']) unless json_hash['valueCount'].nil?
      result['valueDistance'] = Distance.transform_json(json_hash['valueDistance']) unless json_hash['valueDistance'].nil?
      result['valueDuration'] = Duration.transform_json(json_hash['valueDuration']) unless json_hash['valueDuration'].nil?
      result['valueHumanName'] = HumanName.transform_json(json_hash['valueHumanName']) unless json_hash['valueHumanName'].nil?
      result['valueIdentifier'] = Identifier.transform_json(json_hash['valueIdentifier']) unless json_hash['valueIdentifier'].nil?
      result['valueMoney'] = Money.transform_json(json_hash['valueMoney']) unless json_hash['valueMoney'].nil?
      result['valuePeriod'] = Period.transform_json(json_hash['valuePeriod']) unless json_hash['valuePeriod'].nil?
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?
      result['valueRange'] = Range.transform_json(json_hash['valueRange']) unless json_hash['valueRange'].nil?
      result['valueRatio'] = Ratio.transform_json(json_hash['valueRatio']) unless json_hash['valueRatio'].nil?
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?
      result['valueSampledData'] = SampledData.transform_json(json_hash['valueSampledData']) unless json_hash['valueSampledData'].nil?
      result['valueSignature'] = Signature.transform_json(json_hash['valueSignature']) unless json_hash['valueSignature'].nil?
      result['valueTiming'] = Timing.transform_json(json_hash['valueTiming']) unless json_hash['valueTiming'].nil?
      result['valueContactDetail'] = ContactDetail.transform_json(json_hash['valueContactDetail']) unless json_hash['valueContactDetail'].nil?
      result['valueContributor'] = Contributor.transform_json(json_hash['valueContributor']) unless json_hash['valueContributor'].nil?
      result['valueDataRequirement'] = DataRequirement.transform_json(json_hash['valueDataRequirement']) unless json_hash['valueDataRequirement'].nil?
      result['valueExpression'] = Expression.transform_json(json_hash['valueExpression']) unless json_hash['valueExpression'].nil?
      result['valueParameterDefinition'] = ParameterDefinition.transform_json(json_hash['valueParameterDefinition']) unless json_hash['valueParameterDefinition'].nil?
      result['valueRelatedArtifact'] = RelatedArtifact.transform_json(json_hash['valueRelatedArtifact']) unless json_hash['valueRelatedArtifact'].nil?
      result['valueTriggerDefinition'] = TriggerDefinition.transform_json(json_hash['valueTriggerDefinition']) unless json_hash['valueTriggerDefinition'].nil?
      result['valueUsageContext'] = UsageContext.transform_json(json_hash['valueUsageContext']) unless json_hash['valueUsageContext'].nil?
      result['valueDosage'] = Dosage.transform_json(json_hash['valueDosage']) unless json_hash['valueDosage'].nil?
      result['valueMeta'] = Meta.transform_json(json_hash['valueMeta']) unless json_hash['valueMeta'].nil?

      result
    end
  end
end
