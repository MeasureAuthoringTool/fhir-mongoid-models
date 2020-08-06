module FHIR
  # fhir/research_element_definition_characteristic.rb
  class ResearchElementDefinitionCharacteristic < BackboneElement
    include Mongoid::Document
    embeds_one :definitionCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :definitionCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :definitionExpression, class_name: 'FHIR::Expression'    
    embeds_one :definitionDataRequirement, class_name: 'FHIR::DataRequirement'    
    embeds_many :usageContext, class_name: 'FHIR::UsageContext'    
    embeds_one :exclude, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :unitOfMeasure, class_name: 'FHIR::CodeableConcept'    
    embeds_one :studyEffectiveDescription, class_name: 'FHIR::PrimitiveString'    
    embeds_one :studyEffectiveDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :studyEffectivePeriod, class_name: 'FHIR::Period'    
    embeds_one :studyEffectiveDuration, class_name: 'FHIR::Duration'    
    embeds_one :studyEffectiveTiming, class_name: 'FHIR::Timing'    
    embeds_one :studyEffectiveTimeFromStart, class_name: 'FHIR::Duration'    
    embeds_one :studyEffectiveGroupMeasure, class_name: 'FHIR::GroupMeasure'    
    embeds_one :participantEffectiveDescription, class_name: 'FHIR::PrimitiveString'    
    embeds_one :participantEffectiveDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :participantEffectivePeriod, class_name: 'FHIR::Period'    
    embeds_one :participantEffectiveDuration, class_name: 'FHIR::Duration'    
    embeds_one :participantEffectiveTiming, class_name: 'FHIR::Timing'    
    embeds_one :participantEffectiveTimeFromStart, class_name: 'FHIR::Duration'    
    embeds_one :participantEffectiveGroupMeasure, class_name: 'FHIR::GroupMeasure'    
    
    def as_json(*args)
      result = super      
      unless self.definitionCodeableConcept.nil?
        result['definitionCodeableConcept'] = self.definitionCodeableConcept.as_json(*args)                        
      end          
      unless self.definitionCanonical.nil?
        result['definitionCanonical'] = self.definitionCanonical.value                        
        serialized = Extension.serializePrimitiveExtension(self.definitionCanonical) 
        result['_definitionCanonical'] = serialized unless serialized.nil?
      end          
      unless self.definitionExpression.nil?
        result['definitionExpression'] = self.definitionExpression.as_json(*args)                        
      end          
      unless self.definitionDataRequirement.nil?
        result['definitionDataRequirement'] = self.definitionDataRequirement.as_json(*args)                        
      end          
      unless self.usageContext.nil?  || !self.usageContext.any? 
        result['usageContext'] = self.usageContext.map{ |x| x.as_json(*args) }
      end
      unless self.exclude.nil? 
        result['exclude'] = self.exclude.value
        serialized = Extension.serializePrimitiveExtension(self.exclude)            
        result['_exclude'] = serialized unless serialized.nil?
      end
      unless self.unitOfMeasure.nil? 
        result['unitOfMeasure'] = self.unitOfMeasure.as_json(*args)
      end
      unless self.studyEffectiveDescription.nil? 
        result['studyEffectiveDescription'] = self.studyEffectiveDescription.value
        serialized = Extension.serializePrimitiveExtension(self.studyEffectiveDescription)            
        result['_studyEffectiveDescription'] = serialized unless serialized.nil?
      end
      unless self.studyEffectiveDateTime.nil?
        result['studyEffectiveDateTime'] = self.studyEffectiveDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.studyEffectiveDateTime) 
        result['_studyEffectiveDateTime'] = serialized unless serialized.nil?
      end          
      unless self.studyEffectivePeriod.nil?
        result['studyEffectivePeriod'] = self.studyEffectivePeriod.as_json(*args)                        
      end          
      unless self.studyEffectiveDuration.nil?
        result['studyEffectiveDuration'] = self.studyEffectiveDuration.as_json(*args)                        
      end          
      unless self.studyEffectiveTiming.nil?
        result['studyEffectiveTiming'] = self.studyEffectiveTiming.as_json(*args)                        
      end          
      unless self.studyEffectiveTimeFromStart.nil? 
        result['studyEffectiveTimeFromStart'] = self.studyEffectiveTimeFromStart.as_json(*args)
      end
      unless self.studyEffectiveGroupMeasure.nil? 
        result['studyEffectiveGroupMeasure'] = self.studyEffectiveGroupMeasure.value
        serialized = Extension.serializePrimitiveExtension(self.studyEffectiveGroupMeasure)            
        result['_studyEffectiveGroupMeasure'] = serialized unless serialized.nil?
      end
      unless self.participantEffectiveDescription.nil? 
        result['participantEffectiveDescription'] = self.participantEffectiveDescription.value
        serialized = Extension.serializePrimitiveExtension(self.participantEffectiveDescription)            
        result['_participantEffectiveDescription'] = serialized unless serialized.nil?
      end
      unless self.participantEffectiveDateTime.nil?
        result['participantEffectiveDateTime'] = self.participantEffectiveDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.participantEffectiveDateTime) 
        result['_participantEffectiveDateTime'] = serialized unless serialized.nil?
      end          
      unless self.participantEffectivePeriod.nil?
        result['participantEffectivePeriod'] = self.participantEffectivePeriod.as_json(*args)                        
      end          
      unless self.participantEffectiveDuration.nil?
        result['participantEffectiveDuration'] = self.participantEffectiveDuration.as_json(*args)                        
      end          
      unless self.participantEffectiveTiming.nil?
        result['participantEffectiveTiming'] = self.participantEffectiveTiming.as_json(*args)                        
      end          
      unless self.participantEffectiveTimeFromStart.nil? 
        result['participantEffectiveTimeFromStart'] = self.participantEffectiveTimeFromStart.as_json(*args)
      end
      unless self.participantEffectiveGroupMeasure.nil? 
        result['participantEffectiveGroupMeasure'] = self.participantEffectiveGroupMeasure.value
        serialized = Extension.serializePrimitiveExtension(self.participantEffectiveGroupMeasure)            
        result['_participantEffectiveGroupMeasure'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ResearchElementDefinitionCharacteristic.new)
      result = self.superclass.transform_json(json_hash, target)
      result['definitionCodeableConcept'] = CodeableConcept.transform_json(json_hash['definitionCodeableConcept']) unless json_hash['definitionCodeableConcept'].nil?
      result['definitionCanonical'] = PrimitiveCanonical.transform_json(json_hash['definitionCanonical'], json_hash['_definitionCanonical']) unless json_hash['definitionCanonical'].nil?
      result['definitionExpression'] = Expression.transform_json(json_hash['definitionExpression']) unless json_hash['definitionExpression'].nil?
      result['definitionDataRequirement'] = DataRequirement.transform_json(json_hash['definitionDataRequirement']) unless json_hash['definitionDataRequirement'].nil?
      result['usageContext'] = json_hash['usageContext'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          UsageContext.transform_json(var) 
        end
      } unless json_hash['usageContext'].nil?
      result['exclude'] = PrimitiveBoolean.transform_json(json_hash['exclude'], json_hash['_exclude']) unless json_hash['exclude'].nil?
      result['unitOfMeasure'] = CodeableConcept.transform_json(json_hash['unitOfMeasure']) unless json_hash['unitOfMeasure'].nil?
      result['studyEffectiveDescription'] = PrimitiveString.transform_json(json_hash['studyEffectiveDescription'], json_hash['_studyEffectiveDescription']) unless json_hash['studyEffectiveDescription'].nil?
      result['studyEffectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['studyEffectiveDateTime'], json_hash['_studyEffectiveDateTime']) unless json_hash['studyEffectiveDateTime'].nil?
      result['studyEffectivePeriod'] = Period.transform_json(json_hash['studyEffectivePeriod']) unless json_hash['studyEffectivePeriod'].nil?
      result['studyEffectiveDuration'] = Duration.transform_json(json_hash['studyEffectiveDuration']) unless json_hash['studyEffectiveDuration'].nil?
      result['studyEffectiveTiming'] = Timing.transform_json(json_hash['studyEffectiveTiming']) unless json_hash['studyEffectiveTiming'].nil?
      result['studyEffectiveTimeFromStart'] = Duration.transform_json(json_hash['studyEffectiveTimeFromStart']) unless json_hash['studyEffectiveTimeFromStart'].nil?
      result['studyEffectiveGroupMeasure'] = GroupMeasure.transform_json(json_hash['studyEffectiveGroupMeasure'], json_hash['_studyEffectiveGroupMeasure']) unless json_hash['studyEffectiveGroupMeasure'].nil?
      result['participantEffectiveDescription'] = PrimitiveString.transform_json(json_hash['participantEffectiveDescription'], json_hash['_participantEffectiveDescription']) unless json_hash['participantEffectiveDescription'].nil?
      result['participantEffectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['participantEffectiveDateTime'], json_hash['_participantEffectiveDateTime']) unless json_hash['participantEffectiveDateTime'].nil?
      result['participantEffectivePeriod'] = Period.transform_json(json_hash['participantEffectivePeriod']) unless json_hash['participantEffectivePeriod'].nil?
      result['participantEffectiveDuration'] = Duration.transform_json(json_hash['participantEffectiveDuration']) unless json_hash['participantEffectiveDuration'].nil?
      result['participantEffectiveTiming'] = Timing.transform_json(json_hash['participantEffectiveTiming']) unless json_hash['participantEffectiveTiming'].nil?
      result['participantEffectiveTimeFromStart'] = Duration.transform_json(json_hash['participantEffectiveTimeFromStart']) unless json_hash['participantEffectiveTimeFromStart'].nil?
      result['participantEffectiveGroupMeasure'] = GroupMeasure.transform_json(json_hash['participantEffectiveGroupMeasure'], json_hash['_participantEffectiveGroupMeasure']) unless json_hash['participantEffectiveGroupMeasure'].nil?

      result
    end
  end
end
