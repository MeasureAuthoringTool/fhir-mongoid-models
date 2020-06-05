module FHIR
  class MedicationRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequest'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'MedicationRequestStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_one :intent, class_name: 'MedicationRequestIntent'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'MedicationRequestPriority'
    field :doNotPerform, type:  # primitive
    embeds_one :_doNotPerform, class_name: 'Extension'
    field :reportedPrimitiveBoolean, type:  # primitive
    embeds_one :_reportedPrimitiveBoolean, class_name: 'Extension'
    embeds_one :reportedReference, class_name: 'Reference'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_many :supportingInformation, class_name: 'Reference'
    field :authoredOn, type:  # primitive
    embeds_one :_authoredOn, class_name: 'Extension'
    embeds_one :requester, class_name: 'Reference'
    embeds_one :performer, class_name: 'Reference'
    embeds_one :performerType, class_name: 'CodeableConcept'
    embeds_one :recorder, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    field :instantiatesCanonical, type: Array # primitive
    embeds_many :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type: Array # primitive
    embeds_many :_instantiatesUri, class_name: 'Extension'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_one :groupIdentifier, class_name: 'Identifier'
    embeds_one :courseOfTherapyType, class_name: 'CodeableConcept'
    embeds_many :insurance, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :dosageInstruction, class_name: 'Dosage'
    embeds_one :dispenseRequest, class_name: 'MedicationRequestDispenseRequest'
    embeds_one :substitution, class_name: 'MedicationRequestSubstitution'
    embeds_one :priorPrescription, class_name: 'Reference'
    embeds_many :detectedIssue, class_name: 'Reference'
    embeds_many :eventHistory, class_name: 'Reference'
  end
end
