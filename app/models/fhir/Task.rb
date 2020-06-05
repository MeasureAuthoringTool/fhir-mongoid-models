module FHIR
  class Task < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Task'
    embeds_many :identifier, class_name: 'Identifier'
    field :instantiatesCanonical, type:  # primitive
    embeds_one :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type:  # primitive
    embeds_one :_instantiatesUri, class_name: 'Extension'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_one :groupIdentifier, class_name: 'Identifier'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'TaskStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_one :businessStatus, class_name: 'CodeableConcept'
    embeds_one :intent, class_name: 'TaskIntent'
    embeds_one :priority, class_name: 'TaskPriority'
    embeds_one :code, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :focus, class_name: 'Reference'
    embeds_one :for, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :executionPeriod, class_name: 'Period'
    field :authoredOn, type:  # primitive
    embeds_one :_authoredOn, class_name: 'Extension'
    field :lastModified, type:  # primitive
    embeds_one :_lastModified, class_name: 'Extension'
    embeds_one :requester, class_name: 'Reference'
    embeds_many :performerType, class_name: 'CodeableConcept'
    embeds_one :owner, class_name: 'Reference'
    embeds_one :location, class_name: 'Reference'
    embeds_one :reasonCode, class_name: 'CodeableConcept'
    embeds_one :reasonReference, class_name: 'Reference'
    embeds_many :insurance, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :relevantHistory, class_name: 'Reference'
    embeds_one :restriction, class_name: 'TaskRestriction'
    embeds_many :input, class_name: 'TaskInput'
    embeds_many :output, class_name: 'TaskOutput'
  end
end
