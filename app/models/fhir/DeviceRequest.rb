module FHIR
  class DeviceRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceRequest'
    embeds_many :identifier, class_name: 'Identifier'
    field :instantiatesCanonical, type: Array # primitive
    embeds_many :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type: Array # primitive
    embeds_many :_instantiatesUri, class_name: 'Extension'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :priorRequest, class_name: 'Reference'
    embeds_one :groupIdentifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'DeviceRequestStatus'
    embeds_one :intent, class_name: 'RequestIntent'
    embeds_one :priority, class_name: 'RequestPriority'
    embeds_one :codeReference, class_name: 'Reference'
    embeds_one :codeCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :parameter, class_name: 'DeviceRequestParameter'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :occurrencePrimitiveDateTime, type:  # primitive
    embeds_one :_occurrencePrimitiveDateTime, class_name: 'Extension'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :occurrenceTiming, class_name: 'Timing'
    field :authoredOn, type:  # primitive
    embeds_one :_authoredOn, class_name: 'Extension'
    embeds_one :requester, class_name: 'Reference'
    embeds_one :performerType, class_name: 'CodeableConcept'
    embeds_one :performer, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :insurance, class_name: 'Reference'
    embeds_many :supportingInfo, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :relevantHistory, class_name: 'Reference'
  end
end
