module FHIR
  class RiskAssessment < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskAssessment'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :basedOn, class_name: 'Reference'
    embeds_one :parent, class_name: 'Reference'
    embeds_one :status, class_name: 'RiskAssessmentStatus'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :occurrencePrimitiveDateTime, type:  # primitive
    embeds_one :_occurrencePrimitiveDateTime, class_name: 'Extension'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :condition, class_name: 'Reference'
    embeds_one :performer, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :basis, class_name: 'Reference'
    embeds_many :prediction, class_name: 'RiskAssessmentPrediction'
    field :mitigation, type:  # primitive
    embeds_one :_mitigation, class_name: 'Extension'
    embeds_many :note, class_name: 'Annotation'
  end
end
