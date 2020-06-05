module FHIR
  class MedicationDispense < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationDispense'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'MedicationDispenseStatus'
    embeds_one :statusReasonCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :statusReasonReference, class_name: 'Reference'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :context, class_name: 'Reference'
    embeds_many :supportingInformation, class_name: 'Reference'
    embeds_many :performer, class_name: 'MedicationDispensePerformer'
    embeds_one :location, class_name: 'Reference'
    embeds_many :authorizingPrescription, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :daysSupply, class_name: 'SimpleQuantity'
    field :whenPrepared, type:  # primitive
    embeds_one :_whenPrepared, class_name: 'Extension'
    field :whenHandedOver, type:  # primitive
    embeds_one :_whenHandedOver, class_name: 'Extension'
    embeds_one :destination, class_name: 'Reference'
    embeds_many :receiver, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :dosageInstruction, class_name: 'Dosage'
    embeds_one :substitution, class_name: 'MedicationDispenseSubstitution'
    embeds_many :detectedIssue, class_name: 'Reference'
    embeds_many :eventHistory, class_name: 'Reference'
  end
end
