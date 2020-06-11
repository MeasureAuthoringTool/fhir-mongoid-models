module FHIR
  class MedicationStatement < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationStatement'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'MedicationStatementStatus'
    embeds_many :statusReason, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :context, class_name: 'Reference'
    field :effectivePrimitiveDateTime, type:  # primitive
    embeds_one :_effectivePrimitiveDateTime, class_name: 'Extension'
    embeds_one :effectivePeriod, class_name: 'Period'
    field :dateAsserted, type:  # primitive
    embeds_one :_dateAsserted, class_name: 'Extension'
    embeds_one :informationSource, class_name: 'Reference'
    embeds_many :derivedFrom, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :dosage, class_name: 'Dosage'
  end
end
