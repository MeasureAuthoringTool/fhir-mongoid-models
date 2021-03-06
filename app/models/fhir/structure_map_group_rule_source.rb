module FHIR
  # fhir/structure_map_group_rule_source.rb
  class StructureMapGroupRuleSource < BackboneElement
    include Mongoid::Document
    embeds_one :context, class_name: 'FHIR::PrimitiveId'    
    embeds_one :min, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :max, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::PrimitiveString'    
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
    embeds_one :element, class_name: 'FHIR::PrimitiveString'    
    embeds_one :listMode, class_name: 'FHIR::StructureMapSourceListMode'    
    embeds_one :variable, class_name: 'FHIR::PrimitiveId'    
    embeds_one :condition, class_name: 'FHIR::PrimitiveString'    
    embeds_one :check, class_name: 'FHIR::PrimitiveString'    
    embeds_one :logMessage, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.context.nil? 
        result['context'] = self.context.value
        serialized = Extension.serializePrimitiveExtension(self.context)            
        result['_context'] = serialized unless serialized.nil?
      end
      unless self.min.nil? 
        result['min'] = self.min.value
        serialized = Extension.serializePrimitiveExtension(self.min)            
        result['_min'] = serialized unless serialized.nil?
      end
      unless self.max.nil? 
        result['max'] = self.max.value
        serialized = Extension.serializePrimitiveExtension(self.max)            
        result['_max'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.defaultValueBase64Binary.nil?
        result['defaultValueBase64Binary'] = self.defaultValueBase64Binary.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueBase64Binary) 
        result['_defaultValueBase64Binary'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueBoolean.nil?
        result['defaultValueBoolean'] = self.defaultValueBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueBoolean) 
        result['_defaultValueBoolean'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueCanonical.nil?
        result['defaultValueCanonical'] = self.defaultValueCanonical.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueCanonical) 
        result['_defaultValueCanonical'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueCode.nil?
        result['defaultValueCode'] = self.defaultValueCode.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueCode) 
        result['_defaultValueCode'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueDate.nil?
        result['defaultValueDate'] = self.defaultValueDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueDate) 
        result['_defaultValueDate'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueDateTime.nil?
        result['defaultValueDateTime'] = self.defaultValueDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueDateTime) 
        result['_defaultValueDateTime'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueDecimal.nil?
        result['defaultValueDecimal'] = self.defaultValueDecimal.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueDecimal) 
        result['_defaultValueDecimal'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueId.nil?
        result['defaultValueId'] = self.defaultValueId.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueId) 
        result['_defaultValueId'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueInstant.nil?
        result['defaultValueInstant'] = self.defaultValueInstant.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueInstant) 
        result['_defaultValueInstant'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueInteger.nil?
        result['defaultValueInteger'] = self.defaultValueInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueInteger) 
        result['_defaultValueInteger'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueMarkdown.nil?
        result['defaultValueMarkdown'] = self.defaultValueMarkdown.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueMarkdown) 
        result['_defaultValueMarkdown'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueOid.nil?
        result['defaultValueOid'] = self.defaultValueOid.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueOid) 
        result['_defaultValueOid'] = serialized unless serialized.nil?
      end          
      unless self.defaultValuePositiveInt.nil?
        result['defaultValuePositiveInt'] = self.defaultValuePositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValuePositiveInt) 
        result['_defaultValuePositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueString.nil?
        result['defaultValueString'] = self.defaultValueString.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueString) 
        result['_defaultValueString'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueTime.nil?
        result['defaultValueTime'] = self.defaultValueTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueTime) 
        result['_defaultValueTime'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueUnsignedInt.nil?
        result['defaultValueUnsignedInt'] = self.defaultValueUnsignedInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueUnsignedInt) 
        result['_defaultValueUnsignedInt'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueUri.nil?
        result['defaultValueUri'] = self.defaultValueUri.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueUri) 
        result['_defaultValueUri'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueUrl.nil?
        result['defaultValueUrl'] = self.defaultValueUrl.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueUrl) 
        result['_defaultValueUrl'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueUuid.nil?
        result['defaultValueUuid'] = self.defaultValueUuid.value                        
        serialized = Extension.serializePrimitiveExtension(self.defaultValueUuid) 
        result['_defaultValueUuid'] = serialized unless serialized.nil?
      end          
      unless self.defaultValueAddress.nil?
        result['defaultValueAddress'] = self.defaultValueAddress.as_json(*args)                        
      end          
      unless self.defaultValueAge.nil?
        result['defaultValueAge'] = self.defaultValueAge.as_json(*args)                        
      end          
      unless self.defaultValueAnnotation.nil?
        result['defaultValueAnnotation'] = self.defaultValueAnnotation.as_json(*args)                        
      end          
      unless self.defaultValueAttachment.nil?
        result['defaultValueAttachment'] = self.defaultValueAttachment.as_json(*args)                        
      end          
      unless self.defaultValueCodeableConcept.nil?
        result['defaultValueCodeableConcept'] = self.defaultValueCodeableConcept.as_json(*args)                        
      end          
      unless self.defaultValueCoding.nil?
        result['defaultValueCoding'] = self.defaultValueCoding.as_json(*args)                        
      end          
      unless self.defaultValueContactPoint.nil?
        result['defaultValueContactPoint'] = self.defaultValueContactPoint.as_json(*args)                        
      end          
      unless self.defaultValueCount.nil?
        result['defaultValueCount'] = self.defaultValueCount.as_json(*args)                        
      end          
      unless self.defaultValueDistance.nil?
        result['defaultValueDistance'] = self.defaultValueDistance.as_json(*args)                        
      end          
      unless self.defaultValueDuration.nil?
        result['defaultValueDuration'] = self.defaultValueDuration.as_json(*args)                        
      end          
      unless self.defaultValueHumanName.nil?
        result['defaultValueHumanName'] = self.defaultValueHumanName.as_json(*args)                        
      end          
      unless self.defaultValueIdentifier.nil?
        result['defaultValueIdentifier'] = self.defaultValueIdentifier.as_json(*args)                        
      end          
      unless self.defaultValueMoney.nil?
        result['defaultValueMoney'] = self.defaultValueMoney.as_json(*args)                        
      end          
      unless self.defaultValuePeriod.nil?
        result['defaultValuePeriod'] = self.defaultValuePeriod.as_json(*args)                        
      end          
      unless self.defaultValueQuantity.nil?
        result['defaultValueQuantity'] = self.defaultValueQuantity.as_json(*args)                        
      end          
      unless self.defaultValueRange.nil?
        result['defaultValueRange'] = self.defaultValueRange.as_json(*args)                        
      end          
      unless self.defaultValueRatio.nil?
        result['defaultValueRatio'] = self.defaultValueRatio.as_json(*args)                        
      end          
      unless self.defaultValueReference.nil?
        result['defaultValueReference'] = self.defaultValueReference.as_json(*args)                        
      end          
      unless self.defaultValueSampledData.nil?
        result['defaultValueSampledData'] = self.defaultValueSampledData.as_json(*args)                        
      end          
      unless self.defaultValueSignature.nil?
        result['defaultValueSignature'] = self.defaultValueSignature.as_json(*args)                        
      end          
      unless self.defaultValueTiming.nil?
        result['defaultValueTiming'] = self.defaultValueTiming.as_json(*args)                        
      end          
      unless self.defaultValueContactDetail.nil?
        result['defaultValueContactDetail'] = self.defaultValueContactDetail.as_json(*args)                        
      end          
      unless self.defaultValueContributor.nil?
        result['defaultValueContributor'] = self.defaultValueContributor.as_json(*args)                        
      end          
      unless self.defaultValueDataRequirement.nil?
        result['defaultValueDataRequirement'] = self.defaultValueDataRequirement.as_json(*args)                        
      end          
      unless self.defaultValueExpression.nil?
        result['defaultValueExpression'] = self.defaultValueExpression.as_json(*args)                        
      end          
      unless self.defaultValueParameterDefinition.nil?
        result['defaultValueParameterDefinition'] = self.defaultValueParameterDefinition.as_json(*args)                        
      end          
      unless self.defaultValueRelatedArtifact.nil?
        result['defaultValueRelatedArtifact'] = self.defaultValueRelatedArtifact.as_json(*args)                        
      end          
      unless self.defaultValueTriggerDefinition.nil?
        result['defaultValueTriggerDefinition'] = self.defaultValueTriggerDefinition.as_json(*args)                        
      end          
      unless self.defaultValueUsageContext.nil?
        result['defaultValueUsageContext'] = self.defaultValueUsageContext.as_json(*args)                        
      end          
      unless self.defaultValueDosage.nil?
        result['defaultValueDosage'] = self.defaultValueDosage.as_json(*args)                        
      end          
      unless self.defaultValueMeta.nil?
        result['defaultValueMeta'] = self.defaultValueMeta.as_json(*args)                        
      end          
      unless self.element.nil? 
        result['element'] = self.element.value
        serialized = Extension.serializePrimitiveExtension(self.element)            
        result['_element'] = serialized unless serialized.nil?
      end
      unless self.listMode.nil? 
        result['listMode'] = self.listMode.value
        serialized = Extension.serializePrimitiveExtension(self.listMode)            
        result['_listMode'] = serialized unless serialized.nil?
      end
      unless self.variable.nil? 
        result['variable'] = self.variable.value
        serialized = Extension.serializePrimitiveExtension(self.variable)            
        result['_variable'] = serialized unless serialized.nil?
      end
      unless self.condition.nil? 
        result['condition'] = self.condition.value
        serialized = Extension.serializePrimitiveExtension(self.condition)            
        result['_condition'] = serialized unless serialized.nil?
      end
      unless self.check.nil? 
        result['check'] = self.check.value
        serialized = Extension.serializePrimitiveExtension(self.check)            
        result['_check'] = serialized unless serialized.nil?
      end
      unless self.logMessage.nil? 
        result['logMessage'] = self.logMessage.value
        serialized = Extension.serializePrimitiveExtension(self.logMessage)            
        result['_logMessage'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = StructureMapGroupRuleSource.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['context'] = PrimitiveId.transform_json(json_hash['context'], json_hash['_context']) unless json_hash['context'].nil?
      result['min'] = PrimitiveInteger.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?
      result['type'] = PrimitiveString.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
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
      result['element'] = PrimitiveString.transform_json(json_hash['element'], json_hash['_element']) unless json_hash['element'].nil?
      result['listMode'] = StructureMapSourceListMode.transform_json(json_hash['listMode'], json_hash['_listMode']) unless json_hash['listMode'].nil?
      result['variable'] = PrimitiveId.transform_json(json_hash['variable'], json_hash['_variable']) unless json_hash['variable'].nil?
      result['condition'] = PrimitiveString.transform_json(json_hash['condition'], json_hash['_condition']) unless json_hash['condition'].nil?
      result['check'] = PrimitiveString.transform_json(json_hash['check'], json_hash['_check']) unless json_hash['check'].nil?
      result['logMessage'] = PrimitiveString.transform_json(json_hash['logMessage'], json_hash['_logMessage']) unless json_hash['logMessage'].nil?

      result
    end
  end
end
