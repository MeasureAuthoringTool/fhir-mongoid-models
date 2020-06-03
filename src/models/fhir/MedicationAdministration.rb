module FHIR
  class MedicationAdministration < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationAdministration'
    embeds_many :identifier, class_name: 'Identifier'
    field :instantiates, type: Array # primitive
    embeds_many :_instantiates, class_name: 'Extension'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'MedicationAdministrationStatus'
    embeds_many :statusReason, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :context, class_name: 'Reference'
    embeds_many :supportingInformation, class_name: 'Reference'
    field :effectivePrimitiveDateTime, type:  # primitive
    embeds_one :_effectivePrimitiveDateTime, class_name: 'Extension'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_many :performer, class_name: 'MedicationAdministrationPerformer'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_one :request, class_name: 'Reference'
    embeds_many :device, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_one :dosage, class_name: 'MedicationAdministrationDosage'
    embeds_many :eventHistory, class_name: 'Reference'
  end
end
