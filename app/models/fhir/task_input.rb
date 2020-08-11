module FHIR
  # fhir/task_input.rb
  class TaskInput < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
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
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.valueBase64Binary.nil?
        result['valueBase64Binary'] = self.valueBase64Binary.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueBase64Binary) 
        result['_valueBase64Binary'] = serialized unless serialized.nil?
      end          
      unless self.valueBoolean.nil?
        result['valueBoolean'] = self.valueBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueBoolean) 
        result['_valueBoolean'] = serialized unless serialized.nil?
      end          
      unless self.valueCanonical.nil?
        result['valueCanonical'] = self.valueCanonical.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueCanonical) 
        result['_valueCanonical'] = serialized unless serialized.nil?
      end          
      unless self.valueCode.nil?
        result['valueCode'] = self.valueCode.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueCode) 
        result['_valueCode'] = serialized unless serialized.nil?
      end          
      unless self.valueDate.nil?
        result['valueDate'] = self.valueDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueDate) 
        result['_valueDate'] = serialized unless serialized.nil?
      end          
      unless self.valueDateTime.nil?
        result['valueDateTime'] = self.valueDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueDateTime) 
        result['_valueDateTime'] = serialized unless serialized.nil?
      end          
      unless self.valueDecimal.nil?
        result['valueDecimal'] = self.valueDecimal.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueDecimal) 
        result['_valueDecimal'] = serialized unless serialized.nil?
      end          
      unless self.valueId.nil?
        result['valueId'] = self.valueId.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueId) 
        result['_valueId'] = serialized unless serialized.nil?
      end          
      unless self.valueInstant.nil?
        result['valueInstant'] = self.valueInstant.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueInstant) 
        result['_valueInstant'] = serialized unless serialized.nil?
      end          
      unless self.valueInteger.nil?
        result['valueInteger'] = self.valueInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueInteger) 
        result['_valueInteger'] = serialized unless serialized.nil?
      end          
      unless self.valueMarkdown.nil?
        result['valueMarkdown'] = self.valueMarkdown.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueMarkdown) 
        result['_valueMarkdown'] = serialized unless serialized.nil?
      end          
      unless self.valueOid.nil?
        result['valueOid'] = self.valueOid.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueOid) 
        result['_valueOid'] = serialized unless serialized.nil?
      end          
      unless self.valuePositiveInt.nil?
        result['valuePositiveInt'] = self.valuePositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.valuePositiveInt) 
        result['_valuePositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.valueString.nil?
        result['valueString'] = self.valueString.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueString) 
        result['_valueString'] = serialized unless serialized.nil?
      end          
      unless self.valueTime.nil?
        result['valueTime'] = self.valueTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueTime) 
        result['_valueTime'] = serialized unless serialized.nil?
      end          
      unless self.valueUnsignedInt.nil?
        result['valueUnsignedInt'] = self.valueUnsignedInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueUnsignedInt) 
        result['_valueUnsignedInt'] = serialized unless serialized.nil?
      end          
      unless self.valueUri.nil?
        result['valueUri'] = self.valueUri.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueUri) 
        result['_valueUri'] = serialized unless serialized.nil?
      end          
      unless self.valueUrl.nil?
        result['valueUrl'] = self.valueUrl.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueUrl) 
        result['_valueUrl'] = serialized unless serialized.nil?
      end          
      unless self.valueUuid.nil?
        result['valueUuid'] = self.valueUuid.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueUuid) 
        result['_valueUuid'] = serialized unless serialized.nil?
      end          
      unless self.valueAddress.nil?
        result['valueAddress'] = self.valueAddress.as_json(*args)                        
      end          
      unless self.valueAge.nil?
        result['valueAge'] = self.valueAge.as_json(*args)                        
      end          
      unless self.valueAnnotation.nil?
        result['valueAnnotation'] = self.valueAnnotation.as_json(*args)                        
      end          
      unless self.valueAttachment.nil?
        result['valueAttachment'] = self.valueAttachment.as_json(*args)                        
      end          
      unless self.valueCodeableConcept.nil?
        result['valueCodeableConcept'] = self.valueCodeableConcept.as_json(*args)                        
      end          
      unless self.valueCoding.nil?
        result['valueCoding'] = self.valueCoding.as_json(*args)                        
      end          
      unless self.valueContactPoint.nil?
        result['valueContactPoint'] = self.valueContactPoint.as_json(*args)                        
      end          
      unless self.valueCount.nil?
        result['valueCount'] = self.valueCount.as_json(*args)                        
      end          
      unless self.valueDistance.nil?
        result['valueDistance'] = self.valueDistance.as_json(*args)                        
      end          
      unless self.valueDuration.nil?
        result['valueDuration'] = self.valueDuration.as_json(*args)                        
      end          
      unless self.valueHumanName.nil?
        result['valueHumanName'] = self.valueHumanName.as_json(*args)                        
      end          
      unless self.valueIdentifier.nil?
        result['valueIdentifier'] = self.valueIdentifier.as_json(*args)                        
      end          
      unless self.valueMoney.nil?
        result['valueMoney'] = self.valueMoney.as_json(*args)                        
      end          
      unless self.valuePeriod.nil?
        result['valuePeriod'] = self.valuePeriod.as_json(*args)                        
      end          
      unless self.valueQuantity.nil?
        result['valueQuantity'] = self.valueQuantity.as_json(*args)                        
      end          
      unless self.valueRange.nil?
        result['valueRange'] = self.valueRange.as_json(*args)                        
      end          
      unless self.valueRatio.nil?
        result['valueRatio'] = self.valueRatio.as_json(*args)                        
      end          
      unless self.valueReference.nil?
        result['valueReference'] = self.valueReference.as_json(*args)                        
      end          
      unless self.valueSampledData.nil?
        result['valueSampledData'] = self.valueSampledData.as_json(*args)                        
      end          
      unless self.valueSignature.nil?
        result['valueSignature'] = self.valueSignature.as_json(*args)                        
      end          
      unless self.valueTiming.nil?
        result['valueTiming'] = self.valueTiming.as_json(*args)                        
      end          
      unless self.valueContactDetail.nil?
        result['valueContactDetail'] = self.valueContactDetail.as_json(*args)                        
      end          
      unless self.valueContributor.nil?
        result['valueContributor'] = self.valueContributor.as_json(*args)                        
      end          
      unless self.valueDataRequirement.nil?
        result['valueDataRequirement'] = self.valueDataRequirement.as_json(*args)                        
      end          
      unless self.valueExpression.nil?
        result['valueExpression'] = self.valueExpression.as_json(*args)                        
      end          
      unless self.valueParameterDefinition.nil?
        result['valueParameterDefinition'] = self.valueParameterDefinition.as_json(*args)                        
      end          
      unless self.valueRelatedArtifact.nil?
        result['valueRelatedArtifact'] = self.valueRelatedArtifact.as_json(*args)                        
      end          
      unless self.valueTriggerDefinition.nil?
        result['valueTriggerDefinition'] = self.valueTriggerDefinition.as_json(*args)                        
      end          
      unless self.valueUsageContext.nil?
        result['valueUsageContext'] = self.valueUsageContext.as_json(*args)                        
      end          
      unless self.valueDosage.nil?
        result['valueDosage'] = self.valueDosage.as_json(*args)                        
      end          
      unless self.valueMeta.nil?
        result['valueMeta'] = self.valueMeta.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TaskInput.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
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
