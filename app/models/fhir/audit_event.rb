module FHIR
  # fhir/audit_event.rb
  class AuditEvent < DomainResource
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::Coding'    
    embeds_many :subtype, class_name: 'FHIR::Coding'    
    embeds_one :action, class_name: 'FHIR::AuditEventAction'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :recorded, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :outcome, class_name: 'FHIR::AuditEventOutcome'    
    embeds_one :outcomeDesc, class_name: 'FHIR::PrimitiveString'    
    embeds_many :purposeOfEvent, class_name: 'FHIR::CodeableConcept'    
    embeds_many :agent, class_name: 'FHIR::AuditEventAgent'    
    embeds_one :source, class_name: 'FHIR::AuditEventSource'    
    embeds_many :entity, class_name: 'FHIR::AuditEventEntity'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.subtype.nil?  || !self.subtype.any? 
        result['subtype'] = self.subtype.map{ |x| x.as_json(*args) }
      end
      unless self.action.nil? 
        result['action'] = self.action.value
        serialized = Extension.serializePrimitiveExtension(self.action)            
        result['_action'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.recorded.nil? 
        result['recorded'] = self.recorded.value
        serialized = Extension.serializePrimitiveExtension(self.recorded)            
        result['_recorded'] = serialized unless serialized.nil?
      end
      unless self.outcome.nil? 
        result['outcome'] = self.outcome.value
        serialized = Extension.serializePrimitiveExtension(self.outcome)            
        result['_outcome'] = serialized unless serialized.nil?
      end
      unless self.outcomeDesc.nil? 
        result['outcomeDesc'] = self.outcomeDesc.value
        serialized = Extension.serializePrimitiveExtension(self.outcomeDesc)            
        result['_outcomeDesc'] = serialized unless serialized.nil?
      end
      unless self.purposeOfEvent.nil?  || !self.purposeOfEvent.any? 
        result['purposeOfEvent'] = self.purposeOfEvent.map{ |x| x.as_json(*args) }
      end
      unless self.agent.nil?  || !self.agent.any? 
        result['agent'] = self.agent.map{ |x| x.as_json(*args) }
      end
      unless self.source.nil? 
        result['source'] = self.source.as_json(*args)
      end
      unless self.entity.nil?  || !self.entity.any? 
        result['entity'] = self.entity.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AuditEvent.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = Coding.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subtype'] = json_hash['subtype'].map { |var| Coding.transform_json(var) } unless json_hash['subtype'].nil?
      result['action'] = AuditEventAction.transform_json(json_hash['action'], json_hash['_action']) unless json_hash['action'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['recorded'] = PrimitiveInstant.transform_json(json_hash['recorded'], json_hash['_recorded']) unless json_hash['recorded'].nil?
      result['outcome'] = AuditEventOutcome.transform_json(json_hash['outcome'], json_hash['_outcome']) unless json_hash['outcome'].nil?
      result['outcomeDesc'] = PrimitiveString.transform_json(json_hash['outcomeDesc'], json_hash['_outcomeDesc']) unless json_hash['outcomeDesc'].nil?
      result['purposeOfEvent'] = json_hash['purposeOfEvent'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['purposeOfEvent'].nil?
      result['agent'] = json_hash['agent'].map { |var| AuditEventAgent.transform_json(var) } unless json_hash['agent'].nil?
      result['source'] = AuditEventSource.transform_json(json_hash['source']) unless json_hash['source'].nil?
      result['entity'] = json_hash['entity'].map { |var| AuditEventEntity.transform_json(var) } unless json_hash['entity'].nil?

      result
    end
  end
end
