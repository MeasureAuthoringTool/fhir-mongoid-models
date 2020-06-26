module FHIR
  # fhir/element_definition.rb
  class ElementDefinition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinition'
    embeds_one :path, class_name: 'PrimitiveString'
    embeds_many :representation, class_name: 'PropertyRepresentation'
    embeds_one :sliceName, class_name: 'PrimitiveString'
    embeds_one :sliceIsConstraining, class_name: 'PrimitiveBoolean'
    embeds_one :label, class_name: 'PrimitiveString'
    embeds_many :code, class_name: 'Coding'
    embeds_one :slicing, class_name: 'ElementDefinitionSlicing'
    embeds_one :short, class_name: 'PrimitiveString'
    embeds_one :definition, class_name: 'PrimitiveMarkdown'
    embeds_one :comment, class_name: 'PrimitiveMarkdown'
    embeds_one :requirements, class_name: 'PrimitiveMarkdown'
    embeds_many :alias, class_name: 'PrimitiveString'
    embeds_one :min, class_name: 'PrimitiveUnsignedInt'
    embeds_one :max, class_name: 'PrimitiveString'
    embeds_one :base, class_name: 'ElementDefinitionBase'
    embeds_one :contentReference, class_name: 'PrimitiveUri'
    embeds_many :type, class_name: 'ElementDefinitionType'
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
    embeds_one :meaningWhenMissing, class_name: 'PrimitiveMarkdown'
    embeds_one :orderMeaning, class_name: 'PrimitiveString'
    embeds_one :fixedbase64Binary, class_name: 'PrimitiveBase64Binary'
    embeds_one :fixedboolean, class_name: 'PrimitiveBoolean'
    embeds_one :fixedcanonical, class_name: 'PrimitiveCanonical'
    embeds_one :fixedcode, class_name: 'PrimitiveCode'
    embeds_one :fixeddate, class_name: 'PrimitiveDate'
    embeds_one :fixeddateTime, class_name: 'PrimitiveDateTime'
    embeds_one :fixeddecimal, class_name: 'PrimitiveDecimal'
    embeds_one :fixedid, class_name: 'PrimitiveId'
    embeds_one :fixedinstant, class_name: 'PrimitiveInstant'
    embeds_one :fixedinteger, class_name: 'PrimitiveInteger'
    embeds_one :fixedmarkdown, class_name: 'PrimitiveMarkdown'
    embeds_one :fixedoid, class_name: 'PrimitiveOid'
    embeds_one :fixedpositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :fixedstring, class_name: 'PrimitiveString'
    embeds_one :fixedtime, class_name: 'PrimitiveTime'
    embeds_one :fixedunsignedInt, class_name: 'PrimitiveUnsignedInt'
    embeds_one :fixeduri, class_name: 'PrimitiveUri'
    embeds_one :fixedurl, class_name: 'PrimitiveUrl'
    embeds_one :fixeduuid, class_name: 'PrimitiveUuid'
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
    embeds_one :patternbase64Binary, class_name: 'PrimitiveBase64Binary'
    embeds_one :patternboolean, class_name: 'PrimitiveBoolean'
    embeds_one :patterncanonical, class_name: 'PrimitiveCanonical'
    embeds_one :patterncode, class_name: 'PrimitiveCode'
    embeds_one :patterndate, class_name: 'PrimitiveDate'
    embeds_one :patterndateTime, class_name: 'PrimitiveDateTime'
    embeds_one :patterndecimal, class_name: 'PrimitiveDecimal'
    embeds_one :patternid, class_name: 'PrimitiveId'
    embeds_one :patterninstant, class_name: 'PrimitiveInstant'
    embeds_one :patterninteger, class_name: 'PrimitiveInteger'
    embeds_one :patternmarkdown, class_name: 'PrimitiveMarkdown'
    embeds_one :patternoid, class_name: 'PrimitiveOid'
    embeds_one :patternpositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :patternstring, class_name: 'PrimitiveString'
    embeds_one :patterntime, class_name: 'PrimitiveTime'
    embeds_one :patternunsignedInt, class_name: 'PrimitiveUnsignedInt'
    embeds_one :patternuri, class_name: 'PrimitiveUri'
    embeds_one :patternurl, class_name: 'PrimitiveUrl'
    embeds_one :patternuuid, class_name: 'PrimitiveUuid'
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
    embeds_one :minValuedate, class_name: 'PrimitiveDate'
    embeds_one :minValuedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :minValueinstant, class_name: 'PrimitiveInstant'
    embeds_one :minValuetime, class_name: 'PrimitiveTime'
    embeds_one :minValuedecimal, class_name: 'PrimitiveDecimal'
    embeds_one :minValueinteger, class_name: 'PrimitiveInteger'
    embeds_one :minValuepositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :minValueunsignedInt, class_name: 'PrimitiveUnsignedInt'
    embeds_one :minValueQuantity, class_name: 'Quantity'
    embeds_one :maxValuedate, class_name: 'PrimitiveDate'
    embeds_one :maxValuedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :maxValueinstant, class_name: 'PrimitiveInstant'
    embeds_one :maxValuetime, class_name: 'PrimitiveTime'
    embeds_one :maxValuedecimal, class_name: 'PrimitiveDecimal'
    embeds_one :maxValueinteger, class_name: 'PrimitiveInteger'
    embeds_one :maxValuepositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :maxValueunsignedInt, class_name: 'PrimitiveUnsignedInt'
    embeds_one :maxValueQuantity, class_name: 'Quantity'
    embeds_one :maxLength, class_name: 'PrimitiveInteger'
    embeds_many :condition, class_name: 'PrimitiveId'
    embeds_many :constraint, class_name: 'ElementDefinitionConstraint'
    embeds_one :mustSupport, class_name: 'PrimitiveBoolean'
    embeds_one :isModifier, class_name: 'PrimitiveBoolean'
    embeds_one :isModifierReason, class_name: 'PrimitiveString'
    embeds_one :isSummary, class_name: 'PrimitiveBoolean'
    embeds_one :binding, class_name: 'ElementDefinitionBinding'
    embeds_many :mapping, class_name: 'ElementDefinitionMapping'

    def self.transform_json(json_hash)
      result = ElementDefinition.new
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
      result['meaningWhenMissing'] = PrimitiveMarkdown.transform_json(json_hash['meaningWhenMissing'], json_hash['_meaningWhenMissing']) unless json_hash['meaningWhenMissing'].nil?      
      result['orderMeaning'] = PrimitiveString.transform_json(json_hash['orderMeaning'], json_hash['_orderMeaning']) unless json_hash['orderMeaning'].nil?      
      result['fixedbase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['fixedbase64Binary'], json_hash['_fixedbase64Binary']) unless json_hash['fixedbase64Binary'].nil?      
      result['fixedboolean'] = PrimitiveBoolean.transform_json(json_hash['fixedboolean'], json_hash['_fixedboolean']) unless json_hash['fixedboolean'].nil?      
      result['fixedcanonical'] = PrimitiveCanonical.transform_json(json_hash['fixedcanonical'], json_hash['_fixedcanonical']) unless json_hash['fixedcanonical'].nil?      
      result['fixedcode'] = PrimitiveCode.transform_json(json_hash['fixedcode'], json_hash['_fixedcode']) unless json_hash['fixedcode'].nil?      
      result['fixeddate'] = PrimitiveDate.transform_json(json_hash['fixeddate'], json_hash['_fixeddate']) unless json_hash['fixeddate'].nil?      
      result['fixeddateTime'] = PrimitiveDateTime.transform_json(json_hash['fixeddateTime'], json_hash['_fixeddateTime']) unless json_hash['fixeddateTime'].nil?      
      result['fixeddecimal'] = PrimitiveDecimal.transform_json(json_hash['fixeddecimal'], json_hash['_fixeddecimal']) unless json_hash['fixeddecimal'].nil?      
      result['fixedid'] = PrimitiveId.transform_json(json_hash['fixedid'], json_hash['_fixedid']) unless json_hash['fixedid'].nil?      
      result['fixedinstant'] = PrimitiveInstant.transform_json(json_hash['fixedinstant'], json_hash['_fixedinstant']) unless json_hash['fixedinstant'].nil?      
      result['fixedinteger'] = PrimitiveInteger.transform_json(json_hash['fixedinteger'], json_hash['_fixedinteger']) unless json_hash['fixedinteger'].nil?      
      result['fixedmarkdown'] = PrimitiveMarkdown.transform_json(json_hash['fixedmarkdown'], json_hash['_fixedmarkdown']) unless json_hash['fixedmarkdown'].nil?      
      result['fixedoid'] = PrimitiveOid.transform_json(json_hash['fixedoid'], json_hash['_fixedoid']) unless json_hash['fixedoid'].nil?      
      result['fixedpositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['fixedpositiveInt'], json_hash['_fixedpositiveInt']) unless json_hash['fixedpositiveInt'].nil?      
      result['fixedstring'] = PrimitiveString.transform_json(json_hash['fixedstring'], json_hash['_fixedstring']) unless json_hash['fixedstring'].nil?      
      result['fixedtime'] = PrimitiveTime.transform_json(json_hash['fixedtime'], json_hash['_fixedtime']) unless json_hash['fixedtime'].nil?      
      result['fixedunsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['fixedunsignedInt'], json_hash['_fixedunsignedInt']) unless json_hash['fixedunsignedInt'].nil?      
      result['fixeduri'] = PrimitiveUri.transform_json(json_hash['fixeduri'], json_hash['_fixeduri']) unless json_hash['fixeduri'].nil?      
      result['fixedurl'] = PrimitiveUrl.transform_json(json_hash['fixedurl'], json_hash['_fixedurl']) unless json_hash['fixedurl'].nil?      
      result['fixeduuid'] = PrimitiveUuid.transform_json(json_hash['fixeduuid'], json_hash['_fixeduuid']) unless json_hash['fixeduuid'].nil?      
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
      result['patternbase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['patternbase64Binary'], json_hash['_patternbase64Binary']) unless json_hash['patternbase64Binary'].nil?      
      result['patternboolean'] = PrimitiveBoolean.transform_json(json_hash['patternboolean'], json_hash['_patternboolean']) unless json_hash['patternboolean'].nil?      
      result['patterncanonical'] = PrimitiveCanonical.transform_json(json_hash['patterncanonical'], json_hash['_patterncanonical']) unless json_hash['patterncanonical'].nil?      
      result['patterncode'] = PrimitiveCode.transform_json(json_hash['patterncode'], json_hash['_patterncode']) unless json_hash['patterncode'].nil?      
      result['patterndate'] = PrimitiveDate.transform_json(json_hash['patterndate'], json_hash['_patterndate']) unless json_hash['patterndate'].nil?      
      result['patterndateTime'] = PrimitiveDateTime.transform_json(json_hash['patterndateTime'], json_hash['_patterndateTime']) unless json_hash['patterndateTime'].nil?      
      result['patterndecimal'] = PrimitiveDecimal.transform_json(json_hash['patterndecimal'], json_hash['_patterndecimal']) unless json_hash['patterndecimal'].nil?      
      result['patternid'] = PrimitiveId.transform_json(json_hash['patternid'], json_hash['_patternid']) unless json_hash['patternid'].nil?      
      result['patterninstant'] = PrimitiveInstant.transform_json(json_hash['patterninstant'], json_hash['_patterninstant']) unless json_hash['patterninstant'].nil?      
      result['patterninteger'] = PrimitiveInteger.transform_json(json_hash['patterninteger'], json_hash['_patterninteger']) unless json_hash['patterninteger'].nil?      
      result['patternmarkdown'] = PrimitiveMarkdown.transform_json(json_hash['patternmarkdown'], json_hash['_patternmarkdown']) unless json_hash['patternmarkdown'].nil?      
      result['patternoid'] = PrimitiveOid.transform_json(json_hash['patternoid'], json_hash['_patternoid']) unless json_hash['patternoid'].nil?      
      result['patternpositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['patternpositiveInt'], json_hash['_patternpositiveInt']) unless json_hash['patternpositiveInt'].nil?      
      result['patternstring'] = PrimitiveString.transform_json(json_hash['patternstring'], json_hash['_patternstring']) unless json_hash['patternstring'].nil?      
      result['patterntime'] = PrimitiveTime.transform_json(json_hash['patterntime'], json_hash['_patterntime']) unless json_hash['patterntime'].nil?      
      result['patternunsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['patternunsignedInt'], json_hash['_patternunsignedInt']) unless json_hash['patternunsignedInt'].nil?      
      result['patternuri'] = PrimitiveUri.transform_json(json_hash['patternuri'], json_hash['_patternuri']) unless json_hash['patternuri'].nil?      
      result['patternurl'] = PrimitiveUrl.transform_json(json_hash['patternurl'], json_hash['_patternurl']) unless json_hash['patternurl'].nil?      
      result['patternuuid'] = PrimitiveUuid.transform_json(json_hash['patternuuid'], json_hash['_patternuuid']) unless json_hash['patternuuid'].nil?      
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
      result['minValuedate'] = PrimitiveDate.transform_json(json_hash['minValuedate'], json_hash['_minValuedate']) unless json_hash['minValuedate'].nil?      
      result['minValuedateTime'] = PrimitiveDateTime.transform_json(json_hash['minValuedateTime'], json_hash['_minValuedateTime']) unless json_hash['minValuedateTime'].nil?      
      result['minValueinstant'] = PrimitiveInstant.transform_json(json_hash['minValueinstant'], json_hash['_minValueinstant']) unless json_hash['minValueinstant'].nil?      
      result['minValuetime'] = PrimitiveTime.transform_json(json_hash['minValuetime'], json_hash['_minValuetime']) unless json_hash['minValuetime'].nil?      
      result['minValuedecimal'] = PrimitiveDecimal.transform_json(json_hash['minValuedecimal'], json_hash['_minValuedecimal']) unless json_hash['minValuedecimal'].nil?      
      result['minValueinteger'] = PrimitiveInteger.transform_json(json_hash['minValueinteger'], json_hash['_minValueinteger']) unless json_hash['minValueinteger'].nil?      
      result['minValuepositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['minValuepositiveInt'], json_hash['_minValuepositiveInt']) unless json_hash['minValuepositiveInt'].nil?      
      result['minValueunsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['minValueunsignedInt'], json_hash['_minValueunsignedInt']) unless json_hash['minValueunsignedInt'].nil?      
      result['minValueQuantity'] = Quantity.transform_json(json_hash['minValueQuantity']) unless json_hash['minValueQuantity'].nil?      
      result['maxValuedate'] = PrimitiveDate.transform_json(json_hash['maxValuedate'], json_hash['_maxValuedate']) unless json_hash['maxValuedate'].nil?      
      result['maxValuedateTime'] = PrimitiveDateTime.transform_json(json_hash['maxValuedateTime'], json_hash['_maxValuedateTime']) unless json_hash['maxValuedateTime'].nil?      
      result['maxValueinstant'] = PrimitiveInstant.transform_json(json_hash['maxValueinstant'], json_hash['_maxValueinstant']) unless json_hash['maxValueinstant'].nil?      
      result['maxValuetime'] = PrimitiveTime.transform_json(json_hash['maxValuetime'], json_hash['_maxValuetime']) unless json_hash['maxValuetime'].nil?      
      result['maxValuedecimal'] = PrimitiveDecimal.transform_json(json_hash['maxValuedecimal'], json_hash['_maxValuedecimal']) unless json_hash['maxValuedecimal'].nil?      
      result['maxValueinteger'] = PrimitiveInteger.transform_json(json_hash['maxValueinteger'], json_hash['_maxValueinteger']) unless json_hash['maxValueinteger'].nil?      
      result['maxValuepositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['maxValuepositiveInt'], json_hash['_maxValuepositiveInt']) unless json_hash['maxValuepositiveInt'].nil?      
      result['maxValueunsignedInt'] = PrimitiveUnsignedInt.transform_json(json_hash['maxValueunsignedInt'], json_hash['_maxValueunsignedInt']) unless json_hash['maxValueunsignedInt'].nil?      
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
