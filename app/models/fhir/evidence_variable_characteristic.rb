module FHIR
  # fhir/evidence_variable_characteristic.rb
  class EvidenceVariableCharacteristic < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :definitionReference, class_name: 'FHIR::Reference'    
    embeds_one :definitionCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :definitionCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :definitionExpression, class_name: 'FHIR::Expression'    
    embeds_one :definitionDataRequirement, class_name: 'FHIR::DataRequirement'    
    embeds_one :definitionTriggerDefinition, class_name: 'FHIR::TriggerDefinition'    
    embeds_many :usageContext, class_name: 'FHIR::UsageContext'    
    embeds_one :exclude, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :participantEffectiveDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :participantEffectivePeriod, class_name: 'FHIR::Period'    
    embeds_one :participantEffectiveDuration, class_name: 'FHIR::Duration'    
    embeds_one :participantEffectiveTiming, class_name: 'FHIR::Timing'    
    embeds_one :timeFromStart, class_name: 'FHIR::Duration'    
    embeds_one :groupMeasure, class_name: 'FHIR::GroupMeasure'    
    
    def as_json(*args)
      result = super      
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.definitionReference.nil?
        result['definitionReference'] = self.definitionReference.as_json(*args)                        
      end          
      unless self.definitionCanonical.nil?
        result['definitionCanonical'] = self.definitionCanonical.value                        
        serialized = Extension.serializePrimitiveExtension(self.definitionCanonical) 
        result['_definitionCanonical'] = serialized unless serialized.nil?
      end          
      unless self.definitionCodeableConcept.nil?
        result['definitionCodeableConcept'] = self.definitionCodeableConcept.as_json(*args)                        
      end          
      unless self.definitionExpression.nil?
        result['definitionExpression'] = self.definitionExpression.as_json(*args)                        
      end          
      unless self.definitionDataRequirement.nil?
        result['definitionDataRequirement'] = self.definitionDataRequirement.as_json(*args)                        
      end          
      unless self.definitionTriggerDefinition.nil?
        result['definitionTriggerDefinition'] = self.definitionTriggerDefinition.as_json(*args)                        
      end          
      unless self.usageContext.nil?  || !self.usageContext.any? 
        result['usageContext'] = self.usageContext.map{ |x| x.as_json(*args) }
      end
      unless self.exclude.nil? 
        result['exclude'] = self.exclude.value
        serialized = Extension.serializePrimitiveExtension(self.exclude)            
        result['_exclude'] = serialized unless serialized.nil?
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
      unless self.timeFromStart.nil? 
        result['timeFromStart'] = self.timeFromStart.as_json(*args)
      end
      unless self.groupMeasure.nil? 
        result['groupMeasure'] = self.groupMeasure.value
        serialized = Extension.serializePrimitiveExtension(self.groupMeasure)            
        result['_groupMeasure'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EvidenceVariableCharacteristic.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['definitionReference'] = Reference.transform_json(json_hash['definitionReference']) unless json_hash['definitionReference'].nil?
      result['definitionCanonical'] = PrimitiveCanonical.transform_json(json_hash['definitionCanonical'], json_hash['_definitionCanonical']) unless json_hash['definitionCanonical'].nil?
      result['definitionCodeableConcept'] = CodeableConcept.transform_json(json_hash['definitionCodeableConcept']) unless json_hash['definitionCodeableConcept'].nil?
      result['definitionExpression'] = Expression.transform_json(json_hash['definitionExpression']) unless json_hash['definitionExpression'].nil?
      result['definitionDataRequirement'] = DataRequirement.transform_json(json_hash['definitionDataRequirement']) unless json_hash['definitionDataRequirement'].nil?
      result['definitionTriggerDefinition'] = TriggerDefinition.transform_json(json_hash['definitionTriggerDefinition']) unless json_hash['definitionTriggerDefinition'].nil?
      result['usageContext'] = json_hash['usageContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['usageContext'].nil?
      result['exclude'] = PrimitiveBoolean.transform_json(json_hash['exclude'], json_hash['_exclude']) unless json_hash['exclude'].nil?
      result['participantEffectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['participantEffectiveDateTime'], json_hash['_participantEffectiveDateTime']) unless json_hash['participantEffectiveDateTime'].nil?
      result['participantEffectivePeriod'] = Period.transform_json(json_hash['participantEffectivePeriod']) unless json_hash['participantEffectivePeriod'].nil?
      result['participantEffectiveDuration'] = Duration.transform_json(json_hash['participantEffectiveDuration']) unless json_hash['participantEffectiveDuration'].nil?
      result['participantEffectiveTiming'] = Timing.transform_json(json_hash['participantEffectiveTiming']) unless json_hash['participantEffectiveTiming'].nil?
      result['timeFromStart'] = Duration.transform_json(json_hash['timeFromStart']) unless json_hash['timeFromStart'].nil?
      result['groupMeasure'] = GroupMeasure.transform_json(json_hash['groupMeasure'], json_hash['_groupMeasure']) unless json_hash['groupMeasure'].nil?

      result
    end
  end
end
