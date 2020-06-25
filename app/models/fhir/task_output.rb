module FHIR
  # fhir/task_output.rb
  class TaskOutput < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TaskOutput'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :valuebase64Binary, class_name: 'PrimitiveBase64Binary'
    embeds_one :valueboolean, class_name: 'PrimitiveBoolean'
    embeds_one :valuecanonical, class_name: 'PrimitiveCanonical'
    embeds_one :valuecode, class_name: 'PrimitiveCode'
    embeds_one :valuedate, class_name: 'PrimitiveDate'
    embeds_one :valuedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :valuedecimal, class_name: 'PrimitiveDecimal'
    embeds_one :valueid, class_name: 'PrimitiveId'
    embeds_one :valueinstant, class_name: 'PrimitiveInstant'
    embeds_one :valueinteger, class_name: 'PrimitiveInteger'
    embeds_one :valuemarkdown, class_name: 'PrimitiveMarkdown'
    embeds_one :valueoid, class_name: 'PrimitiveOid'
    embeds_one :valuepositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :valuestring, class_name: 'PrimitiveString'
    embeds_one :valuetime, class_name: 'PrimitiveTime'
    embeds_one :valueunsignedInt, class_name: 'PrimitiveUnsignedInt'
    embeds_one :valueuri, class_name: 'PrimitiveUri'
    embeds_one :valueurl, class_name: 'PrimitiveUrl'
    embeds_one :valueuuid, class_name: 'PrimitiveUuid'
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

    def self.transform_json(json_hash)
      result = TaskOutput.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['valuebase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['valuebase64Binary'], json_hash['_valuebase64Binary']) unless json_hash['valuebase64Binary'].nil?      
      result['valueboolean'] = PrimitiveBoolean.transform_json(json_hash['valueboolean'], json_hash['_valueboolean']) unless json_hash['valueboolean'].nil?      
      result['valuecanonical'] = PrimitiveCanonical.transform_json(json_hash['valuecanonical'], json_hash['_valuecanonical']) unless json_hash['valuecanonical'].nil?      
      result['valuecode'] = PrimitiveCode.transform_json(json_hash['valuecode'], json_hash['_valuecode']) unless json_hash['valuecode'].nil?      
      result['valuedate'] = PrimitiveDate.transform_json(json_hash['valuedate'], json_hash['_valuedate']) unless json_hash['valuedate'].nil?      
      result['valuedateTime'] = PrimitiveDateTime.transform_json(json_hash['valuedateTime'], json_hash['_valuedateTime']) unless json_hash['valuedateTime'].nil?      
      result['valuedecimal'] = PrimitiveDecimal.transform_json(json_hash['valuedecimal'], json_hash['_valuedecimal']) unless json_hash['valuedecimal'].nil?      
      result['valueid'] = PrimitiveId.transform_json(json_hash['valueid'], json_hash['_valueid']) unless json_hash['valueid'].nil?      
      result['valueinstant'] = PrimitiveInstant.transform_json(json_hash['valueinstant'], json_hash['_valueinstant']) unless json_hash['valueinstant'].nil?      
      result['valueinteger'] = PrimitiveInteger.transform_json(json_hash['valueinteger'], json_hash['_valueinteger']) unless json_hash['valueinteger'].nil?      
      result['valuemarkdown'] = PrimitiveMarkdown.transform_json(json_hash['valuemarkdown'], json_hash['_valuemarkdown']) unless json_hash['valuemarkdown'].nil?      
      result['valueoid'] = PrimitiveOid.transform_json(json_hash['valueoid'], json_hash['_valueoid']) unless json_hash['valueoid'].nil?      
      result['valuepositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['valuepositiveInt'], json_hash['_valuepositiveInt']) unless json_hash['valuepositiveInt'].nil?      
      result['valuestring'] = PrimitiveString.transform_json(json_hash['valuestring'], json_hash['_valuestring']) unless json_hash['valuestring'].nil?      
      result['valuetime'] = PrimitiveTime.transform_json(json_hash['valuetime'], json_hash['_valuetime']) unless json_hash['valuetime'].nil?      
      result['valueunsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['valueunsignedInt'], json_hash['_valueunsignedInt']) unless json_hash['valueunsignedInt'].nil?      
      result['valueuri'] = PrimitiveUri.transform_json(json_hash['valueuri'], json_hash['_valueuri']) unless json_hash['valueuri'].nil?      
      result['valueurl'] = PrimitiveUrl.transform_json(json_hash['valueurl'], json_hash['_valueurl']) unless json_hash['valueurl'].nil?      
      result['valueuuid'] = PrimitiveUuid.transform_json(json_hash['valueuuid'], json_hash['_valueuuid']) unless json_hash['valueuuid'].nil?      
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
