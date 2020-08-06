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
    
    def as_json(*args)
      result = super      
      unless self.path.nil? 
        result['path'] = self.path.value
        serialized = Extension.serializePrimitiveExtension(self.path)            
        result['_path'] = serialized unless serialized.nil?
      end
      unless self.representation.nil?  || !self.representation.any? 
        result['representation'] = self.representation.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.representation)                              
        result['_representation'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.sliceName.nil? 
        result['sliceName'] = self.sliceName.value
        serialized = Extension.serializePrimitiveExtension(self.sliceName)            
        result['_sliceName'] = serialized unless serialized.nil?
      end
      unless self.sliceIsConstraining.nil? 
        result['sliceIsConstraining'] = self.sliceIsConstraining.value
        serialized = Extension.serializePrimitiveExtension(self.sliceIsConstraining)            
        result['_sliceIsConstraining'] = serialized unless serialized.nil?
      end
      unless self.label.nil? 
        result['label'] = self.label.value
        serialized = Extension.serializePrimitiveExtension(self.label)            
        result['_label'] = serialized unless serialized.nil?
      end
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      unless self.slicing.nil? 
        result['slicing'] = self.slicing.as_json(*args)
      end
      unless self.short.nil? 
        result['short'] = self.short.value
        serialized = Extension.serializePrimitiveExtension(self.short)            
        result['_short'] = serialized unless serialized.nil?
      end
      unless self.definition.nil? 
        result['definition'] = self.definition.value
        serialized = Extension.serializePrimitiveExtension(self.definition)            
        result['_definition'] = serialized unless serialized.nil?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      unless self.requirements.nil? 
        result['requirements'] = self.requirements.value
        serialized = Extension.serializePrimitiveExtension(self.requirements)            
        result['_requirements'] = serialized unless serialized.nil?
      end
      unless self.alias.nil?  || !self.alias.any? 
        result['alias'] = self.alias.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.alias)                              
        result['_alias'] = serialized unless serialized.nil? || !serialized.any?
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
      unless self.base.nil? 
        result['base'] = self.base.as_json(*args)
      end
      unless self.contentReference.nil? 
        result['contentReference'] = self.contentReference.value
        serialized = Extension.serializePrimitiveExtension(self.contentReference)            
        result['_contentReference'] = serialized unless serialized.nil?
      end
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
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
      unless self.meaningWhenMissing.nil? 
        result['meaningWhenMissing'] = self.meaningWhenMissing.value
        serialized = Extension.serializePrimitiveExtension(self.meaningWhenMissing)            
        result['_meaningWhenMissing'] = serialized unless serialized.nil?
      end
      unless self.orderMeaning.nil? 
        result['orderMeaning'] = self.orderMeaning.value
        serialized = Extension.serializePrimitiveExtension(self.orderMeaning)            
        result['_orderMeaning'] = serialized unless serialized.nil?
      end
      unless self.fixedBase64Binary.nil?
        result['fixedBase64Binary'] = self.fixedBase64Binary.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedBase64Binary) 
        result['_fixedBase64Binary'] = serialized unless serialized.nil?
      end          
      unless self.fixedBoolean.nil?
        result['fixedBoolean'] = self.fixedBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedBoolean) 
        result['_fixedBoolean'] = serialized unless serialized.nil?
      end          
      unless self.fixedCanonical.nil?
        result['fixedCanonical'] = self.fixedCanonical.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedCanonical) 
        result['_fixedCanonical'] = serialized unless serialized.nil?
      end          
      unless self.fixedCode.nil?
        result['fixedCode'] = self.fixedCode.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedCode) 
        result['_fixedCode'] = serialized unless serialized.nil?
      end          
      unless self.fixedDate.nil?
        result['fixedDate'] = self.fixedDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedDate) 
        result['_fixedDate'] = serialized unless serialized.nil?
      end          
      unless self.fixedDateTime.nil?
        result['fixedDateTime'] = self.fixedDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedDateTime) 
        result['_fixedDateTime'] = serialized unless serialized.nil?
      end          
      unless self.fixedDecimal.nil?
        result['fixedDecimal'] = self.fixedDecimal.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedDecimal) 
        result['_fixedDecimal'] = serialized unless serialized.nil?
      end          
      unless self.fixedId.nil?
        result['fixedId'] = self.fixedId.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedId) 
        result['_fixedId'] = serialized unless serialized.nil?
      end          
      unless self.fixedInstant.nil?
        result['fixedInstant'] = self.fixedInstant.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedInstant) 
        result['_fixedInstant'] = serialized unless serialized.nil?
      end          
      unless self.fixedInteger.nil?
        result['fixedInteger'] = self.fixedInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedInteger) 
        result['_fixedInteger'] = serialized unless serialized.nil?
      end          
      unless self.fixedMarkdown.nil?
        result['fixedMarkdown'] = self.fixedMarkdown.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedMarkdown) 
        result['_fixedMarkdown'] = serialized unless serialized.nil?
      end          
      unless self.fixedOid.nil?
        result['fixedOid'] = self.fixedOid.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedOid) 
        result['_fixedOid'] = serialized unless serialized.nil?
      end          
      unless self.fixedPositiveInt.nil?
        result['fixedPositiveInt'] = self.fixedPositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedPositiveInt) 
        result['_fixedPositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.fixedString.nil?
        result['fixedString'] = self.fixedString.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedString) 
        result['_fixedString'] = serialized unless serialized.nil?
      end          
      unless self.fixedTime.nil?
        result['fixedTime'] = self.fixedTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedTime) 
        result['_fixedTime'] = serialized unless serialized.nil?
      end          
      unless self.fixedUnsignedInt.nil?
        result['fixedUnsignedInt'] = self.fixedUnsignedInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedUnsignedInt) 
        result['_fixedUnsignedInt'] = serialized unless serialized.nil?
      end          
      unless self.fixedUri.nil?
        result['fixedUri'] = self.fixedUri.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedUri) 
        result['_fixedUri'] = serialized unless serialized.nil?
      end          
      unless self.fixedUrl.nil?
        result['fixedUrl'] = self.fixedUrl.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedUrl) 
        result['_fixedUrl'] = serialized unless serialized.nil?
      end          
      unless self.fixedUuid.nil?
        result['fixedUuid'] = self.fixedUuid.value                        
        serialized = Extension.serializePrimitiveExtension(self.fixedUuid) 
        result['_fixedUuid'] = serialized unless serialized.nil?
      end          
      unless self.fixedAddress.nil?
        result['fixedAddress'] = self.fixedAddress.as_json(*args)                        
      end          
      unless self.fixedAge.nil?
        result['fixedAge'] = self.fixedAge.as_json(*args)                        
      end          
      unless self.fixedAnnotation.nil?
        result['fixedAnnotation'] = self.fixedAnnotation.as_json(*args)                        
      end          
      unless self.fixedAttachment.nil?
        result['fixedAttachment'] = self.fixedAttachment.as_json(*args)                        
      end          
      unless self.fixedCodeableConcept.nil?
        result['fixedCodeableConcept'] = self.fixedCodeableConcept.as_json(*args)                        
      end          
      unless self.fixedCoding.nil?
        result['fixedCoding'] = self.fixedCoding.as_json(*args)                        
      end          
      unless self.fixedContactPoint.nil?
        result['fixedContactPoint'] = self.fixedContactPoint.as_json(*args)                        
      end          
      unless self.fixedCount.nil?
        result['fixedCount'] = self.fixedCount.as_json(*args)                        
      end          
      unless self.fixedDistance.nil?
        result['fixedDistance'] = self.fixedDistance.as_json(*args)                        
      end          
      unless self.fixedDuration.nil?
        result['fixedDuration'] = self.fixedDuration.as_json(*args)                        
      end          
      unless self.fixedHumanName.nil?
        result['fixedHumanName'] = self.fixedHumanName.as_json(*args)                        
      end          
      unless self.fixedIdentifier.nil?
        result['fixedIdentifier'] = self.fixedIdentifier.as_json(*args)                        
      end          
      unless self.fixedMoney.nil?
        result['fixedMoney'] = self.fixedMoney.as_json(*args)                        
      end          
      unless self.fixedPeriod.nil?
        result['fixedPeriod'] = self.fixedPeriod.as_json(*args)                        
      end          
      unless self.fixedQuantity.nil?
        result['fixedQuantity'] = self.fixedQuantity.as_json(*args)                        
      end          
      unless self.fixedRange.nil?
        result['fixedRange'] = self.fixedRange.as_json(*args)                        
      end          
      unless self.fixedRatio.nil?
        result['fixedRatio'] = self.fixedRatio.as_json(*args)                        
      end          
      unless self.fixedReference.nil?
        result['fixedReference'] = self.fixedReference.as_json(*args)                        
      end          
      unless self.fixedSampledData.nil?
        result['fixedSampledData'] = self.fixedSampledData.as_json(*args)                        
      end          
      unless self.fixedSignature.nil?
        result['fixedSignature'] = self.fixedSignature.as_json(*args)                        
      end          
      unless self.fixedTiming.nil?
        result['fixedTiming'] = self.fixedTiming.as_json(*args)                        
      end          
      unless self.fixedContactDetail.nil?
        result['fixedContactDetail'] = self.fixedContactDetail.as_json(*args)                        
      end          
      unless self.fixedContributor.nil?
        result['fixedContributor'] = self.fixedContributor.as_json(*args)                        
      end          
      unless self.fixedDataRequirement.nil?
        result['fixedDataRequirement'] = self.fixedDataRequirement.as_json(*args)                        
      end          
      unless self.fixedExpression.nil?
        result['fixedExpression'] = self.fixedExpression.as_json(*args)                        
      end          
      unless self.fixedParameterDefinition.nil?
        result['fixedParameterDefinition'] = self.fixedParameterDefinition.as_json(*args)                        
      end          
      unless self.fixedRelatedArtifact.nil?
        result['fixedRelatedArtifact'] = self.fixedRelatedArtifact.as_json(*args)                        
      end          
      unless self.fixedTriggerDefinition.nil?
        result['fixedTriggerDefinition'] = self.fixedTriggerDefinition.as_json(*args)                        
      end          
      unless self.fixedUsageContext.nil?
        result['fixedUsageContext'] = self.fixedUsageContext.as_json(*args)                        
      end          
      unless self.fixedDosage.nil?
        result['fixedDosage'] = self.fixedDosage.as_json(*args)                        
      end          
      unless self.fixedMeta.nil?
        result['fixedMeta'] = self.fixedMeta.as_json(*args)                        
      end          
      unless self.patternBase64Binary.nil?
        result['patternBase64Binary'] = self.patternBase64Binary.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternBase64Binary) 
        result['_patternBase64Binary'] = serialized unless serialized.nil?
      end          
      unless self.patternBoolean.nil?
        result['patternBoolean'] = self.patternBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternBoolean) 
        result['_patternBoolean'] = serialized unless serialized.nil?
      end          
      unless self.patternCanonical.nil?
        result['patternCanonical'] = self.patternCanonical.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternCanonical) 
        result['_patternCanonical'] = serialized unless serialized.nil?
      end          
      unless self.patternCode.nil?
        result['patternCode'] = self.patternCode.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternCode) 
        result['_patternCode'] = serialized unless serialized.nil?
      end          
      unless self.patternDate.nil?
        result['patternDate'] = self.patternDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternDate) 
        result['_patternDate'] = serialized unless serialized.nil?
      end          
      unless self.patternDateTime.nil?
        result['patternDateTime'] = self.patternDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternDateTime) 
        result['_patternDateTime'] = serialized unless serialized.nil?
      end          
      unless self.patternDecimal.nil?
        result['patternDecimal'] = self.patternDecimal.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternDecimal) 
        result['_patternDecimal'] = serialized unless serialized.nil?
      end          
      unless self.patternId.nil?
        result['patternId'] = self.patternId.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternId) 
        result['_patternId'] = serialized unless serialized.nil?
      end          
      unless self.patternInstant.nil?
        result['patternInstant'] = self.patternInstant.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternInstant) 
        result['_patternInstant'] = serialized unless serialized.nil?
      end          
      unless self.patternInteger.nil?
        result['patternInteger'] = self.patternInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternInteger) 
        result['_patternInteger'] = serialized unless serialized.nil?
      end          
      unless self.patternMarkdown.nil?
        result['patternMarkdown'] = self.patternMarkdown.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternMarkdown) 
        result['_patternMarkdown'] = serialized unless serialized.nil?
      end          
      unless self.patternOid.nil?
        result['patternOid'] = self.patternOid.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternOid) 
        result['_patternOid'] = serialized unless serialized.nil?
      end          
      unless self.patternPositiveInt.nil?
        result['patternPositiveInt'] = self.patternPositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternPositiveInt) 
        result['_patternPositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.patternString.nil?
        result['patternString'] = self.patternString.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternString) 
        result['_patternString'] = serialized unless serialized.nil?
      end          
      unless self.patternTime.nil?
        result['patternTime'] = self.patternTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternTime) 
        result['_patternTime'] = serialized unless serialized.nil?
      end          
      unless self.patternUnsignedInt.nil?
        result['patternUnsignedInt'] = self.patternUnsignedInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternUnsignedInt) 
        result['_patternUnsignedInt'] = serialized unless serialized.nil?
      end          
      unless self.patternUri.nil?
        result['patternUri'] = self.patternUri.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternUri) 
        result['_patternUri'] = serialized unless serialized.nil?
      end          
      unless self.patternUrl.nil?
        result['patternUrl'] = self.patternUrl.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternUrl) 
        result['_patternUrl'] = serialized unless serialized.nil?
      end          
      unless self.patternUuid.nil?
        result['patternUuid'] = self.patternUuid.value                        
        serialized = Extension.serializePrimitiveExtension(self.patternUuid) 
        result['_patternUuid'] = serialized unless serialized.nil?
      end          
      unless self.patternAddress.nil?
        result['patternAddress'] = self.patternAddress.as_json(*args)                        
      end          
      unless self.patternAge.nil?
        result['patternAge'] = self.patternAge.as_json(*args)                        
      end          
      unless self.patternAnnotation.nil?
        result['patternAnnotation'] = self.patternAnnotation.as_json(*args)                        
      end          
      unless self.patternAttachment.nil?
        result['patternAttachment'] = self.patternAttachment.as_json(*args)                        
      end          
      unless self.patternCodeableConcept.nil?
        result['patternCodeableConcept'] = self.patternCodeableConcept.as_json(*args)                        
      end          
      unless self.patternCoding.nil?
        result['patternCoding'] = self.patternCoding.as_json(*args)                        
      end          
      unless self.patternContactPoint.nil?
        result['patternContactPoint'] = self.patternContactPoint.as_json(*args)                        
      end          
      unless self.patternCount.nil?
        result['patternCount'] = self.patternCount.as_json(*args)                        
      end          
      unless self.patternDistance.nil?
        result['patternDistance'] = self.patternDistance.as_json(*args)                        
      end          
      unless self.patternDuration.nil?
        result['patternDuration'] = self.patternDuration.as_json(*args)                        
      end          
      unless self.patternHumanName.nil?
        result['patternHumanName'] = self.patternHumanName.as_json(*args)                        
      end          
      unless self.patternIdentifier.nil?
        result['patternIdentifier'] = self.patternIdentifier.as_json(*args)                        
      end          
      unless self.patternMoney.nil?
        result['patternMoney'] = self.patternMoney.as_json(*args)                        
      end          
      unless self.patternPeriod.nil?
        result['patternPeriod'] = self.patternPeriod.as_json(*args)                        
      end          
      unless self.patternQuantity.nil?
        result['patternQuantity'] = self.patternQuantity.as_json(*args)                        
      end          
      unless self.patternRange.nil?
        result['patternRange'] = self.patternRange.as_json(*args)                        
      end          
      unless self.patternRatio.nil?
        result['patternRatio'] = self.patternRatio.as_json(*args)                        
      end          
      unless self.patternReference.nil?
        result['patternReference'] = self.patternReference.as_json(*args)                        
      end          
      unless self.patternSampledData.nil?
        result['patternSampledData'] = self.patternSampledData.as_json(*args)                        
      end          
      unless self.patternSignature.nil?
        result['patternSignature'] = self.patternSignature.as_json(*args)                        
      end          
      unless self.patternTiming.nil?
        result['patternTiming'] = self.patternTiming.as_json(*args)                        
      end          
      unless self.patternContactDetail.nil?
        result['patternContactDetail'] = self.patternContactDetail.as_json(*args)                        
      end          
      unless self.patternContributor.nil?
        result['patternContributor'] = self.patternContributor.as_json(*args)                        
      end          
      unless self.patternDataRequirement.nil?
        result['patternDataRequirement'] = self.patternDataRequirement.as_json(*args)                        
      end          
      unless self.patternExpression.nil?
        result['patternExpression'] = self.patternExpression.as_json(*args)                        
      end          
      unless self.patternParameterDefinition.nil?
        result['patternParameterDefinition'] = self.patternParameterDefinition.as_json(*args)                        
      end          
      unless self.patternRelatedArtifact.nil?
        result['patternRelatedArtifact'] = self.patternRelatedArtifact.as_json(*args)                        
      end          
      unless self.patternTriggerDefinition.nil?
        result['patternTriggerDefinition'] = self.patternTriggerDefinition.as_json(*args)                        
      end          
      unless self.patternUsageContext.nil?
        result['patternUsageContext'] = self.patternUsageContext.as_json(*args)                        
      end          
      unless self.patternDosage.nil?
        result['patternDosage'] = self.patternDosage.as_json(*args)                        
      end          
      unless self.patternMeta.nil?
        result['patternMeta'] = self.patternMeta.as_json(*args)                        
      end          
      unless self.example.nil?  || !self.example.any? 
        result['example'] = self.example.map{ |x| x.as_json(*args) }
      end
      unless self.minValueDate.nil?
        result['minValueDate'] = self.minValueDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.minValueDate) 
        result['_minValueDate'] = serialized unless serialized.nil?
      end          
      unless self.minValueDateTime.nil?
        result['minValueDateTime'] = self.minValueDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.minValueDateTime) 
        result['_minValueDateTime'] = serialized unless serialized.nil?
      end          
      unless self.minValueInstant.nil?
        result['minValueInstant'] = self.minValueInstant.value                        
        serialized = Extension.serializePrimitiveExtension(self.minValueInstant) 
        result['_minValueInstant'] = serialized unless serialized.nil?
      end          
      unless self.minValueTime.nil?
        result['minValueTime'] = self.minValueTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.minValueTime) 
        result['_minValueTime'] = serialized unless serialized.nil?
      end          
      unless self.minValueDecimal.nil?
        result['minValueDecimal'] = self.minValueDecimal.value                        
        serialized = Extension.serializePrimitiveExtension(self.minValueDecimal) 
        result['_minValueDecimal'] = serialized unless serialized.nil?
      end          
      unless self.minValueInteger.nil?
        result['minValueInteger'] = self.minValueInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.minValueInteger) 
        result['_minValueInteger'] = serialized unless serialized.nil?
      end          
      unless self.minValuePositiveInt.nil?
        result['minValuePositiveInt'] = self.minValuePositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.minValuePositiveInt) 
        result['_minValuePositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.minValueUnsignedInt.nil?
        result['minValueUnsignedInt'] = self.minValueUnsignedInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.minValueUnsignedInt) 
        result['_minValueUnsignedInt'] = serialized unless serialized.nil?
      end          
      unless self.minValueQuantity.nil?
        result['minValueQuantity'] = self.minValueQuantity.as_json(*args)                        
      end          
      unless self.maxValueDate.nil?
        result['maxValueDate'] = self.maxValueDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.maxValueDate) 
        result['_maxValueDate'] = serialized unless serialized.nil?
      end          
      unless self.maxValueDateTime.nil?
        result['maxValueDateTime'] = self.maxValueDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.maxValueDateTime) 
        result['_maxValueDateTime'] = serialized unless serialized.nil?
      end          
      unless self.maxValueInstant.nil?
        result['maxValueInstant'] = self.maxValueInstant.value                        
        serialized = Extension.serializePrimitiveExtension(self.maxValueInstant) 
        result['_maxValueInstant'] = serialized unless serialized.nil?
      end          
      unless self.maxValueTime.nil?
        result['maxValueTime'] = self.maxValueTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.maxValueTime) 
        result['_maxValueTime'] = serialized unless serialized.nil?
      end          
      unless self.maxValueDecimal.nil?
        result['maxValueDecimal'] = self.maxValueDecimal.value                        
        serialized = Extension.serializePrimitiveExtension(self.maxValueDecimal) 
        result['_maxValueDecimal'] = serialized unless serialized.nil?
      end          
      unless self.maxValueInteger.nil?
        result['maxValueInteger'] = self.maxValueInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.maxValueInteger) 
        result['_maxValueInteger'] = serialized unless serialized.nil?
      end          
      unless self.maxValuePositiveInt.nil?
        result['maxValuePositiveInt'] = self.maxValuePositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.maxValuePositiveInt) 
        result['_maxValuePositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.maxValueUnsignedInt.nil?
        result['maxValueUnsignedInt'] = self.maxValueUnsignedInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.maxValueUnsignedInt) 
        result['_maxValueUnsignedInt'] = serialized unless serialized.nil?
      end          
      unless self.maxValueQuantity.nil?
        result['maxValueQuantity'] = self.maxValueQuantity.as_json(*args)                        
      end          
      unless self.maxLength.nil? 
        result['maxLength'] = self.maxLength.value
        serialized = Extension.serializePrimitiveExtension(self.maxLength)            
        result['_maxLength'] = serialized unless serialized.nil?
      end
      unless self.condition.nil?  || !self.condition.any? 
        result['condition'] = self.condition.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.condition)                              
        result['_condition'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.constraint.nil?  || !self.constraint.any? 
        result['constraint'] = self.constraint.map{ |x| x.as_json(*args) }
      end
      unless self.mustSupport.nil? 
        result['mustSupport'] = self.mustSupport.value
        serialized = Extension.serializePrimitiveExtension(self.mustSupport)            
        result['_mustSupport'] = serialized unless serialized.nil?
      end
      unless self.isModifier.nil? 
        result['isModifier'] = self.isModifier.value
        serialized = Extension.serializePrimitiveExtension(self.isModifier)            
        result['_isModifier'] = serialized unless serialized.nil?
      end
      unless self.isModifierReason.nil? 
        result['isModifierReason'] = self.isModifierReason.value
        serialized = Extension.serializePrimitiveExtension(self.isModifierReason)            
        result['_isModifierReason'] = serialized unless serialized.nil?
      end
      unless self.isSummary.nil? 
        result['isSummary'] = self.isSummary.value
        serialized = Extension.serializePrimitiveExtension(self.isSummary)            
        result['_isSummary'] = serialized unless serialized.nil?
      end
      unless self.binding.nil? 
        result['binding'] = self.binding.as_json(*args)
      end
      unless self.mapping.nil?  || !self.mapping.any? 
        result['mapping'] = self.mapping.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ElementDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?
      result['representation'] = json_hash['representation'].each_with_index.map do |var, i|
        extension_hash = json_hash['_representation'] && json_hash['_representation'][i]
        PropertyRepresentation.transform_json(var, extension_hash)
      end unless json_hash['representation'].nil?
      result['sliceName'] = PrimitiveString.transform_json(json_hash['sliceName'], json_hash['_sliceName']) unless json_hash['sliceName'].nil?
      result['sliceIsConstraining'] = PrimitiveBoolean.transform_json(json_hash['sliceIsConstraining'], json_hash['_sliceIsConstraining']) unless json_hash['sliceIsConstraining'].nil?
      result['label'] = PrimitiveString.transform_json(json_hash['label'], json_hash['_label']) unless json_hash['label'].nil?
      result['code'] = json_hash['code'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Coding.transform_json(var) 
        end
      } unless json_hash['code'].nil?
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
      result['type'] = json_hash['type'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ElementDefinitionType.transform_json(var) 
        end
      } unless json_hash['type'].nil?
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
      result['example'] = json_hash['example'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ElementDefinitionExample.transform_json(var) 
        end
      } unless json_hash['example'].nil?
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
      result['constraint'] = json_hash['constraint'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ElementDefinitionConstraint.transform_json(var) 
        end
      } unless json_hash['constraint'].nil?
      result['mustSupport'] = PrimitiveBoolean.transform_json(json_hash['mustSupport'], json_hash['_mustSupport']) unless json_hash['mustSupport'].nil?
      result['isModifier'] = PrimitiveBoolean.transform_json(json_hash['isModifier'], json_hash['_isModifier']) unless json_hash['isModifier'].nil?
      result['isModifierReason'] = PrimitiveString.transform_json(json_hash['isModifierReason'], json_hash['_isModifierReason']) unless json_hash['isModifierReason'].nil?
      result['isSummary'] = PrimitiveBoolean.transform_json(json_hash['isSummary'], json_hash['_isSummary']) unless json_hash['isSummary'].nil?
      result['binding'] = ElementDefinitionBinding.transform_json(json_hash['binding']) unless json_hash['binding'].nil?
      result['mapping'] = json_hash['mapping'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ElementDefinitionMapping.transform_json(var) 
        end
      } unless json_hash['mapping'].nil?

      result
    end
  end
end
