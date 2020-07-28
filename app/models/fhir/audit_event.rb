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

    def self.transform_json(json_hash, target = AuditEvent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = Coding.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subtype'] = json_hash['subtype'].map { |var| Coding.transform_json(var) } unless json_hash['subtype'].nil?
      result['action'] = AuditEventAction.transform_json(json_hash['action']) unless json_hash['action'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['recorded'] = PrimitiveInstant.transform_json(json_hash['recorded'], json_hash['_recorded']) unless json_hash['recorded'].nil?
      result['outcome'] = AuditEventOutcome.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?
      result['outcomeDesc'] = PrimitiveString.transform_json(json_hash['outcomeDesc'], json_hash['_outcomeDesc']) unless json_hash['outcomeDesc'].nil?
      result['purposeOfEvent'] = json_hash['purposeOfEvent'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['purposeOfEvent'].nil?
      result['agent'] = json_hash['agent'].map { |var| AuditEventAgent.transform_json(var) } unless json_hash['agent'].nil?
      result['source'] = AuditEventSource.transform_json(json_hash['source']) unless json_hash['source'].nil?
      result['entity'] = json_hash['entity'].map { |var| AuditEventEntity.transform_json(var) } unless json_hash['entity'].nil?

      result
    end
  end
end
