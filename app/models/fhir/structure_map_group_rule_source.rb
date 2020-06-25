module FHIR
  # fhir/structure_map_group_rule_source.rb
  class StructureMapGroupRuleSource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupRuleSource'
    embeds_one :context, class_name: 'PrimitiveId'
    embeds_one :min, class_name: 'PrimitiveInteger'
    embeds_one :max, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'PrimitiveString'
    embeds_one :defaultValuebase64Binary, class_name: 'PrimitiveBase64Binary'
    embeds_one :defaultValueboolean, class_name: 'PrimitiveBoolean'
    embeds_one :defaultValuecanonical, class_name: 'PrimitiveCanonical'
    embeds_one :defaultValuecode, class_name: 'PrimitiveCode'
    embeds_one :defaultValuedate, class_name: 'PrimitiveDate'
    embeds_one :defaultValuedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :defaultValuedecimal, class_name: 'PrimitiveDecimal'
    embeds_one :defaultValueid, class_name: 'PrimitiveId'
    embeds_one :defaultValueinstant, class_name: 'PrimitiveInstant'
    embeds_one :defaultValueinteger, class_name: 'PrimitiveInteger'
    embeds_one :defaultValuemarkdown, class_name: 'PrimitiveMarkdown'
    embeds_one :defaultValueoid, class_name: 'PrimitiveOid'
    embeds_one :defaultValuepositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :defaultValuestring, class_name: 'PrimitiveString'
    embeds_one :defaultValuetime, class_name: 'PrimitiveTime'
    embeds_one :defaultValueunsignedInt, class_name: 'PrimitiveUnsignedInt'
    embeds_one :defaultValueuri, class_name: 'PrimitiveUri'
    embeds_one :defaultValueurl, class_name: 'PrimitiveUrl'
    embeds_one :defaultValueuuid, class_name: 'PrimitiveUuid'
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
    embeds_one :element, class_name: 'PrimitiveString'
    embeds_one :listMode, class_name: 'StructureMapSourceListMode'
    embeds_one :variable, class_name: 'PrimitiveId'
    embeds_one :condition, class_name: 'PrimitiveString'
    embeds_one :check, class_name: 'PrimitiveString'
    embeds_one :logMessage, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = StructureMapGroupRuleSource.new
      result['context'] = PrimitiveId.transform_json(json_hash['context'], json_hash['_context']) unless json_hash['context'].nil?      
      result['min'] = PrimitiveInteger.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?      
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?      
      result['type'] = PrimitiveString.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?      
      result['defaultValuebase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['defaultValuebase64Binary'], json_hash['_defaultValuebase64Binary']) unless json_hash['defaultValuebase64Binary'].nil?      
      result['defaultValueboolean'] = PrimitiveBoolean.transform_json(json_hash['defaultValueboolean'], json_hash['_defaultValueboolean']) unless json_hash['defaultValueboolean'].nil?      
      result['defaultValuecanonical'] = PrimitiveCanonical.transform_json(json_hash['defaultValuecanonical'], json_hash['_defaultValuecanonical']) unless json_hash['defaultValuecanonical'].nil?      
      result['defaultValuecode'] = PrimitiveCode.transform_json(json_hash['defaultValuecode'], json_hash['_defaultValuecode']) unless json_hash['defaultValuecode'].nil?      
      result['defaultValuedate'] = PrimitiveDate.transform_json(json_hash['defaultValuedate'], json_hash['_defaultValuedate']) unless json_hash['defaultValuedate'].nil?      
      result['defaultValuedateTime'] = PrimitiveDateTime.transform_json(json_hash['defaultValuedateTime'], json_hash['_defaultValuedateTime']) unless json_hash['defaultValuedateTime'].nil?      
      result['defaultValuedecimal'] = PrimitiveDecimal.transform_json(json_hash['defaultValuedecimal'], json_hash['_defaultValuedecimal']) unless json_hash['defaultValuedecimal'].nil?      
      result['defaultValueid'] = PrimitiveId.transform_json(json_hash['defaultValueid'], json_hash['_defaultValueid']) unless json_hash['defaultValueid'].nil?      
      result['defaultValueinstant'] = PrimitiveInstant.transform_json(json_hash['defaultValueinstant'], json_hash['_defaultValueinstant']) unless json_hash['defaultValueinstant'].nil?      
      result['defaultValueinteger'] = PrimitiveInteger.transform_json(json_hash['defaultValueinteger'], json_hash['_defaultValueinteger']) unless json_hash['defaultValueinteger'].nil?      
      result['defaultValuemarkdown'] = PrimitiveMarkdown.transform_json(json_hash['defaultValuemarkdown'], json_hash['_defaultValuemarkdown']) unless json_hash['defaultValuemarkdown'].nil?      
      result['defaultValueoid'] = PrimitiveOid.transform_json(json_hash['defaultValueoid'], json_hash['_defaultValueoid']) unless json_hash['defaultValueoid'].nil?      
      result['defaultValuepositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['defaultValuepositiveInt'], json_hash['_defaultValuepositiveInt']) unless json_hash['defaultValuepositiveInt'].nil?      
      result['defaultValuestring'] = PrimitiveString.transform_json(json_hash['defaultValuestring'], json_hash['_defaultValuestring']) unless json_hash['defaultValuestring'].nil?      
      result['defaultValuetime'] = PrimitiveTime.transform_json(json_hash['defaultValuetime'], json_hash['_defaultValuetime']) unless json_hash['defaultValuetime'].nil?      
      result['defaultValueunsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['defaultValueunsignedInt'], json_hash['_defaultValueunsignedInt']) unless json_hash['defaultValueunsignedInt'].nil?      
      result['defaultValueuri'] = PrimitiveUri.transform_json(json_hash['defaultValueuri'], json_hash['_defaultValueuri']) unless json_hash['defaultValueuri'].nil?      
      result['defaultValueurl'] = PrimitiveUrl.transform_json(json_hash['defaultValueurl'], json_hash['_defaultValueurl']) unless json_hash['defaultValueurl'].nil?      
      result['defaultValueuuid'] = PrimitiveUuid.transform_json(json_hash['defaultValueuuid'], json_hash['_defaultValueuuid']) unless json_hash['defaultValueuuid'].nil?      
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
      result['element'] = PrimitiveString.transform_json(json_hash['element'], json_hash['_element']) unless json_hash['element'].nil?      
      result['listMode'] = StructureMapSourceListMode.transform_json(json_hash['listMode']) unless json_hash['listMode'].nil?      
      result['variable'] = PrimitiveId.transform_json(json_hash['variable'], json_hash['_variable']) unless json_hash['variable'].nil?      
      result['condition'] = PrimitiveString.transform_json(json_hash['condition'], json_hash['_condition']) unless json_hash['condition'].nil?      
      result['check'] = PrimitiveString.transform_json(json_hash['check'], json_hash['_check']) unless json_hash['check'].nil?      
      result['logMessage'] = PrimitiveString.transform_json(json_hash['logMessage'], json_hash['_logMessage']) unless json_hash['logMessage'].nil?      

      result
    end
  end
end
