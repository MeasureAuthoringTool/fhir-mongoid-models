module FHIR
  class Procedure < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Procedure'
    embeds_many :identifier, class_name: 'Identifier'
    field :instantiatesCanonical, type: Array # primitive
    embeds_many :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type: Array # primitive
    embeds_many :_instantiatesUri, class_name: 'Extension'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'ProcedureStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :performedPrimitiveDateTime, type:  # primitive
    embeds_one :_performedPrimitiveDateTime, class_name: 'Extension'
    embeds_one :performedPeriod, class_name: 'Period'
    field :performedPrimitiveString, type:  # primitive
    embeds_one :_performedPrimitiveString, class_name: 'Extension'
    embeds_one :performedAge, class_name: 'Age'
    embeds_one :performedRange, class_name: 'Range'
    embeds_one :recorder, class_name: 'Reference'
    embeds_one :asserter, class_name: 'Reference'
    embeds_many :performer, class_name: 'ProcedurePerformer'
    embeds_one :location, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :bodySite, class_name: 'CodeableConcept'
    embeds_one :outcome, class_name: 'CodeableConcept'
    embeds_many :report, class_name: 'Reference'
    embeds_many :complication, class_name: 'CodeableConcept'
    embeds_many :complicationDetail, class_name: 'Reference'
    embeds_many :followUp, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :focalDevice, class_name: 'ProcedureFocalDevice'
    embeds_many :usedReference, class_name: 'Reference'
    embeds_many :usedCode, class_name: 'CodeableConcept'
  end
end
