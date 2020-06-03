module FHIR
  class DiagnosticReport < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DiagnosticReport'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_one :status, class_name: 'DiagnosticReportStatus'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :effectivePrimitiveDateTime, type:  # primitive
    embeds_one :_effectivePrimitiveDateTime, class_name: 'Extension'
    embeds_one :effectivePeriod, class_name: 'Period'
    field :issued, type:  # primitive
    embeds_one :_issued, class_name: 'Extension'
    embeds_many :performer, class_name: 'Reference'
    embeds_many :resultsInterpreter, class_name: 'Reference'
    embeds_many :specimen, class_name: 'Reference'
    embeds_many :result, class_name: 'Reference'
    embeds_many :imagingStudy, class_name: 'Reference'
    embeds_many :media, class_name: 'DiagnosticReportMedia'
    field :conclusion, type:  # primitive
    embeds_one :_conclusion, class_name: 'Extension'
    embeds_many :conclusionCode, class_name: 'CodeableConcept'
    embeds_many :presentedForm, class_name: 'Attachment'
  end
end
