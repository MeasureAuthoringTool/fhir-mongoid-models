module FHIR
  # fhir/request_group_action.rb
  class RequestGroupAction < BackboneElement
    include Mongoid::Document
    embeds_one :prefix, class_name: 'FHIR::PrimitiveString'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :textEquivalent, class_name: 'FHIR::PrimitiveString'    
    embeds_one :priority, class_name: 'FHIR::RequestPriority'    
    embeds_many :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :documentation, class_name: 'FHIR::RelatedArtifact'    
    embeds_many :condition, class_name: 'FHIR::RequestGroupActionCondition'    
    embeds_many :relatedAction, class_name: 'FHIR::RequestGroupActionRelatedAction'    
    embeds_one :timingDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :timingAge, class_name: 'FHIR::Age'    
    embeds_one :timingPeriod, class_name: 'FHIR::Period'    
    embeds_one :timingDuration, class_name: 'FHIR::Duration'    
    embeds_one :timingRange, class_name: 'FHIR::Range'    
    embeds_one :timingTiming, class_name: 'FHIR::Timing'    
    embeds_many :participant, class_name: 'FHIR::Reference'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :groupingBehavior, class_name: 'FHIR::ActionGroupingBehavior'    
    embeds_one :selectionBehavior, class_name: 'FHIR::ActionSelectionBehavior'    
    embeds_one :requiredBehavior, class_name: 'FHIR::ActionRequiredBehavior'    
    embeds_one :precheckBehavior, class_name: 'FHIR::ActionPrecheckBehavior'    
    embeds_one :cardinalityBehavior, class_name: 'FHIR::ActionCardinalityBehavior'    
    embeds_one :resource, class_name: 'FHIR::Reference'    
    embeds_many :action, class_name: 'FHIR::RequestGroupAction'    
    
    def as_json(*args)
      result = super      
      unless self.prefix.nil? 
        result['prefix'] = self.prefix.value
        serialized = Extension.serializePrimitiveExtension(self.prefix)            
        result['_prefix'] = serialized unless serialized.nil?
      end
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.textEquivalent.nil? 
        result['textEquivalent'] = self.textEquivalent.value
        serialized = Extension.serializePrimitiveExtension(self.textEquivalent)            
        result['_textEquivalent'] = serialized unless serialized.nil?
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.value
        serialized = Extension.serializePrimitiveExtension(self.priority)            
        result['_priority'] = serialized unless serialized.nil?
      end
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      unless self.documentation.nil?  || !self.documentation.any? 
        result['documentation'] = self.documentation.map{ |x| x.as_json(*args) }
      end
      unless self.condition.nil?  || !self.condition.any? 
        result['condition'] = self.condition.map{ |x| x.as_json(*args) }
      end
      unless self.relatedAction.nil?  || !self.relatedAction.any? 
        result['relatedAction'] = self.relatedAction.map{ |x| x.as_json(*args) }
      end
      unless self.timingDateTime.nil?
        result['timingDateTime'] = self.timingDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.timingDateTime) 
        result['_timingDateTime'] = serialized unless serialized.nil?
      end          
      unless self.timingAge.nil?
        result['timingAge'] = self.timingAge.as_json(*args)                        
      end          
      unless self.timingPeriod.nil?
        result['timingPeriod'] = self.timingPeriod.as_json(*args)                        
      end          
      unless self.timingDuration.nil?
        result['timingDuration'] = self.timingDuration.as_json(*args)                        
      end          
      unless self.timingRange.nil?
        result['timingRange'] = self.timingRange.as_json(*args)                        
      end          
      unless self.timingTiming.nil?
        result['timingTiming'] = self.timingTiming.as_json(*args)                        
      end          
      unless self.participant.nil?  || !self.participant.any? 
        result['participant'] = self.participant.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.groupingBehavior.nil? 
        result['groupingBehavior'] = self.groupingBehavior.value
        serialized = Extension.serializePrimitiveExtension(self.groupingBehavior)            
        result['_groupingBehavior'] = serialized unless serialized.nil?
      end
      unless self.selectionBehavior.nil? 
        result['selectionBehavior'] = self.selectionBehavior.value
        serialized = Extension.serializePrimitiveExtension(self.selectionBehavior)            
        result['_selectionBehavior'] = serialized unless serialized.nil?
      end
      unless self.requiredBehavior.nil? 
        result['requiredBehavior'] = self.requiredBehavior.value
        serialized = Extension.serializePrimitiveExtension(self.requiredBehavior)            
        result['_requiredBehavior'] = serialized unless serialized.nil?
      end
      unless self.precheckBehavior.nil? 
        result['precheckBehavior'] = self.precheckBehavior.value
        serialized = Extension.serializePrimitiveExtension(self.precheckBehavior)            
        result['_precheckBehavior'] = serialized unless serialized.nil?
      end
      unless self.cardinalityBehavior.nil? 
        result['cardinalityBehavior'] = self.cardinalityBehavior.value
        serialized = Extension.serializePrimitiveExtension(self.cardinalityBehavior)            
        result['_cardinalityBehavior'] = serialized unless serialized.nil?
      end
      unless self.resource.nil? 
        result['resource'] = self.resource.as_json(*args)
      end
      unless self.action.nil?  || !self.action.any? 
        result['action'] = self.action.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = RequestGroupAction.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['prefix'] = PrimitiveString.transform_json(json_hash['prefix'], json_hash['_prefix']) unless json_hash['prefix'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['textEquivalent'] = PrimitiveString.transform_json(json_hash['textEquivalent'], json_hash['_textEquivalent']) unless json_hash['textEquivalent'].nil?
      result['priority'] = RequestPriority.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['documentation'] = json_hash['documentation'].map { |var| RelatedArtifact.transform_json(var) } unless json_hash['documentation'].nil?
      result['condition'] = json_hash['condition'].map { |var| RequestGroupActionCondition.transform_json(var) } unless json_hash['condition'].nil?
      result['relatedAction'] = json_hash['relatedAction'].map { |var| RequestGroupActionRelatedAction.transform_json(var) } unless json_hash['relatedAction'].nil?
      result['timingDateTime'] = PrimitiveDateTime.transform_json(json_hash['timingDateTime'], json_hash['_timingDateTime']) unless json_hash['timingDateTime'].nil?
      result['timingAge'] = Age.transform_json(json_hash['timingAge']) unless json_hash['timingAge'].nil?
      result['timingPeriod'] = Period.transform_json(json_hash['timingPeriod']) unless json_hash['timingPeriod'].nil?
      result['timingDuration'] = Duration.transform_json(json_hash['timingDuration']) unless json_hash['timingDuration'].nil?
      result['timingRange'] = Range.transform_json(json_hash['timingRange']) unless json_hash['timingRange'].nil?
      result['timingTiming'] = Timing.transform_json(json_hash['timingTiming']) unless json_hash['timingTiming'].nil?
      result['participant'] = json_hash['participant'].map { |var| Reference.transform_json(var) } unless json_hash['participant'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['groupingBehavior'] = ActionGroupingBehavior.transform_json(json_hash['groupingBehavior'], json_hash['_groupingBehavior']) unless json_hash['groupingBehavior'].nil?
      result['selectionBehavior'] = ActionSelectionBehavior.transform_json(json_hash['selectionBehavior'], json_hash['_selectionBehavior']) unless json_hash['selectionBehavior'].nil?
      result['requiredBehavior'] = ActionRequiredBehavior.transform_json(json_hash['requiredBehavior'], json_hash['_requiredBehavior']) unless json_hash['requiredBehavior'].nil?
      result['precheckBehavior'] = ActionPrecheckBehavior.transform_json(json_hash['precheckBehavior'], json_hash['_precheckBehavior']) unless json_hash['precheckBehavior'].nil?
      result['cardinalityBehavior'] = ActionCardinalityBehavior.transform_json(json_hash['cardinalityBehavior'], json_hash['_cardinalityBehavior']) unless json_hash['cardinalityBehavior'].nil?
      result['resource'] = Reference.transform_json(json_hash['resource']) unless json_hash['resource'].nil?
      result['action'] = json_hash['action'].map { |var| RequestGroupAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
