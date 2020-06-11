module FHIR
  class VerificationResult < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'VerificationResult'
    embeds_many :target, class_name: 'Reference'
    field :targetLocation, type: Array # primitive
    embeds_many :_targetLocation, class_name: 'Extension'
    embeds_one :need, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'Status'
    field :statusDate, type:  # primitive
    embeds_one :_statusDate, class_name: 'Extension'
    embeds_one :validationType, class_name: 'CodeableConcept'
    embeds_many :validationProcess, class_name: 'CodeableConcept'
    embeds_one :frequency, class_name: 'Timing'
    field :lastPerformed, type:  # primitive
    embeds_one :_lastPerformed, class_name: 'Extension'
    field :nextScheduled, type:  # primitive
    embeds_one :_nextScheduled, class_name: 'Extension'
    embeds_one :failureAction, class_name: 'CodeableConcept'
    embeds_many :primarySource, class_name: 'VerificationResultPrimarySource'
    embeds_one :attestation, class_name: 'VerificationResultAttestation'
    embeds_many :validator, class_name: 'VerificationResultValidator'
  end
end
