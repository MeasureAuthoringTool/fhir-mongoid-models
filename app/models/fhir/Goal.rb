module FHIR
  class Goal < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Goal'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :lifecycleStatus, class_name: 'GoalLifecycleStatus'
    embeds_one :achievementStatus, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    field :startPrimitiveDate, type:  # primitive
    embeds_one :_startPrimitiveDate, class_name: 'Extension'
    embeds_one :startCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :target, class_name: 'GoalTarget'
    field :statusDate, type:  # primitive
    embeds_one :_statusDate, class_name: 'Extension'
    field :statusReason, type:  # primitive
    embeds_one :_statusReason, class_name: 'Extension'
    embeds_one :expressedBy, class_name: 'Reference'
    embeds_many :addresses, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :outcomeCode, class_name: 'CodeableConcept'
    embeds_many :outcomeReference, class_name: 'Reference'
  end
end
