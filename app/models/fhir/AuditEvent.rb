module FHIR
  class AuditEvent < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEvent'
    embeds_one :type, class_name: 'Coding'
    embeds_many :subtype, class_name: 'Coding'
    embeds_one :action, class_name: 'AuditEventAction'
    embeds_one :period, class_name: 'Period'
    field :recorded, type:  # primitive
    embeds_one :_recorded, class_name: 'Extension'
    embeds_one :outcome, class_name: 'AuditEventOutcome'
    field :outcomeDesc, type:  # primitive
    embeds_one :_outcomeDesc, class_name: 'Extension'
    embeds_many :purposeOfEvent, class_name: 'CodeableConcept'
    embeds_many :agent, class_name: 'AuditEventAgent'
    embeds_one :source, class_name: 'AuditEventSource'
    embeds_many :entity, class_name: 'AuditEventEntity'
  end
end
