module FHIR
  class Communication < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Communication'
    embeds_many :identifier, class_name: 'Identifier'
    field :instantiatesCanonical, type: Array # primitive
    embeds_many :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type: Array # primitive
    embeds_many :_instantiatesUri, class_name: 'Extension'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_many :inResponseTo, class_name: 'Reference'
    embeds_one :status, class_name: 'CommunicationStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'CommunicationPriority'
    embeds_many :medium, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :topic, class_name: 'CodeableConcept'
    embeds_many :about, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :sent, type:  # primitive
    embeds_one :_sent, class_name: 'Extension'
    field :received, type:  # primitive
    embeds_one :_received, class_name: 'Extension'
    embeds_many :recipient, class_name: 'Reference'
    embeds_one :sender, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :payload, class_name: 'CommunicationPayload'
    embeds_many :note, class_name: 'Annotation'
  end
end
