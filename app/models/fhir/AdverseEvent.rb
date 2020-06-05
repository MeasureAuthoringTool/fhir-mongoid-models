module FHIR
  class AdverseEvent < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'AdverseEvent'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :actuality, class_name: 'AdverseEventActuality'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :event, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    field :detected, type:  # primitive
    embeds_one :_detected, class_name: 'Extension'
    field :recordedDate, type:  # primitive
    embeds_one :_recordedDate, class_name: 'Extension'
    embeds_many :resultingCondition, class_name: 'Reference'
    embeds_one :location, class_name: 'Reference'
    embeds_one :seriousness, class_name: 'CodeableConcept'
    embeds_one :severity, class_name: 'CodeableConcept'
    embeds_one :outcome, class_name: 'CodeableConcept'
    embeds_one :recorder, class_name: 'Reference'
    embeds_many :contributor, class_name: 'Reference'
    embeds_many :suspectEntity, class_name: 'AdverseEventSuspectEntity'
    embeds_many :subjectMedicalHistory, class_name: 'Reference'
    embeds_many :referenceDocument, class_name: 'Reference'
    embeds_many :study, class_name: 'Reference'
  end
end
