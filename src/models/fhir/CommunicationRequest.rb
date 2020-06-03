module FHIR
  class CommunicationRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CommunicationRequest'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :replaces, class_name: 'Reference'
    embeds_one :groupIdentifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'CommunicationRequestStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'CommunicationPriority'
    field :doNotPerform, type:  # primitive
    embeds_one :_doNotPerform, class_name: 'Extension'
    embeds_many :medium, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_many :about, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_many :payload, class_name: 'CommunicationRequestPayload'
    field :occurrencePrimitiveDateTime, type:  # primitive
    embeds_one :_occurrencePrimitiveDateTime, class_name: 'Extension'
    embeds_one :occurrencePeriod, class_name: 'Period'
    field :authoredOn, type:  # primitive
    embeds_one :_authoredOn, class_name: 'Extension'
    embeds_one :requester, class_name: 'Reference'
    embeds_many :recipient, class_name: 'Reference'
    embeds_one :sender, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
  end
end
