module FHIR
  class ServiceRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ServiceRequest'
    embeds_many :identifier, class_name: 'Identifier'
    field :instantiatesCanonical, type: Array # primitive
    embeds_many :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type: Array # primitive
    embeds_many :_instantiatesUri, class_name: 'Extension'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :replaces, class_name: 'Reference'
    embeds_one :requisition, class_name: 'Identifier'
    embeds_one :status, class_name: 'ServiceRequestStatus'
    embeds_one :intent, class_name: 'ServiceRequestIntent'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'ServiceRequestPriority'
    field :doNotPerform, type:  # primitive
    embeds_one :_doNotPerform, class_name: 'Extension'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :orderDetail, class_name: 'CodeableConcept'
    embeds_one :quantityQuantity, class_name: 'Quantity'
    embeds_one :quantityRatio, class_name: 'Ratio'
    embeds_one :quantityRange, class_name: 'Range'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :occurrencePrimitiveDateTime, type:  # primitive
    embeds_one :_occurrencePrimitiveDateTime, class_name: 'Extension'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :occurrenceTiming, class_name: 'Timing'
    field :asNeededPrimitiveBoolean, type:  # primitive
    embeds_one :_asNeededPrimitiveBoolean, class_name: 'Extension'
    embeds_one :asNeededCodeableConcept, class_name: 'CodeableConcept'
    field :authoredOn, type:  # primitive
    embeds_one :_authoredOn, class_name: 'Extension'
    embeds_one :requester, class_name: 'Reference'
    embeds_one :performerType, class_name: 'CodeableConcept'
    embeds_many :performer, class_name: 'Reference'
    embeds_many :locationCode, class_name: 'CodeableConcept'
    embeds_many :locationReference, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :insurance, class_name: 'Reference'
    embeds_many :supportingInfo, class_name: 'Reference'
    embeds_many :specimen, class_name: 'Reference'
    embeds_many :bodySite, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
    field :patientInstruction, type:  # primitive
    embeds_one :_patientInstruction, class_name: 'Extension'
    embeds_many :relevantHistory, class_name: 'Reference'
  end
end
