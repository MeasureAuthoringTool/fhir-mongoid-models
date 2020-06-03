module FHIR
  class ImmunizationEvaluation < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationEvaluation'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ImmunizationEvaluationStatus'
    embeds_one :patient, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :authority, class_name: 'Reference'
    embeds_one :targetDisease, class_name: 'CodeableConcept'
    embeds_one :immunizationEvent, class_name: 'Reference'
    embeds_one :doseStatus, class_name: 'CodeableConcept'
    embeds_many :doseStatusReason, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :series, type:  # primitive
    embeds_one :_series, class_name: 'Extension'
    field :doseNumberPrimitivePositiveInt, type:  # primitive
    embeds_one :_doseNumberPrimitivePositiveInt, class_name: 'Extension'
    field :doseNumberPrimitiveString, type:  # primitive
    embeds_one :_doseNumberPrimitiveString, class_name: 'Extension'
    field :seriesDosesPrimitivePositiveInt, type:  # primitive
    embeds_one :_seriesDosesPrimitivePositiveInt, class_name: 'Extension'
    field :seriesDosesPrimitiveString, type:  # primitive
    embeds_one :_seriesDosesPrimitiveString, class_name: 'Extension'
  end
end
