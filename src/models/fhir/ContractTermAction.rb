module FHIR
  class ContractTermAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermAction'
    field :doNotPerform, type:  # primitive
    embeds_one :_doNotPerform, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :subject, class_name: 'ContractTermActionSubject'
    embeds_one :intent, class_name: 'CodeableConcept'
    field :linkId, type: Array # primitive
    embeds_many :_linkId, class_name: 'Extension'
    embeds_one :status, class_name: 'CodeableConcept'
    embeds_one :context, class_name: 'Reference'
    field :contextLinkId, type: Array # primitive
    embeds_many :_contextLinkId, class_name: 'Extension'
    field :occurrencePrimitiveDateTime, type:  # primitive
    embeds_one :_occurrencePrimitiveDateTime, class_name: 'Extension'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :occurrenceTiming, class_name: 'Timing'
    embeds_many :requester, class_name: 'Reference'
    field :requesterLinkId, type: Array # primitive
    embeds_many :_requesterLinkId, class_name: 'Extension'
    embeds_many :performerType, class_name: 'CodeableConcept'
    embeds_one :performerRole, class_name: 'CodeableConcept'
    embeds_one :performer, class_name: 'Reference'
    field :performerLinkId, type: Array # primitive
    embeds_many :_performerLinkId, class_name: 'Extension'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    field :reason, type: Array # primitive
    embeds_many :_reason, class_name: 'Extension'
    field :reasonLinkId, type: Array # primitive
    embeds_many :_reasonLinkId, class_name: 'Extension'
    embeds_many :note, class_name: 'Annotation'
    field :securityLabelNumber, type: Array # primitive
    embeds_many :_securityLabelNumber, class_name: 'Extension'
  end
end
