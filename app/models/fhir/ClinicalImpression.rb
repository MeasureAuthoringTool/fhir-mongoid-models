module FHIR
  class ClinicalImpression < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ClinicalImpression'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ClinicalImpressionStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :effectivePrimitiveDateTime, type:  # primitive
    embeds_one :_effectivePrimitiveDateTime, class_name: 'Extension'
    embeds_one :effectivePeriod, class_name: 'Period'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :assessor, class_name: 'Reference'
    embeds_one :previous, class_name: 'Reference'
    embeds_many :problem, class_name: 'Reference'
    embeds_many :investigation, class_name: 'ClinicalImpressionInvestigation'
    field :protocol, type: Array # primitive
    embeds_many :_protocol, class_name: 'Extension'
    field :summary, type:  # primitive
    embeds_one :_summary, class_name: 'Extension'
    embeds_many :finding, class_name: 'ClinicalImpressionFinding'
    embeds_many :prognosisCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :prognosisReference, class_name: 'Reference'
    embeds_many :supportingInfo, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
  end
end
